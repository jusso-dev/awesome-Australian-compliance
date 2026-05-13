# Guidelines for Email

This guideline covers the configuration and management of email systems, including the
domain-level authentication standards (SPF, DKIM, DMARC), content filtering, and
encryption.

## In plain English

Lock down email. Stop spoofing of your domains. Filter content. Encrypt where required.
Watch the platform for compromise.

## Key topics

- Sender Policy Framework (SPF) configuration.
- DomainKeys Identified Mail (DKIM) signing.
- Domain-based Message Authentication, Reporting and Conformance (DMARC) policy
  (`p=reject` for production domains is the target state).
- Marking and handling protective markings on email (PSPF email protective marking
  standard).
- Content filtering inbound and outbound.
- Encryption in transit (MTA-STS / opportunistic TLS / forced TLS for sensitive
  conversations).
- Email server hardening.
- Compromised account detection.

## Where to look

- DNS records for production and adjacent domains.
- Email gateway configuration (Microsoft Defender for Office 365, Mimecast, Proofpoint,
  agency-deployed equivalents).
- Outbound DLP rules.
- Mailbox audit configuration.
- Email server policy or Microsoft 365 secure score.

## Common evidence

- DNS query confirming SPF, DKIM, DMARC for every production domain.
- DMARC aggregate report destination and a sample report.
- Outbound DLP rule export covering classified information patterns.
- MTA-STS policy and TLS-RPT destination.
- Protective marking enforcement via Microsoft 365 sensitivity labels or equivalent.

## Common pitfalls

- DMARC published but at `p=none` indefinitely.
- SPF record with `+all` or third-party services listed that no longer send mail.
- DKIM not rotated for years.
- Protective markings not enforced; users can send PROTECTED data over standard email.
- Compromise detection limited to "impossible travel" without behavioural correlation.

## Cross-references

- Essential Eight: configure macros, user application hardening (Office, browsers).
- Guidelines for System Hardening.
- PSPF email protective marking standard.

## Sources

- ACSC, ISM Guidelines for Email.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism/cyber-security-guidelines/guidelines-email>
- Attorney-General's Department, PSPF Email Protective Marking Standard.
  <https://www.protectivesecurity.gov.au/publications-library>
