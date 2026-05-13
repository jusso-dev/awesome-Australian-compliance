# Incident Response Plan (IRP) - template

A drop-in Incident Response Plan for an Australian government or APP-entity system.
This template aligns with the ISM Guidelines for Cyber Security Incidents and the
Essential Eight expectations on incident handling, and integrates with the NDB runbook
where personal information is involved.

Fill the bracketed placeholders. Delete guidance in italics before publishing.

---

## Cover sheet

- **System / agency:** [NAME]
- **Plan version:** [vX.Y]
- **Date approved:** [YYYY-MM-DD]
- **Next exercise:** [YYYY-MM-DD]
- **Last review:** [YYYY-MM-DD]
- **Document owner:** [NAME, ROLE]

## 1. Purpose

This plan describes how the entity prepares for, detects, responds to, and recovers
from cyber security incidents. It covers the lifecycle from detection through
post-incident review.

## 2. Scope

In scope:

- [Systems, environments, populations.]

Out of scope (handled under a separate plan):

- [Items.]

## 3. Definitions

- **Event:** any observable occurrence.
- **Alert:** an event surfaced by detection content as worth examining.
- **Incident:** a confirmed adverse event affecting confidentiality, integrity or
  availability.
- **Major incident:** an incident with significant impact (defined locally; commonly
  involves classified information, personal information of many individuals, or
  significant service disruption).
- **Privileged incident:** an incident involving privileged accounts or systems.
  Treated as major by default.

## 4. Roles

| Role | Responsibilities | Contact |
| --- | --- | --- |
| Incident Commander | Owns the response; coordinates teams. | [Name + on-call rotation] |
| Security Lead | Technical investigation and containment. | [Name + rotation] |
| Communications Lead | Internal and external communications. | [Name] |
| Privacy Officer | Engaged when personal information is involved. | [Name] |
| Legal Counsel | Engaged for legal exposure and notifications. | [Name] |
| CISO | Senior cyber decisions. | [Name] |
| Accountable Authority | Notified for major incidents. | [Name] |

## 5. Lifecycle

### 5.1 Preparation

- Training: annual cyber awareness for all staff, role-specific training for
  responders.
- Tabletop exercises: at least annually; cover ransomware, account compromise,
  insider, supplier compromise.
- Tooling: SIEM, EDR, identity logs, network sensors, backup recovery procedures.
- Runbooks: per-scenario runbooks linked below.
- Contact lists: refreshed quarterly.

### 5.2 Detection

Detection sources:

- SIEM alerts.
- Endpoint and identity telemetry.
- User reports via [channel].
- ACSC notifications.
- Third-party reports (researchers, customers, suppliers).
- Anomaly detection from operational dashboards.

### 5.3 Triage

For each alert:

- Severity (informational / low / medium / high / critical).
- Confidence (suspected / likely / confirmed).
- Time-of-event estimate.
- Initial scope (affected accounts, hosts, services).

Output: open or close the incident ticket, escalate if criteria met.

### 5.4 Containment

Short-term containment options:

- Revoke credentials.
- Isolate hosts.
- Disable affected services.
- Block external destinations.
- Pause integrations.

Document containment actions with timestamps. Preserve evidence (logs, images) before
any action that might destroy it.

### 5.5 Eradication

- Identify and remove the root cause.
- Patch the vulnerability if known.
- Remove persistence mechanisms (scheduled tasks, services, accounts).
- Reset credentials with potential exposure.

### 5.6 Recovery

- Restore from backups where required.
- Validate restored systems before reconnection.
- Increase monitoring on restored systems for a defined window.
- Confirm normal service.

### 5.7 Post-incident review

- Within 30 days of containment.
- Capture timeline, root cause, response performance.
- Identify control failures.
- Assign remediation actions with owners and due dates.
- Update runbooks, the SSP, the SoA and detection content as required.

## 6. Reporting and escalation

| Trigger | Internal escalation | External report |
| --- | --- | --- |
| Suspected eligible data breach | Privacy officer + legal | OAIC under NDB scheme; engage [`./notifiable-data-breach-runbook.md`](./notifiable-data-breach-runbook.md) |
| Cyber incident affecting Commonwealth systems | CISO | ACSC ReportCyber |
| Critical infrastructure cyber incident | CISO + executive | Mandatory reporting under SOCI Act if in scope |
| Incident involving classified information | CISO + accountable authority | AGD / ASIO as appropriate |
| Service-impacting incident | Service owner | Customer / agency notification as per service obligations |

## 7. Communications

### Internal

- Executive update within [time window] of major incident declaration.
- All-staff communication if user action required.
- Stand-up cadence during active incident: [frequency].

### External

- Customer / citizen communication: by [channel] within [time window] of decision to
  notify.
- Regulator notification: per the obligations above.
- Media: through the Communications Lead; no comment from technical teams.

## 8. Tools and access

- Incident ticketing system: [URL]
- SIEM: [URL]
- EDR: [URL]
- Identity provider admin: [URL]
- Cloud provider consoles: [URLs]
- Forensic toolkit (read-only): [location]
- War room: [physical or virtual location]

## 9. Scenario runbooks (linked)

- Ransomware: [link]
- Account compromise: [link]
- Data exfiltration: [link]
- Insider misuse: [link]
- Supplier compromise: [link]
- Lost or stolen device: [link]
- Distributed denial of service: [link]

## 10. Exercise programme

- Annual tabletop covering at least three scenarios.
- Annual technical exercise (red team or purple team activity).
- After each material change to the system or threat landscape.

## 11. Continuous improvement

- All post-incident review actions tracked to completion.
- Trend reporting to the CISO quarterly.
- Annual plan review and re-approval.

## 12. Document control

| Version | Date | Author | Summary of change |
| --- | --- | --- | --- |
| 0.1 | [YYYY-MM-DD] | [NAME] | Initial draft. |
| 1.0 | [YYYY-MM-DD] | [NAME] | Approved. |

## Sources

- ACSC, ISM Guidelines for Cyber Security Incidents.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism/cyber-security-guidelines/guidelines-cyber-security-incidents>
- ACSC, ReportCyber.
  <https://www.cyber.gov.au/report-and-recover/report>
- OAIC, Data breach preparation and response.
  <https://www.oaic.gov.au/privacy/guidance-and-advice/data-breach-preparation-and-response>
