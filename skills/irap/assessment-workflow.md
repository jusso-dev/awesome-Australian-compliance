# IRAP assessment workflow

This document is the operating manual for an IRAP assessment, aligned to the ACSC's
**IRAP Common Assessment Framework (CAF) v1.0, April 2025**. The CAF replaces the
earlier *IRAP assessment process guide* and is the authoritative methodology for IRAP
assessors. Assessees and engineering teams supporting an assessment should align their
preparation to the same structure.

> Source: ASD, IRAP Common Assessment Framework, April 2025.
> <https://www.cyber.gov.au/sites/default/files/2025-04/IRAP%20common%20assessment%20framework.pdf>
> Last-verified: 2026-05-13 (against the published v1.0 text).

## Four CAF stages

```
Stage 1: Plan and prepare
Stage 2: Define the assessment boundary
Stage 3: Assess the controls
Stage 4: Produce the IRAP assessment report
```

The CAF is written for IRAP assessors. The summary below restates each stage from the
assessor's perspective and then notes what the assessee should produce or have ready.

## Stage 1 - Plan and prepare

The CAF requires the assessor to inform the ASD IRAP Administration team of the intent
to conduct an assessment by submitting an IRAP **engagement form** through the
**Partner Portal**, which also includes a **Conflict of Interest (COI) declaration**.

CAF requirements that bind the assessor at this stage:

- **IRAP-AR-0008** - The assessor submits a COI declaration to ASD IRAP prior to
  commencing the assessment.
- **IRAP-AR-0009** - The COI declaration is submitted at least **7 business days**
  prior to commencement.
- **IRAP-AR-0010** - The assessor updates and maintains the COI declaration throughout
  the assessment and informs ASD IRAP of any changes.
- **IRAP-AR-0011** - The report outlines all nature of conflicts of interest for
  authorising officers.
- **IRAP-AR-0012** - The assessment uses necessary Australian Government cyber security
  frameworks, policies and guidance (including the ISM and PSPF).
- **IRAP-AR-0014** - The assessor uses the latest release of the ISM available prior to
  the start of the assessment.
- **IRAP-AR-0015** - Where the assessment lapses **2 ISM releases**, a delta assessment
  against the current ISM is conducted.
- **IRAP-AR-0016** - Where the assessor lacks technical depth in a component, they are
  supported by a security assessment team with the relevant expertise.

In consultation with the client, the assessor determines:

- Assessment start date, expected end date, and milestones.
- **Access to resources** including documentation, system accounts, tools, personnel
  and facilities. Documents may include:
  - System Security Plan (SSP) and annex.
  - Risk management documents.
  - Design and architectural documents.
  - Incident response plans and playbooks.
  - Organisational policies.
  - Standard Operating Procedures (SOPs).
  - Security test cases and test plans.
  - Business Continuity Plans (BCP) and Disaster Recovery Plans (DRP).
  - Functional and non-functional requirements.
  - Configuration and build documents.
  - DevSecOps documents (including pipeline).
- **Intended methodologies** to be used (sampling, evidence gathering, testing).
- **System and control testing activities** that will be conducted.
- **Evidence collection processes and protection**, including post-assessment
  requirements.
- Whether managed service providers or outsourced providers manage any aspect of the
  system, with points of contact.
- **Other applicable frameworks**:
  - Hosting Certification Framework (HCF).
  - Security Construction and Equipment Committee (SCEC) assessment.
  - Protective Security Policy Framework (PSPF).
- Appropriate use and marketing of the IRAP assessment and artefacts.
- Communication of what an IRAP assessment is and is not for.
- Availability of IRAP artefacts for ASD quality assurance.
- Required skills and the assessment team composition.

The assessor **may develop an IRAP assessment plan** documenting the above and share it
with the client. The CAF does not mandate this artefact but it is encouraged.

### Assessee preparation for Stage 1

Make ready in advance:

