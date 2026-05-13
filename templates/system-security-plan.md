# System Security Plan (SSP) - universal template

A drop-in System Security Plan template for an Australian Commonwealth, state or local
government system, or for an APP entity's system handling agency information. This
template is framework-neutral; use the IRAP-flavoured variant at
[`../skills/irap/ssp-template.md`](../skills/irap/ssp-template.md) when the SSP is
specifically for an IRAP submission.

Fill the bracketed placeholders. Delete guidance text in italics before publishing.

---

## Cover sheet

- **System name:** [SYSTEM NAME]
- **System owner:** [NAME, ROLE]
- **Accountable authority:** [NAME, ROLE]
- **Privacy officer (if personal information in scope):** [NAME, ROLE]
- **Classification ceiling:** [UNOFFICIAL / OFFICIAL / OFFICIAL: Sensitive / PROTECTED]
- **Frameworks referenced:** [ISM <release>, Essential Eight <target ML>, PSPF
  <release>, Privacy Act 1988 / APPs]
- **SSP version:** [vX.Y]
- **Date approved:** [YYYY-MM-DD]
- **Next review:** [YYYY-MM-DD]
- **Document owner:** [NAME, ROLE]

## 1. Purpose and scope

*One paragraph stating what the SSP covers and why.*

This System Security Plan describes the security architecture, controls and operational
practices for [SYSTEM NAME]. It records how the system meets the applicable Australian
government cyber security obligations.

## 2. System description

- **Function:** [What the system does.]
- **Users:** [Who uses the system: internal staff, citizens, third parties.]
- **Data:** [Categories of information held, including personal information categories
  and classifications.]
- **Hosting:** [Cloud provider, regions, on-premises components.]
- **External integrations:** [Each integration, data exchanged, basis.]

## 3. System boundary

In scope:

- [Components, accounts, networks, namespaces in scope.]

Out of scope (with separate assurance basis where applicable):

- [Components explicitly out of scope.]

## 4. Architecture summary

*High-level architecture. Defer detail to architecture documents linked from here.*

Reference: [link to current architecture document].

## 5. Information assets and classification

| Asset | Description | Classification | Personal information? | Retention |
| --- | --- | --- | --- | --- |
| [Asset] | [Description] | [Class] | [Y/N + APP relevance] | [Period] |

## 6. Roles and responsibilities

| Role | Name | Responsibilities |
| --- | --- | --- |
| Accountable authority | [NAME] | Accepts residual risk. |
| System owner | [NAME] | Operates the system within the authorised configuration. |
| CSO / CISO | [NAME] | Cyber and protective security oversight at agency level. |
| Privacy officer | [NAME] | Privacy policy, PIA, NDB response. |
| Security architect | [NAME] | Owns the security architecture. |
| Incident response lead | [NAME] | Incident command. |

## 7. Control framework alignment

### 7.1 ISM controls

For each applicable ISM control, record the implementation, evidence and owner. Cite
the ISM release in the identifier. Detailed walk-through is in the SoA;
this SSP section captures the architectural posture.

### 7.2 Essential Eight posture

| Strategy | Target ML | Current state | Gaps | Owner |
| --- | --- | --- | --- | --- |
| Application control | [ML] | [Achieved / partial / not achieved] | [Gap] | [Owner] |
| Patch applications | [ML] | [...] | [...] | [...] |
| Configure Office macros | [ML] | [...] | [...] | [...] |
| User application hardening | [ML] | [...] | [...] | [...] |
| Restrict administrative privileges | [ML] | [...] | [...] | [...] |
| Patch operating systems | [ML] | [...] | [...] | [...] |
| Multi-factor authentication | [ML] | [...] | [...] | [...] |
| Regular backups | [ML] | [...] | [...] | [...] |

### 7.3 PSPF posture (where applicable)

| PSPF policy | How addressed | Owner |
| --- | --- | --- |
| Policy 10 (cyber threats) | [Summary] | [Owner] |
| Policy 11 (robust ICT) | [Summary] | [Owner] |
| Policy 8 (classified information) | [Summary if information is classified] | [Owner] |

### 7.4 Privacy Act / APP posture (where personal information in scope)

| APP | How addressed | Owner |
| --- | --- | --- |
| APP 1 | Privacy policy at [URL] | [Owner] |
| APP 5 | Collection notices at [locations] | [Owner] |
| APP 6 | Use and disclosure documented in PIA | [Owner] |
| APP 8 | Cross-border disclosures documented in PIA | [Owner] |
| APP 11 | Security controls per this SSP | [Owner] |
| APP 12 / APP 13 | Access and correction process at [link] | [Owner] |

## 8. Operational security practices

- Patching cadence: [link]
- Vulnerability management: [link]
- Identity and access management: [link]
- Logging and monitoring: [link]
- Incident response: [link]
- Backup and recovery: [link]
- Change management: [link]
- Access reviews: [link, cadence]
- Personnel onboarding and offboarding: [link]
- Third-party management: [link]

## 9. Residual risks

| Risk | Likelihood | Impact | Mitigation | Owner | Acceptance |
| --- | --- | --- | --- | --- | --- |
| [Risk] | [L] | [I] | [Mitigations] | [Owner] | [Accepted by, date] |

## 10. Linked artefacts

- Statement of Applicability: [link]
- Risk register: [link]
- Incident Response Plan: [link]
- Privacy Impact Assessment: [link] (if applicable)
- Business Continuity Plan: [link]
- Disaster Recovery Plan: [link]
- Architecture document: [link]

## 11. Document control

| Version | Date | Author | Summary of change |
| --- | --- | --- | --- |
| 0.1 | [YYYY-MM-DD] | [NAME] | Initial draft. |
| 1.0 | [YYYY-MM-DD] | [NAME] | Approved. |
