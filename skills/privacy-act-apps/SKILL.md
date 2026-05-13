---
name: privacy-act-apps
description: Use this skill when the user asks about the Privacy Act 1988, the 13 Australian Privacy Principles (APPs), the Notifiable Data Breaches (NDB) scheme, the Office of the Australian Information Commissioner (OAIC), personal information handling, a Privacy Impact Assessment (PIA), or any specific APP by number (for example "APP 11", "APP 3", "APP 8"). Trigger on phrasings like "is this app APP 11 compliant", "do we need to notify under the NDB scheme", "draft a PIA", "what does APP 5 require", "Privacy Act review", "personal information lifecycle". Trigger on code signals too: user-registration forms, login flows, KYC data capture, cross-border data flows (S3 buckets in non-AU regions, third-party SaaS hosting personal information), exports of customer data, marketing-tooling integrations. Use this skill for privacy reviews, PIAs, drafting NDB notifications, designing collection notices, mapping data flows. Do NOT trigger for non-AU privacy regimes (GDPR, CCPA, PIPEDA) unless the user is explicitly asking for a mapping between APPs and that regime.
---

# Privacy Act 1988 and the Australian Privacy Principles

The Privacy Act 1988 (Cth) is the Australian Commonwealth's general privacy statute. It
contains 13 Australian Privacy Principles (APPs) in Schedule 1, which bind APP entities
(most Commonwealth agencies and most private-sector organisations with annual turnover
above AUD 3 million, plus specific categories such as health service providers and
credit-related entities). The Office of the Australian Information Commissioner (OAIC) is
the regulator.

The Notifiable Data Breaches (NDB) scheme in Part IIIC of the Act applies where an
eligible data breach occurs.

This skill helps an agent reason about APP obligations, draft privacy artefacts, and
respond to suspected breaches.

## When to use this skill

- The user is reviewing whether a system or feature complies with one or more APPs.
- The user is writing a Privacy Impact Assessment, a collection notice, a privacy
  policy, or an NDB notification.
- The user is designing data flows that handle personal information and wants the privacy
  controls baked in early.
- The user is responding to a suspected breach and needs the NDB scheme criteria.
- The user is integrating a third-party SaaS or cloud service that will receive personal
  information.
- The codebase contains signals that engage personal information handling: user
  registration / authentication, contact-form processing, customer support exports,
  marketing list management, analytics that captures user identifiers.

## What this skill knows

- The 13 Australian Privacy Principles, one per file under [`apps/`](./apps/).
- The Notifiable Data Breaches scheme, in [`ndb-scheme.md`](./ndb-scheme.md).
- How APP obligations are usually evidenced in software (data flow diagrams, retention
  policies, access controls, third-party agreements).
- The relationship between Privacy Act obligations and ISM controls (the same encryption,
  access-control and logging evidence often satisfies both).

In scope: APP entities under the Privacy Act 1988, OAIC guidance, NDB scheme.

Out of scope: state and territory privacy regimes (Victoria's Privacy and Data Protection
Act 2014, NSW's Privacy and Personal Information Protection Act 1998, and similar) beyond
flagging that they exist; My Health Records Act (Phase 2 of this pack); general
international regimes (GDPR, CCPA) except as mapping cells.

## How to apply

When the user asks a privacy question or asks for a privacy artefact, follow this pattern.

1. **Identify whether the user is an APP entity.** Most Commonwealth agencies are
   automatically in. Private-sector organisations are in if annual turnover exceeds
   AUD 3 million, with carve-ins for specific categories regardless of turnover. State and
   territory agencies are usually covered by their own state regime, not the federal Act.
2. **Identify the personal information.** Define what personal information the system
   handles. "Personal information" is broad: anything that identifies or could reasonably
   identify an individual. Sensitive information (a defined subset including health,
   racial origin, sexual orientation, biometric, criminal record) has tighter rules.
3. **Map the data lifecycle.** Collection -> use -> disclosure -> storage -> deletion.
   Most APP obligations attach to one of these stages.
4. **Walk the relevant APPs.** Use the per-APP pages under [`apps/`](./apps/). For most
   software systems the load-bearing APPs are APP 1 (open and transparent management),
   APP 3 (collection of solicited personal information), APP 5 (notification of
   collection), APP 6 (use or disclosure), APP 8 (cross-border disclosure), APP 11
   (security of personal information), APP 12 (access) and APP 13 (correction). APPs 2,
   4, 7, 9 and 10 are more situational.
5. **Identify third parties.** Disclosure to a third party (including a cloud provider)
   engages APP 6 and, if the recipient is overseas, APP 8.
6. **Identify cross-border flows.** S3 buckets, SaaS sub-processors, support staff in
   other jurisdictions: each is a potential APP 8 trigger.
7. **Document.** Produce a Privacy Impact Assessment for any system handling significant
   amounts of personal information, especially sensitive information.

## Producing a Privacy Impact Assessment

When asked to draft a PIA:

- Describe the system, the data flows and the parties.
- Identify the personal information collected, the categories of sensitive information
  if any, and the source.
- Walk each APP, stating how the system addresses it, what residual risk remains, and
  what controls mitigate the residual risk.
- Identify cross-border disclosures.
- Identify retention and deletion expectations.
- Identify access, correction and complaints handling routes.
- Identify whether the project is in scope for any specific PIA requirement (Commonwealth
  agencies have a threshold assessment under the Privacy (Australian Government Agencies
  - Governance) APP Code 2017 for "high privacy risk" projects).
- A template lives at [`templates/privacy-impact-assessment.md`](../../templates/privacy-impact-assessment.md)
  when published.

## Common pitfalls

- **"We don't collect personal information."** Most systems do. IP addresses, device
  identifiers, usernames and email addresses are personal information.
- **Collection notice burying the disclosures.** APP 5 requires clear notification of
  who the information will be disclosed to. "Trusted partners" is not specific.
- **Cross-border disclosure missed.** Putting customer data in a US-region SaaS without
  considering APP 8 is the most common gap.
- **"We anonymise the analytics."** Pseudonymisation is not anonymisation. If the data
  can be re-identified it remains personal information.
- **Retention forever.** APP 11.2 requires destruction or de-identification when the
  information is no longer needed. "We might need it" is not a retention policy.
- **NDB notification thresholds misread.** Not every breach is notifiable, but the test
  is specific and time-bound (30 days from awareness to assess; then notify the OAIC and
  affected individuals if the test is met).
- **Sensitive information mistaken for ordinary personal information.** Health,
  biometric and similar information attracts tighter obligations, particularly around
  consent for collection.

## Sub-files

- [`apps/`](./apps/) - one page per APP, APP 1 through APP 13.
- [`ndb-scheme.md`](./ndb-scheme.md) - NDB scheme assessment runbook.
- `examples/` - worked examples (PIA outline for a customer portal; NDB walk-through
  for a credential exposure incident).

## Sources

- Office of the Australian Information Commissioner, Australian Privacy Principles.
  <https://www.oaic.gov.au/privacy/australian-privacy-principles>
- OAIC, Australian Privacy Principles guidelines.
  <https://www.oaic.gov.au/privacy/australian-privacy-principles-guidelines>
- OAIC, Notifiable Data Breaches scheme.
  <https://www.oaic.gov.au/privacy/notifiable-data-breaches>
- Federal Register of Legislation, Privacy Act 1988.
  <https://www.legislation.gov.au/C2004A03712/latest>

Last-verified dates are tracked centrally in
[`_shared/sources.md`](../../_shared/sources.md).
