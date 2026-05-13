# Worked example - Linux application control with fapolicyd

`fapolicyd` is the application-control daemon shipped in RHEL and derivatives. It enforces
a path / hash / publisher policy through the kernel's `fanotify` API and pairs naturally
with signed RPM repositories. This example targets a fleet of RHEL 9 / Rocky / Alma
servers configured with Ansible.

## Architecture

- Distribution: RHEL 9 (or compatible). Kernel includes `fanotify` support.
- Policy daemon: `fapolicyd` in enforcing mode (`permissive = 0`).
- Trust database: built from the package manager's RPM database (`fapolicyd-cli --update`
  on package install), plus an organisation-specific allowlist for binaries installed
  outside the package manager.
- Logging: `audit.log` events for `fanotify` decisions, forwarded to the SIEM by
  `auditd` -> `rsyslog` or directly by a SIEM-vendor collector.
- Configuration management: Ansible role applies the daemon config and rule files.
- Change control: rule additions go through PRs against the Ansible repository, reviewed
  by two engineers.

## Daemon configuration

`/etc/fapolicyd/fapolicyd.conf` (excerpt):

```
permissive = 0
nice_val = 14
q_size = 800
uid = fapolicyd
gid = fapolicyd
do_stat_report = 1
detailed_report = 1
db_max_size = 200
subj_cache_size = 4096
obj_cache_size = 8192
trust = rpmdb,file
integrity = sha256
syslog_format = rule,dec,perm,auid,pid,exe,:,path,ftype
```

Important fields:

- `permissive = 0` means enforce. `permissive = 1` is observation-only. Anything other
  than `0` is not compliant beyond an initial rollout window.
- `integrity = sha256` adds integrity checks beyond path matching.
- `trust = rpmdb,file` reads trusted hashes from the RPM database and a supplemental
  file (`/etc/fapolicyd/fapolicyd.trust`).

## Rule file

`/etc/fapolicyd/rules.d/99-organisation.rules` (excerpt). The order of evaluation matters;
fapolicyd applies the first matching rule.

```
# Allow execution of any binary present in the rpm trust database
allow perm=any all : trust=1

# Allow user shells to run scripts in /usr/local/sbin (admin-managed scripts)
allow perm=execute uid=0 : dir=/usr/local/sbin/

# Deny execution from world-writable paths
deny_audit perm=execute all : dir=/tmp/
deny_audit perm=execute all : dir=/var/tmp/
deny_audit perm=execute all : dir=/dev/shm/

# Default deny
deny perm=any all : all
```

After every rule change run:

```sh
fapolicyd-cli --check-config
systemctl reload fapolicyd
```

## Supplemental trusted files

For binaries installed outside the package manager (rare, but realistic for some vendor
tools), populate `/etc/fapolicyd/fapolicyd.trust` with one entry per file:

```
/opt/agency-vendor-tool/bin/agency-tool 12048312 sha256-of-binary
```

The format is `path size sha256`. Regenerate when the binary is updated.

## Logging

Configure `auditd` to forward `AVC`-style decision logs. A typical `auditd` rule:

```
# /etc/audit/rules.d/fapolicyd.rules
-w /etc/fapolicyd/ -p wa -k fapolicyd_config
```

Add a `rsyslog` action sending the audit log destination to the SIEM, or use a SIEM-
vendor collector. Retention should match the ISM and Essential Eight Maturity Model
expectations for the agency's classification level.

## Ansible role (excerpt)

```yaml
- name: Install fapolicyd
  ansible.builtin.dnf:
    name: fapolicyd
    state: present

- name: Drop daemon configuration
  ansible.builtin.template:
    src: fapolicyd.conf.j2
    dest: /etc/fapolicyd/fapolicyd.conf
    owner: root
    group: root
    mode: '0644'
  notify: reload fapolicyd

- name: Drop organisation rule file
  ansible.builtin.copy:
    src: rules.d/99-organisation.rules
    dest: /etc/fapolicyd/rules.d/99-organisation.rules
    owner: root
    group: root
    mode: '0644'
  notify: reload fapolicyd

- name: Drop trust supplements
  ansible.builtin.copy:
    src: fapolicyd.trust
    dest: /etc/fapolicyd/fapolicyd.trust
    owner: root
    group: root
    mode: '0644'
  notify: reload fapolicyd

- name: Enable and start fapolicyd
  ansible.builtin.systemd:
    name: fapolicyd
    enabled: true
    state: started
```

## Detection heuristic an agent can run

1. In the Ansible repository, search for `fapolicyd.conf` templates and confirm
   `permissive = 0`. Flag any host group where `permissive` is not `0`.
2. Read rule files and confirm a `default deny` rule is present at the end of evaluation.
3. Look for any rule allowing execution from world-writable paths (`/tmp`, `/var/tmp`,
   `/dev/shm`). Allow rules in these paths are a finding.
4. Confirm trust supplements are scoped (specific paths, not directory wildcards).
5. Confirm auditd is configured to forward `fanotify` decisions to a central log
   destination.
6. Cross-check the package repository configuration. Trusted binaries from `rpmdb`
   require that the RPM repositories themselves are signed and trusted; look at
   `/etc/yum.repos.d/*.repo` for `gpgcheck=1` and `repo_gpgcheck=1`.

## What this example does not cover

- Container workloads. Containers running on these hosts inherit the host's runtime
  protection but the in-container application control posture must be managed separately
  (signed images, admission control, runtime security policy).
- Build hosts running self-hosted CI runners. Treat as production servers, not developer
  workstations.
- Hosts running on kernel builds without `fanotify` support. fapolicyd will not function;
  use Linux Integrity Measurement Architecture (IMA / EVM) or a different agent.

## Sources

- ACSC, Implementing Application Control.
  <https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/implementing-application-control>
- Red Hat, Blocking and allowing applications using fapolicyd.
  <https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/security_hardening/assembly_blocking-and-allowing-applications-using-fapolicyd_security-hardening>
- Linux Audit subsystem documentation.
  <https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/security_hardening/auditing-the-system_security-hardening>
