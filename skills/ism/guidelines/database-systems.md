# Guidelines for Database Systems

This guideline covers the configuration and management of relational and non-relational
database systems.

## In plain English

Lock down the database. Authenticate every connection. Audit every privileged action.
Encrypt sensitive data. Restrict who can read.

## Key topics

- Authentication to databases (no anonymous, no shared accounts).
- Authorisation and least privilege (per-schema or per-row access where supported).
- Auditing of privileged actions and access to sensitive data.
- Encryption at rest (transparent data encryption or equivalent) and in transit (TLS).
- Database backup as part of the broader backup strategy.
- Database server hardening.
- Separation of database administrator accounts from application service accounts.

## Where to look

- Database engine configuration files and parameter groups.
- IaC for managed database services (RDS, Aurora, Cloud SQL, Cosmos DB, MongoDB Atlas).
- IAM policies for database administrators.
- Application connection strings (in secrets management) confirming TLS enforcement.
- Audit log destinations.

## Common evidence

- Authentication and authorisation model document for each database.
- Encryption at rest with managed key custody.
- Audit log samples for privileged actions.
- Network restriction (private subnets, no public endpoints, security group rules).
- DBA role inventory with rotation evidence.

## Common pitfalls

- Public database endpoints on cloud providers.
- Default admin accounts retained with default passwords.
- Audit logging enabled but not collected centrally.
- Application service account with `*.*` permission across all schemas.
- TLS optional rather than required.

## Cross-references

- Guidelines for System Hardening.
- Guidelines for System Monitoring.
- Guidelines for Cryptography.

## Sources

- ACSC, ISM Guidelines for Database Systems.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism/cyber-security-guidelines/guidelines-database-systems>
