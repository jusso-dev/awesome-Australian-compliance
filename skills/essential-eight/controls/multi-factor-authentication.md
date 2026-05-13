# Multi-factor authentication

MFA reduces the value of a stolen password. The Maturity Model has shifted in recent years
from "any second factor is fine" toward phishing-resistant factors at higher maturity
levels, and toward MFA on more than just SSO sign-in.

## In plain English

Require a second factor on sign-in. Require it on privileged actions, not just initial
login. At higher maturity, the second factor must be phishing-resistant (FIDO2 / WebAuthn,
hardware tokens). Customer-facing services that handle personal information also need MFA
where the user authenticates.

## Why it exists

Most account compromises start with password theft, password reuse from a third-party
breach, or phishing. MFA breaks the direct line from stolen credential to account takeover.
Phishing-resistant MFA breaks the second-order attack where the attacker proxies the
victim's MFA prompt in real time.

## What the Maturity Model requires

Quote the live published wording. The themes:

- **Scope.** MFA on remote access (VPN, RDP, SaaS sign-in), privileged operations,
  workstations (at higher maturity), and on services that handle the agency's data.
- **Factor strength.** At ML1, any second factor that meets the published definition; at
  ML2 and ML3, the factors must be phishing-resistant. Common phishing-resistant choices
  include FIDO2 / WebAuthn with hardware authenticators and certificate-based smart-card
  authentication.
- **MFA for customers.** Where an agency offers services to the public that handle the
  agency's data, MFA must be available, and at higher maturity levels strongly encouraged
  or enforced.
- **Logging.** Successful and unsuccessful MFA events logged centrally.

Reference: ACSC, Essential Eight Maturity Model, multi-factor authentication section.
<https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-maturity-model>

## Evidence an assessor will ask for

- IdP configuration showing MFA enforced for all users on all access paths.
- Factor inventory: which factor types are accepted, with the weaker ones disabled at the
  target maturity level.
- Conditional Access policy showing privileged role activations require an additional
  prompt with a strong factor.
- Phishing-resistant factor enrolment rate (FIDO2 / hardware token enrolment) for
  privileged accounts.
- Logs showing MFA failures, particularly clusters of failures or anomalous geographies.
- Documentation showing customer-facing MFA available and the uptake rate.

## Where to look

- Entra ID Conditional Access policies, Authentication methods policy.
- Okta MFA enrolment policies, factor sequencing.
- AWS SSO (IAM Identity Center) MFA settings, AWS IAM root account MFA.
- GCP / Cloud Identity 2-Step Verification policies.
- SSH access: hardware token requirements (`PubkeyAuthentication` with hardware-backed
  keys), certificate authority arrangements.
- VPN concentrators: integration with the IdP for MFA, posture for split-tunnelling.
- Custom-built customer authentication: code paths in the application, secret-key
  rotation for TOTP, WebAuthn registration and assertion handling.

## Detection heuristics

1. In the IdP export, look for accounts without MFA enrolled. Sort by role. Any admin
   without an enrolled strong factor is a finding.
2. In Conditional Access exports, look for the policy that requires MFA. Confirm it
   targets All users / All cloud apps. Look for exclusions and challenge each one.
3. Check whether SMS-only or voice-call factors are allowed for any high-risk role.
4. Look for FIDO2 / hardware authenticator registration records.
5. For custom-built apps, find authentication code paths and confirm the MFA logic exists.
   Common shapes: a `verify_totp`, `verify_webauthn`, `complete_mfa_challenge` function.
6. In CI / CD identity (GitHub Actions OIDC, AWS IAM roles for service accounts), look
   for short-lived credentials rather than long-lived static keys.
7. Look at SSH access patterns in the infrastructure: certificate-based auth via Teleport
   / step-ca / OpenSSH CA, or just static keys.

## Common implementation patterns

- **Phishing-resistant by default for privileged accounts.** YubiKeys or platform
  authenticators (Windows Hello for Business with TPM, Touch ID) enrolled and required.
- **Authenticator app for general staff at ML1**, moved to phishing-resistant before
  attempting ML2.
- **Conditional Access policy stack**: baseline MFA for everyone, additional strong-factor
  policy for admin roles, location-based step-up for sensitive operations.
- **Customer MFA**: TOTP and WebAuthn supported, SMS as a recovery factor only, recovery
  flows audited.
- **No bypass routes.** Application passwords removed, legacy authentication protocols
  (Basic auth, IMAP, POP) disabled.

## Common pitfalls

- **SMS or voice as the only factor.** Not phishing-resistant. Not acceptable for
  privileged accounts at ML2 and above.
- **MFA on portal but not on API.** API tokens that grant the same access without MFA
  defeat the control.
- **Service accounts excluded.** Long-lived service account credentials are an admin-
  equivalent risk and need their own controls (rotation, scoping, vault).
- **"Remember this device" with a long lifetime.** A six-month remember-me is functionally
  no MFA.
- **MFA enrolment optional.** Optional MFA is no MFA.
- **Token spreading.** OIDC access tokens copied to a developer laptop and reused for
  weeks defeats the MFA challenge that originally minted them.

## Cross-references

- Related: restrict administrative privileges (MFA on activation, phishing-resistant
  factors).
- ISM mapping: see [`mappings/e8-to-ism.md`](../../../mappings/e8-to-ism.md).
- APP 11 (Privacy Act) overlaps for systems handling personal information.

## Sources

- ACSC, Essential Eight Maturity Model.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-maturity-model>
- ACSC, Implementing Multi-Factor Authentication.
  <https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening/implementing-multi-factor-authentication>
