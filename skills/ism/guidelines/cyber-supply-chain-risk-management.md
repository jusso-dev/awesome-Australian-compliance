# Guidelines for Cyber Supply Chain Risk Management

This guideline covers supply-chain risk specifically for cyber security: how suppliers
of hardware, software and services can introduce risk into a system, and how to manage
that risk over the supplier relationship's lifecycle.

The ACSC introduced a dedicated guideline on this topic in a recent ISM release.
Maintainers must verify which release first introduced this guideline before relying on
this page for assessment evidence. TODO(source) for the introducing release.

## In plain English

Know which suppliers your system depends on, including the ones the supplier depends on.
Assess each one. Watch for compromise signals. Have a plan when one of them is breached.

## Why it exists

Supply-chain compromises (SolarWinds, log4j, Codecov, MOVEit) demonstrated that the
strongest perimeter does not protect against a trusted, signed update from a compromised
supplier. The ISM addresses this directly.

## Key topics

- Inventory of suppliers and sub-suppliers.
- Supplier risk assessment criteria.
- Software Bill of Materials (SBOM) for in-house and acquired software.
- Source verification (signatures, in-toto attestations, SLSA levels).
- Monitoring for supplier compromise signals.
- Contractual right to be notified of supplier incidents.
- Sub-contracting visibility (knowing the third party your supplier uses).
- Exit and substitution planning.

## Where to look

- Procurement records (Guidelines for Procurement and Outsourcing) extended for cyber
  supply chain.
- SBOMs in build pipelines (`cyclonedx`, `syft`, `spdx` artefacts in CI).
- Signature verification in admission controllers (cosign / sigstore in Kubernetes).
- Vendor risk management platform.
- Threat intelligence subscriptions covering supplier incidents.

## Common evidence

- Supplier inventory with risk tier per supplier.
- SBOM artefact policy: generated, stored, retrievable, refreshed.
- Recent supplier incident response (a real incident, not a theoretical one).
- Contractual incident-notification clauses with sample notifications received.

## Common pitfalls

- Inventory of direct suppliers only, with no visibility of sub-suppliers.
- SBOM generation enabled but artefacts not retained.
- Signature verification "best-effort" in admission control.
- No substitution plan for a critical sole-source supplier.

## Cross-references

- Guidelines for Procurement and Outsourcing.
- Guidelines for Software Development (SBOM and signing).
- Essential Eight: patch applications (SCA overlap).

## Sources

- ACSC, ISM Guidelines for Cyber Supply Chain Risk Management.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism/cyber-security-guidelines/guidelines-cyber-supply-chain-risk-management>
  (URL last-verified date TODO(source))
