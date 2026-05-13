# PSPF Policy 9 - Access to information

This policy governs who can access classified or sensitive information and on what
basis.

Note: numbering and content may have shifted in the PSPF 2024 redesign.

## In plain English

Apply need-to-know. Verify clearance. Limit access to the minimum required. Log who
accessed what.

## Key requirements

- Need-to-know principle applied alongside clearance level.
- Access to classified information requires a corresponding security clearance.
- Mechanisms to grant, modify and revoke access in a timely manner.
- Logging of access to classified information.

## Evidence

- IAM policy and IdP configuration enforcing role-based access.
- Clearance register matched to access roles.
- Onboarding / offboarding records demonstrating timely access changes.
- Access logs for classified information stores.

## Where to look

- Identity provider and IAM exports.
- Document management system access policies.
- Clearance management system.
- SIEM rules for unusual access to classified information.

## Common pitfalls

- Clearance held but no need-to-know basis recorded.
- Access widened temporarily and not narrowed back.
- Logging of access to classified information limited to authentication events, with
  no record of which records were viewed.

## Cross-references

- PSPF Policies 12 to 14 (personnel security).
- ISM Guidelines for System Hardening (access controls).
- ISM Guidelines for System Monitoring (logging).

## Sources

- AGD, PSPF Policy 9.
  <https://www.protectivesecurity.gov.au/publications-library>