- The current SSP and annex.
- The risk register.
- Architecture and design documentation, including diagrams.
- IR, BCP and DR plans with recent exercise records.
- Organisational policies and SOPs.
- Build and configuration documents; IaC repositories.
- DevSecOps pipeline documentation.
- Functional and non-functional requirements.
- A named engagement point of contact and SMEs for each domain.
- Organisational profile (legal name, mission, contacts) per
  [`./organisational-intake.md`](./organisational-intake.md). The CAF does not list
  these as separate items but they are required by the IRAP Assessment Report Template
  cover sheet and by the engagement letter.

## Stage 2 - Define the assessment boundary

The CAF distinguishes the **assessment boundary** from the **authorisation boundary**.

- **Assessment boundary**: all components of an information system to be assessed in
  scope of the assessed entity's Information Security Continuous Monitoring (ISCM)
  implementation, plus the associated assessment objects.
- **Authorisation boundary**: all components an authorising officer authorises for
  operation, which may exclude separately authorised systems. The authorisation
  boundary is not larger than the assessment boundary, although it may aggregate
  multiple assessment boundaries.

See [`./boundaries.md`](./boundaries.md) for diagrams and worked examples.

CAF requirements at this stage:

- **IRAP-AR-0017** - The assessor regularly reviews, validates and maintains the
  assessment boundary.
- **IRAP-AR-0018** - The assessment report clearly defines the assessment boundary.
- **IRAP-AR-0019** - The report covers data sovereignty, offshore equipment and staff,
  or any information (including metadata) not within Australia.
- **IRAP-AR-0020** - The assessment covers all applicable environments, software,
  workstations, network devices, servers and other devices or services within the
  boundary.
- **IRAP-AR-0021** - The rationale for out-of-scope items is clearly articulated in
  the report and the controls matrix.

Considerations when defining the boundary:

- System boundaries: version and environments (PROD, PRE-PROD, TEST, DEV).
- Security and control classification of data stored, processed or communicated.
- Components, people, processes, technologies and facilities that the system relies on
  or that affect its security posture.
- Service provider's corporate network may be in scope, depending on secure
  administration practices and segmentation between the corporate network and the
  cloud infrastructure. End User Computing devices used for privileged activities are
  relevant; jump servers alone do not adequately protect the underlying devices.
- Previous assessments.
- Identification of assets, components, applications, networks, data and physical
  facilities.
- Parties (including suppliers) involved in delivering or maintaining the system and
  its controls (shared responsibility model and control inheritance).
- SSP annex, Controls Matrix (CCM if available) and logical system diagrams to identify
  controls applicable to the system boundary.

The CAF also covers **layering** of assessments (Layer 1: cloud infrastructure provider;
Layer 2: SaaS provider; Layer 3: consumer government agency). See
[`./boundaries.md`](./boundaries.md).

## Stage 3 - Assess the controls

The assessor collects and reviews evidence to determine **implementation effectiveness**
of controls against the ISM and other applicable frameworks.

### Implementation outcomes

The CAF specifies a single set of outcomes for control implementation effectiveness:

- **Effective**
- **Ineffective**
- **Alternate control**
- **Not assessed**
- **Not applicable**
- **No visibility**
- **Not implemented**

All control assessments (including Not applicable and Not implemented) must include the
assessor's justification.

CAF requirement: **IRAP-AR-0003** - The assessor uses the correct terminology and
intent for assessing control implementation, defined by ASD.

See [`./implementation-outcomes.md`](./implementation-outcomes.md) for definitions and
worked examples.

### Assessment objects and methods

Drawn from NIST SP 800-53A r5:

- **Assessment objects**: Specifications, Mechanisms, Activities, Personnel.
- **Assessment methods**: Examine, Interview, Test.

CAF requirement: **IRAP-AR-0024** - The assessor outlines the assessment objects and
methods utilised within the controls matrix for each control.

### Assessment degree

The CAF defines an **assessment degree matrix** combining coverage assurance (Very low /
Low / Medium / High) with depth and evidence quality (Poor / Fair / Good / Excellent),
producing one of three degrees:

- **Basic assessment**
- **Focused assessment**
- **Comprehensive assessment**

See [`./evidence-quality.md`](./evidence-quality.md) for the matrix and selection
guidance.

### Sampling

