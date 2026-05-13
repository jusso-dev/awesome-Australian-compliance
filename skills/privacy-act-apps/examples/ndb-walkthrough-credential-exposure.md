# Worked example - NDB walk-through for a credential exposure incident

A condensed walk-through of an NDB assessment for a typical incident: a developer
publishes a private repository to a public namespace, exposing application code and a
`.env` file containing customer database credentials. The exposure window is six hours
before detection.

## Timeline

| Time | Event |
| --- | --- |
| T+0 | Developer pushes repository to wrong organisation, making it public. |
| T+5h45m | External researcher reports the exposed repository via a HackerOne-style program. |
| T+6h | Privacy officer and incident response team activated. Repository made private. Credentials in `.env` rotated. |
| T+7h | Forensic preservation: GitHub audit log exported, repo history preserved, IDs of any forks identified. |
| T+24h | Initial assessment: confirmed credentials were live during exposure; database access logs reviewed for the 6-hour window. |
| T+72h | Database access log review complete. No anomalous access from non-corporate IPs. Audit shows no exfiltration. |
| T+5d | Assessment finalised: serious harm risk reduced by credential rotation and absence of evidence of access; documented as not eligible. |

## Assessment steps

### 1. Identify the personal information at risk

The exposed credentials would have allowed read access to the customer database
containing identity details (name, email, phone, address), order history and limited
payment information (last four digits only; full payment details are in a separate
PCI-scoped store outside the exposed credential's reach).

### 2. Identify the population

If credentials had been used: approximately 240,000 customer records.
Confirmed access from credential use: zero.

### 3. Identify the cause and remedial action

Cause: developer pushed to wrong organisation. Remedial action: repository made
private; credentials rotated; database access reviewed; preventive controls strengthened
(pre-commit secret scanning, organisation-level setting preventing public repository
creation by non-admins).

### 4. Apply the likely-serious-harm test

The Act's test is whether the access, disclosure or loss is likely to result in serious
harm to one or more individuals, taking into account remedial action.

Factors weighed:

- Exposure window: 6 hours, business hours.
- Public availability: GitHub public repository, theoretically discoverable by anyone
  scanning new public repositories (and such scanners exist).
- Severity of personal information: contact information; serious-harm threshold from
  contact information alone is generally not met, although the population size raises it.
- Evidence of access: database access logs reviewed for the window; no anomalous access
  identified.
- Forks: searched immediately on detection; no forks created during the window.

Conclusion: with remedial action complete and no evidence of access, the likely risk of
serious harm was prevented in time. The breach was assessed as not an "eligible data
breach". Notification to the OAIC and to individuals was not required under the Act.

### 5. Voluntary actions taken

Despite not being notifiable, the entity:

- Published a transparency report on its security blog within 30 days describing the
  near-miss and the controls strengthened.
- Briefed the OAIC informally (the Commissioner's office accepts voluntary briefings).
- Strengthened the relevant controls:
  - Enforced organisation-level GitHub setting "members cannot create public
    repositories".
  - Deployed pre-commit and CI secret scanning.
  - Replaced the long-lived database credential with short-lived OIDC-issued tokens.
  - Added detection content for newly-created public repositories owned by the
    organisation, alerting the security team within 5 minutes.

## What would have changed the outcome

If even one anomalous access had been identified in the database logs, the assessment
would have concluded that serious harm was reasonably likely. Notification to the OAIC
and to affected individuals would have been required as soon as practicable.

If the credentials had granted access to sensitive information (health, financial
account details, biometric data), the threshold for serious harm would have been lower
and the absence of access evidence alone may not have removed the risk.

## Documentation produced

- Full incident timeline (in the security ticketing system).
- Forensic preservation evidence pack.
- Database access log analysis report.
- Lessons-learned record with assigned actions.
- Updated incident response plan.
- Voluntary transparency report.

## Cross-references

- [`../ndb-scheme.md`](../ndb-scheme.md) for the NDB scheme runbook.
- [`../apps/app-11-security.md`](../apps/app-11-security.md) for the upstream APP 11
  obligation.

## Sources

- OAIC, Notifiable Data Breaches scheme.
  <https://www.oaic.gov.au/privacy/notifiable-data-breaches>
- OAIC, Data breach preparation and response.
  <https://www.oaic.gov.au/privacy/guidance-and-advice/data-breach-preparation-and-response>
