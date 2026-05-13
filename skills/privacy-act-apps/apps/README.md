# Australian Privacy Principles index

Schedule 1 of the Privacy Act 1988 (Cth) contains 13 Australian Privacy Principles. Each
file in this directory covers one APP. The pages summarise the obligation, point at the
relevant OAIC guideline chapter, list evidence types, and flag common pitfalls.

## Index

- [APP 1 - Open and transparent management of personal information](./app-01-open-and-transparent-management.md)
- [APP 2 - Anonymity and pseudonymity](./app-02-anonymity-and-pseudonymity.md)
- [APP 3 - Collection of solicited personal information](./app-03-collection-of-solicited-information.md)
- [APP 4 - Dealing with unsolicited personal information](./app-04-unsolicited-personal-information.md)
- [APP 5 - Notification of the collection of personal information](./app-05-notification-of-collection.md)
- [APP 6 - Use or disclosure of personal information](./app-06-use-or-disclosure.md)
- [APP 7 - Direct marketing](./app-07-direct-marketing.md)
- [APP 8 - Cross-border disclosure of personal information](./app-08-cross-border-disclosure.md)
- [APP 9 - Adoption, use or disclosure of government related identifiers](./app-09-government-related-identifiers.md)
- [APP 10 - Quality of personal information](./app-10-quality.md)
- [APP 11 - Security of personal information](./app-11-security.md)
- [APP 12 - Access to personal information](./app-12-access.md)
- [APP 13 - Correction of personal information](./app-13-correction.md)

## How to use these pages

- For a Privacy Impact Assessment, walk all 13 APPs. Some will be quickly disposed of as
  not applicable to the system; others will demand significant detail. APP 1, APP 3, APP
  5, APP 6, APP 8, APP 11, APP 12 and APP 13 are usually the load-bearing ones for
  software systems.
- For a code review, focus on APP 3 (what is collected), APP 6 and APP 8 (where it
  flows), APP 11 (how it is protected) and APPs 12 / 13 (how the user can see and
  correct it).
- For an incident, jump directly to [`../ndb-scheme.md`](../ndb-scheme.md). The NDB
  obligation is independent of (and usually engaged together with) APP 11.

## Cross-cutting notes

- "Personal information" is broad. IP addresses, device identifiers, usernames and email
  addresses are all personal information.
- "Sensitive information" is a defined subset (health, racial origin, sexual
  orientation, biometric, criminal record, and others) attracting tighter obligations.
- State and territory privacy regimes apply to state and territory government agencies
  (and in some sectors, organisations). They are out of scope for these pages but should
  be considered alongside the Privacy Act for any system handling state government data.

## Sources

- OAIC, Australian Privacy Principles.
  <https://www.oaic.gov.au/privacy/australian-privacy-principles>
- OAIC, Australian Privacy Principles guidelines.
  <https://www.oaic.gov.au/privacy/australian-privacy-principles-guidelines>