Sampling supports direct control assessments where it is impractical to assess every
component. The CAF lists four methodologies: Random, Stratified, Risk-based,
Systematic. The assessor must clearly explain the methodology and any disadvantages.

CAF requirements:

- **IRAP-AR-0001** - Assessor has assessed all components within the boundary and used
  sampling only where appropriate.
- **IRAP-AR-0002** - The assessor clearly explains the sampling methodology.

See [`./sampling.md`](./sampling.md).

### Quality of evidence

Evidence tiers:

- **Excellent**: examine, test or review firsthand the activities, processes or
  mechanisms.
- **Good**: review various sources evidencing the existence of activities, processes or
  mechanisms.
- **Fair**: second-hand evidence demonstrating the control has been implemented.
- **Poor**: statements of implementation from personnel or specifications without
  underlying evidence.

CAF requirements:

- **IRAP-AR-0004** - The assessor bases the assessment on presented evidence and facts
  and does not make inappropriate assumptions.
- **IRAP-AR-0005** - Evidence is at a sufficient quality and is appropriate for the
  system and control.
- **IRAP-AR-0006** - The report clearly articulates any constraints or limitations
  affecting the assessment.
- **IRAP-AR-0026** - The report and controls matrix outline the evidence gathered.
- **IRAP-AR-0027** - Where evidence is insufficient, the limitations and impact are
  documented in the report and the controls marked accordingly.

### Assessing changes, alternate controls and multiple services

The CAF provides specific guidance for:

- **Assessing changes** to an already-assessed system: identify changes, gaps and
  altered workflows; assess impact on existing controls; deliver delta report,
  addendum, or new report depending on engagement.
- **Alternate controls**: must effectively meet the intent of the ISM control with
  sufficient evidence. **IRAP-AR-0030** binds this.
- **Multiple services**: each service is assessed against applicable controls;
  deviations from common controls are outlined per service. **IRAP-AR-0031**.

## Stage 4 - Produce the IRAP assessment report

The deliverables are:

- **IRAP Security Assessment Report** (or **IRAP Cloud Security Assessment Report**)
  for authorising officers, system owners and risk owners.
- **Controls Matrix** (or **Cloud Controls Matrix**) for technical personnel and system
  administrators.

The report describes:

- The assessment boundary.
- The system and environments assessed (PROD, PRE-PROD, TEST, DEV).
- Security strengths and weaknesses.
- Limitations during the assessment and how they affected activities.
- The implementation of controls.
- The justification for each implementation effectiveness outcome, the evidence gathered
  and how the control was tested.
- Security weaknesses and vulnerabilities **without** rating risk or determining
  acceptability for authorisation.
- Recommendations and remediation activities (**descriptive**, not prescriptive).

The Controls Matrix contains per-control observations including:

- Brief description of the control implementation and its effectiveness.
- Responsibilities between the organisation and any external service providers.
- The assessment method used.
- The evidence gathered and its quality.

### Recommendations

CAF guidance: provide **descriptive** recommendations that explain the issue and its
implications, allowing the organisation to take a risk-based approach. Avoid
prescriptive recommendations that dictate a specific solution.

When assessing a service that government entities will authorise, the assessor requests
consumer recommendations from the provider and includes them in the report
(**IRAP-AR-0007**).

### Report quality CAF requirements

The CAF binds the following report-quality requirements (full list in
[`./quality-standards.md`](./quality-standards.md)):

- **IRAP-AR-0023** - The assessor only assesses what is implemented, not what will be
  implemented.
- **IRAP-AR-0032** - The report and controls matrix are reviewed by security
  professionals internally and by the stakeholder prior to final release.
- **IRAP-AR-0033** - The assessor articulates the potential impact but does not rate
  risks on behalf of the assessed entity or government agency.
- **IRAP-AR-0034** - Key vulnerabilities and weaknesses are clearly articulated as
  early as possible.
- **IRAP-AR-0041** - The assessor does not use statements of compliance, conformity,
  certification or authorisation.
- **IRAP-AR-0042** - The report does not include biased or misleading statements or
  marketing jargon.
