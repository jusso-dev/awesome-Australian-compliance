# Regular backups

Backups are the last line of defence after a destructive incident (ransomware, deletion,
data corruption). The Maturity Model requires that backups exist, that they cover important
data, that they survive an adversary with admin privileges, and that restores actually
work.

## In plain English

Back up the data and configuration you need to rebuild. Keep at least one copy out of reach
of the production admin set. Test the restore on a defined schedule. Make sure the people
who can delete production cannot also delete the backups.

## Why it exists

Ransomware operators consistently target backups before encrypting production. If the
backup is on the same domain, accessible by the same admin credentials, it is destroyed
first. The strategy is specific about isolation and immutability for this reason.

## What the Maturity Model requires

Quote the live published wording. Key requirements:

- **Coverage.** Important data, software and configuration settings backed up.
- **Frequency and retention.** Frequencies and retention periods aligned to business
  continuity requirements.
- **Restore tested.** Restore validated as part of disaster recovery exercises. ML2 and
  ML3 tighten the cadence and scope.
- **Privileged account isolation.** Privileged accounts (other than backup administrators)
  cannot access, modify or delete backups. ML3 strengthens this to break-glass-only access
  to immutable copies.
- **Backup administrator accounts** subject to the privileged-access controls (separate
  identity, MFA, no email and no internet).
- **Backups stored separately** from production systems and ideally offline / air-gapped
  / immutable.

Reference: ACSC, Essential Eight Maturity Model, regular backups section.
<https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-maturity-model>

## Evidence an assessor will ask for

- Backup inventory: what is in scope, frequency, retention, storage location.
- Restore test records for the last 12 months, with success / failure outcomes and
  remediation for any failure.
- IAM separation between production admins and backup admins.
- Immutability or air-gap evidence: object-lock policy, write-once configuration, separate
  account with restricted trust.
- Encryption of backups in transit and at rest, with key custody documented.
- Inclusion of the configuration and identity layer (IaC, IdP, secrets vault) in scope,
  not just user data.

## Where to look

- Cloud provider backup services: AWS Backup, AWS Backup Vault Lock, Azure Backup,
  Recovery Services Vault soft-delete and immutable vault, GCP Backup and DR.
- Object lock policies on S3 buckets or equivalent (Compliance vs Governance mode).
- Cross-account / cross-tenant backup replication.
- Database snapshots: RDS automated backups, Aurora backtrack, Cloud SQL backups,
  Cosmos DB backup policies. Retention duration and account separation.
- SaaS data backups: Microsoft 365 and Google Workspace third-party backup tools, since
  the platform retention is not a substitute for a backup.
- Source-control: secondary mirror of the Git remote, build artefact backups, container
  registry backup.
- Identity layer: documented procedure for re-bootstrapping the IdP, recovery of the root
  account in each cloud tenant, recovery of code-signing certificates.
- IaC of the infrastructure: the IaC itself in version control, plus the secrets vault
  contents in a controlled backup.

## Detection heuristics

1. List all cloud backup services in use across accounts in scope. Confirm coverage of
   every database, file store, and configuration system identified in the inventory.
2. Check whether backup destinations are in a separate cloud account / subscription /
   project, and whether the production admin role can write to or delete from that
   destination.
3. Look for object-lock / immutability configuration on backup targets:
   - S3 buckets: `ObjectLockConfiguration` with `ObjectLockEnabled=Enabled`.
   - Azure: immutable blob storage, Recovery Services Vault immutable setting.
   - GCS: bucket lock with retention policy.
4. Confirm encryption-at-rest with customer-managed keys where mandated, and rotation of
   those keys.
5. Find a recent restore-test record (file path, runbook output, ticket).
6. Check whether the IaC repository itself is mirrored, and whether the secrets vault has
   a documented recovery procedure.
7. For SaaS data (Microsoft 365 mailboxes, SharePoint, OneDrive, Google Workspace),
   confirm a third-party backup is in place or document why the platform's retention is
   considered sufficient.

## Common implementation patterns

- **Three-two-one with cloud immutability**: three copies, two media types, one
  off-platform / immutable. In cloud-native shops, that becomes: production data, in-
  region snapshot, immutable cross-account / cross-region replica.
- **Separate backup tenant.** A dedicated cloud account / subscription that only the
  backup admin role can write or delete in. Production admins cannot reach it.
- **Restore-test cadence**: monthly small restores (one database, one file share),
  quarterly larger drills (a full service rebuild), annual whole-region drill where
  reasonable.
- **Configuration backup**: the IaC repository plus the IdP plus the secrets vault are
  all part of the backup scope. Backing up only application data leaves you unable to
  rebuild.
- **Backup admin role**: a dedicated identity with phishing-resistant MFA, JIT
  activation, no email, no internet, audited.

## Common pitfalls

- **Backups in the same account / tenant as production.** A compromised admin deletes
  both.
- **Soft-delete confused with immutability.** Soft-delete can be reverted by a
  sufficiently-privileged account. Immutability with retention is the requirement.
- **Untested restores.** The backups exist but nobody has ever proved they work.
- **No SaaS backup.** Microsoft and Google offer recycle bins and retention policies,
  not backups. Many agencies discover this after an incident.
- **Encryption keys lost.** Encrypted backups are useless without the key. Key custody
  and recovery is part of the backup scope.
- **Backup admin role with everyday email and browsing.** Brings the privileged-access
  problem back into scope on the one role that can read everything.

## Cross-references

- Related: restrict administrative privileges (the separation requirement is shared).
- Related: incident response (backups are how you get out of a destructive incident).
- ISM mapping: see [`mappings/e8-to-ism.md`](../../../mappings/e8-to-ism.md).
- PSPF business continuity references.

## Sources

- ACSC, Essential Eight Maturity Model.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-maturity-model>
- ACSC, Performing Backups.
  <https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/maintaining-systems/performing-backups>
