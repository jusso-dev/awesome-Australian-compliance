# Essential Eight audit checklist

Use this checklist to produce a per-strategy, per-control finding for a target Maturity
Level. Each row reads: requirement, where to look, evidence type, finding (achieved /
partially achieved / not achieved), gap, remediation, owner. The agent fills in each row
from the codebase, the IaC, the IdP and any artefacts the user has connected.

Cite the live Essential Eight Maturity Model when quoting numbers and wording. Do not
paraphrase requirements. This checklist is the worksheet, not the requirement itself.

## How to use

1. Confirm the target Maturity Level (ML1, ML2 or ML3) with the system owner.
2. Walk the eight strategies in order. For each, complete every row that applies to the
   target Maturity Level.
3. Grade each strategy as achieved, partially achieved or not achieved.
4. Grade the overall maturity at the lowest per-strategy grade.
5. Produce a remediation plan ordered by leverage: strategies graded "not achieved"
   first, then "partially achieved", with the smallest gap-to-target items prioritised
   inside each.

## Strategy 1 - Application control

| # | Requirement (per ML) | Where to look | Evidence | Finding | Gap | Remediation | Owner |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1.1 | Application control enforced (not audit-only) on in-scope endpoints | AppLocker / WDAC / fapolicyd / Santa policies in IaC, MDM exports | Policy XML / config with enforcement enabled | | | | |
| 1.2 | Scope matches target ML (workstations / internet-facing / non-internet-facing servers) | Asset inventory, policy assignments | Coverage report | | | | |
| 1.3 | Microsoft recommended block rules loaded (ML2+) | WDAC base policy | Block list version present | | | | |
| 1.4 | Microsoft recommended driver block rules loaded (ML3) | WDAC policy | Driver block list present | | | | |
| 1.5 | Centralised logging of allowed / blocked execution | SIEM config, log forwarder | Event channel forwarded, retention | | | | |
| 1.6 | Logs reviewed and signals investigated (ML2+) | SOC runbook, ticket history | Review records and incident tickets | | | | |
| 1.7 | Rule changes tracked through change control | Change management system | Approval records | | | | |

## Strategy 2 - Patch applications

| # | Requirement (per ML) | Where to look | Evidence | Finding | Gap | Remediation | Owner |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2.1 | Vulnerability scanning at the cadence required by target ML | Scanner config | Last-scan dates per class | | | | |
| 2.2 | Patching SLA for internet-facing services met | Patch tracker | Mean and tail TTP for last 90 days | | | | |
| 2.3 | Patching SLA for other applications met | Patch tracker | Mean and tail TTP for last 90 days | | | | |
| 2.4 | Unsupported software removed | Asset inventory | EOL software absent | | | | |
| 2.5 | Dependency manifests are scanned and tracked | Dependabot / Renovate / equivalent in CI | Config + recent PR activity | | | | |
| 2.6 | Container base images pinned and rebuilt on cadence | Dockerfiles, registry policy | Pin to digest, rebuild job | | | | |
| 2.7 | SBOM generated for production builds | CI logs, artefact store | SBOM artefacts retained | | | | |

## Strategy 3 - Configure Microsoft Office macro settings

| # | Requirement (per ML) | Where to look | Evidence | Finding | Gap | Remediation | Owner |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 3.1 | Macros disabled for users without business requirement | GPO / Intune Office policy | Policy export | | | | |
| 3.2 | Macros from the internet blocked (Mark-of-the-Web) | GPO / Intune Office policy | Policy export | | | | |
| 3.3 | Only signed-or-Trusted-Location macros may run (ML2+) | GPO / Intune Office policy | Policy export | | | | |
| 3.4 | Trusted Locations not user-writable | File-server ACLs | Permission export | | | | |
| 3.5 | Macro execution logged centrally (ML2+) | SIEM, log channel | Event samples | | | | |
| 3.6 | OLE packages blocked (ML3) | GPO / Intune Office policy | Policy export | | | | |

## Strategy 4 - User application hardening

| # | Requirement (per ML) | Where to look | Evidence | Finding | Gap | Remediation | Owner |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 4.1 | Web browser Java blocked | Browser policy | Policy export | | | | |
| 4.2 | Web browser advertisements blocked | Browser policy / ad blocker / DNS filter | Policy + filter coverage | | | | |
| 4.3 | Internet Explorer 11 disabled or removed | Endpoint inventory | Absence or disabled flag | | | | |
| 4.4 | Browser settings cannot be modified by users | Browser policy | Policy export | | | | |
| 4.5 | PDF JavaScript disabled and locked | Adobe / Foxit / browser PDF policy | Policy export | | | | |
| 4.6 | PowerShell restricted (ML3) | GPO / Intune | Policy export, AppLocker rules | | | | |
| 4.7 | PowerShell logging centralised and reviewed (ML3) | SIEM | Event channel, review records | | | | |

## Strategy 5 - Restrict administrative privileges

