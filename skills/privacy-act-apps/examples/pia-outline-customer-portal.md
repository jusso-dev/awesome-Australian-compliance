# Worked example - PIA outline for a customer portal

A condensed Privacy Impact Assessment outline for an agency customer portal that lets
individuals submit applications, upload supporting documents, and track status. The
example illustrates how to walk the APPs and identify residual risk. A real PIA would be
significantly longer and would include detailed data flow diagrams.

## 1. System description

- A customer portal hosted in AWS in the ap-southeast-2 (Sydney) region.
- Identity managed in the agency's existing identity provider (Entra ID), federated via
  OIDC.
- Application stack: React frontend, Node.js API, PostgreSQL on RDS, document storage in
  S3 with KMS-CMK encryption.
- Inbound traffic terminated at a managed WAF.
- Background processing of submitted applications by case workers in an internal
  case-management system.
- Email notifications via the agency's email gateway.
- Telemetry to a central log lake and SIEM in the same region.

## 2. Personal information collected

- Identity details: full name, date of birth, contact email, contact phone, address.
- Government related identifiers: driver licence or passport number (verified, but not
  stored long-term).
- Supporting documents: scans of identity documents, financial statements, health
  certificates depending on the application type.
- Application metadata: questions, answers, status, case worker notes.
- Communication content: emails between the agency and the applicant.
- Telemetry: page views, click events, error reports.

Sensitive information categories: health information (some application types), and
potentially other sensitive categories depending on the application.

## 3. Data flow summary

| Stage | Actors | Personal information | Notes |
| --- | --- | --- | --- |
| Collection | Individual via portal | Identity, application data, attachments | APP 3, APP 5 |
| Identity verification | Identity verification service | Driver licence or passport | APP 9 - government identifier handling |
| Case work | Internal case workers | All of the above | APP 6, internal access controls |
| Notifications | Email gateway | Identity + status | APP 6 |
| Retention | Database, document store, archive | All of the above | APP 11.2 |
| Eventual destruction | Lifecycle policy and manual review | All of the above | APP 11.2 |

## 4. APP walkthrough

| APP | How addressed | Residual risk |
| --- | --- | --- |
| APP 1 | Privacy policy at /privacy, last reviewed [DATE], owned by the agency privacy officer. | Low if reviewed annually. |
| APP 2 | Anonymous browsing of the public information is supported. The application process requires identification by law; documented in the system description. | Low. |
| APP 3 | Each collected field is mapped to a question on a specific application type. Data inventory at `docs/privacy/data-inventory.csv`. | Low if inventory is maintained. |
| APP 4 | Unsolicited attachments uploaded outside the application flow are deleted on receipt. Procedure documented. | Low. |
| APP 5 | Collection notice on every page that collects personal information. Layered notice approach: short notice at point of collection, link to full policy. | Low if notice content stays current. |
| APP 6 | Disclosures: internal case workers, identity verification service, email gateway. No marketing use. Data flow diagrams in the PIA. | Medium. Address with quarterly audit of internal access logs. |
| APP 7 | Direct marketing not applicable; the portal is a regulatory function, not marketing. | Not applicable. |
| APP 8 | Identity verification service is an Australian-hosted provider. Email gateway is Australian-hosted. AWS region is ap-southeast-2. Support staff at sub-processors are Australian-resident as per their IRAP letter. | Medium. Reassess if any provider changes their support model. |
| APP 9 | Driver licence or passport number used only for verification, deleted from the system within 7 days of verification. | Low if retention deletion is monitored. |
| APP 10 | Validation at point of submission; self-service correction in the portal; case worker correction process. | Low. |
| APP 11 | TLS 1.2+ in transit, AES-256 at rest with CMKs, IAM segregated by function, audit logging, regular vulnerability scanning, IRAP-assessed AWS region, regular penetration testing. Retention schedule with destruction or de-identification after the regulatory retention period. | Medium. Address with continuous monitoring and annual penetration test. |
| APP 12 | Self-service access to one's own data in the portal. Privacy enquiry inbox for broader requests. SLA: 14 days. | Low if SLA is monitored. |
| APP 13 | Self-service correction for most fields. Formal correction process for case-worker-managed fields. SLA: 14 days. | Low. |

## 5. Cross-border disclosures

None at present. Reassess if any sub-processor changes their model.

## 6. Risk register highlights

- Risk: insider misuse of case-worker access.
  Mitigation: log all PII access; alert on anomalous access patterns; quarterly access
  review.
- Risk: third-party identity verification service compromise.
  Mitigation: vendor security assessment; data minimisation (only the fields strictly
  required); short retention.
- Risk: long retention of supporting documents.
  Mitigation: clear retention schedule aligned to regulatory needs; quarterly
  destruction job; audit log of destruction.

## 7. Approvals

- Drafted by: [name, system delivery]
- Reviewed by: [agency privacy officer]
- Approved by: [system owner]
- Date: [YYYY-MM-DD]
- Next review: [annual or on material change]

## Sources

- OAIC, Guide to undertaking privacy impact assessments.
  <https://www.oaic.gov.au/privacy/privacy-impact-assessments>
- OAIC, Australian Privacy Principles guidelines.
  <https://www.oaic.gov.au/privacy/australian-privacy-principles-guidelines>
