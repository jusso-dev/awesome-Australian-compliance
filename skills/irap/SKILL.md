---
name: irap
description: Use this skill when the user asks about the Information Security Registered Assessors Program (IRAP), the IRAP Common Assessment Framework (CAF), an IRAP-registered assessor, an IRAP Security Assessment Report or Cloud Security Assessment Report, the Controls Matrix or Cloud Controls Matrix, the four CAF stages (Plan and prepare, Define the assessment boundary, Assess the controls, Produce the report), an IRAP Assessment Requirement (IRAP-AR-XXXX), implementation outcomes (Effective, Ineffective, Alternate control, Not assessed, Not applicable, No visibility, Not implemented), evidence quality (Excellent / Good / Fair / Poor), the assessment-degree matrix (Basic / Focused / Comprehensive), sampling methodologies (Random / Stratified / Risk-based / Systematic), assessment vs authorisation boundary, layered assessments (Layer 1 cloud infra / Layer 2 SaaS / Layer 3 consumer), the assessor's Conflict of Interest declaration to ASD IRAP, or the artefacts an IRAP assessor will demand (SSP, Statement of Applicability, security risk management plan, IR plan, BCP/DRP, design and configuration documents, DevSecOps documentation). Trigger on phrasings like "starting an IRAP", "IRAP CAF", "IRAP intake", "prescreening", "what does the assessor want", "draft an SSP", "IRAP scope", "responding to IRAP findings", and on the specific IRAP-AR identifiers. Also trigger when the user is gathering organisational details (legal entity, ABN / ACN, registered address, mission, contacts) ahead of an engagement. Do NOT trigger for non-AU assurance regimes (FedRAMP, SOC 2, ISO 27001 audits) unless the user is explicitly asking how IRAP compares.
---

# IRAP - Information Security Registered Assessors Program

IRAP is the Australian Signals Directorate's programme that registers independent
assessors to evaluate ICT systems and services against the Information Security Manual
(ISM). The current authoritative methodology is the **IRAP Common Assessment
Framework (CAF) v1.0, April 2025**, which replaced the earlier *IRAP assessment process
guide*.

An IRAP assessment is **not** a certification. IRAP assessors do not certify, accredit,
endorse, register or authorise systems. They identify security strengths and weaknesses
so that an **authorising officer** can make a risk-based authorisation decision.

The minimum deliverables of an IRAP assessment are:

- **IRAP Security Assessment Report** (or **IRAP Cloud Security Assessment Report**)
  intended for authorising officers, system owners and risk owners.
- **Controls Matrix** (or **Cloud Controls Matrix**) intended for technical personnel
  and system administrators.

## When to use this skill

- The user is preparing for, or responding to, an IRAP assessment.
- The user is writing an SSP, an SoA, a security risk management plan, or other Stage 1
  inputs the assessor will request.
- The user is mapping shared responsibilities between a cloud or SaaS provider and the
  consumer agency.
- The user is reading an existing IRAP report from a provider and asking what to
  inherit, what to verify and what is theirs to implement.
- The user is preparing for an authorising officer's risk-based decision based on an
  IRAP report.
- The user is asking about a specific IRAP Assessment Requirement (IRAP-AR-XXXX).
- The codebase or estate contains artefacts the assessor will sample: IaC, IdP exports,
  monitoring config, DevSecOps pipelines, evidence packs.

## What this skill knows

- The four CAF stages: Plan and prepare, Define the assessment boundary, Assess the
  controls, Produce the IRAP assessment report.
- The 46 IRAP Assessment Requirements (IRAP-AR-0001 through IRAP-AR-0046) grouped
  under the CAF's seven quality standards (Report quality and terminology, Assessment
  process and frameworks, Evidence gathering, Coverage, Objectivity, Technical accuracy
  and completeness, Assessment integrity). See
  [`./quality-standards.md`](./quality-standards.md).
- The seven implementation outcomes and the rules around their use. See
  [`./implementation-outcomes.md`](./implementation-outcomes.md).
- The four-tier evidence quality model (Excellent, Good, Fair, Poor) and the
  assessment-degree matrix (Basic, Focused, Comprehensive). See
  [`./evidence-quality.md`](./evidence-quality.md).
- The four sampling methodologies (Random, Stratified, Risk-based, Systematic). See
  [`./sampling.md`](./sampling.md).
- The distinction between **assessment boundary** and **authorisation boundary**, and
  layered assessments. See [`./boundaries.md`](./boundaries.md).
- The mandatory Conflict of Interest declaration to ASD IRAP via the Partner Portal,
  submitted at least 7 business days before commencement (IRAP-AR-0008 and -0009), and
  the obligation to update it throughout the engagement (IRAP-AR-0010).
- The role of the system authoriser (the agency that authorises the system based on
  the IRAP outcome) and the explicit prohibition on the assessor rating risk or making
  authorisation statements (IRAP-AR-0033, IRAP-AR-0041).
- The ISM-release-handling rule: use the latest ISM at start (IRAP-AR-0014); if 2 ISM
  releases lapse during the engagement, conduct a delta assessment (IRAP-AR-0015).

In scope: IRAP for systems up to PROTECTED. Out of scope: high-assurance assessments
above PROTECTED.

## How to apply

1. **Establish the engagement.** Capture the organisational profile, principal
   contacts, and the assessor-side CAF Stage 1 inputs (engagement form via the Partner
   Portal, COI declaration to ASD IRAP, assessment plan). See
   [`./organisational-intake.md`](./organisational-intake.md).
2. **Pin the ISM release.** Open [`../ism/versions.md`](../ism/versions.md) and pin to
   the latest release available at start (IRAP-AR-0014). Track release changes during
   the engagement against IRAP-AR-0015.
