# Worked example - IRAP prescreening questionnaire

A worked prescreening questionnaire for a fictional Commonwealth agency, "Department of
Example Affairs" (DOEA), preparing for a triennial reassessment of its customer portal.

The CAF does not publish a fixed prescreening question set; the items below are
standard commercial-engagement practice that map to the CAF's Stage 1 inputs and to
**IRAP-AR-0008 through IRAP-AR-0011** on conflict of interest. The CAF's mandatory
COI declaration to ASD IRAP via the Partner Portal at least 7 business days before
commencement is captured in Section D.3.

---

## Prescreening questionnaire

**Engagement reference:** DOEA-CP-IRAP-2026

**Date completed:** 2026-04-22

**Completed by (assessed entity):** Jordan Park, CISO, Department of Example Affairs

**Completed by (assessor):** Sam Cooper, IRAP registration #1234, Example Assurance Pty
Ltd

## Section A - Organisational profile

| Field | Value |
| --- | --- |
| Legal name | Department of Example Affairs |
| Trading name | DOEA |
| Entity type | Commonwealth non-corporate entity |
| ABN | 12 345 678 901 |
| ACN | n/a (non-corporate entity) |
| Registered office | Level 5, 100 Example Street, Canberra ACT 2600 |
| Operational addresses | Brisbane, Melbourne, Perth shared service centres |
| Website | https://example.gov.au |
| Mission | DOEA administers example programmes serving Australian citizens. |
| Logo provided | Yes - vector SVG at `branding/logo.svg`. Approved for report cover. |
| Approximate headcount | 1,800 staff plus 400 contractors |
| Industry classification | 7530 Administration - Justice (Commonwealth) |

## Section B - Principal contacts

| Role | Name | Email | Phone |
| --- | --- | --- | --- |
| Accountable authority | Secretary [Name] | [email] | [phone] |
| CSO | [Name] | [email] | [phone] |
| CISO | Jordan Park | [email] | [phone] |
| System owner (Customer Portal) | [Name] | [email] | [phone] |
| Privacy officer | [Name] | [email] | [phone] |
| Engagement sponsor | [Name] | [email] | [phone] |
| Engagement point of contact | [Name] | [email] | [phone] |
| Identity SME | [Name] | [email] | [phone] |
| Network SME | [Name] | [email] | [phone] |
| Endpoint SME | [Name] | [email] | [phone] |
| Application SME | [Name] | [email] | [phone] |
| Cloud SME | [Name] | [email] | [phone] |
| Monitoring SME | [Name] | [email] | [phone] |
| IR SME | [Name] | [email] | [phone] |
| Legal counsel | [Name] | [email] | [phone] |
| Communications | [Name] | [email] | [phone] |

## Section C - Engagement parameters

| Field | Value |
| --- | --- |
| System(s) in scope | DOEA Customer Portal (production environment in AWS ap-southeast-2) |
| Classification ceiling | PROTECTED |
| Authorising agency | DOEA (system authorised by the Secretary on delegation) |
| ISM release pinned | ISM March 2026 |
| Essential Eight target | ML2 across all eight strategies; uplift toward ML3 on application control documented separately |
| Prior IRAP | DOEA-CP-IRAP-2023, completed 2023-10, by Different Assurance Pty Ltd |
| Engagement start | 2026-06-01 |
| Final report due | 2026-09-15 |
| Change-freeze windows | 2026-07-08 to 2026-07-21 (financial year close) |
| Preferred cadence | Weekly status calls, on-site workshop in week 6 |
| Document exchange | Example Assurance secure portal; Microsoft 365 sensitivity-label-protected backup |

## Section D - Prescreening

### D.1 Authorisation to engage

**Question.** Is the engagement approved by the accountable authority or their
delegate?

**Response.** Yes. Approval signed by the Deputy Secretary, Corporate, on 2026-03-14.
Record at `evidence/intake/approval-letter.pdf`.

### D.2 Conflict of interest (entity)

**Question.** Are there any prior commercial or personal relationships between the
entity and the proposed assessor that should be disclosed?

**Response.** No prior engagements with Example Assurance Pty Ltd or with the lead
assessor in the past three years.

### D.3 Conflict of interest declaration to ASD IRAP

**Question.** Confirm the assessor has submitted a Conflict of Interest declaration
to ASD IRAP via the Partner Portal at least 7 business days before commencement
(**IRAP-AR-0008**, **IRAP-AR-0009**). Confirm the assessor or the assessor's firm has
not provided implementation services to the entity in the last 12 months touching the
controls being assessed.

**Response.** COI declaration submitted via the IRAP Partner Portal on 2026-05-15.
The 7-business-day clock elapsed on 2026-05-26. Engagement commences 2026-06-01. The
lead assessor has not provided implementation services to DOEA. The firm has not been
engaged by DOEA in the past three years. Confirmed in writing by the firm's engagement
manager. The assessor will update the COI declaration if anything changes during the
engagement, per **IRAP-AR-0010**.

