# Guidelines for Procurement and Outsourcing

This guideline covers cyber security considerations when buying or outsourcing IT
services, particularly cloud and managed services.

## In plain English

Before you buy or outsource, know what data goes where, who can access it, and what
controls the provider operates. Document the provider's responsibilities. Reassess on a
schedule.

## Why it exists

Procured and outsourced services routinely host or process the agency's sensitive
information. The agency cannot delegate accountability, only the operation. Procurement
without security input is the most common path to data residency, jurisdiction and
control gaps that surface during an incident.

## Key topics

- Cyber security requirements in procurement (RFI, RFT, contracts).
- Cloud service assessment (IRAP-assessed services where appropriate, DTA's Cloud
  Assessment and Authorisation Framework).
- Shared-responsibility model between the agency and the provider.
- Off-shoring considerations and data residency.
- Sub-contracting and supply-chain management.
- Contract clauses for incident notification, evidence access and termination.
- Periodic reassessment.

## Where to look

- Master services agreements and statements of work.
- IRAP reports for cloud services in use.
- Cloud configuration showing region pinning and customer-managed key custody.
- Procurement register listing third parties with access to the agency's information.
- Right-to-audit clauses in contracts.

## Common evidence

- Provider's IRAP assessment letter and statement of applicability.
- Shared responsibility matrix specific to the system, not the generic vendor template.
- Subcontractor list with access scopes.
- Annual review minutes for major providers.

## Common pitfalls

- Treating SOC 2 Type II as equivalent to an IRAP assessment. They are different.
- Procurement signed before security input.
- Provider's marketing claim of compliance accepted without their assessor's letter.
- Data egress paths to non-Australian regions hidden in nested SaaS dependencies.
- No reassessment when the provider's posture changes (new sub-processor, new region,
  new service offering).

## Cross-references

- DTA Cloud Assessment and Authorisation Framework (Phase 2 of this pack).
- [`skills/irap/`](../../irap/) for IRAP scope and workflow (Phase 2).
- PSPF Policy 6 (security governance with industry partners).

## Sources

- ACSC, ISM Guidelines for Procurement and Outsourcing.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism/cyber-security-guidelines/guidelines-procurement-and-outsourcing>
- DTA, Cloud Assessment and Authorisation Framework.
  <https://www.dta.gov.au/help-and-advice/cloud/cloud-assessment-and-authorisation-framework>
