# Implementation outcomes

The CAF defines seven standardised outcomes the assessor uses to describe control
implementation effectiveness. The terminology is ASD's; assessors and assessees must
use it consistently. The relevant requirement is **IRAP-AR-0003** (Report quality and
terminology).

> Source: ASD, IRAP Common Assessment Framework v1.0, "Implementation outcomes"
> section. Last-verified: 2026-05-13.

## Outcomes

| Outcome | Meaning |
| --- | --- |
| **Effective** | The organisation's control implementation effectively meets the intent of the ISM's control objective. |
| **Ineffective** | The implementation is not adequately meeting the intent of the ISM's control objective. |
| **Alternate control** | The implementation meets the intent of the ISM's control objective through an alternate control. |
| **Not assessed** | The control has not yet been assessed by the IRAP assessor. |
| **Not applicable** | The control does not apply to the system or environment. |
| **No visibility** | The assessor was unable to obtain adequate visibility or assurance of the control's implementation. May be considered ineffective from a risk perspective by authorising officers. |
| **Not implemented** | The organisation has not implemented the ISM control, generally due to business or technical constraints. |

All outcomes (including Not applicable and Not implemented) must be accompanied by the
assessor's written justification.

## Rules of use

- The assessor's terminology must match this set exactly. Variants ("Mostly effective",
  "Partial", "TBD") are not permitted under IRAP-AR-0003.
- **Alternate control** requires sufficient evidence that the compensating mechanism
  meets the original control's intent. IRAP-AR-0030 binds this.
- **No visibility** is recorded when the assessor cannot obtain adequate evidence. The
  report must explain the limitation and its impact. From a risk perspective the
  authorising officer may treat it as ineffective.
- **Not implemented** must be supported by the business or technical decision; record
  the decision-maker and the justification.

## Worked examples (drawn from the CAF)

### Effective

> **Control: ISM-1654** Internet Explorer 11 is disabled or removed.
>
> The organisation has implemented the control using application control allowlists.
> The assessor attempted to launch IE 11 from the desktop and through Control Panel
> applets; each attempt was blocked by the application control software.
>
> **Outcome: Effective.**

### Ineffective

> **Control: ISM-1654** Internet Explorer 11 is disabled or removed.
>
> The organisation has implemented the control through computer policies. The assessor
> attempted to launch IE 11 from the desktop, which was blocked, but successfully
> launched it via Control Panel applets.
>
> **Outcome: Ineffective.** The computer policies did not effectively disable or
> remove IE 11.

### Alternate control

> **Control: ISM-1695** Patches, updates, or other vendor mitigations for
> vulnerabilities in operating systems of workstations, non-internet-facing servers
> and non-internet-facing network devices, are applied within one month of release.
>
> An internal review identified a low-risk Windows server that could not be patched. A
> plan to decommission within two months was implemented. The server was placed in a
> segmented domain with extensive monitoring and policy enforcement to prevent and log
> any attempted communication on vulnerable ports until decommissioning.
>
> **Outcome: Alternate control.** Compensating controls effectively meet the intent.

### Not applicable

> **Control: ISM-1622** PowerShell is configured to use Constrained Language Mode.
>
> The assessor confirmed via technical validation and interviews with the system
> owner that the operating system does not contain or support PowerShell. The
> application control allowlist also excludes PowerShell.
>
> **Outcome: Not applicable.** PowerShell is not installed or used.

### No visibility

> **Control: ISM-0840** When outsourcing the destruction of media storing
> non-accountable material, a NAID AAA certified destruction service with ASIO
> Protective Security Circular-167 endorsements is used.
>
> The assessor noted the destruction service vendors used by the provider but could
> not access ASIO PSC-167 to validate the endorsements.
>
> **Outcome: No visibility.** The report notes the limitation and recommends
> consuming agencies review the outsourced destruction services against ASIO
> PSC-167.

### Not implemented

> **Control: ISM-1874** Multi-factor authentication used for authenticating
> customers of online customer services is phishing-resistant.
>
> The assessor confirmed via technical testing and discussions with the system owner
> that phishing-resistant MFA is not implemented due to a business decision. The
> delegated authority accepts the risk because some customers do not have access to
> modern authentication methods.
>
> **Outcome: Not implemented.** The report records the constraint and the accepting
> authority.

## Cross-references

- [`./evidence-quality.md`](./evidence-quality.md) for the evidence tiers that
  determine assessment degree and ultimately the outcome.
- [`./assessment-workflow.md`](./assessment-workflow.md) Stage 3 for where the
  outcomes attach.
- [`./quality-standards.md`](./quality-standards.md) for IRAP-AR-0003 and -0030.

## Sources

- ASD, IRAP Common Assessment Framework v1.0 (April 2025). Last-verified: 2026-05-13.
  <https://www.cyber.gov.au/sites/default/files/2025-04/IRAP%20common%20assessment%20framework.pdf>
