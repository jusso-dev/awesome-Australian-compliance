# Worked example - Windows application control with WDAC and AppLocker

This example shows a realistic ML2 starting point for application control on a managed
Windows fleet. The estate is joined to Entra ID, managed by Intune, and the user fleet is
Windows 11. The example uses Windows Defender Application Control (WDAC) as the kernel-
level baseline and AppLocker for fine-grained user-mode rules. WDAC is the strategic
direction; AppLocker fills gaps Microsoft has not yet covered.

## Architecture

- WDAC base policy: signed, enforcing.
- WDAC supplemental policy: agency-specific allowlist (line-of-business apps).
- Microsoft recommended block rules: included as a supplemental policy (ML2 requirement).
- Microsoft recommended driver block rules: included as a supplemental policy (ML3
  requirement, deployed at ML2 if the team is reaching for it).
- AppLocker: complements WDAC with rules for scripts and installers in user paths.
- Deployment: Intune device configuration profile with WDAC and AppLocker payloads.
- Logging: Microsoft-Windows-CodeIntegrity / Operational and AppLocker channels forwarded
  to Microsoft Sentinel or equivalent.
- Change control: rule changes raised as PRs against an IaC repository, reviewed by two
  security engineers, deployed by pipeline.

## WDAC base policy (excerpt)

The policy below is a slimmed-down illustration. Generate a real policy with the
`New-CIPolicy` and `ConvertFrom-CIPolicy` cmdlets following ACSC and Microsoft guidance.

```xml
<?xml version="1.0" encoding="utf-8"?>
<SiPolicy xmlns="urn:schemas-microsoft-com:sipolicy">
  <VersionEx>10.0.2.0</VersionEx>
  <PolicyTypeID>{A244370E-44C9-4C06-B551-F6016E563076}</PolicyTypeID>
  <PlatformID>{2E07F7E4-194C-4D20-B7C9-6F44A6C5A234}</PlatformID>
  <Rules>
    <Rule>
      <Option>Enabled:Audit Mode</Option>
    </Rule>
    <Rule>
      <Option>Enabled:UMCI</Option>
    </Rule>
    <Rule>
      <Option>Required:Enforce Store Applications</Option>
    </Rule>
    <Rule>
      <Option>Enabled:Update Policy No Reboot</Option>
    </Rule>
    <Rule>
      <Option>Disabled:Flight Signing</Option>
    </Rule>
  </Rules>
  <EKUs />
  <FileRules />
  <Signers />
  <SigningScenarios>
    <SigningScenario Value="131" ID="ID_SIGNINGSCENARIO_WINDOWS" FriendlyName="Auto generated policy on 2026-05-13">
      <ProductSigners />
    </SigningScenario>
    <SigningScenario Value="12" ID="ID_SIGNINGSCENARIO_USER" FriendlyName="User mode signing scenario">
      <ProductSigners />
    </SigningScenario>
  </SigningScenarios>
</SiPolicy>
```

Important: ship the policy with `Enabled:Audit Mode` for an initial discovery window (one
to four weeks), then remove that option and merge the policy with the supplemental rules
before deploying in enforcement mode. Track the audit-to-enforce transition in change
control.

## Microsoft recommended block list

Download the current recommended block list and the recommended driver block list from
Microsoft's published documentation, convert with `ConvertFrom-CIPolicy`, and deploy as
supplemental policies. The driver block list is required at ML3.

Maintain a quarterly review to refresh the block lists from Microsoft. The lists evolve as
new bypass tooling is discovered and the agency must keep up.

## AppLocker supplement (excerpt)

The XML below blocks PowerShell from user-writable paths and allows it only from system
locations. Apply via Intune endpoint security configuration.

```xml
<AppLockerPolicy Version="1">
  <RuleCollection Type="Script" EnforcementMode="Enabled">
    <FilePathRule Id="11111111-1111-1111-1111-111111111111"
                  Name="Allow PowerShell from System32"
                  Description="System paths only"
                  UserOrGroupSid="S-1-1-0"
                  Action="Allow">
      <Conditions>
        <FilePathCondition Path="%WINDIR%\System32\WindowsPowerShell\v1.0\*" />
      </Conditions>
    </FilePathRule>
    <FilePathRule Id="22222222-2222-2222-2222-222222222222"
                  Name="Deny PowerShell from user-writable paths"
                  Description="Block PS in user-writable locations"
                  UserOrGroupSid="S-1-1-0"
                  Action="Deny">
      <Conditions>
        <FilePathCondition Path="%OSDRIVE%\Users\*" />
      </Conditions>
    </FilePathRule>
  </RuleCollection>
</AppLockerPolicy>
```

Important: AppLocker enforces in the order Allow then Deny is evaluated; the deny rule
above will block PowerShell launched from any user profile. Validate against your
engineers' workflows before deploying.

## Centralised logging

Configure the following event channels for forwarding to the SIEM:

- `Microsoft-Windows-CodeIntegrity/Operational` (WDAC events).
- `Microsoft-Windows-AppLocker/EXE and DLL`.
- `Microsoft-Windows-AppLocker/MSI and Script`.
- `Microsoft-Windows-AppLocker/Packaged app-Deployment` and
  `Microsoft-Windows-AppLocker/Packaged app-Execution`.

Set retention according to the agency's logging guideline (typically 12 months online for
ML2, longer for ML3).

## Detection heuristic an agent can run

When the user asks "audit our Windows application control", run these checks if you have
read access to the relevant repositories or exports:

1. In Intune exports under `endpointSecurity/applicationControl/` or equivalent, locate the
   WDAC policy assignments. Confirm the assignment target covers all production users, not
   a pilot group.
2. In the WDAC XML, confirm the `Enabled:Audit Mode` option is absent (enforcement mode is
   in effect by default when not present).
3. Confirm a supplemental policy is loaded that references Microsoft's recommended block
   rules. The supplemental policy typically has a friendly name containing "block list" or
   "recommended block".
4. For ML3, confirm a separate supplemental policy is loaded for the driver block list.
5. Look in `policies/applocker/` for any path rules referencing user-writable paths in
   Allow rules. Flag any.
6. Search for log forwarder configuration to confirm CodeIntegrity and AppLocker channels
   are collected.

## What this example does not cover

- Server-side application control. Modern Windows Server can run WDAC. The agency policy
  should specify the baseline for internet-facing and non-internet-facing servers at ML2
  and ML3.
- Removable media. Application control should consider USB-attached executable storage.
- Build hosts and CI runners. Self-hosted runners need their own policy.

## Sources

- ACSC, Implementing Application Control.
  <https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/implementing-application-control>
- Microsoft, Application Control for Windows.
  <https://learn.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/windows-defender-application-control>
- Microsoft, Microsoft Recommended Block Rules.
  <https://learn.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/microsoft-recommended-block-rules>
- Microsoft, Recommended Driver Block Rules.
  <https://learn.microsoft.com/en-us/windows/security/threat-protection/windows-defender-application-control/microsoft-recommended-driver-block-rules>
