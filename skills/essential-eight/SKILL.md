---
name: essential-eight
description: Use this skill when the user asks about the Australian Cyber Security Centre's Essential Eight, the Essential Eight Maturity Model (ML1, ML2, ML3), or any of its eight mitigation strategies (application control, patch applications, configure Microsoft Office macro settings, user application hardening, restrict administrative privileges, patch operating systems, multi-factor authentication, regular backups). Trigger phrasings include "is this Essential Eight compliant", "audit against ML1 / ML2 / ML3", "what's our E8 posture", "ACSC mitigation strategy", "Essential Eight gap assessment", "Essential Eight Assessment Process Guide". Trigger on codebase signals such as application allowlisting policies (AppLocker, WDAC, fapolicyd, Gatekeeper config), patching automation, macro security GPOs, MFA wiring in auth code, and backup or restore tooling. Use it for audits, control mapping, evidence collection, SSP and SoA sections, and remediation plans. Do NOT trigger for non-AU frameworks (CIS Controls, NIST 800-53, ISO 27001, SOC 2) unless the user is explicitly asking for a mapping from those frameworks to the Essential Eight.
---

# Essential Eight

The Essential Eight is the ACSC's prioritised set of mitigation strategies for protecting
internet-connected information technology networks. Each strategy has three Maturity Levels
(ML1, ML2, ML3) representing increasing alignment against tradecraft of increasing
sophistication. This skill helps an agent audit, design and document systems against the
Essential Eight at PROTECTED or below.

## When to use this skill

- The user asks for an Essential Eight audit, gap assessment, or maturity uplift plan.
- The user asks "is this repository / system / agency compliant at ML1 / ML2 / ML3".
- The user is writing an SSP, SoA or risk register that references E8 strategies.
- The user is mapping ISO 27001, NIST or CIS controls to Australian government expectations.
- The user is preparing for an IRAP assessment and needs E8 evidence collated.
- The codebase contains application allowlisting policies, patching automation, MFA wiring or
  backup tooling and the user wants those reviewed against the E8.
- The user explicitly mentions ACSC, cyber.gov.au, the Maturity Model, or the Assessment
  Process Guide.

Do not use this skill for general "is my app secure" questions. Use it when the Essential
Eight is the specific lens the user is asking for, or when the user is producing artefacts
that an IRAP assessor or ACSC reader will consume.

## What this skill knows

- The eight mitigation strategies, in the order the ACSC publishes them:
  1. Application control
  2. Patch applications
  3. Configure Microsoft Office macro settings
  4. User application hardening
  5. Restrict administrative privileges
  6. Patch operating systems
  7. Multi-factor authentication
  8. Regular backups
- The three Maturity Levels and what differentiates them: ML1 mitigates commodity tradecraft,
  ML2 mitigates tradecraft that invests more effort in target selection, ML3 mitigates
  tradecraft that is adaptive and less reliant on public tools. The detail per strategy lives
  in `maturity-levels/ml1.md`, `maturity-levels/ml2.md`, `maturity-levels/ml3.md`.
- The Essential Eight Assessment Process Guide (APG) methodology: scope, evidence types,
  sampling, and how assessors weight implementation, design and operation.
- Per-control implementation patterns and detection heuristics in `controls/*.md`.
- Three worked examples in `examples/`: a Windows AppLocker / WDAC baseline, a macOS
  Gatekeeper and notarisation baseline, and a Linux fapolicyd baseline.
- An audit checklist in `audit-checklists/` that produces a per-control finding with
  evidence, gap, and a remediation that an engineer can action.

In scope: implementation patterns for software systems and the operational evidence required
to demonstrate them. Out of scope: assessor sign-off, non-IT controls outside the E8, and any
content for SECRET or above.

## How to apply

When the user asks for an Essential Eight assessment or related artefact, follow this
pattern.

1. **Pin the maturity level.** Ask the user which Maturity Level they are targeting if it is
   not obvious. For most agency engagements the target is ML2. For OFFICIAL or
   OFFICIAL: Sensitive systems with low risk appetite, ML1 may be acceptable. Do not assess
   against an unspecified level.
2. **Scope the system.** List the in-scope technology stack: operating systems, browsers,
   identity providers, email gateways, productivity suites, container runtimes, build
   pipelines. The Essential Eight applies to user computing environments by default. Server
   environments, cloud control planes and CI/CD inherit relevant strategies.
