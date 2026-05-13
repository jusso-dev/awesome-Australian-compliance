## IRAP assessment workflow

This document is the operating manual for taking a system through an IRAP assessment.
The audience is the system owner and the engineering team supporting the assessment. An
IRAP-registered assessor will have their own internal methodology; this workflow lines up
with that, but is written from the assessee's perspective.

## Stages

```
1. Pre-engagement scoping
2. Documentation preparation
3. Evidence gathering
4. Assessor engagement (workshop / fieldwork)
5. Draft report and finding response
6. Final report and system authoriser decision
7. Post-assessment uplift
```

### Stage 1 - Pre-engagement scoping

Before engaging an assessor:

- Confirm the business need: which agency consumer, which classification, which
  authorisation timeline.
- Pin the ISM release. See [`../ism/versions.md`](../ism/versions.md).
- Define the system boundary explicitly. Capture in a one-page scoping document with a
  diagram showing in-scope and out-of-scope components.
- Identify the shared-responsibility model. For each inherited control, note the
  provider, the provider's IRAP date, and the relevant section of the provider's SoA.
- Estimate the residual risk profile. If the system has known compensating controls
  for missing ISM controls, list them.
- Engage the system authoriser. Confirm they accept the proposed scope and ISM release.
- Select an IRAP-registered assessor. The ACSC publishes the IRAP-registered assessors
  list. Choose based on fit (cloud experience, sector experience), availability and
  cost.

Output: scoping document, signed by system owner, used in the engagement statement of
work with the assessor.

### Stage 2 - Documentation preparation

Produce or refresh:

- System Security Plan (SSP) - see [`ssp-template.md`](./ssp-template.md).
- Statement of Applicability (SoA) - see [`soa-template.md`](./soa-template.md).
- Security Risk Management Plan (SRMP).
- Security risk register.
- Incident Response Plan (IRP) - see [`../../templates/incident-response-plan.md`](../../templates/incident-response-plan.md)
  when published.
- Business Continuity Plan and Disaster Recovery Plan.
- Privacy Impact Assessment if personal information is in scope - see
  [`../../templates/privacy-impact-assessment.md`](../../templates/privacy-impact-assessment.md).

Pin every ISM control reference to the chosen release. Use the format
`ISM-XXXX (ISM <Month Year>)`.

### Stage 3 - Evidence gathering

Build the evidence pack. Each applicable ISM control points to one or more evidence
items. Evidence items are:

- Configuration exports (IAM policies, IaC files, MDM profiles, firewall rules).
- Log samples (sanitised where needed).
- Screenshots of admin consoles, with timestamps.
- Process documentation (runbooks, SOPs).
- Records of operation (change tickets, access reviews, restore tests).
- Independent test results (penetration tests, vulnerability scans).

Store evidence in a structured location with a stable URL or path per item. Provide
the assessor a read-only index. Do not bury evidence in 200-page PDFs; small, atomic
items are easier to assess.

### Stage 4 - Assessor engagement

The assessor will typically:

- Hold a kick-off call confirming scope.
- Review the SSP, SoA and risk register.
- Schedule workshops with subject-matter experts (security architecture, identity,
  monitoring, incident response).
- Sample evidence and request live demonstrations.
- For higher-risk areas (administrative privileges, cryptography, monitoring), expect
  deep dives.

Practical tips:

- Have a single point of contact who routes assessor requests to the right SME.
- Capture every assessor question and its answer in a register. Answers stand for the
  duration of the engagement.
- Demonstrate live systems where the assessor asks; recordings of past demos are not
  the same.
- Where evidence is missing, say so. Trying to manufacture evidence under workshop
  pressure is a path to bigger problems.

### Stage 5 - Draft report and finding response

The assessor produces a draft report containing findings, each typically categorised
by severity. Possible responses to each finding:

- **Remediate.** Fix before finalisation. Provide updated evidence. Re-test.
- **Accept residual risk.** With the system authoriser's sign-off in writing.
- **Contest.** Provide reasoning and evidence in a written response. The assessor
  decides whether to retain, modify or remove the finding.

Track responses in a finding-response register with status, owner, due date, and
linked evidence. This register is part of the final report's annex.

### Stage 6 - Final report and authoriser decision

The assessor issues the final IRAP report and a letter summarising the outcome. The
system authoriser uses these as inputs to the authorisation decision. They may:

- Authorise the system for operation at the assessed classification.
- Authorise with conditions (remediations to complete within a specified time).
- Decline authorisation.

The authoriser is the accountable party for the residual risk decision. The IRAP is
input, not approval.

### Stage 7 - Post-assessment uplift

After the engagement:

- Implement any conditional remediations.
- Roll into business-as-usual the controls that were tightened during preparation.
- Schedule the next IRAP. Most systems re-assess on a defined cadence (annually for
  high-impact systems, less frequently for stable systems with minor change).
- Update the SSP, SoA and risk register with the lessons learned.

## Typical durations and costs

- Scoping: 2 to 4 weeks of system-owner time.
- Documentation preparation: 4 to 12 weeks depending on starting state.
- Assessor engagement: 4 to 12 weeks elapsed, including workshops and finding-response
  cycles.
- Total elapsed: 3 to 6 months for a system with prior assessment history; 6 to 12
  months for a first-time assessment.
- Cost: varies significantly. Confirm with the chosen assessor in the statement of work.

## Common pitfalls

- Starting without an agreed scope.
- Treating the SSP as a one-off artefact rather than the system's living security
  description.
- Assuming the cloud provider's IRAP covers the system's controls. It covers their
  infrastructure controls; the system owner remains responsible for the controls they
  configure on top.
- Underestimating the time to gather evidence. Begin evidence collection on day one of
  the project, not in the week before the workshop.
- Finding-response register kept in email rather than as a tracked artefact.

## Sources

- ACSC, IRAP.
  <https://www.cyber.gov.au/about-us/about-asd/programs-and-services/irap>
- ACSC, Information Security Manual.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism>
- DTA, Cloud Assessment and Authorisation Framework.
  <https://www.dta.gov.au/help-and-advice/cloud/cloud-assessment-and-authorisation-framework>
