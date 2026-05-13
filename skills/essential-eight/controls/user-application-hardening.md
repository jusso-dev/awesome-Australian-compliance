# User application hardening

User application hardening removes features in user-facing software that are commonly abused
for initial access or persistence. The most-cited targets are web browsers (Flash, Java,
advertising, untrusted Office add-ins, Internet Explorer mode) and PDF readers (JavaScript,
embedded scripting, OLE).

## In plain English

Strip the dangerous features out of the apps your users live in. No Flash. No Java in the
browser. No untrusted browser extensions. PDF readers with JavaScript turned off. Office
add-ins limited to a vetted set. Internet Explorer either disabled or, in current Windows,
never used in IE mode.

## Why it exists

Initial-access tradecraft consistently exploits scripting and plugin surface in the user's
browser and PDF reader. Removing the surface area is cheap and high-leverage.

## What the Maturity Model requires

Requirements vary by Maturity Level. Quote the live published wording.

- **Web browsers.** Java content in browsers blocked. Web advertisements blocked
  (typically via an enterprise ad-blocker or DNS filter). Internet Explorer 11 disabled or
  removed. Browser security settings cannot be changed by users.
- **PDF readers.** JavaScript in PDFs disabled. Security settings cannot be changed by
  users.
- **Microsoft Office.** OLE in Office disabled (object linking and embedding has been
  abused for delivery). Security settings cannot be changed by users.
- **PowerShell.** At higher maturity levels, blocked or constrained for users who do not
  need it (script block logging and constrained language mode).
- **.NET Framework.** Mitigations for known abuse paths (for example, .NET Framework 3.5
  legacy support).

Reference: ACSC, Essential Eight Maturity Model, user application hardening section.
<https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-maturity-model>

## Evidence an assessor will ask for

- Browser configuration: enterprise policies for Edge, Chrome, Firefox (whichever is
  standard) showing Java, Flash, ad-blocking and extension allowlisting.
- PDF reader configuration: Adobe Reader / Foxit / built-in browser PDF posture showing
  JavaScript disabled and security settings locked.
- Office hardening: OLE disabled, ActiveX disabled or controlled.
- PowerShell configuration: script block logging enabled, constrained language mode where
  applicable, AppLocker / WDAC rules covering script files.
- DNS filtering or enterprise ad blocker in use, with coverage data.
- Confirmation Internet Explorer is disabled or removed.

## Where to look

- Group Policy / Intune: Browser policies (Edge, Chrome, Firefox per-vendor templates),
  Office Trust Center, Adobe Reader policies.
- Browser enterprise documentation:
  - Microsoft Edge policy reference.
  - Chrome Enterprise policy list.
  - Firefox enterprise policies.json.
- Defender for Endpoint attack surface reduction (ASR) rule set.
- PowerShell: `Set-ExecutionPolicy`, `Get-WinEvent -LogName Microsoft-Windows-PowerShell/Operational`.

## Detection heuristics

1. Search Intune or GPO exports for browser policies:
   - Edge: `ExtensionInstallBlocklist`, `ExtensionInstallAllowlist`,
     `JavaScriptBlockedForUrls`, `DefaultJavaScriptSetting`.
   - Chrome: `ExtensionInstallBlocklist`, `ExtensionInstallAllowlist`,
     `JavaScriptAllowedForUrls`.
   - Firefox: `policies.json` with `Extensions` and `DisabledCiphers`.
2. Look for Defender for Endpoint ASR rule deployment with the relevant rule GUIDs
   (Office child process creation, Office injection, Win32 API calls from macros, etc.).
3. Look for a DNS filtering vendor in IaC or runtime config (Cisco Umbrella, Cloudflare
   Gateway, AdGuard, Pi-hole at the small end).
4. Search for any IE-mode configuration in Edge policies (`InternetExplorerIntegrationSiteList`).
   Presence of a non-trivial list is a finding to investigate.
5. In any developer workstation profile, check for unrestricted PowerShell execution
   policies.

## Common implementation patterns

- **Browser hardening profile**: managed extensions only, Java and Flash blocked, ad
  blocker installed and locked, search engine pinned to an internal-respecting default.
- **DNS-based ad and malware filtering** as a baseline so user errors do not surface to
  the browser.
- **PDF rendering in browser**: standardise on the browser's built-in PDF viewer with
  JavaScript disabled. If a desktop PDF app is required, lock its settings.
- **PowerShell logging on by default**: script block, module and transcription logging
  enabled, forwarded to a SIEM. Constrained language mode for non-admin users.
- **Office macro reductions**: combined with the macro strategy. OLE disabled, Mark-of-the-
  Web preserved.

## Common pitfalls

- **Allowlisted browser extensions reviewed only at deployment.** Extension publishers
  change, get sold, or are compromised. The allowlist needs periodic review.
- **Adobe Reader JavaScript disabled in the UI but re-enabled by a downloaded PDF.**
  Lock settings via policy, not user UI.
- **DNS filtering bypassed by browsers using DoH.** Disable DoH or scope the filter to
  cover the browser's chosen resolver.
- **PowerShell logging enabled but log channel not collected centrally.** Logs that stay
  on the endpoint are limited use.
- **IE mode silently re-introducing legacy attack surface.** Audit IE-mode site lists and
  remove anything that no longer needs it.

## Cross-references

- Related: application control (last line of defence when hardening fails).
- Related: macros (overlapping mitigation for Office attack surface).
- ISM mapping: see [`mappings/e8-to-ism.md`](../../../mappings/e8-to-ism.md).

## Sources

- ACSC, Essential Eight Maturity Model.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-maturity-model>
- ACSC, Hardening Microsoft Windows 10 and Windows 11 Workstations.
  <https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening>
