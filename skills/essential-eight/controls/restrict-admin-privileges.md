# Restrict administrative privileges

Administrative privileges are the keys to the kingdom. Strategy is to grant them sparingly,
justify each grant, and ensure that privileged actions happen on hardened, isolated
infrastructure so that a compromised user account cannot trivially become a compromised
admin account.

## In plain English

Make admin accounts rare and special. Validate the need before granting. Separate the
privileged identity from the everyday one. Do privileged work on a dedicated, hardened
device or session. Block privileged accounts from reading email and browsing the
internet. Revalidate the need on a schedule. Log everything.

## Why it exists

The single most consistent escalation pattern is "compromise a user, find admin, become
admin". Constraining the size of the admin population, the lifetime of admin sessions,
and the surface that admin accounts touch is the most direct mitigation.

## What the Maturity Model requires

Quote the live published wording. Requirements typically include:

- **Privileged account validation.** Requests to use privileged accounts are validated each
  time. ML2 and ML3 strengthen the validation cadence and audit.
- **Privileged access workstations (PAWs) or equivalent.** Privileged operations occur on
  separate, hardened devices or in a separate, hardened session. ML2 and ML3 require the
  separation, with secure admin workstations.
- **Internet and email isolation.** Privileged accounts cannot send or receive email and
  cannot browse the internet. ML2 and ML3 enforce this with technical controls.
- **Separate user account.** A privileged user must have a non-privileged account for
  everyday tasks. Workflows do not silently elevate.
- **Just-in-time access.** Higher maturity levels move from standing privilege to
  short-lived grants (Just-Enough-Admin, PIM, equivalent).
- **Revalidation.** Privileged access is revalidated at least annually (more often at
  higher maturity levels).
- **Logging.** Privileged actions are logged centrally and reviewed for indicators of
  compromise.

Reference: ACSC, Essential Eight Maturity Model, restrict administrative privileges section.
<https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-maturity-model>

## Evidence an assessor will ask for

- Privileged role inventory: who holds each role, with justification and date of last
  validation.
- PAW build standard: image, hardening baseline, lockdown of removable media, isolation
  from production user network.
- Identity provider configuration showing admins cannot use email and cannot browse to
  general-purpose websites (conditional access).
- JIT / PIM configuration in Entra ID, Okta or equivalent: maximum activation duration,
  approval requirements, MFA requirement on activation.
- Audit log samples showing privileged role activations and denials.
- Revalidation records (calendar of access reviews, owner sign-off, removals).
- Break-glass account policy: one or two heavily-monitored accounts with offline
  credentials, used only in emergencies.

## Where to look

- Active Directory / Entra ID: privileged role memberships (Domain Admins, Enterprise
  Admins, Global Administrators), Tier 0 asset inventory, Protected Users group.
- PIM configuration in Entra ID.
- IAM in cloud providers: AWS IAM and SSO permission sets, GCP IAM, Azure RBAC role
  assignments. Search for `AdministratorAccess`, `roles/owner`, `Owner` etc.
- Kubernetes RBAC: `ClusterRoleBinding` to `cluster-admin`, namespace-level admin
  bindings.
- CI/CD: deploy roles with broad permissions, secrets that grant production access.
- Database admin accounts: `sysadmin`, `root@%` on MySQL, `superuser` in PostgreSQL.
- Conditional Access policies for admin roles.

## Detection heuristics

1. Pull IAM exports and count the number of accounts with administrator-equivalent roles.
   Compare to the agency's documented headcount needing admin.
2. In cloud IaC, search for broad permissions (`*:*`, `roles/owner`, `AdministratorAccess`)
   and confirm each has an owner and justification.
3. Check whether admin role assignments are time-bound (PIM eligible, AWS session policies,
   short-lived OIDC tokens) or standing.
4. Look for break-glass accounts and confirm they have an MFA requirement and a monitored
   alert on use.
5. Look for separate admin identities (`alice` vs. `alice-admin`) in IdP exports. If a
   single identity does both, the separation control is missing.
6. Check whether privileged accounts are excluded from general internet egress and email
   in Conditional Access or equivalent.
7. Look for password manager and credential vault evidence (CyberArk, HashiCorp Vault,
   AWS Secrets Manager). Confirm rotation and check-out logging.

## Common implementation patterns

- **Tiered admin model.** Tier 0 (identity and core security), Tier 1 (servers and
  applications), Tier 2 (workstations). Identities and devices do not cross tiers.
- **PIM / JIT.** Eligible-but-not-active admin role memberships, activated for a few
  hours at a time with MFA and an approval flow.
- **PAWs.** Dedicated, locked-down devices for privileged work. No email client, no
  general-purpose browser, no productivity suite. Connect only to admin endpoints over
  a constrained network.
- **Just-Enough-Admin (JEA) in PowerShell.** Constrained role capabilities exposed via
  PSRemoting, audited.
- **Break-glass accounts in a sealed envelope.** Two accounts, MFA required, alerted on
  every use, rotated after each use.

## Common pitfalls

- **Admin accounts that read email.** The single most common entry point into admin
  compromise. Conditional Access must block this for admin role holders.
- **The same browser session for admin and personal.** Cookies and tokens leak.
- **Cloud "owner" assigned to humans rather than to break-glass roles.** Reduce daily
  human owners to zero and use elevated roles when needed.
- **CI/CD service principals with permanent owner-equivalent permissions.** A pipeline
  with `*:*` is a standing admin account.
- **Kubernetes cluster-admin everywhere.** Namespaced roles take longer to write and are
  worth the effort.
- **No alerting on privileged role activation.** PIM without an alerting pipeline is
  half the control.
- **Annual recertification done in spreadsheets, with most boxes ticked "yes" without
  review.** Make the access review meaningful or it is theatre.

## Cross-references

- Related: multi-factor authentication (MFA on admin activation, phishing-resistant
  factors at ML2 and above).
- ISM mapping: see [`mappings/e8-to-ism.md`](../../../mappings/e8-to-ism.md).
- PSPF Core Requirement on personnel security applies to admin role holders.

## Sources

- ACSC, Essential Eight Maturity Model.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/essential-eight/essential-eight-maturity-model>
- ACSC, Restricting Administrative Privileges.
  <https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-administration/restricting-administrative-privileges>
