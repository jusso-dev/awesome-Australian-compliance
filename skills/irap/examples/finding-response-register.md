## Worked example - IRAP finding response register

A finding response register tracks every finding raised by the IRAP assessor, the
response, the evidence supporting the response, and the status. Treated as a working
document during the engagement, finalised as an annex to the IRAP report.

## Fields

- **ID** - assigned by the assessor or the assessee, used in the report.
- **Finding** - the assessor's wording.
- **Severity** - the assessor's classification (typically informational / low / medium /
  high / critical).
- **Control(s)** - the ISM control(s) the finding relates to, with ISM release.
- **Response type** - remediate / accept residual risk / contest.
- **Response** - the assessee's written response.
- **Evidence** - reference to the evidence supporting the response.
- **Owner** - named role.
- **Due date** - when the response or remediation is expected.
- **Status** - open / in progress / resolved / withdrawn / accepted by authoriser.
- **Notes** - free text for context.

## Example entries

### Finding F-001

- **Finding:** Microsoft recommended driver block rules not loaded on production
  workstations.
- **Severity:** Medium.
- **Control:** ISM-XXXX (ISM <release>), per Essential Eight ML3 Application Control.
- **Response type:** Remediate.
- **Response:** Driver block list deployed as a supplemental WDAC policy via Intune
  device configuration profile [name]. Validation: WDAC event log shows policy active
  on a sample of devices.
- **Evidence:**
  - `evidence/intune/wdac-driver-block.json`
  - `evidence/intune/wdac-driver-block-rollout-report.csv`
  - `evidence/event-logs/code-integrity-sample.evtx`
- **Owner:** Endpoint Engineering.
- **Due date:** [YYYY-MM-DD].
- **Status:** Resolved (pending assessor verification).

### Finding F-002

- **Finding:** Privileged accounts retain general internet access via the corporate
  proxy.
- **Severity:** High.
- **Control:** ISM-XXXX (ISM <release>), per Essential Eight Restrict Administrative
  Privileges.
- **Response type:** Remediate.
- **Response:** Conditional Access policy `au-gov-admin-no-internet` deployed,
  blocking general internet destinations for the Tier 0 admin role. Allowed
  destinations: agency administrative endpoints only, listed in
  `evidence/conditional-access/admin-allowed-destinations.csv`. Service account
  exceptions documented and reduced to a small audited set.
- **Evidence:**
  - `evidence/conditional-access/au-gov-admin-no-internet.json`
  - `evidence/conditional-access/admin-allowed-destinations.csv`
  - `evidence/access-reviews/2026Q1-admin-exceptions.pdf`
- **Owner:** Identity Engineering.
- **Due date:** [YYYY-MM-DD].
- **Status:** Resolved (pending assessor verification).

### Finding F-003

- **Finding:** SaaS support tooling provider's support staff in non-Australian region
  can access agency tenant data on call.
- **Severity:** Medium.
- **Control:** APP 8 (cross-border disclosure); ISM-XXXX (ISM <release>) on procurement.
- **Response type:** Accept residual risk with system authoriser sign-off.
- **Response:** Provider's IRAP letter and SoA confirm reasonable steps consistent with
  APP 8. Access is logged, role-restricted, and audited. The system authoriser has
  accepted the residual risk for the contract term.
- **Evidence:**
  - Provider IRAP letter dated [date]
  - Provider SoA section X
  - Risk acceptance record `evidence/risk-acceptance/F-003.pdf` signed by the system
    authoriser on [date]
- **Owner:** Procurement.
- **Due date:** Accepted; review at next contract renewal.
- **Status:** Accepted by authoriser.

### Finding F-004

- **Finding:** Restore tests have not been performed in the last 90 days.
- **Severity:** Medium.
- **Control:** ISM-XXXX (ISM <release>) on backups; Essential Eight Regular Backups.
- **Response type:** Contest.
- **Response:** Most recent restore test occurred [date], 75 days before the workshop,
  which is inside the 90-day window. Evidence was previously linked to a stale URL.
  Working link provided.
- **Evidence:**
  - `evidence/dr-tests/2026Q1-restore-test-report.pdf` (corrected URL)
  - DR test ticket [ID].
- **Owner:** Platform Engineering.
- **Due date:** Reviewed in updated draft.
- **Status:** Withdrawn by assessor.

## Notes

- Status transitions: open -> in progress -> resolved or accepted by authoriser or
  withdrawn.
- Resolved status indicates the assessee considers the finding addressed; the assessor
  must verify before the final report.
- "Accepted by authoriser" is a final state; the authoriser's written acceptance is
  permanently linked.
- "Contest" responses keep the finding open until the assessor decides whether to
  retain, modify or withdraw.
- All findings, whether resolved, accepted or withdrawn, appear in the final report's
  annex.
