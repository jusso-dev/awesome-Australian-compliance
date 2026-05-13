---
name: ism
description: Use this skill when the user asks about the Australian Government Information Security Manual (ISM), an ISM control by its identifier (for example "ISM-0123", "control 1546"), an ISM guideline (Guidelines for Cyber Security Roles, Guidelines for System Hardening, Guidelines for Cryptography, and so on), or about an Information Security Registered Assessors Program (IRAP) assessment that references ISM controls. Trigger on phrases like "what does the ISM say about X", "ISM compliance", "draft an SSP", "draft a Statement of Applicability", "what version of the ISM is this", "what changed in the latest ISM", and any explicit ISM control number. Also trigger when the user is preparing an SSP, SoA, evidence pack or risk register for a system that must align to the ISM, or when classification is mentioned (OFFICIAL, OFFICIAL: Sensitive, PROTECTED). Always pin the ISM version (release quarter) before quoting a control identifier or wording, because controls are added, removed and reworded each quarter. Do NOT trigger for non-AU control catalogues (NIST 800-53, ISO 27002, CIS Controls) unless the user is explicitly asking for a mapping to or from the ISM.
---

# Information Security Manual (ISM)

The ISM is the Australian Government's primary cyber security control catalogue, published
by the Australian Signals Directorate's Australian Cyber Security Centre. It is updated
quarterly. Controls have integer identifiers (for example `ISM-0123`) which are reused
across releases unless the control is retired or split. Wording, applicable classifications
and recommended implementations all change between quarterly releases.

Use this skill to look up ISM controls, draft System Security Plan (SSP) and Statement of
Applicability (SoA) sections that reference the ISM, identify applicable controls for a
target classification, and surface what has changed between releases.

## When to use this skill

- The user references an ISM control number, the ISM directly, or any of its guideline
  groups.
- The user is preparing for, or responding to, an IRAP assessment.
- The user is writing an SSP, an SoA, an evidence pack, or a risk register that needs to
  cite the ISM.
- The user asks about classification (OFFICIAL, OFFICIAL: Sensitive, PROTECTED).
- The codebase or estate exposes signals that map to ISM guideline groups: cryptography
  config, gateway and network egress controls, system monitoring pipelines, software-
  development practices, mobile device management, evaluated product use.
- The user wants to know what changed between two ISM releases (release notes, list of
  changes documents).

## What this skill knows

- The structure of the ISM: an introduction, then a set of *guidelines*, each containing
  a list of *controls* with identifiers, applicable classifications and recommended
  implementations.
- The set of guideline groups (current structure; pre-2024 structure differed). One
  reference page per guideline lives under `guidelines/`.
- A version register at [`versions.md`](./versions.md) listing the quarterly releases the
  ACSC has published, with a note that control identifiers and wording change between
  releases.
- The classification model at [`classifications.md`](./classifications.md). Phase 1 of
  this pack covers up to PROTECTED.
- That the ISM is not the Essential Eight. Many controls overlap, but the ISM is the
  larger catalogue.

In scope: ISM controls at OFFICIAL through PROTECTED, the guideline structure, mapping to
ISO 27001 in [`mappings/ism-to-iso27001.md`](../../mappings/ism-to-iso27001.md), and the
mapping from Essential Eight to ISM in [`mappings/e8-to-ism.md`](../../mappings/e8-to-ism.md).

Out of scope: SECRET and above, the ISM Cyber Security Principles (high-level governance
framing) covered only briefly, and any content that paraphrases paid frameworks.

## How to apply

When the user asks an ISM question or asks for an ISM-referencing artefact, follow this
pattern.

1. **Pin the version.** Ask the user which ISM release they are targeting (typically the
   most recent quarterly release at the time of assessment). If not stated, default to
   the latest release in [`versions.md`](./versions.md) and explicitly say so in the
   response. Quoting an ISM control without naming the release is a recipe for
   embarrassment.
2. **Pin the classification.** ISM controls have an "applicable to" column listing the
   classifications they apply to. The set of applicable controls grows as classification
   rises. Phase 1 of this pack covers up to PROTECTED.
3. **Pin the system type.** ISM controls are scoped by type (workstations, servers, mobile
   devices, gateways, cloud services). The "applicable to" set narrows when the system is
   only one of these.
4. **Pull the relevant guideline page.** The detail lives in `guidelines/*.md`. The pages
   are scoping documents: what the guideline covers, where to look in a codebase, common
   evidence types, common pitfalls.
5. **Quote controls from the live ISM, not from memory.** When a specific control
   identifier and wording matters (SSP, SoA, assessor evidence), open the live published
   ISM PDF or HTML on cyber.gov.au, find the control by identifier, and quote it. Note
   the release quarter alongside the identifier (for example `ISM-0123 (ISM December
   2025)`).
6. **Cross-reference Essential Eight.** Where a control overlaps with an E8 strategy,
   surface that mapping so the user does not produce two contradictory pieces of
   evidence.
7. **Note version drift.** If the user is comparing to an older artefact (an SSP from
   two releases ago), open [`versions.md`](./versions.md), identify the intervening
   change documents, and call out any controls that have been added, removed, or
   reworded.

## Producing an SSP or SoA section

When asked to draft SSP or SoA content:

- Lead each control entry with the identifier and release quarter.
- Quote the requirement from the source.
- State how the system implements the requirement, with file paths or configuration
  references.
- State who owns the implementation, and the evidence the assessor should expect to see.
- For SoA: state applicability (applicable / not applicable / not relevant at target
  classification), with justification when not applicable.
- Cross-reference Essential Eight, PSPF and any APP obligations where the same evidence
  satisfies multiple requirements.

## Common pitfalls

- **Quoting an ISM control identifier without the release quarter.** Identifiers are
  reused but wording changes. An assessor sees `ISM-0123` and assumes the latest text.
- **Treating the ISM as the Essential Eight.** The Essential Eight is a subset of ISM
  obligations focused on the eight strategies. ISM expectations at PROTECTED extend well
  beyond E8.
- **Producing an SSP that references retired controls.** Controls are retired. Use the
  current release for new artefacts.
- **Classification mismatch.** A control marked applicable only at PROTECTED does not
  apply to an OFFICIAL: Sensitive system, and vice versa. Read the applicable-to column.
- **Conflating "should" and "must" guidance.** Some ISM controls are mandatory at certain
  classifications, others are recommended. The wording matters.
- **Stale version references in long-running SSPs.** SSPs typically have a review cadence
  (often annual). Refresh against the most recent ISM release at each review and document
  the changes.

## Sub-files

- [`versions.md`](./versions.md) - quarterly release register with last-verified dates.
- [`classifications.md`](./classifications.md) - OFFICIAL through PROTECTED at a working
  level.
- `guidelines/` - one page per ISM guideline group, with scope, codebase signals,
  evidence types and pitfalls.
- `examples/` - worked examples of SSP and SoA sections.

## Sources

- ACSC, Information Security Manual.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism>
- ACSC, Cyber Security Principles (ISM).
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism/cyber-security-principles>
- ACSC, IRAP overview.
  <https://www.cyber.gov.au/about-us/about-asd/programs-and-services/irap>

Last-verified dates are tracked centrally in
[`_shared/sources.md`](../../_shared/sources.md).
