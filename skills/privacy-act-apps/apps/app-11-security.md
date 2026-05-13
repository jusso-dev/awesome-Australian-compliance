# APP 11 - Security of personal information

APP 11 imposes the technical and organisational security obligation that engineers
encounter most often. APP entities must take reasonable steps to protect personal
information from misuse, interference, loss, unauthorised access, modification or
disclosure. They must also destroy or de-identify the information when it is no longer
needed.

## In plain English

Protect the data. Encrypt it where appropriate. Limit who can access it. Patch the
systems that hold it. Watch for intrusions. When you no longer need it, get rid of it.

## Why it exists

APP 11 is the link between privacy law and information security practice. Every modern
breach engages APP 11; almost every modern privacy review centres on it.

## What APP 11 requires

- APP 11.1: take such steps (if any) as are reasonable in the circumstances to protect
  personal information from misuse, interference, loss, unauthorised access, modification
  or disclosure.
- APP 11.2: take such steps as are reasonable in the circumstances to destroy or
  de-identify the information once it is no longer needed for any purpose for which it
  may be used or disclosed, unless retention is required by law or a court order.

What counts as "reasonable" is contextual: it depends on the sensitivity of the
information, the harm a breach would cause, the practicality of the steps, the cost,
and whether the steps would impair the entity's functions.

## Evidence

- Information security policy applying to the systems holding personal information.
- Implementation evidence for security controls: encryption at rest and in transit,
  identity and access management, network segmentation, vulnerability management,
  endpoint protection, monitoring and incident response.
- Retention schedule with destruction or de-identification records.
- Periodic security assessment outcomes (penetration tests, IRAP, internal review).
- Staff training records on handling personal information.

## Where to look

- IaC defining encryption settings (KMS keys, S3 default encryption, Azure SSE-KMS, GCS
  CMEK).
- Database TDE configuration.
- IAM policies restricting access to personal information stores.
- Backup and replication configuration.
- Logging and SIEM detection content for unusual access.
- Retention tooling (lifecycle policies on object stores, retention rules on databases,
  destruction workflows for paper records).

## Common pitfalls

- Encryption at rest assumed because the cloud provider says so, with no documentation
  of which keys, which CMEK posture, who has access.
- "Personal information access is restricted" without evidence of the IAM policy in
  production.
- Logs of access to personal information not retained or not reviewed.
- Retention indefinite: "we might need it for tax / legal / audit".
- De-identification claimed where pseudonymisation is the reality.
- Destruction of physical media at end-of-life skipped or delegated without chain of
  custody.

## Cross-references

- Essential Eight: all eight strategies overlap with APP 11.
- ISM Guidelines for System Hardening, Cryptography, System Monitoring and Database
  Systems all carry evidence for APP 11.
- [`ndb-scheme.md`](../ndb-scheme.md) for when an APP 11 failure becomes notifiable.

## Sources

- OAIC, APP 11 - Security of personal information.
  <https://www.oaic.gov.au/privacy/australian-privacy-principles/australian-privacy-principles-guidelines/chapter-11-app-11-security-of-personal-information>
- OAIC, Guide to securing personal information.
  <https://www.oaic.gov.au/privacy/privacy-guidance-for-organisations-and-government-agencies/handling-personal-information/guide-to-securing-personal-information>
