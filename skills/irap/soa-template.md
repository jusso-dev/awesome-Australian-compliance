## Statement of Applicability (SoA) - IRAP-ready template

A Statement of Applicability lists every applicable ISM control for the system,
indicates whether it is applicable, inherited or accepted-as-residual-risk, and points
at the evidence. The SoA is usually a spreadsheet or table; this template captures the
structure.

Pin the ISM release in the cover sheet and reference it in every control row.

---

## Cover sheet

- **System name:** [SYSTEM NAME]
- **ISM release pinned:** [ISM <Month Year>]
- **Classification ceiling:** [OFFICIAL / OFFICIAL: Sensitive / PROTECTED]
- **SoA version:** [vX.Y]
- **Date approved:** [YYYY-MM-DD]
- **Approved by:** [system owner / system authoriser]

## Status values

- **Applicable.** Control applies to the system; implemented and evidenced.
- **Partially applicable.** Control applies; partially implemented with documented
  residual risk.
- **Inherited.** Control inherited from a service provider (cloud or managed service)
  whose IRAP letter and SoA cover it.
- **Not applicable.** Control does not apply to the system because of classification,
  system type, or scope.
- **Risk accepted.** Control applies but is not implemented; the system authoriser
  has accepted the residual risk in writing.

## SoA row template

For each control, populate the row below. Group rows by ISM guideline.

| Control | Status | Implementation summary | Evidence reference | Residual risk | Owner | Last reviewed |
| --- | --- | --- | --- | --- | --- | --- |

## Example rows (replace with actual content)

### Guideline: System Hardening

| Control | Status | Implementation summary | Evidence reference | Residual risk | Owner | Last reviewed |
| --- | --- | --- | --- | --- | --- | --- |
| ISM-XXXX (ISM <Month Year>) | Applicable | Windows 11 baseline applied via Intune; ACSC hardening guidance for Windows 11 implemented. | `evidence/intune/win11-baseline.json` | Low | Endpoint Engineering | YYYY-MM-DD |
| ISM-XXXX (ISM <Month Year>) | Inherited | Cloud provider hardening of underlying hypervisor. | Provider IRAP letter section X | Low | Cloud provider | YYYY-MM-DD |
| ISM-XXXX (ISM <Month Year>) | Risk accepted | [Reason for non-implementation] | [Acceptance record] | Medium | [Owner] | YYYY-MM-DD |

### Guideline: Cryptography

| Control | Status | Implementation summary | Evidence reference | Residual risk | Owner | Last reviewed |
| --- | --- | --- | --- | --- | --- | --- |
| ISM-XXXX (ISM <Month Year>) | Applicable | TLS 1.2 minimum on all public endpoints, approved cipher suites only. | `evidence/tls-scans/2026Q1.html` | Low | Platform Engineering | YYYY-MM-DD |

### Guideline: System Monitoring

| Control | Status | Implementation summary | Evidence reference | Residual risk | Owner | Last reviewed |
| --- | --- | --- | --- | --- | --- | --- |
| ISM-XXXX (ISM <Month Year>) | Applicable | Central SIEM ingesting endpoint, network and cloud control-plane logs. Retention 12 months online, 7 years cold. | `evidence/siem/source-inventory.csv` | Low | SOC | YYYY-MM-DD |

## Approval

- **Prepared by:** [name, role, date]
- **Reviewed by:** [name, role, date]
- **Approved by:** [name, role, date]
- **Next review:** [YYYY-MM-DD]

## Notes for the agent maintaining this SoA

- When the ISM release changes, walk every row. Roll the identifier forward, re-read
  the wording, and update the implementation summary if the requirement has shifted.
  See [`../ism/examples/version-diff-walkthrough.md`](../ism/examples/version-diff-walkthrough.md)
  for the procedure.
- For "Inherited" rows, refresh the provider IRAP letter reference annually.
- "Risk accepted" rows need a written acceptance with a review date. Re-affirm at each
  scheduled SoA review or earlier if the system or threat landscape changes.
