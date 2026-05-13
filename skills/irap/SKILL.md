---
name: irap
description: Use this skill when the user asks about an Information Security Registered Assessors Program (IRAP) assessment, an IRAP-registered assessor, an IRAP report or letter, the scope and stages of an IRAP, the Cloud Assessment and Authorisation Framework's reliance on IRAP, or the artefacts an IRAP assessor will demand (System Security Plan, Statement of Applicability, security risk management plan, residual risk acceptance). Trigger on phrasings like "we need an IRAP", "what does the assessor want", "draft an SSP", "draft a Statement of Applicability", "IRAP scope", "IRAP stage 1 vs stage 2", "what does IRAP cost / take", "responding to IRAP findings". Use the skill to plan and execute an assessment, scaffold the documentation, prepare evidence, and respond to findings. Do NOT trigger for non-AU assurance regimes (FedRAMP, SOC 2, ISO 27001 audits) unless the user is explicitly asking how IRAP compares.
---

# IRAP - Information Security Registered Assessors Program

IRAP is the Australian Cyber Security Centre's programme that registers independent
assessors to evaluate systems against the Information Security Manual (ISM). An IRAP
assessment is not a certification; it is a point-in-time independent assessment that
the consuming agency (the "system authoriser") relies on when authorising a system to
hold government information.

Cloud service providers serving Australian government typically run regular IRAP
assessments so that agency customers can use the resulting report under the DTA's
Cloud Assessment and Authorisation Framework. Custom-built systems running on those
cloud services run their own narrower IRAP assessment.

## When to use this skill

- The user is preparing for an IRAP for a system, a service or a piece of infrastructure.
- The user is responding to an existing IRAP report or finding.
- The user is producing or revising the SSP, SoA, security risk management plan, or
  residual risk acceptance.
- The user is evaluating cloud or SaaS suppliers and needs to read their IRAP letter and
  Statement of Applicability.
- The user is scoping the assessment (system boundary, classification, ISM release,
  shared responsibilities with a cloud provider).
- The user is producing evidence for the assessor walking the codebase, IaC, IdP and
  monitoring.

## What this skill knows

- The IRAP programme as administered by the ACSC, including assessor registration.
- The typical structure of an IRAP engagement: scoping, evidence gathering, on-site or
  remote workshop, draft report, response to findings, final report.
- The artefacts an IRAP assessor expects: System Security Plan (SSP), Statement of
  Applicability (SoA), security risk management plan (SRMP), security risk register,
  incident response plan, business continuity / disaster recovery plan, and a structured
  evidence pack mapping each applicable ISM control to evidence.
- The role of the system authoriser (the agency that authorises the system based on the
  IRAP outcome) versus the assessor (the independent IRAP-registered individual).
- The interaction with the Cloud Assessment and Authorisation Framework: the IRAP report
  is one input to the agency's authorisation decision.

In scope: IRAP for systems up to PROTECTED. Out of scope: high-assurance assessments
above PROTECTED.

## How to apply

1. **Pin the ISM release.** Open [`../ism/versions.md`](../ism/versions.md) and confirm
   the release the assessment will use. Most assessments pin to the latest published
   release at the time of the engagement.
2. **Pin the classification and system type.** PROTECTED, OFFICIAL: Sensitive, or
   OFFICIAL. System type drives which controls are applicable.
3. **Define the boundary.** The system boundary is the scope of the assessment. Be
   precise: which networks, which AWS accounts, which Kubernetes clusters, which SaaS
   integrations, which on-premises components. Include or explicitly exclude developer
   workstations.
4. **Identify shared responsibilities.** For cloud-hosted systems, the underlying
   provider has its own IRAP and SoA. Document which controls are inherited from the
   provider and which are the system owner's responsibility. Do not re-assess the
   inherited controls; refer to the provider's IRAP letter and SoA.
5. **Produce or refresh the SSP.** Use [`ssp-template.md`](./ssp-template.md). Pin every
   control reference to the ISM release.
6. **Produce or refresh the SoA.** Use [`soa-template.md`](./soa-template.md). For each
   applicable ISM control: applicable / not applicable / inherited / risk accepted,
   with justification and evidence.
7. **Produce the security risk management plan and register.** Identify the system's
   security risks, evaluate them, document mitigations and residual risk.
8. **Schedule the engagement.** Allow lead time: scoping calls, document review, the
   workshop (typically 1 to 2 weeks of assessor time for a moderately complex system),
   draft-report cycle, finalisation.
9. **Run the workshop.** The assessor walks the SSP, the SoA, the risk register and the
   evidence. Be ready to demonstrate live systems, not just artefacts.
10. **Respond to findings.** The assessor categorises findings. Decide for each: remediate
    before finalisation, accept the residual risk with system-authoriser sign-off, or
    contest the finding with reasoning.
11. **Submit to the system authoriser.** The IRAP letter and report are inputs to the
    agency's authorisation decision. The authoriser may accept the residual risk, ask
    for further remediation, or decline authorisation.

## Common pitfalls

- **Scope creep during the workshop.** Stay disciplined about the boundary. If the
  assessor asks about adjacent systems, document them as out-of-scope dependencies with
  a separate assurance basis.
- **Inherited controls re-assessed.** Wastes assessor time and the system owner's. Point
  at the provider's IRAP letter.
- **SSP referencing a stale ISM release.** Roll the SSP forward before the engagement.
- **Evidence pack without traceability.** Each control must point to specific evidence
  (file path, log sample, configuration export). "See SIEM" is not evidence.
- **Verbal demonstrations not recorded.** Capture screenshots or session recordings of
  workshop demos and store them in the evidence pack.
- **Findings disputed informally.** Disagreement with a finding should be captured in
  writing and addressed in the report cycle, not over Slack.
- **No system authoriser engagement.** The IRAP is for the authoriser; engage them
  early so the residual risk acceptance is not a surprise.

## Sub-files

- [`assessment-workflow.md`](./assessment-workflow.md) - end-to-end IRAP workflow
  including scoping, documentation, workshop and post-assessment.
- [`ssp-template.md`](./ssp-template.md) - drop-in System Security Plan template.
- [`soa-template.md`](./soa-template.md) - drop-in Statement of Applicability template.
- `examples/` - worked examples including an IRAP scoping document and a sample
  finding-response register.

The `templates/` directory at the repo root also has the universal forms of these
templates (SSP and SoA) that are not IRAP-specific; the IRAP versions add the
assessor-facing structure.

## Sources

- ACSC, IRAP.
  <https://www.cyber.gov.au/about-us/about-asd/programs-and-services/irap>
- ACSC, Information Security Manual.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism>
- DTA, Cloud Assessment and Authorisation Framework.
  <https://www.dta.gov.au/help-and-advice/cloud/cloud-assessment-and-authorisation-framework>

Last-verified dates are tracked centrally in
[`_shared/sources.md`](../../_shared/sources.md).
