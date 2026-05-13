# Patch applications

Patch applications addresses unpatched vulnerabilities in applications, especially internet-
facing ones, that adversaries weaponise quickly. The strategy combines vulnerability
scanning, patching SLAs by exposure class, and removing software that is no longer vendor-
supported.

## In plain English

Find vulnerabilities in applications. Patch the internet-facing ones fast, the rest on a
defined schedule. Remove software the vendor has stopped supporting. Have evidence that
this happens, not just a policy that says it should.

## Why it exists

Most exploited vulnerabilities have been public for weeks to months before they are used in
intrusions. The window between disclosure and exploitation is the bit you can actually
control. Patching SLAs constrain that window.

## What the Maturity Model requires

Patching strategy obligations vary by Maturity Level along several axes. Quote the live
Maturity Model in any assessment.

- **Scope of applications.** Internet-facing services (web servers, email, FTP, SSH gateways,
  VPN concentrators), productivity suites, web browsers and their extensions, email
  clients, PDF readers, security products. ML2 and ML3 expand the application list.
- **Vulnerability scanning frequency.** ML1 starts at fortnightly for some classes, ML2 and
  ML3 tighten to weekly and daily for the riskiest classes.
- **Patch SLA.** Internet-facing services have the tightest SLA (commonly 48 hours at ML2
  and above for critical vulnerabilities), while workstation productivity software follows a
  longer SLA.
- **Remove unsupported software.** All maturity levels require that applications no longer
  receiving vendor security updates are removed.

The exact numbers (hours, days) appear in the Maturity Model and shift periodically. Quote
the live published text rather than memorising numbers.

Reference: ACSC, Essential Eight Maturity Model, patch applications section.
<https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-maturity-model>

## Evidence an assessor will ask for

- Vulnerability scanner inventory: which scanner, last scan date by asset class, scan
  schedule.
- Patch deployment records: ticket IDs, deployment dates per CVE, asset count covered.
- Mean and tail (95th and 99th percentile) time-to-patch by asset class for the last 90 days.
- Evidence of removal of unsupported software (audit logs, asset register entries, change
  tickets).
- Exception register for any unpatched system, with risk acceptance signed off and an
  expiry date.

## Where to look in a typical codebase

- Dependency manifests: `package.json`, `package-lock.json`, `yarn.lock`, `pnpm-lock.yaml`,
  `requirements.txt`, `Pipfile.lock`, `poetry.lock`, `go.mod`, `go.sum`, `Gemfile.lock`,
  `Cargo.lock`, `pom.xml`, `build.gradle`, `composer.lock`.
- Dependabot, Renovate, npm-audit, pip-audit, gosec or equivalent in CI.
- SBOM generation: `cyclonedx`, `syft`, `spdx` outputs.
- Container base image pinning: `Dockerfile` `FROM` lines pinned to digests, not floating
  tags. Rebuild cadence (weekly base image rebuild is a common pattern).
- IaC scanning: trivy, checkov, tfsec in CI.
- Cloud platform service versions: managed database engine versions, runtime versions
  (`runtime: nodejs20.x` in Lambda, `node-version` in App Service), Kubernetes node image
  versions.
- Internet-facing infrastructure: reverse proxy versions (nginx, envoy), VPN appliance
  firmware (Fortinet, Palo Alto, Citrix), email gateways. These are the highest-priority
  classes for the patching SLA.

## Detection heuristics for an agent

1. Run a vulnerability resolver against each lockfile and produce a list of dependencies
   with known CVEs. Prefer authoritative sources (OSV, GitHub Advisory Database) over
   aggregators.
2. Check for Dependabot config (`.github/dependabot.yml`), Renovate config
   (`renovate.json`), or equivalent. Confirm enabled for production manifests, not only
   dev dependencies.
3. Search Dockerfiles for `FROM image:latest` or unpinned base images. Flag any.
4. Check Kubernetes manifests for image tags that are not digests. Flag any.
5. Look for SBOM generation step in CI workflows. If absent, note as a finding.
6. Look for a documented patching SLA. Common locations: `SECURITY.md`, security
   handbook, `docs/policy/`, internal wiki references.
7. Identify internet-facing assets in IaC (security group rules opening 0.0.0.0/0 or ::/0,
   public Load Balancers) and confirm their software is on the highest priority patching
   schedule.

## Common implementation patterns

- **Continuous patching for managed cloud**: managed databases auto-applying minor versions,
  Lambda / App Service / Cloud Run runtime versions on supported lines, base images rebuilt
  weekly with `--no-cache` in the registry.
- **Dependency automation**: Dependabot / Renovate on weekly cadence for normal
  dependencies, expedited cadence for security advisories, auto-merge for green-CI patches
  on locked sets.
- **Internet-facing fast path**: A separate, monitored deployment lane that bypasses normal
  release windows for vulnerabilities meeting the 48-hour SLA. Documented and rehearsed.
- **Asset inventory**: a single source of truth (CMDB, ServiceNow, a Git-tracked inventory)
  with owner, exposure class, last patch date.

## Common pitfalls

- **Tracking patches by CVE published, not CVE applicable.** Counting all CVEs in the wild
  rather than those in your actual stack inflates the queue and hides the real backlog.
- **Lockfiles updated but not deployed.** A green Dependabot PR that has not been merged or
  deployed is not a patched system.
- **Floating tags on base images.** `node:20` looks pinned but moves under your feet.
- **Patching production but not the build host.** Build agents and CI runners are
  vulnerable too.
- **Unsupported runtimes still in use.** Python 3.7, Node 12, RHEL 7 after EOL. The
  Maturity Model is explicit about removal of unsupported software.
- **No tracking of internet-facing inventory.** If you cannot name your internet-facing
  systems in under five minutes you cannot meet the SLA.

## Cross-references

- Related strategy: patch operating systems (same idea, different scope, same SLA pattern).
- Related strategy: application control (a patched but exploited vulnerability is still
  blocked from running an unsigned payload).
- ISM mapping: see [`mappings/e8-to-ism.md`](../../../mappings/e8-to-ism.md).

## Sources

- ACSC, Essential Eight Maturity Model.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-maturity-model>
- ACSC, Assessing Security Vulnerabilities and Applying Patches.
  <https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/assessing-security-vulnerabilities-and-applying-patches>
- OSV vulnerability database (used for detection heuristics).
  <https://osv.dev>
