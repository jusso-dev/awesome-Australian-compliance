# Maturity Level 2 (ML2)

ML2 mitigates adversaries that invest more time and effort in target selection and that
use a moderate level of tradecraft to bypass implemented controls. ML2 is the realistic
target for most Commonwealth, state and council systems and for suppliers handling agency
data at OFFICIAL: Sensitive or PROTECTED.

## Threat model

The Maturity Model describes ML2 as designed to mitigate tradecraft that is targeted and
willing to invest more in research and bypass techniques. Think credential phishing
tailored to the agency, password-spray against discovered tenant names, and exploitation
of known but unpatched vulnerabilities in middle-of-the-road windows.

## What ML2 changes from ML1

The full requirements are in the live published Maturity Model. The deltas below are the
useful mental model when stepping up from ML1 to ML2.

### 1. Application control

- Scope broadens to workstations and internet-facing servers.
- Microsoft's "recommended block rules" are implemented to defeat known bypasses.
- Centralised logging of allowed and blocked executions.
- Logs retained for an extended period.

### 2. Patch applications

- Vulnerability scanning cadence tightens.
- Patching SLAs for office productivity suites, browsers, email clients, PDF software and
  security products tightens.
- The asset list in scope is broader (more application classes than ML1).

### 3. Configure Microsoft Office macro settings

- Only macros from Trusted Locations (users cannot write to) or signed by a Trusted
  Publisher may run.
- Macro execution events logged centrally and reviewed.

### 4. User application hardening

- Office is configured to block child processes commonly used by malware.
- PDF readers do not process JavaScript.
- Web browsers, Office and PDF readers cannot be modified by users.
- ACSC guidance on Microsoft Office, web browser and PDF reader hardening is implemented.

### 5. Restrict administrative privileges

- Privileged users use separate accounts for privileged work.
- Privileged accounts cannot access the internet, email and web services (technically
  enforced, not policy-only).
- Privileged accounts revalidated annually or more often.
- Privileged operating environments are hardened.
- Just-in-time access begins to appear at this level.

### 6. Patch operating systems

- Vulnerability scanning of internet-facing services more frequent.
- Patching SLAs across all operating systems tightened.
- The list of in-scope operating systems is broader.

### 7. Multi-factor authentication

- MFA required for privileged users to authenticate to internet-facing services.
- MFA required for non-privileged users to access important data repositories.
- The MFA factor at ML2 should be phishing-resistant for privileged access.
- Customers of internet-facing services that handle the organisation's data are offered
  MFA.

### 8. Regular backups

- Backups stored separately from production.
- Privileged accounts (other than backup administrators) cannot modify or delete backups.
- Restoration of systems and data from backups is tested at least annually.

## How to assess a system against ML2

1. ML2 is graded against the weakest strategy. Confirm each strategy independently meets
   the ML2 wording before claiming an overall ML2.
2. For phishing-resistance, look for FIDO2 / WebAuthn / hardware-token enrolment data,
   not just "MFA enabled".
3. For application control, confirm enforcement mode (not audit), Microsoft's recommended
   block rules present, and central logging working.
4. For macros, confirm Trusted Location storage is not user-writable.
5. For privileged access, confirm conditional access blocks email and internet for
   privileged role holders.
6. For backups, confirm separation by account / tenant and the most recent restore-test
   record.

## Common shortfalls when reaching for ML2

- ML2 claimed on the basis of one strategy hitting the bar (overall grade is the lowest
  strategy).
- SMS or voice-call MFA accepted for privileged accounts.
- Trusted Locations on user-writable disks.
- Logs collected but never reviewed (the Maturity Model expects review and investigation,
  not just collection).
- Application control "ML2" because Microsoft's recommended block rules are loaded,
  ignoring that the scope did not broaden to include internet-facing servers.

## Sources

- ACSC, Essential Eight Maturity Model.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-maturity-model>
- ACSC, Essential Eight Assessment Process Guide.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-assessment-process-guide>
