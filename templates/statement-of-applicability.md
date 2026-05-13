# Statement of Applicability (SoA) - universal template

A Statement of Applicability lists every applicable security control for the system,
the applicability status, the implementation, the evidence, and the owner. This
template is framework-neutral; an IRAP-flavoured variant for ISM-specific use lives at
[`../skills/irap/soa-template.md`](../skills/irap/soa-template.md).

Fill the bracketed placeholders. Delete guidance in italics before publishing.

---

## Cover sheet

- **System name:** [SYSTEM NAME]
- **Frameworks covered:** [ISM <release>, Essential Eight, PSPF <release>, Privacy Act
  / APPs as applicable]
- **Classification ceiling:** [OFFICIAL / OFFICIAL: Sensitive / PROTECTED]
- **SoA version:** [vX.Y]
- **Date approved:** [YYYY-MM-DD]
- **Approved by:** [system owner / system authoriser]

## Status values

- **Applicable.** Control applies; implemented and evidenced.
- **Partially applicable.** Applies; partially implemented with documented residual
  risk.
- **Inherited.** Inherited from a service provider whose assurance covers it.
- **Not applicable.** Does not apply for stated reasons.
- **Risk accepted.** Applies but not implemented; the accountable authority has
  accepted the residual risk in writing.

## Row template

| Control | Framework | Status | Implementation summary | Evidence reference | Residual risk | Owner | Last reviewed |
| --- | --- | --- | --- | --- | --- | --- | --- |

## Sections

Group rows by framework, then by guideline group within ISM.

### ISM controls (release pinned in cover sheet)

#### Guideline: System Hardening

| Control | Framework | Status | Implementation summary | Evidence reference | Residual risk | Owner | Last reviewed |
| --- | --- | --- | --- | --- | --- | --- | --- |
| ISM-XXXX | ISM | Applicable | [Summary] | [Path] | Low | [Owner] | YYYY-MM-DD |

#### Guideline: Cryptography

| Control | Framework | Status | Implementation summary | Evidence reference | Residual risk | Owner | Last reviewed |
| --- | --- | --- | --- | --- | --- | --- | --- |
| ISM-XXXX | ISM | Applicable | [Summary] | [Path] | Low | [Owner] | YYYY-MM-DD |

*Add a subsection per applicable guideline group.*

### Essential Eight strategies (target ML pinned in cover sheet)

| Strategy | Framework | Status | Implementation summary | Evidence reference | Residual risk | Owner | Last reviewed |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Application control | E8 | Applicable | [Summary] | [Path] | Low | [Owner] | YYYY-MM-DD |
| Patch applications | E8 | [Status] | [Summary] | [Path] | [Risk] | [Owner] | YYYY-MM-DD |
| Configure Office macros | E8 | [Status] | [Summary] | [Path] | [Risk] | [Owner] | YYYY-MM-DD |
| User application hardening | E8 | [Status] | [Summary] | [Path] | [Risk] | [Owner] | YYYY-MM-DD |
| Restrict administrative privileges | E8 | [Status] | [Summary] | [Path] | [Risk] | [Owner] | YYYY-MM-DD |
| Patch operating systems | E8 | [Status] | [Summary] | [Path] | [Risk] | [Owner] | YYYY-MM-DD |
| Multi-factor authentication | E8 | [Status] | [Summary] | [Path] | [Risk] | [Owner] | YYYY-MM-DD |
| Regular backups | E8 | [Status] | [Summary] | [Path] | [Risk] | [Owner] | YYYY-MM-DD |

### PSPF policies (where applicable)

| Policy | Framework | Status | Implementation summary | Evidence reference | Residual risk | Owner | Last reviewed |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Policy 8 | PSPF | [Status] | [Summary] | [Path] | [Risk] | [Owner] | YYYY-MM-DD |
| Policy 10 | PSPF | [Status] | [Summary] | [Path] | [Risk] | [Owner] | YYYY-MM-DD |

### APP obligations (where personal information in scope)

| APP | Framework | Status | Implementation summary | Evidence reference | Residual risk | Owner | Last reviewed |
| --- | --- | --- | --- | --- | --- | --- | --- |
| APP 5 | Privacy Act | Applicable | Collection notices at [URLs] | [Path] | Low | [Owner] | YYYY-MM-DD |
| APP 8 | Privacy Act | Applicable | Cross-border disclosure register | [Path] | Medium | [Owner] | YYYY-MM-DD |
| APP 11 | Privacy Act | Applicable | Security controls per SSP | [Path] | Low | [Owner] | YYYY-MM-DD |

## Approval

- Prepared by: [name, role, date]
- Reviewed by: [name, role, date]
- Approved by: [name, role, date]
- Next review: [YYYY-MM-DD]

## Maintainer notes

- When the ISM release changes, walk every ISM row and roll forward following
  [`../skills/ism/examples/version-diff-walkthrough.md`](../skills/ism/examples/version-diff-walkthrough.md).
- When the Maturity Model changes, re-grade each E8 strategy against the new wording.
- "Risk accepted" rows need a written acceptance with a review date and the
  accountable authority's signature.
