# Guidelines for Cryptography

This guideline specifies which cryptographic algorithms, protocols, key sizes and product
types are acceptable at each classification.

## In plain English

Use the algorithms the ACSC approves. Use key sizes and parameters they specify. Use
products that have been evaluated where required. Protect the keys.

## Why it exists

Cryptography is hard to get right and easy to get wrong. Specifying acceptable choices
removes guesswork and pre-emptively rejects classes of weakness (weak hashes, broken
ciphers, short keys).

## Key topics

- Approved Cryptographic Algorithms (ACA).
- Approved Cryptographic Protocols (ACP), notably TLS configuration.
- High Assurance Cryptographic Algorithms (HACA) for higher classifications (out of
  scope for this pack).
- Key management: generation, storage, rotation, destruction.
- Hardware security modules (HSMs) and evaluated cryptographic products.
- Cryptographic equipment configuration.
- Forward secrecy and authenticated encryption modes.
- Random number generation.

## Where to look

- TLS configuration on load balancers, reverse proxies, application servers and
  databases.
- Cipher suites enabled (and disabled).
- Certificate management: issuance pipeline, automation (cert-manager, ACM, Let's
  Encrypt, agency PKI), rotation.
- KMS / vault / HSM configuration.
- Disk encryption configuration.
- Application-level cryptography: library choices, custom code that performs encryption.

## Common evidence

- TLS scan output (Qualys SSL Labs, internal scanner) for every public endpoint
  showing TLS 1.2 / 1.3 only, approved cipher suites only, forward secrecy.
- Key rotation evidence for KMS-managed keys.
- HSM model and configuration where used.
- Application code review showing approved library use (no DIY crypto).

## Common pitfalls

- TLS 1.0 / 1.1 still enabled.
- Self-signed certificates in production paths.
- Weak ciphers (3DES, RC4, NULL ciphers) enabled "for legacy".
- Key rotation manual and forgotten.
- DIY cryptography in application code instead of vetted libraries.
- KMS keys with policies allowing wide use across accounts.
- HMAC keys reused across protocols.

## Cross-references

- Guidelines for Evaluated Products (cryptographic products often must be evaluated).
- Guidelines for Networking.
- Guidelines for System Hardening.

## Sources

- ACSC, ISM Guidelines for Cryptography.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism/cyber-security-guidelines/guidelines-cryptography>
- ACSC, Using the Australian Government Information Security Manual's cryptographic
  controls (where published).
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism>