| # | Requirement (per ML) | Where to look | Evidence | Finding | Gap | Remediation | Owner |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 5.1 | Privileged role inventory exists and is current | IdP exports, IAM exports | Inventory + last-review date | | | | |
| 5.2 | Separate identity for privileged work | IdP user list | Two accounts per admin | | | | |
| 5.3 | Privileged accounts blocked from email and internet | Conditional Access / IAM | Policy export | | | | |
| 5.4 | JIT / PIM for elevated roles (ML2+) | PIM / equivalent | Eligibility records, activation logs | | | | |
| 5.5 | Phishing-resistant MFA on privileged actions (ML2/ML3) | Authenticator records | Hardware-token / WebAuthn enrolment | | | | |
| 5.6 | PAW or hardened privileged environment in use (ML2/ML3) | Endpoint inventory | Build standard, isolation evidence | | | | |
| 5.7 | Privileged action logs centralised and reviewed | SIEM | Event channel, review records | | | | |
| 5.8 | Annual or more frequent revalidation of access | Access review records | Most recent review date | | | | |

## Strategy 6 - Patch operating systems

| # | Requirement (per ML) | Where to look | Evidence | Finding | Gap | Remediation | Owner |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 6.1 | OS vulnerability scanning at target cadence | Scanner config | Last-scan dates per class | | | | |
| 6.2 | Internet-facing OS patching SLA met | Patch tracker | Mean and tail TTP for last 90 days | | | | |
| 6.3 | Workstation OS patching SLA met | Patch tracker | Mean and tail TTP for last 90 days | | | | |
| 6.4 | Network appliance firmware tracked and patched | Network management system | Inventory and patch history | | | | |
| 6.5 | Unsupported OS removed | Asset inventory | EOL OS absent | | | | |
| 6.6 | Container nodes on managed and updated images | Kubernetes / cloud config | Node image version | | | | |
| 6.7 | Base images rebuilt on cadence | CI / registry | Rebuild job, recent push | | | | |

## Strategy 7 - Multi-factor authentication

| # | Requirement (per ML) | Where to look | Evidence | Finding | Gap | Remediation | Owner |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 7.1 | MFA enforced for all users on remote access and important repositories | IdP policy | Conditional Access / equivalent policy | | | | |
| 7.2 | Weak factors disabled where required by target ML | IdP factor policy | Disabled SMS / voice for relevant roles | | | | |
| 7.3 | Phishing-resistant MFA for privileged accounts (ML2/ML3) | Authenticator inventory | Hardware token / WebAuthn enrolment | | | | |
| 7.4 | MFA on workstations for privileged actions (ML3) | Workstation policy | Windows Hello / smartcard for sudo / runas | | | | |
| 7.5 | MFA available to customers of internet-facing services that handle organisation data | Customer auth code path | Feature documentation, code, uptake metrics | | | | |
| 7.6 | MFA event logs centralised and reviewed | SIEM | Event channel, review records | | | | |
| 7.7 | No long-lived application passwords or legacy auth in use | IdP audit | Disabled legacy protocols | | | | |

## Strategy 8 - Regular backups

| # | Requirement (per ML) | Where to look | Evidence | Finding | Gap | Remediation | Owner |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 8.1 | Inventory of backups in scope (data, software, configuration) | Backup service config | Coverage report | | | | |
| 8.2 | Frequency and retention aligned to business continuity needs | Backup policy | Policy + measured RPO / RTO | | | | |
| 8.3 | Restore tested at target ML cadence | DR exercise records | Most recent restore-test report | | | | |
| 8.4 | Backup admin separation from production admins | IAM / IdP | Role separation, no overlap | | | | |
| 8.5 | Backups stored separately from production | Backup destination config | Cross-account or off-platform target | | | | |
| 8.6 | Immutability or air-gap on backups (ML3) | Object lock / vault lock / equivalent | Configuration export | | | | |
| 8.7 | Encryption at rest with managed key custody | Backup encryption settings | Key custody and rotation records | | | | |
| 8.8 | SaaS data backup in place (Microsoft 365 / Google Workspace / similar) | Third-party backup product | Coverage report | | | | |

## Producing the maturity summary

After completing the eight strategy tables:

- For each strategy: count "achieved" rows against rows that apply at the target ML.
  Translate: all required rows green is "achieved at target ML", any required row red is
  "not achieved at target ML", mixed is "partially achieved".
- Overall maturity is the lowest per-strategy result.
- A "partially achieved" at one strategy plus everything else at the target ML still
  grades as below-target overall, with a specific remediation list for that strategy.

## Worked example (Essential Eight Maturity Level 2 against a typical agency web app)

A condensed example follows. In a real assessment, fill the tables above with file paths,
config values and ticket references rather than narrative.

> Application control: enforced on agency-managed workstations via WDAC with Microsoft's
> recommended block rules. Scope does not include the production EKS nodes (internet-
> facing). Finding: partially achieved at ML2. Gap: extend scope to internet-facing
> servers, or accept risk with a specific mitigation. Remediation: define a node
> allowlisting baseline using runtime image-signature enforcement (Kyverno verifyImages
> with cosign) and document as an alternative implementation, with ACSC guidance on
> server-side application control referenced.
>
> Patch applications: Dependabot enabled across all production manifests, weekly base
> image rebuild, internet-facing services patched within 24 hours for critical CVEs in
> the last 90 days. Finding: achieved at ML2.
>
> (and so on through all eight strategies)

## Sources

- ACSC, Essential Eight Maturity Model.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-maturity-model>
- ACSC, Essential Eight Assessment Process Guide.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-assessment-process-guide>