3. **Walk the codebase and surrounding artefacts.** Use the detection heuristics in each
   `controls/*.md`. Typical signals:
   - `package.json`, `requirements.txt`, `go.mod`, `Gemfile.lock`, `Cargo.toml`, `pom.xml`
     for dependency currency (patch applications).
   - IaC under `terraform/`, `bicep/`, `cloudformation/`, `kubernetes/` for OS patching,
     admin role bindings, MFA enforcement and backup configuration.
   - `Dockerfile`, base image pins and image scanning policies for patch applications and
     operating system patching.
   - GitHub Actions / GitLab CI / Azure Pipelines for hardening of build hosts, separation of
     admin privileges, and protected branch and environment policies.
   - SSO / IdP config (Entra ID, Okta, Auth0, Keycloak) for MFA enforcement and phishing-
     resistant factors at ML2 and above.
   - Backup tooling and restore tests for the backups strategy.
4. **Produce a per-control finding.** Each finding has:
   - Strategy and Maturity Level being assessed.
   - Requirement in plain English with a citation to the ACSC Maturity Model.
   - Evidence found (file paths and line ranges, configuration values, screenshots if a
     human is in the loop).
   - Gaps against the requirement.
   - Remediation, sized so an engineer can pick it up. Where the remediation is not the
     repo's job (for example, AppLocker policy lives in Intune, not in the application
     code) say so explicitly and point to where it does live.
5. **Cross-reference the ISM.** Each E8 strategy is mapped to ISM controls in
   `mappings/e8-to-ism.md`. If the user is producing an SSP or SoA, cite the ISM control
   identifiers, not just the strategy name.
6. **Produce a maturity summary.** A short paragraph per strategy with a level (achieved /
   partially achieved / not achieved against the target ML), and an overall maturity number
   that matches the lowest per-strategy level (the Maturity Model is graded against the
   weakest link).
7. **Cite primary sources.** Use the URLs in `_shared/sources.md`. Do not paraphrase the
   Maturity Model in long form; quote short phrases and link to the source.

## Common pitfalls

- **Claiming a maturity level that the weakest strategy does not support.** The model is
  graded against the lowest per-strategy level. ML2 patching with ML1 MFA is ML1 overall.
- **Confusing "implemented" with "operating effectively".** Assessors expect evidence that the
  control runs in production, not just that it exists in a config file. Log samples, alerting
  destinations, last-restore-test date, and the ticket trail for exceptions all matter.
- **Treating the E8 as a complete security programme.** It is a baseline against a specific
  threat model. PROTECTED-classified systems still need the broader ISM controls.
- **Ignoring user computing devices.** The Essential Eight applies to the laptops and
  workstations engineers use to build the system, not only the system itself. If your
  developers run unmanaged macOS with no MFA on Git push, that is in scope.
- **Patching SLA mis-statements.** ML1, ML2 and ML3 have specific patching windows for
  internet-facing services, workstations, and other infrastructure. Always quote the window
  from the published Maturity Model rather than guessing.
- **Backups that have never been restored.** A backup strategy without a tested restore is
  not compliant at any maturity level. Look for restore test evidence.
- **MFA on the IdP but not on local admin accounts.** ML2 and above require MFA for
  privileged actions, not just for SSO sign-in.

## How to invoke the sub-files

This SKILL.md is the trigger and the operating manual. The detail lives in:

- `controls/application-control.md`
- `controls/patch-applications.md`
- `controls/ms-office-macros.md`
- `controls/user-application-hardening.md`
- `controls/restrict-admin-privileges.md`
- `controls/patch-operating-systems.md`
- `controls/multi-factor-authentication.md`
- `controls/regular-backups.md`
- `maturity-levels/ml1.md`, `ml2.md`, `ml3.md`
- `audit-checklists/` for ready-to-run assessment templates
- `examples/` for worked baselines on Windows, macOS and Linux

Read the controls referenced by the user's question, not the whole pack. The maturity-level
files are reference material for cross-strategy comparisons.

## Sources

All citations are primary. Last-verified dates are tracked centrally in
[`_shared/sources.md`](../../_shared/sources.md).

- ACSC, Essential Eight:
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight>
- ACSC, Essential Eight Maturity Model:
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-maturity-model>
- ACSC, Essential Eight Assessment Process Guide:
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-assessment-process-guide>
- ACSC, Information Security Manual (for ISM mappings):
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism>
