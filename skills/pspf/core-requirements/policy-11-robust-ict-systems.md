# PSPF Policy 11 - Robust ICT systems

This policy historically focused on ICT system robustness, including patching, secure
configuration and system monitoring. It overlaps significantly with PSPF Policy 10 and
relies on the ISM for the technical detail.

Note: in the PSPF 2024 redesign, the cyber-related policies may have been consolidated.

## In plain English

Build and run ICT systems in a way that resists compromise: patched, hardened, monitored.

## Key requirements

- Implement ISM controls applicable to the system.
- Patch in accordance with patching SLAs.
- Configure systems to hardened baselines.
- Monitor for cyber security events.
- Plan for and exercise incident response.

## Evidence

- Patch deployment metrics.
- Hardening baseline implementation evidence (Group Policy / Intune / MDM / Ansible
  exports).
- SIEM coverage and review records.
- Incident response exercises.

## Where to look

- ISM Guidelines for System Hardening, System Management and System Monitoring.
- Patch management tooling.
- Configuration management repositories.

## Common pitfalls

- Patch SLA met for production but missed on internal tooling.
- Hardening baseline applied at deploy and not re-checked.
- SIEM events flowing but never triaged.

## Cross-references

- ISM Guidelines for System Hardening / System Management / System Monitoring.
- Essential Eight strategies (patch applications, patch OS, application control, etc.).

## Sources

- AGD, PSPF Policy 11.
  <https://www.protectivesecurity.gov.au/publications-library>
- ACSC, Information Security Manual.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism>
