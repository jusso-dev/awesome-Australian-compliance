# Evidence quality and assessment degree

The CAF defines a four-tier evidence quality model and a three-tier assessment degree
model. Together they govern how much assurance the assessor can place on a control's
implementation outcome.

> Source: ASD, IRAP Common Assessment Framework v1.0, sections "Quality of evidence"
> and "Assessment degree". Last-verified: 2026-05-13.

## Four evidence tiers

| Tier | Definition (CAF) | Example |
| --- | --- | --- |
| **Excellent** | Examine, test or review firsthand the activities, processes or mechanisms that demonstrate the control is in operation. | Attempt to run an unsigned binary to test application control; attempt to access an external website with a privileged account. |
| **Good** | Review a variety of sources evidencing the existence of activities, processes or mechanisms, demonstrating the control is likely still in operation. | Review the technical configuration of the system through its interface to determine whether it should enforce the expected policy. |
| **Fair** | Receive second-hand evidence of a process, activity or mechanism that demonstrates the control has been implemented. | Review a copy of the system's configuration. |
| **Poor** | Review evidence from personnel or specifications outlining statements of implementation. | A policy statement that repeats the ISM control. Verbal confirmation. |

The CAF binds:

- **IRAP-AR-0004** - The assessor bases the assessment on presented evidence and facts
  and has not made inappropriate assumptions.
- **IRAP-AR-0005** - Evidence is at a sufficient quality and is appropriate for the
  system and control.
- **IRAP-AR-0026** - The report and controls matrix outline the evidence gathered.
- **IRAP-AR-0027** - Where evidence is insufficient, the limitations and impact are
  documented and controls marked accordingly.

## Worked evidence examples (drawn from the CAF)

### ISM-1622 PowerShell Constrained Language Mode

| Tier | Approach |
| --- | --- |
| Excellent | Run a PowerShell command that requires full language mode on a production end-user device. Receive a constrained-language error. |
| Good | Run `$ExecutionContext.SessionState.LanguageMode` and observe the configured value. |
| Fair | Receive a screenshot of the administrator's screen showing constrained language mode. |
| Poor | Review the SSP stating constrained language mode is configured; verbal confirmation from the administrator. |

### ISM-0272 Protective marking tools

| Tier | Approach |
| --- | --- |
| Excellent | Attempt to change the protective markings to a classification higher than the system is authorised to process. |
| Good | Review the configuration of the protective marking tool. |
| Fair | Receive a screenshot of the configuration. |
| Poor | Review the design document that states the tool does not allow unauthorised classifications. |

## Assessment degree matrix

Coverage assurance (rows) crossed with evidence depth and quality (columns) yields the
assessment degree.

|  | Poor | Fair | Good | Excellent |
| --- | --- | --- | --- | --- |
| **High coverage** | Basic | Focused | Comprehensive | Comprehensive |
| **Medium coverage** | Basic | Focused | Focused | Comprehensive |
| **Low coverage** | Basic | Basic | Focused | Focused |
| **Very low coverage** | Basic | Basic | Basic | Focused |

### Degree definitions

- **Basic assessment** - High-level review, checks, observations or inspections of
  assessment objects. Foundational understanding that controls are implemented and
  free of obvious configuration errors. Low representative sample.
- **Focused assessment** - High-level review plus detailed checks, observations or
  inspections. Examination of substantial bodies of evidence on implementation,
  configuration and procedures. Good level of assurance that controls are implemented
  correctly and operating effectively. Representative sample plus objects deemed
  particularly important.
- **Comprehensive assessment** - Detailed and thorough analysis, including testing and
  examining extensive documentation. Excellent level of assurance, including evidence
  of ongoing and consistent process supporting continuous improvement. Sufficiently
  large sample plus objects deemed particularly important.

## How an agent should use this

- When the user asks "is our evidence sufficient", classify each piece of evidence
  into one of the four tiers and aggregate via the degree matrix.
- When producing an SoA row, record the tier and the degree explicitly so the
  assessor can replay the judgement.
- Where time is tight, look for opportunities to substitute a higher-tier piece of
  evidence (a configuration export beats a screenshot of a configuration screen).

## Cross-references

- [`./implementation-outcomes.md`](./implementation-outcomes.md) for what the assessor
  concludes once evidence is gathered.
- [`./sampling.md`](./sampling.md) for how the coverage axis is filled.
- [`./quality-standards.md`](./quality-standards.md) for the IRAP-ARs that bind
  evidence quality.

## Sources

- ASD, IRAP Common Assessment Framework v1.0 (April 2025). Last-verified: 2026-05-13.
  <https://www.cyber.gov.au/sites/default/files/2025-04/IRAP%20common%20assessment%20framework.pdf>
