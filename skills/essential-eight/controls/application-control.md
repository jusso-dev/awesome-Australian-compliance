# Application control

Application control restricts the execution of unauthorised executables, software libraries,
scripts, installers, compiled HTML, HTML applications and control panel applets to an
approved set. It is the strongest single mitigation against arbitrary code execution from a
phishing payload, a watering-hole compromise, or a stolen user account.

## In plain English

Only run software that has been explicitly approved. Block everything else by default.
Generate an event when something is blocked. Keep the approved list (the "rule set") under
change control so it cannot be quietly widened.

## Why it exists

If a user opens a malicious attachment, clicks a phishing link, or runs an installer that
ships extra cargo, application control prevents the unauthorised executable from running.
It is mitigates the largest single class of intrusions seen by the ACSC.

## What the Maturity Model requires

The Maturity Model spells out scope (workstations, internet-facing servers, non-internet-
facing servers), execution types (executables, libraries, scripts, installers, compiled HTML,
HTML applications, control panel applets, drivers) and rule sources (Microsoft, vendor,
publisher, hash, path) by Maturity Level. Quote the published wording rather than
summarising. See:

- ACSC, Essential Eight Maturity Model, application control section.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-maturity-model>

At a high level, expectations rise across maturity levels along these axes:

- **Scope.** ML1 covers user profiles and temporary folders on workstations; ML2 broadens to
  workstations and internet-facing servers; ML3 covers workstations, internet-facing servers
  and non-internet-facing servers, with driver control added.
- **Execution types covered.** ML1 covers executables, libraries, scripts, installers,
  compiled HTML, HTML applications and control panel applets. ML2 and ML3 add stricter
  rules around drivers and event logging.
- **Rule integrity.** ML2 requires Microsoft's "recommended block rules" and ML3 adds
  Microsoft's "recommended driver block rules" to defeat known bypasses.
- **Logging and review.** ML2 introduces centralised event logging with retention. ML3
  introduces alerting and timely investigation of signals indicative of a cyber security
  incident.

When citing a specific requirement in an assessment, quote the line from the live published
Maturity Model. Maturity Model wording is reviewed quarterly with the ISM and changes.

## Evidence an assessor will ask for

- The application control policy itself: AppLocker XML, Windows Defender Application Control
  (WDAC) policy XML, Intune device configuration, JAMF or Workspace ONE profile, fapolicyd
  rules, or equivalent.
- Enforcement mode (audit vs. enforce) on each scope. Audit mode is not compliant beyond
  ML1 baseline exercises.
- Microsoft "recommended block rules" included (ML2 and above).
- Driver control posture (ML3).
- Event logs showing blocked executions and centralised collection.
- Change control records for rule additions: who requested, who approved, justification, and
  expiry where the rule is temporary.
- A list of exceptions with risk acceptance signed off at the right level.

## Where to look in a typical codebase or estate

- Windows estate: AppLocker GPOs, WDAC policy XML, Intune Endpoint Security policies,
  Microsoft Defender for Endpoint configuration packages.
- macOS estate: MDM profiles enforcing Gatekeeper, notarisation requirements, and any
  third-party allowlisting (Santa, Carbon Black, etc.).
- Linux estate: fapolicyd rules, SELinux execmod / execstack posture, IMA / EVM
  configuration, signed package repositories pinned in `/etc/apt/sources.list.d/`,
  `/etc/yum.repos.d/`.
- CI / build hosts: container image policies, signed image enforcement (cosign / sigstore),
  Kubernetes admission policies (Gatekeeper, Kyverno) that reject unsigned images.
- Developer machines: BYOD posture, brew / scoop / chocolatey policies, the lack of any of
  which is often where the audit fails.

## Detection heuristics for an agent

Run these in order against the repo or attached environment:

1. Search for AppLocker / WDAC XML under repo paths `policies/`, `intune/`, `mdm/`,
   `compliance/`. Look for `<RuleCollection Type="Exe" EnforcementMode="...">` and confirm
   `EnforcementMode="Enabled"`, not `"AuditOnly"`.
2. Search for fapolicyd rule files (`/etc/fapolicyd/*.rules`) committed to infra repos.
   Check that `permissive = 0` in `fapolicyd.conf`.
3. Look for Santa configuration on macOS fleet repos. Confirm `ClientMode = 2` (lockdown),
   not `1` (monitor).
4. In Kubernetes manifests, look for an admission controller that enforces image signing
   (Kyverno `ClusterPolicy` with `verifyImages`, or Gatekeeper constraint templates).
5. In CI pipelines (`.github/workflows/*.yml`, `.gitlab-ci.yml`, `azure-pipelines.yml`),
   confirm runners use pinned base images and that the workflow does not pull arbitrary
   tools from the network without checksum or signature verification.
6. Look for centralised log collection from endpoints (Microsoft Defender for Endpoint,
   Sentinel, Splunk, Elastic) and confirm AppLocker / WDAC event channels are forwarded.

## Common implementation patterns

- **Windows**: WDAC for new estates (kernel-level, harder to bypass than AppLocker), with
  AppLocker as a complement for fine-grained user-mode rules. Deploy via Intune. Microsoft's
  recommended block list and driver block list applied as base policies.
- **macOS**: Gatekeeper plus notarisation as the platform baseline, plus a third-party
  allowlisting agent (Santa is the open-source reference) for non-app-bundle executables.
  MDM-locked so the user cannot disable Gatekeeper.
- **Linux servers**: fapolicyd in enforcing mode with rules generated from the package
  manager's known-good database, pinned signed repositories, IMA appraisal for kernel-
  enforced integrity if the kernel build supports it.
- **Containers**: signed images, admission control that rejects unsigned or unscanned
  images, image SBOMs maintained for incident response.

## Common pitfalls

- **Audit mode mistaken for compliance.** AppLocker in audit mode logs would-be blocks but
  does not stop execution. Not compliant beyond an initial rollout window.
- **User-writable allowlisted paths.** Allowlisting `C:\ProgramData\` or
  `%TEMP%\some_subdir\` is the same as no allowlisting.
- **Missing Microsoft recommended block rules.** A WDAC policy without the recommended
  block list can be bypassed by tools Microsoft has already published bypass research for.
- **No driver control at ML3.** Driver bypasses (BYOVD attacks) are common; ML3 requires the
  recommended driver block rules.
- **Log channel never reviewed.** Centralised logging without alerting is partial credit.
- **Single sign-off blocks everything.** A weak change-control process where any analyst can
  add a rule undermines the control. Approvals should be tracked.
- **Developer laptops out of scope.** Engineers who can run unsigned binaries on managed
  laptops circumvent the control. If developer machines are exempt, the system the
  developers build is exposed.

## Cross-references

- ISM controls that map to application control: see [`mappings/e8-to-ism.md`](../../../mappings/e8-to-ism.md).
- Related strategy: user application hardening (configure_office_macros and disable web
  browser features make payload delivery harder, application control stops execution if
  delivery succeeds).

## Sources

- ACSC, Essential Eight Maturity Model.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-maturity-model>
- ACSC, Implementing application control.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/strategies-mitigate-cyber-security-incidents/implementing-application-control>
- ACSC, Essential Eight Assessment Process Guide.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-assessment-process-guide>

Last-verified dates for these URLs are tracked in
[`_shared/sources.md`](../../../_shared/sources.md).
