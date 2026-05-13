---
name: pspf
description: Use this skill when the user asks about the Protective Security Policy Framework (PSPF), a PSPF policy by number (for example "PSPF Policy 8", "Policy 10", "Core Requirement 7"), the PSPF's four security outcomes (security governance, information security, personnel security, physical security), the role of the Chief Security Officer (CSO), the accountable authority's responsibilities, classification and protective markings (UNOFFICIAL, OFFICIAL, OFFICIAL: Sensitive, PROTECTED, SECRET, TOP SECRET), or annual PSPF reporting to the Attorney-General's Department. Trigger on phrases like "what does the PSPF require", "are we PSPF compliant", "Core Requirements for personnel security", "PSPF maturity", "sensitive and classified information handling". Also trigger on PSPF-aware artefacts: agency security plans, threat assessments, fraud and corruption controls, security clearances. Do NOT trigger for non-AU protective security frameworks unless the user is explicitly asking for a mapping to or from the PSPF.
---

# Protective Security Policy Framework (PSPF)

The PSPF is the Australian Commonwealth's framework for protective security across
people, information and assets. It is administered by the Attorney-General's Department
(AGD). The PSPF applies to non-corporate Commonwealth entities; corporate Commonwealth
entities and some other bodies may opt in or are otherwise required to apply elements of
it.

The PSPF sets the agency-level governance, personnel and physical security expectations
that sit alongside the ISM's technical controls. The ISM is the technical control
catalogue inside the PSPF's broader policy framework.

## When to use this skill

- The user is preparing for, or reporting against, the PSPF.
- The user is producing an agency security plan, threat assessment or fraud and
  corruption plan.
- The user is responding to a PSPF maturity self-assessment requirement.
- The user is dealing with classifications, protective markings or sensitive
  information handling.
- The user is engaging a contracted service provider and needs the PSPF Policy 6
  governance expectations (security governance for contracted goods and services).
- The codebase or estate carries signals related to the PSPF: protective marking
  enforcement, classification labels in document management systems, security clearance
  workflows, physical access systems with a security zone model.

## What this skill knows

- The PSPF's structure: four outcomes, sixteen policies under those outcomes (subject
  to ongoing redesign; see [`versions.md`](./versions.md)).
- The relationship between the PSPF and the ISM: the PSPF sets policy outcomes, the ISM
  provides technical controls that contribute to those outcomes.
- The role of the accountable authority (the agency head or equivalent) and the
  delegated Chief Security Officer (CSO).
- The classification model and protective marking standard.
- The PSPF annual reporting cycle and maturity levels.

In scope: PSPF for Commonwealth agencies up to PROTECTED. State and territory protective
security regimes are out of scope.

## Note on PSPF versions

The PSPF has been substantially redesigned, most notably in 2024. The structure of the
policies, the maturity model and the reporting expectations have shifted. This skill
treats the current published PSPF on protectivesecurity.gov.au as authoritative and
provides a versions register in [`versions.md`](./versions.md) so an agent or
maintainer can pin to the right release when comparing or refreshing documents.

When quoting a PSPF requirement, always cite the version (release year) alongside the
policy number, in the format `PSPF Policy X (PSPF <year>)`.

## How to apply

1. **Pin the PSPF version.** Open [`versions.md`](./versions.md) and confirm which
   release applies.
2. **Identify the outcome relevant to the question.** The PSPF organises policies under
   four outcomes:
   - Security governance.
   - Information security.
   - Personnel security.
   - Physical security.
3. **Identify the applicable policy.** Use the per-policy pages under
   [`core-requirements/`](./core-requirements/).
4. **Map to the ISM where information security is the topic.** See
   [`mappings/pspf-to-ism.md`](../../mappings/pspf-to-ism.md).
5. **Produce or refresh the artefact.** Common artefacts the PSPF expects:
   - Agency security plan.
   - Security risk management plan.
   - Information security threats and risks assessment.
   - Fraud and corruption control plan.
   - Personnel security risk assessment.
   - Physical security plan.
   - Annual PSPF report.
6. **Engage the right stakeholder.** The accountable authority and the CSO are
   responsible for PSPF outcomes. Engage them early on any material change.

## Common pitfalls

- **Confusing the PSPF and the ISM.** They interlock but serve different purposes. The
  PSPF is the policy framework; the ISM is the technical control catalogue.
- **Citing a PSPF policy without the release year.** The numbering and content have
  shifted across redesigns.
- **Treating annual reporting as the destination.** The report is the by-product of
  ongoing security management, not the goal.
- **Sensitive information handling assumed to be only an information security topic.**
  PSPF Policy 8 binds the whole information lifecycle including physical handling and
  personnel access.
- **Contracted service provider governance handled by procurement alone.** PSPF Policy 6
  expects security-focused governance, not just commercial diligence.

## Sub-files

- [`versions.md`](./versions.md) - PSPF release register, with the 2024 redesign noted.
- [`core-requirements/`](./core-requirements/) - one page per PSPF policy.

## Sources

- Attorney-General's Department, Protective Security Policy Framework.
  <https://www.protectivesecurity.gov.au/>
- ACSC, Information Security Manual (technical controls under PSPF Policy 10 / 11).
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism>

Last-verified dates are tracked centrally in
[`_shared/sources.md`](../../_shared/sources.md).
