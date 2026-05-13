# Guidelines for System Management

This guideline covers patching, change management, configuration management and
administrative privilege management.

## In plain English

Manage the system the way an assessor expects: changes go through a process, patches
arrive on a schedule, configuration is documented and consistent, admins are constrained.

## Key topics

- Change management process.
- Patch management process (overlapping with Essential Eight patch applications and
  patch operating systems).
- Configuration management and drift detection.
- Administrative privilege management (overlapping with E8 restrict admin privileges).
- Separation of development, test and production.

## Where to look

- Change management system (ServiceNow, Jira Service Management, ITSM tools).
- Patch management tooling and recent change tickets.
- IaC repositories and drift-detection tooling.
- IAM exports for privileged role inventories.

## Common evidence

- Change advisory board minutes for the last 90 days.
- Sample change ticket showing approvals, testing, rollout, rollback evidence.
- Configuration drift report.
- Privileged role inventory with last-validated date.

## Common pitfalls

- Emergency change process used as the default to avoid CAB.
- IaC repository diverging from production with no drift remediation.
- "Standard changes" pre-approved without scope review.
- Privileged roles never revalidated.

## Cross-references

- Essential Eight: patch applications, patch operating systems, restrict administrative
  privileges.
- Guidelines for System Hardening.
- Guidelines for System Monitoring.

## Sources

- ACSC, ISM Guidelines for System Management.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism/cyber-security-guidelines/guidelines-system-management>
