# Worked example - SSP section quoting an ISM control

This example illustrates how a System Security Plan should reference an ISM control: with
the release pinned, the wording quoted, the implementation described, and the evidence
location stated. Replace the placeholder values with real ones when authoring a live SSP.

## Format

Each control entry has the same shape:

- **Control identifier and ISM release.** Always include the release.
- **Source text.** Quote the control wording from the live ISM.
- **Applicable classifications.** Quote the "applicable to" column.
- **System implementation.** How this system meets the control.
- **Evidence.** File paths or system locations where the evidence lives.
- **Owner.** Who is accountable.
- **Last review.** Date of the most recent review of this entry.

## Example entry

> **Control ISM-1546 (ISM December 2025).** Quote the live wording, for example: "Privileged
> accounts are prevented from accessing the internet, email and web services."
>
> **Applicable to.** OFFICIAL, OFFICIAL: Sensitive, PROTECTED. (Confirm from the live
> ISM table; the values above are illustrative.)
>
> **System implementation.** Privileged role activation in Entra ID Privileged Identity
> Management requires multi-factor authentication and an approver. The "AU-Gov-Admin"
> Conditional Access policy blocks all sign-ins from privileged role members to mail,
> Outlook on the web, and arbitrary internet destinations. Privileged activity is
> performed on Privileged Access Workstations deployed via Intune.
>
> **Evidence.**
> - Conditional Access policy export at `evidence/conditional-access/au-gov-admin.json`.
> - PIM eligible-role configuration export at `evidence/pim/eligible-roles.csv`.
> - PAW build standard at `docs/standards/paw-build.md`.
> - Quarterly access review record at `evidence/access-reviews/2026Q1.pdf`.
>
> **Owner.** CISO (accountable), Identity Engineering Lead (responsible).
>
> **Last review.** 2026-04-15.

## Notes for the agent

- Pin the ISM release before quoting wording. If the user has not pinned, default to the
  most recent `current` release in [`../versions.md`](../versions.md) and call out the
  default in the response.
- Where the system inherits the control from a managed service (for example, a cloud
  provider hardening the underlying hypervisor), state the inheritance explicitly and
  link to the provider's relevant evidence (their IRAP letter, their compliance
  documentation).
- Where the control is not applicable, state why (classification, system type, scope) and
  cite the part of the system description that justifies the exclusion.
- When the ISM release changes, walk the affected entries and verify the wording still
  matches. The release-update task is a normal part of SSP maintenance.

## Sources

- ACSC, Information Security Manual.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism>
- ACSC, Information Security Manual table of contents and guidelines list.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism>
