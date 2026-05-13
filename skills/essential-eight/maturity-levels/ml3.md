# Maturity Level 3 (ML3)

ML3 mitigates adversaries who are adaptive, less reliant on public tools, and willing to
expend more effort. ML3 is the realistic target for systems holding aggregations of
PROTECTED information, or systems whose compromise would meaningfully damage the agency
or the public.

## Threat model

The Maturity Model describes ML3 as designed to mitigate tradecraft that is highly
targeted, less reliant on public tooling, and willing to invest in tailored techniques.
Think custom malware, supply-chain implants, exploitation of zero-day or near-zero-day
vulnerabilities, and bypass of multi-factor authentication through device theft or
session-token theft.

## What ML3 changes from ML2

The full requirements are in the live published Maturity Model. The deltas below are the
useful mental model when stepping up from ML2 to ML3.

### 1. Application control

- Scope broadens further to include non-internet-facing servers.
- Microsoft's "recommended driver block rules" are implemented to defeat Bring-Your-Own-
  Vulnerable-Driver (BYOVD) tradecraft.
- Centralised event logs are reviewed and signals indicative of a cyber security incident
  are investigated.

### 2. Patch applications

- Patching cadence and SLAs are the tightest in the model.
- The set of in-scope application classes is broadest.
- Unsupported software is actively removed, not tolerated under risk acceptance.

### 3. Configure Microsoft Office macro settings

- Logs of allowed and blocked macro execution are centrally stored, reviewed and
  investigated.
- Microsoft Office is configured to prevent activation of OLE packages.

### 4. User application hardening

- PowerShell is restricted to writers of approved scripts or removed.
- PowerShell module logging, script block logging and transcription are enabled.
- .NET Framework 3.5 (and below) is disabled or removed.
- Logs are centralised, reviewed and investigated.

### 5. Restrict administrative privileges

- Privileged operating environments are used for privileged tasks.
- Just-in-time access is the default; standing privilege is the exception.
- Privileged accounts use phishing-resistant MFA.
- Memory integrity protections are deployed on workstations used for privileged tasks.
- Logging of privileged actions is centralised, reviewed and investigated.

### 6. Patch operating systems

- Operating systems on critical assets are patched on the tightest SLA in the model.
- Vulnerability scanning of operating systems on internet-facing services is daily.
- Unsupported operating systems are not present; this requirement is enforced, not
  aspirational.

### 7. Multi-factor authentication

- Phishing-resistant MFA is used by users when they authenticate to important data
  repositories.
- MFA is verified through a phishing-resistant mechanism for privileged actions on user
  workstations.
- MFA event logs are centralised, reviewed and investigated.

### 8. Regular backups

- Privileged accounts (other than backup administrators) cannot access, modify or delete
  backups belonging to other accounts.
- Restoration of systems and data is tested as part of disaster recovery exercises.
- Backups are stored offline or in an environment that is not modifiable from the
  production estate (immutability, air gap, or equivalent).

## How to assess a system against ML3

1. ML3 is the toughest level to reach and is usually reserved for the agency's crown
   jewels. Confirm the agency intends to actually run at ML3 across the estate, not just
   on a single system.
2. Check for memory integrity and driver block lists on workstations used for privileged
   work.
3. Confirm phishing-resistant MFA is the only acceptable factor for privileged action.
4. Confirm centralised logs are not just collected but reviewed with named owners and
   working alerts.
5. Confirm backup immutability, not just separation. Soft-delete is not immutable.

## Common shortfalls when reaching for ML3

- ML3 claimed because the controls exist on paper, with no evidence that logs are
  reviewed and signals are investigated.
- Driver block list missing from WDAC.
- Standing global-admin still present in cloud tenants.
- Backups stored in a separate account but the production admin role has cross-account
  write permission.
- Critical CVEs still patched in days, not within the ML3 window for critical assets.

## Sources

- ACSC, Essential Eight Maturity Model.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-maturity-model>
- ACSC, Essential Eight Assessment Process Guide.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-assessment-process-guide>
