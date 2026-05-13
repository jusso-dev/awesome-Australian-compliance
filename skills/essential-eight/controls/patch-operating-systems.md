# Patch operating systems

Operating-system vulnerabilities are exploited as fast as application vulnerabilities and
are harder to recover from because they sit underneath everything else. The strategy mirrors
patch applications: scan, patch quickly, remove the unsupported.

## In plain English

Find OS vulnerabilities. Patch internet-facing OS instances fast, the rest on a defined
schedule. Remove operating systems the vendor has stopped supporting. Apply the same
discipline to network appliance firmware as you do to general-purpose servers.

## Why it exists

Most ransomware and remote-access attacks rely on at least one unpatched OS-level
vulnerability. Closing the window between disclosure and exploitation at the OS layer is
the highest-leverage operational habit a team can build.

## What the Maturity Model requires

Patching expectations are split by exposure class. Quote the live published wording.

- **Vulnerability scanning frequency.** Internet-facing services scanned daily or weekly;
  workstations and other servers on a longer cadence.
- **Patch SLA by class.** Internet-facing services have the tightest SLA (commonly 48 hours
  for critical vulnerabilities at ML2 and above). Workstations follow a longer schedule but
  still measured in days, not months.
- **Unsupported operating systems.** Removed from the network or compensating controls
  applied. ML3 requires removal.
- **Cumulative patches preferred** over piecemeal hotfix tracking, where the vendor
  supports them.
- **Firmware on network devices** (gateways, routers, switches, VPN appliances, MFP
  printers if internet-reachable) treated as OS for patching.

Reference: ACSC, Essential Eight Maturity Model, patch operating systems section.
<https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-maturity-model>

## Evidence an assessor will ask for

- OS inventory with version, build, last-patched date, exposure class.
- Vulnerability scanner output, with the most recent scan date for each class.
- Patch deployment evidence: WSUS / Intune / MECM / Ansible / Salt / Puppet / Chef job
  history, deployment success rate, retry handling.
- Mean and tail time-to-patch by class for the last 90 days.
- Inventory of network appliance firmware versions.
- Decommissioning records for unsupported OS instances.
- Exception register for any unpatched system, with risk acceptance and an expiry.

## Where to look

- IaC: AMI / image IDs in Terraform / CloudFormation / Bicep, OS family and version
  declarations.
- Container base images: `FROM` lines in Dockerfiles, base image source registries.
- Kubernetes: node image versions, GKE / EKS / AKS auto-upgrade settings, control plane
  versions.
- Configuration management: Ansible playbooks for `apt`/`dnf`/`pacman` upgrades, scheduled
  jobs.
- Patch orchestration: WSUS, Intune Update Rings, MECM (SCCM), Red Hat Satellite,
  Spacewalk, Landscape.
- Cloud: AWS Systems Manager Patch Manager, Azure Update Manager, GCP OS Config patching.
- Network devices: configuration backups, firmware version per device in the network
  management system.

## Detection heuristics

1. In IaC, find every OS image reference. Resolve each to a publication date. Flag any
   older than 90 days for review.
2. For each cloud provider in use, identify the patching service (Systems Manager,
   Update Manager, OS Config) and confirm it is enrolled across the accounts in scope.
3. For Kubernetes, check whether node groups are on a managed image with auto-upgrade
   enabled, and whether control planes are within one minor version of supported.
4. Look for evidence of base-image rebuild automation (a weekly job that rebuilds the
   organisation's base images from upstream and pushes new digests).
5. Map internet-facing infrastructure (security group rules opening 0.0.0.0/0, public
   load balancers, public IPs on VMs) and produce a list whose patching SLA must be the
   tightest.
6. List any explicitly-installed end-of-life OS versions (Windows 7, Windows Server 2012
   R2 after EOL, RHEL 6, Ubuntu 16.04, etc.). Flag immediately.

## Common implementation patterns

- **Managed-update services in the cloud**: AWS Systems Manager Patch Manager with
  maintenance windows, Azure Update Manager, GCP OS Config patch jobs.
- **Immutable infrastructure**: rebuild images weekly from upstream, redeploy through the
  pipeline, treat patching as a deploy.
- **Critical fast path**: a documented procedure that lifts a critical OS patch out of the
  normal release schedule and pushes it through within the SLA.
- **Firmware tracking**: a network management system (vendor or open-source) inventorying
  firmware versions, integrated with vulnerability advisories.
- **Workstation strategy**: managed update rings in Intune / WSUS / MDM, pilot then broad
  rollout, monitored failure rate, retried.

## Common pitfalls

- **Patching the cloud account that has Patch Manager enabled, not the others.** Tenant
  sprawl is the common cause.
- **AMIs frozen at the date the team built the platform.** New EC2 instances launch with
  old images even after patches exist.
- **Containers patched but the underlying nodes are not.** A patched runtime sitting on an
  unpatched kernel is partial credit.
- **Firmware on internet-facing gateways quietly slipping.** Firewalls and VPN appliances
  often have critical CVEs and need their own watching.
- **EOL Windows Server with TSR (extended security updates) treated as patched.** ESU is
  a stopgap, not a strategy.
- **Workstation update rings dragging on for weeks.** A 30-day rollout for a critical CVE
  is not compliant.

## Cross-references

- Related: patch applications.
- Related: application control (defence in depth).
- ISM mapping: see [`mappings/e8-to-ism.md`](../../../mappings/e8-to-ism.md).

## Sources

- ACSC, Essential Eight Maturity Model.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-maturity-model>
- ACSC, Assessing Security Vulnerabilities and Applying Patches.
  <https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/assessing-security-vulnerabilities-and-applying-patches>
