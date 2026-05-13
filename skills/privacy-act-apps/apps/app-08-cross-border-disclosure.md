# APP 8 - Cross-border disclosure of personal information

APP 8 governs disclosure of personal information to overseas recipients. Before
disclosing, the entity must take reasonable steps to ensure the recipient does not breach
the APPs, with specific exceptions. Where a breach occurs, the disclosing entity is
generally accountable for the recipient's breach.

## In plain English

If you send personal information overseas, you remain on the hook for what the recipient
does with it, unless the recipient is subject to a substantially-similar privacy regime,
the individual has consented after being informed of the consequences, or one of the
specific legal exceptions applies.

## Why it exists

Personal information frequently crosses borders in modern systems (cloud storage, SaaS
support staff, analytics processors, payment processors). APP 8 ensures the Privacy Act
travels with the data.

## What APP 8 requires

Before disclosing personal information to an overseas recipient:

- Take reasonable steps to ensure the overseas recipient does not breach the APPs (other
  than APP 1) in relation to the information.
- The accountability rule (section 16C) generally makes the disclosing entity responsible
  for any breach by the overseas recipient.

Exceptions to the obligation include:

- The recipient is subject to a law or binding scheme that has the effect of protecting
  the information in a way that, overall, is at least substantially similar to the APPs,
  and the individual has access to mechanisms to take action to enforce that protection.
- The individual consents, after being expressly informed that the entity will no longer
  be required to take reasonable steps and that section 16C will not apply.
- The disclosure is required or authorised by Australian law or a court order, or by
  certain international agreements.
- A permitted general situation, permitted health situation, or specific
  enforcement-related disclosure applies.

## Evidence

- Inventory of overseas recipients with the country of each.
- Documentation of the basis for each disclosure (reasonable steps, substantially-
  similar regime, consent, exception).
- Contractual provisions with the recipient binding them to APP-equivalent obligations
  (where reasonable steps is the basis).
- Records of consent where consent is the basis.

## Where to look

- Cloud regions: S3 buckets, Azure storage accounts, GCS buckets in non-AU regions.
- SaaS sub-processors: support tooling, analytics, observability, marketing automation
  with staff or processing in other jurisdictions.
- Backup destinations: cross-region replication targets.
- AI / ML services where prompts and outputs cross borders.
- Payment processors (often multi-jurisdictional).
- Mergers and acquisitions involving overseas parties.

## Common pitfalls

- "We use AWS, our region is ap-southeast-2" without confirming whether support
  personnel in other regions can access the data.
- Reliance on "substantially similar" status without analysis. The OAIC has not
  formally recognised any jurisdiction as substantially similar at the time of writing;
  confirm current status before relying on this exception.
- Consent treated as a single one-time tick rather than a per-disclosure decision.
- Backup destinations replicated cross-region without the source system's privacy
  documentation reflecting that.
- SaaS support tooling with global support teams accessing customer data on a follow-the-
  sun model.

## Cross-references

- APP 5 (notification): the cross-border disclosure must be in the collection notice.
- APP 6 (use or disclosure): general disclosure rules.
- APP 11 (security): the recipient's security posture is part of "reasonable steps".

## Sources

- OAIC, APP 8 - Cross-border disclosure of personal information.
  <https://www.oaic.gov.au/privacy/australian-privacy-principles/australian-privacy-principles-guidelines/chapter-8-app-8-cross-border-disclosure-of-personal-information>
