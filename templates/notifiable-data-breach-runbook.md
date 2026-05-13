# Notifiable Data Breach (NDB) runbook - template

A drop-in runbook for responding to a suspected eligible data breach under Part IIIC
of the Privacy Act 1988. The detailed companion is at
[`../skills/privacy-act-apps/ndb-scheme.md`](../skills/privacy-act-apps/ndb-scheme.md).
A worked example is at
[`../skills/privacy-act-apps/examples/ndb-walkthrough-credential-exposure.md`](../skills/privacy-act-apps/examples/ndb-walkthrough-credential-exposure.md).

This runbook is not legal advice. Engage legal counsel and contact the OAIC where
notification is required.

---

## Cover sheet

- **Agency / entity:** [NAME]
- **APP entity status:** [Confirmed]
- **Privacy officer:** [NAME, ROLE, contact]
- **Privacy officer alternate:** [NAME, ROLE, contact]
- **Legal counsel contact:** [NAME, ROLE, contact]
- **OAIC submission point:** <https://www.oaic.gov.au/privacy/notifiable-data-breaches>
- **Runbook version:** [vX.Y]
- **Last exercised:** [YYYY-MM-DD]
- **Next exercise:** [YYYY-MM-DD]

## Decision points at a glance

```
Incident detected
        |
        v
Containment + evidence preservation (hours 0 to 4)
        |
        v
Initial assessment: is there unauthorised access / disclosure / loss
of personal information the entity holds?
        |        |
       no       yes
        |        |
        |        v
        |   30-day assessment window opens
        |        |
        |        v
        |   Likely-serious-harm test, considering remedial action
        |        |          |
        |       no         yes
        |        |          |
        |   document       Notify OAIC + affected individuals
        |   and close      as soon as practicable
        |        |          |
        v        v          v
   Close      Close      Post-incident review
```

## Step 1 - Detection and activation

- Triage the alert or report.
- Open an incident ticket with the unique ID, timestamp, source and initial
  description.
- Activate the incident response team. Notify the privacy officer.
- Decide whether to notify legal counsel now or after initial assessment.

## Step 2 - Contain and preserve

- Take immediate steps to limit the breach:
  - Revoke credentials.
  - Isolate affected hosts.
  - Block external destinations.
  - Pause exports.
  - Recover misdirected information where possible.
- Preserve evidence:
  - Capture logs, mailbox contents, system images.
  - Avoid actions that destroy evidence (do not nuke and rebuild without imaging).
- Document containment actions with timestamps.

## Step 3 - Initial assessment (target: within hours of detection)

Confirm or refute that personal information was involved.

- What was accessed, disclosed, lost?
- Is any of it personal information of an identifiable individual?
- If no personal information was involved, this is a security incident only.
  Continue with incident response; this runbook is not engaged.

## Step 4 - Full assessment (target: within 30 days of becoming aware)

The Act allows a "reasonable and expeditious" assessment, capped at 30 days. Conduct
the assessment now, do not wait.

### Information involved

- Personal information categories:
  - [Categories from data inventory.]
- Sensitive information categories (if any):
  - [Categories.]
- Approximate number of individuals affected: [count]

### Cause

- Source: [malicious actor / negligent staff / system error / lost device / supplier
  compromise].
- Specific cause: [description].

### Likelihood of serious harm

Consider:

- Nature of the personal information.
- Sensitivity.
- Whether the information is encrypted / protected.
- Persons who obtained / could have obtained the information.
- Likelihood that anyone who has the information has actually misused it or will.
- Nature of the harm.

Evidence supporting the assessment:

- Access logs reviewed for the exposure window.
- Forensic outputs.
- Threat intelligence on the actor.

### Remedial action

- Actions taken to date.
- Effect on the likely-serious-harm risk.

### Conclusion

- Is the breach an "eligible data breach"? [Y/N + reasoning]
- If Y: notification required.
- If N: document the assessment and close.

## Step 5 - Notify

If the breach is eligible:

### Notify the OAIC

- Use the OAIC's published form (currently at
  <https://www.oaic.gov.au/privacy/notifiable-data-breaches>).
- Include:
  - Entity identity and contact.
  - Description of the breach.
  - Kinds of information involved.
  - Recommended steps for individuals.

### Notify affected individuals

- Direct notification preferred (email, post, in-app).
- Where direct notification is not practicable: publish a statement on the entity's
  website and take reasonable steps to publicise it.
- Notification content must include:
  - Entity identity and contact.
  - Description of the breach.
  - Kinds of information involved.
  - Recommended steps for the individual.

### Other reporting

- ACSC ReportCyber if a cyber incident: <https://www.cyber.gov.au/report-and-recover/report>.
- Sector regulators where applicable (APRA for regulated entities, ASIC, Health, etc.).
- State / territory privacy regulators if the affected individuals are protected by a
  state regime.

## Step 6 - Post-incident review

Within 30 days of containment:

- Hold a lessons-learned with the incident response team and the privacy officer.
- Identify control failures.
- Capture remediation actions with owners and due dates.
- Update the runbook.
- Update the SSP, SoA and PIA where affected.
- Update training and awareness content if user behaviour was a factor.

## Common pitfalls

- Treating the 30-day window as the notification deadline. Notification is "as soon as
  practicable" after the entity concludes the breach is eligible.
- Underestimating "serious harm" because the information looks low-sensitivity.
  Volume, combination and context matter.
- Failing to preserve evidence before remediating.
- Notification language that minimises the breach.

## Contacts

- Privacy officer: [name, phone, email]
- Alternate: [name, phone, email]
- Legal counsel: [name, phone, email]
- Security incident lead: [name, phone, email]
- Communications lead: [name, phone, email]
- OAIC: <https://www.oaic.gov.au/contact-us>

## Sources

- OAIC, Notifiable Data Breaches scheme.
  <https://www.oaic.gov.au/privacy/notifiable-data-breaches>
- OAIC, Data breach preparation and response.
  <https://www.oaic.gov.au/privacy/guidance-and-advice/data-breach-preparation-and-response>
- Federal Register of Legislation, Privacy Act 1988, Part IIIC.
  <https://www.legislation.gov.au/C2004A03712/latest>
