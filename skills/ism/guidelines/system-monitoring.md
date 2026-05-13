# Guidelines for System Monitoring

This guideline covers event logging, log management, intrusion detection and operational
security monitoring.

## In plain English

Log the things that matter. Send the logs somewhere central. Watch them. Investigate when
something is off. Keep the logs long enough to be useful.

## Key topics

- Event logging policy: what to log, on what systems, at what level.
- Centralised log collection and retention.
- Time synchronisation across the estate (NTP, Australian network time).
- Log review and detection content.
- Intrusion detection and prevention.
- Alerting, triage and incident escalation.

## Where to look

- SIEM configuration (Sentinel, Splunk, Elastic, sumologic, custom).
- Log forwarder configuration on endpoints and servers (auditd, Sysmon, journald, Windows
  event forwarding).
- Detection content (Sigma rules, KQL queries, Splunk SPL, Elastic EQL).
- NTP configuration.
- Retention policy and storage tier choices.

## Common evidence

- List of in-scope log sources with last-received timestamp.
- Retention policy meeting or exceeding the ISM's stated minimum.
- Detection content with last-fired timestamps and review notes.
- Sample alert with full triage chain.

## Common pitfalls

- "Centralised logging" that excludes cloud control-plane logs.
- Log channel configured but no consumer alerting on it.
- Retention shorter than the ISM requires (commonly 12 months minimum for many event
  types; quote the live ISM).
- Time skew across the estate making correlation unreliable.
- Detection content imported from generic threat hunting blogs and never tuned.

## Cross-references

- Essential Eight: application control and macros (logging requirements at higher
  maturity).
- Guidelines for Cyber Security Incidents.
- Guidelines for Networking (NTP).

## Sources

- ACSC, ISM Guidelines for System Monitoring.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism/cyber-security-guidelines/guidelines-system-monitoring>
