## Worked example - IRAP scoping document

A concise scoping document used to engage an IRAP-registered assessor for a customer-
facing agency portal hosted on AWS. The document is two pages in final form; this
example shows the structure with sample content.

## 1. System

- **Name:** Agency Customer Portal
- **Function:** Self-service application submission and status tracking for citizens.
- **Owner:** [Agency], Customer Channels Branch
- **System owner:** [Name, role]
- **Accountable authority:** [Name, role]

## 2. Target outcome

- IRAP assessment against ISM <release> at the PROTECTED classification.
- System authoriser is the agency's CISO acting on delegation from the accountable
  authority.
- Assessor engagement is part of a triennial reassessment cycle. Prior IRAP report
  reference: [ID, date].

## 3. Classification and information

- Classification ceiling: PROTECTED. Most information held is OFFICIAL: Sensitive
  (personal information of applicants); some classified material exchanged with case
  officers reaches PROTECTED.
- Personal information: yes; APP entity is the agency.
- Sensitive information: yes (health information for some application types).

## 4. System boundary

In scope:

- AWS account `agency-portal-prod` in ap-southeast-2.
- Production EKS cluster `portal-prod`.
- Aurora PostgreSQL database `portal-prod-db`.
- S3 buckets `agency-portal-prod-uploads` and `agency-portal-prod-archive`.
- CloudFront distribution and AWS WAF in front of the portal.
- Identity provider integration: Entra ID tenant `agency.gov.au` (used for staff sign-in
  only).
- Customer identity: in-house user store with WebAuthn and OTP factors.
- Operational tooling: CloudWatch, GuardDuty, Sentinel for SIEM.

Out of scope:

- AWS account `agency-portal-nonprod`. Separate assessment basis: same controls inherited
  from this assessment.
- Agency-wide email and collaboration tooling (covered under the agency's broader IRAP).
- Mobile applications: separate assessment scheduled Q3.

## 5. Shared responsibility

- AWS infrastructure controls inherited from AWS's IRAP letter dated [date].
- Microsoft 365 tenant inherits the agency-wide IRAP for staff identity.
- Identity verification third-party (provider name) covered by its own IRAP letter
  dated [date].

## 6. Essential Eight target

- Maturity Level 2 across all eight strategies. Achieved at last reassessment. Continued
  uplift toward ML3 on Application Control (current gap: server-side coverage).

## 7. Existing artefacts

- SSP version 3.2, last reviewed [date]. Pinned to ISM <release>.
- SoA version 3.2, aligned.
- Security risk register, updated [date].
- Incident response plan, last exercised [date].
- BCP / DRP, last tested [date].
- PIA, last refreshed [date].

## 8. Engagement plan

- Assessor: [registered assessor's name and firm].
- Engagement start: [date]. Final report due: [date].
- Pre-engagement workshop: [date].
- Document review: [dates].
- On-site workshop: [dates], at agency office, with technical demonstrations.
- Draft report: [date].
- Finding-response window: 4 weeks.
- Final report: [date].

## 9. Risks to the engagement

- Cloud provider IRAP letter refresh due during engagement. Mitigation: confirm
  provider has published new letter before workshop.
- Recent migration of identity verification provider; documentation may lag. Mitigation:
  documentation refresh assigned to platform engineering team, due before evidence
  gathering.
- One privileged engineer on extended leave. Mitigation: nominated alternate with
  current access.

## 10. Sign-off

- Prepared by: [name, role, date].
- Approved by system owner: [name, role, date].
- Acknowledged by system authoriser: [name, role, date].
