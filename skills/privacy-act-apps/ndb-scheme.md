# Notifiable Data Breaches (NDB) scheme runbook

Part IIIC of the Privacy Act 1988 imposes mandatory data breach notification obligations
on APP entities. This page is a runbook for an agent or an engineer responding to a
suspected breach.

This runbook is not legal advice. Where an incident may be notifiable, get legal advice
and contact the OAIC.

## What triggers the scheme

A data breach engages the scheme if:

1. There is unauthorised access to, unauthorised disclosure of, or loss of, personal
   information that the entity holds, AND
2. The access, disclosure or loss is likely to result in serious harm to one or more
   individuals to whom the information relates, AND
3. The entity has not been able to prevent the likely risk of serious harm with
   remedial action.

If all three are met, the breach is an "eligible data breach" and notification is
required.

"Serious harm" is not defined exhaustively in the Act. The OAIC guidance lists physical,
psychological, emotional, financial, and reputational harm as examples.

## Step-by-step response

### Step 1 - Confirm an incident exists (hour 0)

- Triage the alert or report. Containment is the first priority.
- Begin the incident timeline. Record date, time, source of detection and initial
  description in the incident ticket.
- Activate the incident response team. Identify the privacy officer.

### Step 2 - Contain and preserve (hours 0 to 4)

- Take immediate steps to limit the breach: revoke credentials, isolate hosts, block
  external destinations, pause exports.
- Preserve evidence: logs, disk images, mailbox contents, transfer histories. Do not
  delete anything that may be evidence.
- Document all containment actions and their timing.

### Step 3 - Conduct an assessment (within 30 days of becoming aware of suspected breach)

The Act requires that, on suspecting an eligible data breach, the entity conduct a
"reasonable and expeditious" assessment to decide whether the test is met, within 30 days.

The assessment should answer:

- What personal information is affected? What categories (contact, financial, health,
  biometric, etc.)?
- How many individuals are affected? Even an estimate is acceptable to begin with.
- What is the cause? Malicious actor, negligent staff, lost device, system error?
- What is the likely consequence? Could this lead to identity theft, fraud, harassment,
  family violence, professional harm?
- What remedial action has been or could be taken? Password resets, freezing accounts,
  paying for identity-monitoring services, recovering misdirected emails before they
  are opened.
- Is the likely risk of serious harm prevented after remedial action?

### Step 4 - Decide whether to notify

If after the assessment the entity is satisfied or aware that an eligible data breach
has occurred (and remedial action has not removed the serious-harm risk), notification
is required as soon as practicable.

Notification is generally to:

- The Australian Information Commissioner (the OAIC) via the published online form.
- Affected individuals. Notification may be to each individual, or by publishing a
  statement on the entity's website if direct notification is not practicable.

The notification must include:

- The identity and contact details of the entity.
- A description of the breach.
- The kinds of information involved.
- Recommendations about steps individuals should take in response.

### Step 5 - Post-incident review

- Hold a lessons-learned within 30 days of containment.
- Update the incident response plan if procedures fell short.
- Update the SSP, the SoA, the privacy policy, and any system documentation reflecting
  changes made as a result.
- Track remediation actions to completion.

## Common exemptions and special cases

- Entities that hold personal information jointly with other entities can sometimes
  delegate notification to one of the entities.
- Multiple breaches arising from the same event can be handled together.
- Some entities are exempt or only partially in scope. Where there is doubt, get legal
  advice.

## Evidence

- Incident response plan including NDB-specific procedures.
- Tabletop exercises specifically covering an NDB scenario.
- Sample notifications used in past incidents.
- Privacy officer contact details, current and tested.
- Document control: the NDB runbook itself should be reviewed annually.

## Common pitfalls

- "We have 30 days to notify." The 30-day window is for the assessment, not for
  notification. Notification is "as soon as practicable" after the entity is satisfied
  the breach is eligible.
- Assuming that encrypted data is automatically not subject to notification. Encrypted
  data can still cause serious harm depending on the circumstances (the attacker has
  the key, the encryption is weak, the metadata alone is harmful).
- Forgetting that "loss" includes loss of access to information (ransomware), not just
  exfiltration.
- Notification language that minimises the breach to the point of being misleading.
- Skipping individual notifications by jumping to a public website statement when direct
  notification was practicable.
- Failing to engage the security team's evidence preservation before remediating.

## Cross-references

- APP 11 (security): the upstream obligation.
- ISM Guidelines for Cyber Security Incidents.
- ACSC ReportCyber service (separate from OAIC notification; do both where relevant).

## Sources

- OAIC, Notifiable Data Breaches scheme.
  <https://www.oaic.gov.au/privacy/notifiable-data-breaches>
- OAIC, Notifiable data breach statistics.
  <https://www.oaic.gov.au/privacy/notifiable-data-breaches/notifiable-data-breaches-statistics>
- OAIC, Data breach preparation and response.
  <https://www.oaic.gov.au/privacy/guidance-and-advice/data-breach-preparation-and-response>
- Federal Register of Legislation, Privacy Act 1988, Part IIIC.
  <https://www.legislation.gov.au/C2004A03712/latest>
