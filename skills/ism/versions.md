# ISM versions

The Information Security Manual is updated quarterly. Each release can add controls,
retire controls, reword existing controls, change which classifications a control applies
to, and reorganise guideline groupings. This page is the register an agent or maintainer
uses to:

- Know which release is current at the time of assessment.
- Compare two releases to find what has changed in scope.
- Avoid quoting a control identifier with stale wording.

Each entry below points at the ACSC's published release for that quarter. The ACSC also
publishes a "List of changes" PDF alongside each release; the link is included where
known. Maintainers must verify the URL and the release date before relying on the entry.

If you are writing an SSP, SoA, evidence pack or risk register today, pin to the most
recent release where the "Status" column is `current` or `superseded`. Do not pin to a
release with status `unverified` until a maintainer has confirmed it.

## Release register

| Release | Release date | Status | Release URL | Notable changes | Last verified |
| --- | --- | --- | --- | --- | --- |
| ISM March 2026 | TODO(source) | unverified | <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism> | TODO(source) | TODO(source) |
| ISM December 2025 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM September 2025 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM June 2025 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM March 2025 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM December 2024 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM September 2024 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM June 2024 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM March 2024 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM December 2023 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM September 2023 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM June 2023 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM March 2023 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM December 2022 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM September 2022 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM June 2022 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM March 2022 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM December 2021 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM September 2021 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM June 2021 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM March 2021 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM December 2020 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM September 2020 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM June 2020 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM March 2020 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| ISM December 2019 | TODO(source) | unverified | TODO(source) | TODO(source) | TODO(source) |
| Earlier (OFFICIAL Use Only era) | TODO(source) | superseded | TODO(source) | Pre-2019 ISM had a different structure and classification model. Most agencies will not encounter pre-2019 artefacts in active use. | TODO(source) |

Status values:

- `current` - the live ISM as of the last-verified date.
- `superseded` - a release that is no longer current but is still cited in long-running
  artefacts (SSPs and SoAs in active use).
- `unverified` - this entry was scaffolded by a maintainer who has not yet opened the
  release notes to confirm the date and the change summary. Do not quote controls from
  an unverified release.
- `withdrawn` - a release that the ACSC has explicitly withdrawn (rare).

## How an agent should use this register

When the user asks about an ISM control:

1. Identify the target release (ask the user, or default to the most recent `current`
   entry and say so).
2. If the user is comparing two releases, open both release pages and the corresponding
   List of Changes documents.
3. Note the release alongside any control quoted (for example, `ISM-0123 (ISM December
   2025)`).
4. If the user asks "what changed", reach for the List of Changes for each intervening
   release, not the body of the ISM.

## Maintainer notes

- The ACSC publishes the ISM as HTML pages and a downloadable PDF. The HTML is the
  canonical source; PDF is convenient for evidence packs but may lag a few days behind
  HTML in some quarters.
- The ACSC also publishes a "List of changes" PDF with each release. This is the
  fastest way to compare two releases.
- Controls have integer identifiers (`ISM-XXXX`). Identifiers are stable across releases
  unless the control is retired. Wording, scope and applicability can change.
- Some controls are split into two or more in a release. The original identifier may be
  retired and two new identifiers introduced.
- Some controls are explicitly retired. They may still be referenced in older
  artefacts; an agent should call out a reference to a retired control.

## Sources

- ACSC, Information Security Manual.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism>
- ACSC, ISM release notes and feedback (historical archive on cyber.gov.au).
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism/release-notes-and-feedback> (TODO(source))
