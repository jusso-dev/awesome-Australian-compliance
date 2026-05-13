# Guidelines for Data Transfers

This guideline covers content filtering and data transfer between networks of different
classifications or trust levels.

## In plain English

When data crosses a trust boundary, decide what is allowed, scan what passes, and log
the result. Treat unstructured transfers (file uploads, email attachments) as carefully
as structured ones (APIs).

## Key topics

- Content filtering on data transfer.
- Approval workflow for high-sensitivity transfers.
- File type and content checks (signatures, depth limits, embedded object scanning).
- Antivirus / antimalware scanning of transferred content.
- Logging of every transfer with sufficient metadata for incident review.
- Cross-domain transfer (for higher classifications, requires evaluated CDS; out of scope
  for this pack).

## Where to look

- Email gateway DLP rules.
- File transfer service configuration (MFT, managed file transfer products).
- API gateway content inspection.
- Cloud storage upload policies.
- Web upload restrictions on the proxy.

## Common evidence

- DLP rule export covering classified information patterns.
- File transfer service log sample.
- Sandbox detonation evidence for inbound attachments.
- Approval workflow for human-mediated transfers (managers signing off on outbound
  classified data).

## Common pitfalls

- Email DLP rules looking for "PROTECTED" string in subject lines only.
- File-type filters that allow `.zip` without inspecting contents.
- Cloud storage with no scanning on upload.
- API endpoints accepting arbitrary payloads with no content checks.
- Transfer logs that lack the recipient identity or the data classification.

## Cross-references

- Guidelines for Gateways.
- Guidelines for Email.
- Guidelines for System Monitoring.

## Sources

- ACSC, ISM Guidelines for Data Transfers.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism/cyber-security-guidelines/guidelines-data-transfers>
