# Worked example - macOS application control with Gatekeeper, notarisation and Santa

Apple's built-in application control combines code signing, notarisation, Gatekeeper and
the XProtect malware definitions. For ML1, a well-configured platform baseline plus MDM
lockdown is enough for most agency fleets. For ML2 and ML3, the ACSC and the Essential
Eight Assessment Process Guide expect a third-party allowlisting agent on top, because
Gatekeeper alone permits any Developer-ID-signed-and-notarised executable. Santa
(open-source, originated at Google) is the reference choice.

## Architecture

- Platform baseline: Gatekeeper enabled, only "App Store and identified developers" allowed,
  notarisation required. Locked by MDM so users cannot disable.
- Allowlisting: Santa in lockdown mode (`ClientMode = 2`), enforcing a publisher and
  hash-based allowlist managed centrally.
- Logging: Santa events forwarded to the SIEM via the Santa sync server or `santactl`
  output.
- Change control: Santa rules are stored in version control. Adding a rule is a PR with
  two reviewers.
- MDM: Jamf Pro or Intune for macOS, deploying both the Gatekeeper baseline and Santa.

## MDM profile for Gatekeeper lockdown (excerpt)

A profile preventing the user from changing Gatekeeper settings. Deliver via MDM.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
  "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>PayloadType</key>
  <string>com.apple.systempolicy.control</string>
  <key>PayloadVersion</key>
  <integer>1</integer>
  <key>PayloadIdentifier</key>
  <string>au.gov.example.gatekeeper</string>
  <key>EnableAssessment</key>
  <true/>
  <key>AllowIdentifiedDevelopers</key>
  <true/>
  <key>DisableOverride</key>
  <true/>
</dict>
</plist>
```

Important: `EnableAssessment` corresponds to Gatekeeper being on; `AllowIdentifiedDevelopers`
keeps the App-Store-and-identified-developers default; `DisableOverride` prevents the user
from right-clicking and choosing "Open Anyway" to bypass for an individual file.

## Santa configuration

`/var/db/santa/config.plist` (deployed via MDM):

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
  "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>ClientMode</key>
  <integer>2</integer>
  <key>EnableSysxCache</key>
  <true/>
  <key>FileChangesRegex</key>
  <string>^/Users/.*</string>
  <key>SyncBaseURL</key>
  <string>https://santa-sync.example.gov.au/</string>
  <key>EventLogType</key>
  <string>file</string>
  <key>EventLogPath</key>
  <string>/var/log/santa.log</string>
  <key>BlockUSBMount</key>
  <true/>
</dict>
</plist>
```

`ClientMode = 2` is lockdown (default-deny). `ClientMode = 1` is monitor (default-allow,
log denies); monitor mode is acceptable during initial rollout but not at ML2 onward.

## Allow rules

Rules are pushed by the Santa sync server. A typical baseline:

```
# allow Apple-signed binaries (Team ID: APPLECOMPUTER)
ADD signing-id platform:* allow

# allow the agency code-signing certificate
ADD certificate <agency-team-id-cert-fingerprint> allow

# allow specific approved third-party publishers
ADD certificate <microsoft-corp-cert-fingerprint> allow
ADD certificate <jetbrains-cert-fingerprint> allow

# specific binary hash allowlist for unsigned approved binaries (last resort)
ADD binary <sha256-of-binary> allow
```

Important: prefer certificate (publisher) rules over binary-hash rules because the latter
need to change with every new release of the application. Hash rules should be a last
resort for unsigned line-of-business tools.

## Logging and sync server

Santa speaks to a sync server that pushes rules and ingests events. Several open-source
implementations exist (Moroz, Zentral, and so on). The agency's choice should:

- Authenticate clients with mutual TLS using device certificates issued by the MDM.
- Persist all `EXEC` and `EXEC_DENIED` events with the SHA-256, signing chain, parent
  process, and user.
- Forward events to the central SIEM in near real time.
- Provide a UI for the security team to approve emergency rule additions, with audit
  history.

## Detection heuristic an agent can run

1. Search MDM profile exports for a `com.apple.systempolicy.control` payload. Confirm
   `EnableAssessment = true`, `AllowIdentifiedDevelopers = true`, `DisableOverride =
   true`.
2. Locate the Santa config plist in the MDM profile or the IaC for fleet config. Confirm
   `ClientMode = 2`.
3. If `ClientMode = 1` is the live setting, this is a finding at any ML target above ML1
   exercise.
4. Look in the Santa sync server's rule repository for any "allow all binaries" or
   wildcard certificate rules. Flag any.
5. Confirm Santa events are flowing into the SIEM (event channel last-received timestamp).
6. Confirm Santa is deployed to engineering laptops, not only general-staff fleets.

## What this example does not cover

- Server-side macOS workloads (rare, but in scope if present).
- Brew / npm / pip developer toolchains. Code installed via these channels often runs as
  user-mode scripts that Gatekeeper does not assess. Santa rule design for developers
  should explicitly allow common interpreters but block their use to run untrusted
  binaries.
- iOS / iPadOS fleet, which is governed by App Store distribution and MDM allowlisting.

## Sources

- ACSC, Implementing Application Control.
  <https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/implementing-application-control>
- Apple, About Gatekeeper.
  <https://support.apple.com/guide/security/gatekeeper-and-runtime-protection-sec5599b66df/web>
- Santa project documentation.
  <https://santa.dev/>
