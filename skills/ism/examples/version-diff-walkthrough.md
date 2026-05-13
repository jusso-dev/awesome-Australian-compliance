# Worked example - comparing two ISM releases

This walks through the process of identifying what changed between two ISM releases when
maintaining an existing SSP or SoA.

## Inputs

- The SSP / SoA in active use, pinned to ISM release A (the "from" release).
- The latest ISM release B (the "to" release).
- The ACSC's "List of changes" document for the intervening releases.

## Steps

1. **Read the List of changes.** Open the ACSC's published list of changes for each
   intervening release (one PDF per release, typically published alongside the ISM PDF).
   Build a single combined list of added, retired and reworded controls.
2. **Filter by guideline.** Narrow the list to the guidelines the system actually
   touches. If the system has no email infrastructure, ignore changes in Guidelines for
   Email.
3. **Walk added controls.** For each control added between A and B:
   - Decide whether the system is in scope.
   - If in scope, write a new SSP entry following
     [`ssp-section-example.md`](./ssp-section-example.md). Cite release B in the
     identifier.
4. **Walk retired controls.** For each control retired between A and B:
   - Locate the SSP / SoA entry citing the retired identifier.
   - If the requirement has moved to a different control identifier, update the entry
     to the new identifier and release.
   - If the requirement has been removed entirely, mark the entry as superseded and
     archive it. Do not delete it; an assessor reviewing historical evidence still needs
     to understand what the system used to do.
5. **Walk reworded controls.** For each control with a wording change between A and B:
   - Read both versions.
   - If the change is editorial only, update the quoted wording in the SSP entry and
     bump the cited release. Note in the entry review log that the change was editorial.
   - If the change is substantive (new requirement, broader scope, tighter threshold),
     reassess the system against the new wording. The implementation may need updating
     before the entry can be re-affirmed.
6. **Update the classification applicability.** Where a control's "applicable to" column
   has changed (for example, a control that previously applied only to PROTECTED now
   also applies to OFFICIAL: Sensitive), pick up any newly-applicable controls.
7. **Update the SSP and SoA cover sheet.** Pin the new release (B) and the date of this
   reconciliation in the document control metadata.
8. **Log the reconciliation.** Capture the diff outcome in the document review log so
   the next assessor can see when the release was rolled forward and which entries
   changed.

## Heuristic an agent can run

- If the user supplies two release URLs and the SSP / SoA, the agent can:
  1. Fetch the "List of changes" PDFs.
  2. Build the combined diff list.
  3. Cross-reference each item against the SSP / SoA entries.
  4. Emit a punch list of entries needing update and entries that are now obsolete.

In practice, the ACSC's List of changes documents are reasonably structured (a table per
release listing added, retired and reworded controls). An agent can parse them with
ordinary table-extraction tooling.

## Common pitfalls

- Comparing the two ISM PDFs directly rather than reading the List of changes. The PDF
  diff is noisy and easy to misinterpret.
- Treating a wording change as editorial when it materially expands scope.
- Updating identifiers but not re-walking implementation.
- Forgetting to refresh the SoA's "not applicable" justifications when a control's
  applicability has changed.

## Sources

- ACSC, Information Security Manual.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism>
- ACSC, ISM release notes and lists of changes (per quarterly release).
  Tracked in [`../versions.md`](../versions.md).
