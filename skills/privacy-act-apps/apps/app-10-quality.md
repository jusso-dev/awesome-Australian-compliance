# APP 10 - Quality of personal information

APP 10 requires APP entities to take reasonable steps to ensure the personal information
they collect is accurate, up-to-date and complete, and that personal information they
use or disclose is accurate, up-to-date, complete and relevant.

## In plain English

Keep the data right. Out-of-date records cause real harm.

## Why it exists

Inaccurate personal information leads to wrong decisions (denied service, mis-targeted
communications, mistaken-identity outcomes). APP 10 attaches an obligation to maintain
quality.

## What APP 10 requires

- Take reasonable steps to ensure personal information collected is accurate, up-to-date
  and complete.
- Take reasonable steps to ensure personal information used or disclosed is accurate,
  up-to-date, complete and relevant.
- What is "reasonable" depends on sensitivity of the information, possible adverse
  consequences for the individual, and the practicality of taking steps.

## Evidence

- Data quality processes: validation at point of collection, periodic refresh,
  consistency checks across systems.
- Records of corrections (linked to APP 13).
- Use-cases requiring high quality (decisions about individuals, eligibility checks)
  with additional steps to ensure quality.

## Where to look

- Validation logic at registration / account-update forms.
- ETL pipelines that may stale data on the way to downstream consumers.
- Data warehouses used for decision-making.
- Reports and KPI dashboards relying on personal information.

## Common pitfalls

- Forms with no validation accepting obvious errors (impossible birth dates, malformed
  postcodes).
- ETL job retaining a six-month-old snapshot used for current decisions.
- Customer-record merge logic that loses corrections.
- No process to remove stale records when individuals are clearly no longer active.

## Cross-references

- APP 13 (correction): the obligation when an individual requests a correction.
- APP 11 (security): integrity overlaps.

## Sources

- OAIC, APP 10 - Quality of personal information.
  <https://www.oaic.gov.au/privacy/australian-privacy-principles/australian-privacy-principles-guidelines/chapter-10-app-10-quality-of-personal-information>
