# Guidelines for Software Development

This guideline covers secure software development practices: development environment
isolation, secure design, secure coding, testing, and the management of development
infrastructure.

## In plain English

Build software with security in mind. Separate dev / test / prod. Test for security
defects. Sign and verify the artefacts. Manage the people and the tooling.

## Key topics

- Development environment isolation from production.
- Secure software design (threat modelling).
- Secure coding practices and developer training.
- Static and dynamic application security testing (SAST, DAST).
- Software composition analysis (SCA) and SBOM generation.
- Code review and merge-request controls.
- Build and release pipeline integrity.
- Software supply-chain security (signed commits, signed releases, attested builds).

## Where to look

- CI / CD configuration files (`.github/workflows/`, `.gitlab-ci.yml`, `azure-pipelines.yml`,
  CircleCI / Jenkins / Buildkite equivalents).
- Branch protection rules.
- Signing configuration: commit signing (Sigstore Gitsign, GPG), artefact signing
  (cosign, in-toto).
- SAST / DAST / SCA tool configuration and recent run history.
- Developer training records on secure coding.
- Threat models for in-scope systems.

## Common evidence

- Branch protection rules requiring code review and signed commits.
- SAST and SCA results across the last 90 days with remediation.
- Threat model document for each significant system, refreshed annually.
- Build pipelines with attestation (SLSA, in-toto).

## Common pitfalls

- Dev and test environments using copies of production data without de-identification.
- "Security as a final step" model where security testing happens at release.
- Branch protection bypassed by admins.
- Signed commits required for some repositories but not others.
- Threat model written once at project start, never revisited.

## Cross-references

- Essential Eight: patch applications (SCA overlap).
- Guidelines for System Hardening (overlap on server hardening for build hosts).
- Guidelines for System Management.

## Sources

- ACSC, ISM Guidelines for Software Development.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism/cyber-security-guidelines/guidelines-software-development>
