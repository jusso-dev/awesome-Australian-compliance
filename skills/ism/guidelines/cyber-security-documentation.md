# Guidelines for Cyber Security Documentation

This guideline covers the documentation set expected for a system: the System Security
Plan (SSP), the Statement of Applicability (SoA), supporting plans (incident response,
business continuity, disaster recovery) and the cyber security strategy.

## In plain English

Write down how your system is meant to be secured. Show which controls apply, how each
one is met, and which do not apply (with a reason). Keep it current.

## Why it exists

Assessors and auditors evaluate documents first and operating evidence second. A coherent
SSP and SoA make the rest of an assessment efficient; their absence makes it adversarial.

## Key topics

- System Security Plan: scope, system description, applicable controls, implementation,
  residual risk.
- Statement of Applicability: per-control applicability with justification.
- Incident response plan.
- Business continuity plan.
- Disaster recovery plan.
- Standard operating procedures for key cyber security tasks.
- Document review and version control.

## Where to look

- `docs/security/` or equivalent in the repository.
- Confluence / SharePoint / Notion spaces dedicated to system security.
- Risk management tooling (RSA Archer, ServiceNow GRC, custom).
- Version-control history on documents.

## Common evidence

- Latest SSP, dated and approved.
- SoA covering every applicable control in the target ISM release.
- Incident response plan with last exercise date.
- Disaster recovery plan with last test date.
- Document review log.

## Common pitfalls

- SSP for the system that was, not the system that is.
- SoA that lists controls as "implemented" with no evidence pointer.
- Multiple stale versions of the same document in different repositories.
- Controls cited by identifier without the ISM release.
- "Continuous improvement" wording covering an absent control.

## Cross-references

- [`skills/irap/`](../../irap/) for SSP and SoA templates (Phase 2).
- [`templates/`](../../../templates/) for drop-in templates.

## Sources

- ACSC, ISM Guidelines for Cyber Security Documentation.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism/cyber-security-guidelines/guidelines-cyber-security-documentation>
