# Guidelines for Gateways

This guideline covers gateway architecture between networks of different security levels,
including internet gateways and cross-domain solutions.

## In plain English

Where a network of one trust level connects to a network of a different trust level,
build a gateway. Decide what is allowed through. Inspect what passes. Log everything.

## Why it exists

Gateways are the last technical control before traffic crosses a trust boundary. Their
correctness has outsized impact on the whole estate.

## Key topics

- Internet gateway architecture.
- Web proxy configuration and content filtering.
- TLS inspection (where lawful and acceptable for the agency).
- Deep packet inspection.
- Cross-Domain Solutions (CDS) for higher classifications (out of scope for this pack).
- Egress filtering for outbound traffic.
- DNS filtering.
- Gateway availability and failure modes.

## Where to look

- Firewall configuration (CheckPoint, Palo Alto, Fortinet, Cisco, cloud-native firewall
  policies).
- Web proxy configuration (Zscaler, Netskope, agency-managed Squid, Microsoft Defender
  for Cloud Apps).
- DNS filtering provider configuration.
- Cloud egress controls (VPC endpoints, private link, egress firewall).
- Network IDS / IPS configuration.

## Common evidence

- Firewall rule export with documented justification per rule.
- Outbound filtering policy preventing arbitrary egress from production.
- Web proxy categorisation and block-by-default posture for unknown categories.
- DNS query logs with policy enforcement evidence.

## Common pitfalls

- "Allow all out" outbound rules on internet gateways.
- Firewall rules accumulated over years with no review.
- TLS inspection bypass for "compatibility" without documented justification.
- Cloud egress allowed to any destination from any subnet.
- DNS filtering enabled at the corporate gateway, bypassed when users use DNS-over-HTTPS
  in the browser.

## Cross-references

- Guidelines for Networking.
- Guidelines for Data Transfers.
- Guidelines for System Monitoring.

## Sources

- ACSC, ISM Guidelines for Gateways.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism/cyber-security-guidelines/guidelines-gateways>
