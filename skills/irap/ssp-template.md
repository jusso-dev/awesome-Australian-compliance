## System Security Plan (SSP) - IRAP-ready template

Fill the bracketed placeholders. Delete guidance text in italics before publishing the
SSP. Pin the ISM release in the cover sheet and reference it in every control entry.

Stored at the agency's document management system as a controlled document. Reviewed at
least annually and on material change.

---

## Cover sheet

- **System name:** [SYSTEM NAME]
- **System owner:** [NAME, ROLE]
- **Accountable authority:** [NAME, ROLE]
- **System authoriser:** [NAME, ROLE]
- **Privacy officer:** [NAME, ROLE]
- **Classification ceiling:** [OFFICIAL / OFFICIAL: Sensitive / PROTECTED]
- **ISM release pinned:** [ISM <Month Year>]
- **Essential Eight target Maturity Level:** [ML1 / ML2 / ML3]
- **SSP version:** [vX.Y]
- **Date approved:** [YYYY-MM-DD]
- **Next review:** [YYYY-MM-DD]
- **Document owner:** [NAME, ROLE]

## 1. Purpose

*This section states why the SSP exists and what it covers.*

This System Security Plan describes the security architecture, controls and operational
practices for [SYSTEM NAME]. It supports the IRAP assessment, the system authorisation
decision, and ongoing security management.

## 2. System description

*Concise system description. Include a diagram in the published version.*

- **Function:** [What the system does in one paragraph.]
- **Users:** [Who uses the system: internal staff, agency citizens, third parties.]
- **Data:** [What information the system holds, including any personal information and
  classification.]
- **Hosting:** [Cloud provider, regions, on-premises components.]
- **External integrations:** [Each integration, the data exchanged, the basis.]

## 3. System boundary

*Be precise. The boundary determines what the assessor will look at.*

In scope:

- [Components, accounts, networks, namespaces in scope.]

Out of scope (with separate assurance basis where applicable):

- [Components explicitly out of scope, with the reason and any inherited assurance.]

## 4. Shared responsibility model

*For each layer, who is responsible for what.*

| Layer | Responsibility | Evidence source |
| --- | --- | --- |
| Physical security and infrastructure | [Cloud provider] | [Provider IRAP letter] |
| Hypervisor and managed services | [Cloud provider] | [Provider SoA] |
| Operating system | [System owner] | [This SSP, section X] |
| Application | [System owner] | [This SSP, section X] |
| Identity and access | [System owner with IdP provider inheritance] | [This SSP, section X; IdP SoA] |
| Data | [System owner] | [This SSP, section X] |

## 5. Architecture summary

*High-level architecture. Defer detail to architecture documents linked from here.*

Reference: [link to current architecture document].

Key flows:

1. [User authentication flow, including MFA factor.]
2. [Data flow in, processing, storage.]
3. [Data flow out, including any cross-border path.]

## 6. Classification and data inventory

| Data category | Examples | Classification | Personal information? | Retention |
| --- | --- | --- | --- | --- |
| [Category] | [Examples] | [Class] | [Y/N + APP relevance] | [Period and basis] |

## 7. Control implementation

*Walk every applicable ISM control. Group by guideline. Each control entry follows the
shape below. Pin the ISM release in the control identifier.*

### Example control entry

> **Control:** ISM-XXXX (ISM <Month Year>)
>
> **Requirement:** [Quote the live wording.]
>
> **Applicable to:** [Classifications from the live ISM table.]
>
> **Implementation:** [How this system meets the control. Reference specific
> configurations, IaC files, or processes.]
>
> **Evidence:**
> - [Evidence item, with stable path or URL.]
> - [Evidence item.]
>
> **Owner:** [Named role.]
>
> **Last reviewed:** [YYYY-MM-DD]

### Guidelines covered

For each ISM guideline relevant to the system, include a subsection. Suggested order:

- 7.1 Cyber Security Roles
- 7.2 Cyber Security Incidents
- 7.3 Procurement and Outsourcing
- 7.4 Cyber Security Documentation
- 7.5 Physical Security
- 7.6 Personnel Security
- 7.7 Communications Infrastructure
- 7.8 Communications Systems
- 7.9 Enterprise Mobility
- 7.10 Evaluated Products
- 7.11 ICT Equipment
- 7.12 Media
- 7.13 System Hardening
- 7.14 System Management
- 7.15 System Monitoring
- 7.16 Software Development
- 7.17 Database Systems
- 7.18 Email
- 7.19 Networking
- 7.20 Cryptography
- 7.21 Gateways
- 7.22 Data Transfers
- 7.23 Cyber Supply Chain Risk Management

## 8. Essential Eight posture

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

## 9. Roles and responsibilities

| Role | Name | Responsibilities |
| --- | --- | --- |
| Accountable authority | [NAME] | Accepts residual risk on behalf of the agency. |
| System owner | [NAME] | Operates the system within the authorised configuration. |
| System authoriser | [NAME] | Authorises the system based on assessment outcomes. |
| Security architect | [NAME] | Owns the security architecture and reviews material changes. |
| CISO | [NAME] | Cyber security policy and oversight at agency level. |
| Privacy officer | [NAME] | Privacy policy, PIA, NDB response. |
| Incident response lead | [NAME] | Day-to-day incident command. |

## 10. Operational security practices

- Patching cadence: [link to runbook]
- Vulnerability management: [link]
- Identity and access management: [link]
- Logging and monitoring: [link]
- Incident response: [link to IRP]
- Backup and recovery: [link to BCP / DRP]
- Change management: [link]
- Access reviews: [link, cadence]
- Personnel onboarding and offboarding: [link]
- Third-party management: [link]

## 11. Residual risks

*Each residual risk listed in the risk register. This SSP section is the summary.*

| Risk | Likelihood | Impact | Mitigation | Owner | Acceptance |
| --- | --- | --- | --- | --- | --- |
| [Risk] | [L] | [I] | [Mitigations] | [Owner] | [Accepted by, date] |

## 12. Document control

| Version | Date | Author | Summary of change |
| --- | --- | --- | --- |
| 0.1 | [YYYY-MM-DD] | [NAME] | Initial draft. |
| 1.0 | [YYYY-MM-DD] | [NAME] | Approved for IRAP submission. |

## 13. References

- ISM release pinned in cover sheet.
- ACSC Essential Eight Maturity Model.
- Provider IRAP letter and SoA (linked).
- Architecture document (linked).
- Risk register (linked).
- Incident response plan (linked).
- Privacy Impact Assessment (linked, where applicable).