- **IRAP-AR-0044** - The report clearly outlines the shared responsibility model.
- **IRAP-AR-0045** - The assessor uses the IRAP assessment report and controls matrix
  template provided by ASD, modifying sections as required.
- **IRAP-AR-0046** - The assessor provides a complete report and controls matrix to
  the assessed entity on completion.

### ASD-provided templates

The CAF directs assessors to use ASD's published templates:

- IRAP Assessment Report Template (Word document).
  <https://www.cyber.gov.au/sites/default/files/2025-02/IRAP-Assessment-Report-Template-V1.0_2025.docx>
- Cloud Security Assessment Report Template.
  <https://www.cyber.gov.au/sites/default/files/2023-03/Cloud-Security-Assessment-Report-Template-06-July-2022.docx>

The assessee does not author these documents. The assessor does, using inputs the
assessee provides during Stages 1 to 3.

## Post-assessment (for the assessee)

The CAF stops at Stage 4. From the assessee's perspective the work continues:

- Respond to recommendations and weaknesses identified in the report.
- Submit the report to the authorising officer for an authorisation decision.
- Roll any uplift work into business-as-usual security operations.
- Schedule the next assessment based on the authorising agency's expectations and the
  system's change profile.

The authorising officer makes the risk-based authorisation decision. IRAP assessors do
not certify, accredit, endorse, register or authorise systems.

## Typical durations

The CAF does not prescribe durations. As a working guide, refined by the four-stage
structure:

- Stage 1 (Plan and prepare), assessor side: 2 to 4 weeks including the 7 business-day
  COI lead time.
- Stage 1 assessee preparation: 4 to 12 weeks depending on starting state of the
  documentation.
- Stage 2 (Boundary definition): 1 to 2 weeks elapsed, often overlapping with Stage 1.
- Stage 3 (Assess the controls): 4 to 12 weeks of assessor effort for a moderately
  complex system, plus the assessee's evidence and workshop time.
- Stage 4 (Report): 3 to 6 weeks elapsed, including internal review and stakeholder
  review per **IRAP-AR-0032**.

## Common pitfalls

- Treating the IRAP report as certification. **IRAP-AR-0041** explicitly forbids this.
- Confusing the assessment boundary and the authorisation boundary.
- Assessor and assessee proceeding before the COI declaration has been submitted to
  ASD (the 7 business-day lead time is a hard CAF requirement).
- ISM release drift during a long engagement (**IRAP-AR-0015** requires a delta
  assessment if 2 releases lapse).
- Sampling used to exclude components rather than to validate the sum (**IRAP-AR-0001**
  forbids this).
- Risk ratings authored by the assessor (**IRAP-AR-0033** explicitly forbids this; the
  authorising officer rates risk, not the assessor).
- Prescriptive recommendations dictating the implementation rather than describing the
  intent.
- Marketing or compliance language in the report.

## Sources

- ASD, IRAP Common Assessment Framework v1.0 (April 2025). Last-verified: 2026-05-13.
  <https://www.cyber.gov.au/sites/default/files/2025-04/IRAP%20common%20assessment%20framework.pdf>
- ASD, IRAP Policy and Procedures.
  <https://www.cyber.gov.au/sites/default/files/2023-03/IRAP%20Policy%20and%20Procedures.pdf>
- ASD, IRAP Assessment Report Template.
  <https://www.cyber.gov.au/sites/default/files/2025-02/IRAP-Assessment-Report-Template-V1.0_2025.docx>
- ASD, Cloud Security Assessment Report Template.
  <https://www.cyber.gov.au/sites/default/files/2023-03/Cloud-Security-Assessment-Report-Template-06-July-2022.docx>
- ASD, IRAP programme.
  <https://www.cyber.gov.au/about-us/about-asd/programs-and-services/irap>
- ASD, IRAP Consumer Guide.
  <https://www.cyber.gov.au/resources-business-and-government/governance-and-user-education/governance/irap/irap-consumer-guide>
- NIST SP 800-53A Revision 5 (Assessment objects and methods terminology). Cell
  reference only.
- AuASB ASA 530 - Audit Sampling. Cell reference only.
