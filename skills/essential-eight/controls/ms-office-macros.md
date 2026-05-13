# Configure Microsoft Office macro settings

Macros in Microsoft Office documents have been one of the most reliable initial-access
techniques used against Australian organisations. The strategy is to block macros from the
internet by default and only allow macros that are demonstrably trusted.

## In plain English

Disable macros for everyone who does not need them. For everyone who does, only allow
macros that are signed by a trusted publisher or located in a Trusted Location that users
cannot write to. Block macros in files marked Mark-of-the-Web (downloaded from the
internet or an external email). Log macro execution.

## Why it exists

Most macro-based intrusions start with a document arriving by email or download. Office's
default behaviour has improved (macros from the internet are blocked by default in current
versions), but enterprise configuration must hold that default in place and prevent users
from re-enabling macros on a per-document basis.

## What the Maturity Model requires

The Maturity Model defines requirements along these axes. Quote the live published wording.

- **Default state.** Macros disabled for users who do not have a documented business
  requirement.
- **Internet-sourced macros.** Macros in files originating from the internet must be
  blocked. Users cannot override this block.
- **Allowed macros.** Only digitally signed macros from a trusted publisher, or macros
  located in a Trusted Location that users cannot write to, may run.
- **Antivirus scanning.** Macros must be scanned by antivirus before execution.
- **Macro security settings.** Cannot be modified by users.
- **Logging.** Macro execution is logged. At higher maturity levels, logs are centralised
  and reviewed.

Reference: ACSC, Essential Eight Maturity Model, configure Microsoft Office macro settings
section.
<https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-maturity-model>

## Evidence an assessor will ask for

- Group Policy or Intune Administrative Templates configuration showing macros disabled by
  default and the Mark-of-the-Web block enforced.
- List of users with a documented business requirement for macros.
- Trusted Locations register: which folders, on which hosts, with what permissions.
- Trusted Publishers register: which certificates are trusted and the chain of custody.
- Antivirus product capable of scanning Office macros, with current signatures.
- Centralised logs of macro execution (ML2 and above) with retention.
- Review records showing that macro execution events are inspected.

## Where to look

- Group Policy: User Configuration > Administrative Templates > Microsoft Office (version)
  > Security Settings > Trust Center, and per-app policies for Word, Excel, PowerPoint.
- Intune: Settings catalog under Microsoft Office configurations.
- Office cloud policy service for Microsoft 365 deployments.
- Registry equivalents under `HKCU\Software\Microsoft\Office\<version>\<app>\Security`.
- File-server permissions for any Trusted Location.

## Detection heuristics

1. If the repo includes Intune profiles or GPO exports, look for these policy IDs (subject
   to Office version):
   - "Block macros from running in Office files from the Internet"
   - "VBA Macro Notification Settings" (set to Disable all without notification, or
     Disable all except digitally signed macros)
   - "Allow Trusted Locations on the network" (typically Disabled)
2. Look for any code-signing certificate metadata for Office macros: enterprise PKI
   issuing publisher certificates for VBA signing.
3. Check whether the engineering team uses macro-bearing Excel templates in their own
   build process. Build tools that depend on macros are a common loophole.

## Common implementation patterns

- **Default deny.** Macros disabled for the whole tenant. Limited macro user group with
  a documented business case and named manager approval.
- **Signed macros only.** Enterprise PKI issues short-lived publisher certificates to a
  small team. Macros must be re-signed periodically. Certificate revocation actively used.
- **Trusted Locations on hardened file servers.** Users have read-only access. Writes go
  through change control. No Trusted Locations on user-writable disks.
- **Mark-of-the-Web preserved.** Email systems and download proxies preserve MOTW so
  Office can identify and block internet-sourced files.

## Common pitfalls

- **Trusted Locations on `C:\Users\`.** A Trusted Location the user can write to defeats
  the control.
- **"Trust access to the VBA project object model" enabled.** Lets macros modify other
  macros and re-arm payloads. Should be disabled.
- **Mark-of-the-Web stripped on download.** Some browsers, mail clients or archive tools
  strip MOTW, allowing internet-sourced macros to be treated as local.
- **No log review.** Macro execution events flowing into a SIEM that nobody alerts on is
  partial credit at best.
- **Personal macros.xlsm with auto-open macros.** Often persists across reinstalls and is
  excluded from the standard controls.
- **Antivirus not configured to scan macros.** A version of the AV that supports macro
  scanning is not the same as macro scanning being on.

## Cross-references

- Related: user application hardening (Flash, Java, ads, untrusted code in browsers).
- Related: application control (an executed macro that drops a PE will still be blocked).
- ISM mapping: see [`mappings/e8-to-ism.md`](../../../mappings/e8-to-ism.md).

## Sources

- ACSC, Essential Eight Maturity Model.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-maturity-model>
- ACSC, Microsoft Office Macro Security.
  <https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/microsoft-office-macro-security>
