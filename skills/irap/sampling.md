# Sampling

The CAF defines sampling as supportive of direct control assessments, not a substitute
for them. Sampling is appropriate where the population is large enough that
direct-assessing every member is impractical and a representative subset will yield a
valid conclusion about the whole.

> Source: ASD, IRAP Common Assessment Framework v1.0, "When to use sampling" section.
> Last-verified: 2026-05-13.

The CAF cross-references the AuASB **ASA 530 Audit Sampling** standard. Sampling
techniques used in IRAP can draw on ASA 530.

## CAF requirements

- **IRAP-AR-0001** - The assessor has assessed all components within the assessment
  boundary and has used sampling only where appropriate, to determine control
  effectiveness.
- **IRAP-AR-0002** - The assessor clearly explains the sampling methodology, outlining
  any disadvantages, advantages and why it was chosen.

## When sampling is appropriate

Examples from the CAF:

- Generated logs, the details contained in the log files and the retention.
- The development, maintenance and implementation of different system administration
  procedures.
- System configurations and control mechanisms that are not managed by a central
  upstream service.
- Organisation's staff understanding of cyber security training, awareness and
  organisational policies.
- Historic application of patches and their associated timeframes.
- On-boarding of personnel.

Sampling is not appropriate to exclude components that require individual evaluation
(IRAP-AR-0001).

## Sampling principles

The CAF lists four principles to apply when selecting an approach:

- **Level of standardisation.** Many ICT environments are centrally managed. Where a
  technical policy is applied uniformly, one server may be representative of all.
- **Representative.** Samples must reflect normal operation, not examples produced for
  the assessment. Historical evidence should be drawn to confirm consistency over
  time.
- **Ease of data collection.** Tools approved by the entity may be used to drive down
  per-sample effort and enable automation, supporting larger sample sizes.
- **Confirmation of unexpected results.** Where results are inconsistent with the
  assessor's professional experience, collect additional samples to confirm.

## Four CAF sampling methodologies

| Methodology | Definition (CAF) | Strengths | Limitations |
| --- | --- | --- | --- |
| **Random** | Select a sample at random, reducing selection bias. | Reduces bias; simple to apply. | May miss subsets with particular characteristics. |
| **Stratified** | Sample assessment objects into distinct subgroups based on specific criteria; sample from each stratum in proportion to its significance. | Ensures coverage of important subgroups; gives finer-grained assurance. | More planning effort; requires clear strata. |
| **Risk-based** | Use the probability of occurrence combined with severity of harm to determine a representative sample focused on the highest-risk items. Threat modelling may inform the methodology. | Concentrates effort where risk is highest. | Needs the entity's input on organisational context; bias possible if risk view is incomplete. |
| **Systematic** | Sample at regular intervals from a sorted group (for example, every 2nd user account). | Easy to apply; predictable. | Bias if the population has periodicity matching the interval. |

Assessors may also draw on methodologies from AuASB ASA 530.

## Sample size and methodology selection

The CAF leaves the selection of sample size to the assessor's judgement, with the
principles above. The selection must align with the scale of the system or service.
Where an appropriate sample size cannot be achieved, the assessor must outline the
constraint and its impact in the report.

## How an agent should use this page

- When the user has a population of components to evaluate, propose a methodology
  matched to the population's structure.
- For ICT estates managed centrally (most modern cloud or Intune-managed estates),
  argue for a small random or systematic sample on the standardisation principle.
- For estates with material variation (mixed cloud accounts, legacy plus modern stack),
  argue for a stratified or risk-based sample.
- Always document the methodology, sample size, rationale and any limitations
  alongside the evidence.

## Cross-references

- [`./evidence-quality.md`](./evidence-quality.md) for how coverage interacts with
  evidence depth to form the assessment degree.
- [`./quality-standards.md`](./quality-standards.md) for IRAP-AR-0001 and -0002.

## Sources

- ASD, IRAP Common Assessment Framework v1.0 (April 2025). Last-verified: 2026-05-13.
  <https://www.cyber.gov.au/sites/default/files/2025-04/IRAP%20common%20assessment%20framework.pdf>
- AuASB, ASA 530 Audit Sampling. Cell reference only.
