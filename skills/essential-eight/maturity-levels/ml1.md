# Maturity Level 1 (ML1)

ML1 mitigates adversaries who use widely-available, commodity tradecraft to find and
compromise targets opportunistically. The implementation cost is the lowest of the three
levels, and reaching ML1 across all eight strategies is the minimum effective baseline for
any Australian agency or supplier handling agency information.

## Threat model

The Maturity Model describes ML1 as designed to mitigate tradecraft that is opportunistic,
relies on publicly-available tools and exploits, and does not invest in target selection.
Think mass phishing campaigns and broadly-scanned internet exposures.

## What ML1 looks like across the eight strategies

The full requirements are in the live published Maturity Model. The points below capture
the shape so an agent can quickly assess whether a system is reaching for ML1 or already
sitting on a partial implementation.

### 1. Application control

- Application control is implemented on workstations.
- The control covers user profiles and temporary folders used by operating systems, web
  browsers and email clients (the locations most often used as drop sites by commodity
  payloads).
- Microsoft's "recommended block rules" are not yet required at ML1.

### 2. Patch applications

- Vulnerability scanning of internet-facing services on a defined cadence.
- Patching of internet-facing services with the tightest SLA in the model.
- Patching of office productivity suites, web browsers, email clients, PDF software,
  Adobe Flash and security products on a less aggressive cadence than internet-facing
  services.
- Applications no longer supported by vendors are removed.

### 3. Configure Microsoft Office macro settings

- Macros disabled for users without a business requirement.
- Macros in files originating from the internet blocked.
- Macro security settings cannot be changed by users.
- Antivirus scans macros.

### 4. User application hardening

- Web browsers do not process Java from the internet.
- Web browsers do not process advertisements from the internet.
- Internet Explorer 11 is disabled or removed.
- Browser security settings cannot be changed by users.

### 5. Restrict administrative privileges

- Requests for privileged access to systems and applications are validated when first
  requested.
- Privileged accounts are prevented from accessing the internet, email and web services.
- Separate privileged and unprivileged operating environments.
- Unprivileged accounts cannot log in to privileged operating environments.

### 6. Patch operating systems

- Vulnerability scanning of operating systems of internet-facing services daily.
- Vulnerability scanning of other operating systems on a longer cadence.
- Patching internet-facing OS with the tightest SLA in the model.
- Operating systems no longer supported by vendors are replaced.

### 7. Multi-factor authentication

- MFA is used by users when they authenticate to remote-access solutions and other
  internet-facing services.
- MFA is used by users when they access important data repositories.
- MFA uses something the user has and something the user knows / is.
- Phishing-resistant factors are not yet mandated at ML1, but stronger factors are
  encouraged.

### 8. Regular backups

- Backups of important data, software and configuration settings are performed and
  retained.
- Backups are stored for a period in line with business continuity requirements.
- Restoration of systems and data from backups is tested.
- Privileged accounts (other than backup administrators) cannot access backups belonging
  to other accounts.

## How to assess a system against ML1

1. Use this page only as the bird's-eye scoping document. For each strategy, open the
   corresponding `controls/*.md` for the detailed requirements, evidence types and
   detection heuristics.
2. The Maturity Model's published wording is the source of truth. Where a number (hours,
   days, scanning cadence) matters, quote the live published text.
3. Grade the overall system at the level of its weakest strategy. ML1 patching with no
   MFA is not ML1.

## Common shortfalls when reaching for ML1

- Application control deployed in audit mode rather than enforcement mode.
- Patching SLAs documented but not measured.
- Macros disabled in UI but settings still modifiable by users.
- MFA enabled but not enforced (optional enrolment is not enrolment).
- Backups in scope but never restore-tested.

## Sources

- ACSC, Essential Eight Maturity Model.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-maturity-model>
- ACSC, Essential Eight Assessment Process Guide.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-assessment-process-guide>