3. **Pin the classification and system type.**
4. **Define the assessment boundary.** Use [`./boundaries.md`](./boundaries.md). Be
   explicit about in-scope and out-of-scope components, environments (PROD, PRE-PROD,
   TEST, DEV), data sovereignty considerations, offshore equipment and staff
   (IRAP-AR-0019), and the shared responsibility model.
5. **Identify shared responsibilities and layered assessments.** For cloud-hosted
   systems, identify Layer 1 (infrastructure provider), Layer 2 (SaaS provider, if any)
   and Layer 3 (consumer government agency) and the inherited controls from each.
6. **Produce or refresh the SSP.** Use [`ssp-template.md`](./ssp-template.md). Pin
   every control reference to the ISM release.
7. **Produce or refresh the SoA / Controls Matrix.** Use
   [`soa-template.md`](./soa-template.md). For each applicable ISM control: the
   implementation outcome (per the seven CAF outcomes), justification, evidence, and
   any deviation from common controls (IRAP-AR-0031).
8. **Assemble the Stage 1 documentation pack.** The CAF lists: SSP and annex, risk
   management documents, design and architecture, IR plans and playbooks,
   organisational policies, SOPs, security test cases and test plans, BCP/DRP,
   functional and non-functional requirements, configuration and build documents, and
   DevSecOps documents (including pipeline).
9. **Run the assessment.** Stage 3 walks the controls using examine / interview / test
   methods against specifications / mechanisms / activities / personnel as assessment
   objects. Sampling is supportive; coverage of components within the boundary is
   mandatory (IRAP-AR-0001).
10. **Respond to draft report and recommendations.** Recommendations are descriptive;
    decide how the entity will implement them.
11. **Submit the final report to the system authoriser.** The IRAP Security Assessment
    Report and the Controls Matrix are inputs to the authoriser's decision. The
    authoriser, not the assessor, makes the authorisation call.

## Common pitfalls

- Treating an IRAP report as certification. **IRAP-AR-0041** prohibits statements of
  compliance, conformity, certification or authorisation.
- Confusing the assessment boundary and the authorisation boundary. The authorisation
  boundary cannot be larger than the assessment boundary.
- Proceeding before the assessor's COI declaration has been submitted to ASD IRAP (the
  7-business-day clock under IRAP-AR-0009 is hard).
- Letting ISM-release drift go unmanaged across a long engagement (IRAP-AR-0015
  requires a delta).
- Sampling used to exclude components rather than validate them (IRAP-AR-0001).
- Risk ratings authored by the assessor (IRAP-AR-0033 explicitly prohibits this).
- Prescriptive recommendations that dictate a vendor or product instead of describing
  intent.
- Marketing or compliance jargon in the report (IRAP-AR-0042).
- Treating a provider's IRAP letter as covering controls that are actually the
  consumer's responsibility under the shared responsibility model.

## Sub-files

- [`organisational-intake.md`](./organisational-intake.md) - Stage 1 organisational
  inputs (CAF-required and common-practice items split out), principal contacts,
  prescreening, COI process.
- [`engagement-letter-template.md`](./engagement-letter-template.md) - commercial
  engagement letter complementing the CAF artefacts.
- [`assessment-workflow.md`](./assessment-workflow.md) - the four CAF stages with the
  IRAP-AR requirements bound to each stage.
- [`boundaries.md`](./boundaries.md) - assessment vs authorisation boundary and
  layered assessments.
- [`implementation-outcomes.md`](./implementation-outcomes.md) - the seven outcomes
  with worked examples.
- [`evidence-quality.md`](./evidence-quality.md) - the four evidence tiers and the
  assessment-degree matrix.
- [`sampling.md`](./sampling.md) - Random / Stratified / Risk-based / Systematic.
- [`quality-standards.md`](./quality-standards.md) - all 46 IRAP-AR requirements.
- [`ssp-template.md`](./ssp-template.md) - drop-in System Security Plan template.
- [`soa-template.md`](./soa-template.md) - drop-in Statement of Applicability template.
- `examples/` - prescreening questionnaire, scoping document, finding-response register.

The `templates/` directory at the repo root has framework-neutral SSP, SoA, PIA, NDB
runbook and IRP templates.

## Sources

- ASD, IRAP Common Assessment Framework v1.0 (April 2025). Last-verified: 2026-05-13.
  <https://www.cyber.gov.au/sites/default/files/2025-04/IRAP%20common%20assessment%20framework.pdf>
- ASD, IRAP Policy and Procedures.
  <https://www.cyber.gov.au/sites/default/files/2023-03/IRAP%20Policy%20and%20Procedures.pdf>
- ASD, IRAP Assessment Report Template.
  <https://www.cyber.gov.au/sites/default/files/2025-02/IRAP-Assessment-Report-Template-V1.0_2025.docx>
- ASD, Cloud Security Assessment Report Template.
  <https://www.cyber.gov.au/sites/default/files/2023-03/Cloud-Security-Assessment-Report-Template-06-July-2022.docx>
- ASD, IRAP Consumer Guide.
  <https://www.cyber.gov.au/resources-business-and-government/governance-and-user-education/governance/irap/irap-consumer-guide>
- ASD, IRAP programme.
  <https://www.cyber.gov.au/about-us/about-asd/programs-and-services/irap>
- ASD, Information Security Manual.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism>
- DTA, Cloud Assessment and Authorisation Framework.
  <https://www.dta.gov.au/help-and-advice/cloud/cloud-assessment-and-authorisation-framework>
- NIST SP 800-53A Revision 5 (assessment objects and methods terminology). Cell
  reference only.

Last-verified dates for additional URLs are tracked centrally in
[`_shared/sources.md`](../../_shared/sources.md).
