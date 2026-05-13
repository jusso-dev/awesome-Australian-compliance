# PSPF Policy 8 - Sensitive and classified information

This is the policy that defines the classification model and the handling expectations
for each level. It binds personnel, physical and information-security controls
together at the information level.

Note: numbering and content may have shifted in the PSPF 2024 redesign.

## In plain English

If information is classified, treat it according to its classification: who can access
it, how it is marked, how it is stored, how it is destroyed.

## Key requirements

- Identify and classify information at the point of creation.
- Apply protective markings consistent with the Email Protective Marking Standard.
- Handle information according to the requirements for each classification level
  (access, transmission, storage, destruction).
- Aggregation: combinations of lower-classified information that produce a higher
  classification when combined.
- Caveats and Information Management Markers (IMMs) layered on top of classification.

## Evidence

- Information asset register with classification per asset.
- Protective marking enforcement on email and document management systems.
- Records of declassification or reclassification decisions.
- Destruction records for end-of-life classified material.

## Where to look

- Information asset register.
- Microsoft Purview / equivalent sensitivity labelling.
- Email gateway enforcing protective markings.
- Document management system classification metadata.

## Common pitfalls

- Classification applied at upload and never reviewed.
- Aggregation overlooked: large datasets of OFFICIAL information that should be
  OFFICIAL: Sensitive or PROTECTED when combined.
- Protective markings present in subject lines but not enforced by the email gateway.
- Destruction of end-of-life material relying on a third party with no chain of
  custody.

## Cross-references

- ISM classifications doc: [`../../ism/classifications.md`](../../ism/classifications.md).
- ISM Guidelines for Email (Email Protective Marking Standard).
- PSPF Policy 9 (access to information).

## Sources

- AGD, PSPF Policy 8.
  <https://www.protectivesecurity.gov.au/publications-library/policy-8-sensitive-and-classified-information>