### D.4 Capacity

**Question.** Does the entity have the personnel and access to documentation required
to support the proposed schedule?

**Response.** Yes. Named SMEs above are committed to the schedule. One SME (Endpoint)
will be on extended leave 2026-07-21 to 2026-08-04; nominated alternate is [Name].

### D.5 Prior assessments

**Question.** Have any prior IRAP, ISO 27001, SOC 2 or other assessments covered
substantially the same system?

**Response.** Yes. Prior IRAP DOEA-CP-IRAP-2023 provided to assessor. ISO 27001
certification of the parent IT function (excluding the Customer Portal application
layer) by [Certification body], current certificate provided.

### D.6 Outstanding remediations

**Question.** Are there findings from prior assessments not yet closed?

**Response.** Three findings open from DOEA-CP-IRAP-2023 (one medium, two low).
Remediation register provided at `evidence/intake/2023-iraq-findings.csv`. Each finding
has an owner, due date and current status.

### D.7 Recent material change

**Question.** Has the system undergone material change in the last 90 days?

**Response.** Yes. Migration of identity verification provider from Provider A to
Provider B completed 2026-03-30. Architecture and security review documents at
`evidence/intake/idv-migration/`.

### D.8 Known incidents

**Question.** Any reportable incidents in the last 12 months affecting the system in
scope?

**Response.** One. Credential-exposure incident assessed under the NDB scheme in
February 2026, concluded as not an eligible data breach. Incident report and
post-incident review at `evidence/intake/inc-2026-02/`.

### D.9 Pending change

**Question.** Any material change planned during the engagement window?

**Response.** WDAC driver block list deployment planned for 2026-07-15. Agreed with
assessor to defer to after the workshop, given the change-freeze window. Backup plan:
include the rollout in scope if it ships before the workshop.

### D.10 Sub-processors

**Question.** Has the sub-processor list changed since the most recent assessment?

**Response.** Yes. Identity verification provider changed (per D.7). Email gateway
unchanged. SIEM unchanged. Updated sub-processor list at
`evidence/intake/sub-processors.csv`.

### D.11 Personnel security

**Question.** Are all personnel with access to engagement information cleared to the
appropriate level?

**Response.** Yes. Clearance roster by role at `evidence/intake/clearance-roster.csv`
(names redacted; clearance levels per role confirmed). Engagement workpapers will be
treated as PROTECTED.

### D.12 Foreign relationships

**Question.** Any foreign ownership, control or influence considerations?

**Response.** Not applicable for the entity. Cloud provider (AWS) is a US-headquartered
multinational; subject to the provider's own AISEP-aligned assessment for the
ap-southeast-2 region. Sub-processor list at D.10 includes country of operation for
each.

### D.13 Legal exposure

**Question.** Any active litigation or regulatory investigation affecting the system?

**Response.** None. Privacy officer confirms no OAIC investigations open.

### D.14 Insurance and indemnities

**Question.** Confirm professional indemnity and liability arrangements.

**Response.** Confirmed in engagement letter clause 7. Assessor firm carries [amount]
professional indemnity per occurrence; certificate provided.

### D.15 Branding

**Question.** Provide approved logo and branding for the report.

**Response.** Provided. SVG and PNG variants at `branding/`. Approved by the
Communications point of contact, 2026-04-15.

### D.16 Information-handling agreement

**Question.** Confirm the information-handling agreement for the engagement.

**Response.** Confirmed. Engagement workpapers treated as PROTECTED. Storage on the
assessor's PROTECTED-rated platform per their IRAP letter dated [date]. Retention 7
years post-engagement, with secure destruction confirmed in writing. Sub-processors
listed and accepted.

## Section E - Sign-off

**Assessed entity:**

- Name: Jordan Park
- Role: CISO
- Signature: _____________________
- Date: 2026-04-22

**Assessor:**

- Name: Sam Cooper
- IRAP registration: 1234
- Signature: _____________________
- Date: 2026-04-22

## Notes for the agent

- Where the agent is preparing this questionnaire for the user, walk each Section D
  question and surface what can be answered from the codebase and operational
  artefacts. Many answers (recent material change, sub-processor list, incidents) can
  be assembled from git history, the change management system, and the incident
  ticketing system.
- Section A and Section B are intake data. Pull from the entity's public records (ABN
  lookup), the IdP and the HR system. Confirm with the user before publishing.
- Section D.16 must be agreed in writing. The assessor's IRAP letter for their own
  platform is part of the supporting evidence.
- The CAF publishes the Stage 1 input list and the COI requirements. Commercial
  assessors layer additional intake on top; the questions here are common practice
  rather than CAF-mandated.

## Sources

- ASD, IRAP Common Assessment Framework v1.0 (April 2025).
  <https://www.cyber.gov.au/sites/default/files/2025-04/IRAP%20common%20assessment%20framework.pdf>
  Last-verified: 2026-05-13.
