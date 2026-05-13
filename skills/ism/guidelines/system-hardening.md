# Guidelines for System Hardening

This guideline covers hardening of operating systems, workstations, servers, web browsers
and Microsoft Office. It overlaps directly with several Essential Eight strategies.

## In plain English

Apply the ACSC's published hardening baselines for Windows 10 / 11, Microsoft Office, web
browsers and Microsoft 365. Don't reinvent the wheel.

## Key topics

- Hardening Microsoft Windows 10 and Windows 11 workstations.
- Hardening Microsoft 365, Office and Outlook.
- Hardening web browsers (Edge, Chrome, Firefox).
- Hardening Linux distributions.
- Hardening macOS endpoints.
- Hardening server operating systems.
- Server application hardening (web servers, databases, mail servers).

## Where to look

- GPO / Intune policy exports.
- macOS configuration profiles in MDM.
- Linux configuration management (Ansible, Salt, Puppet, Chef).
- CIS Benchmark or ACSC hardening baseline implementation evidence.
- Application configuration management.

## Common evidence

- Mapping from ACSC hardening guide settings to the live policy export.
- Sample workstation configuration matching the baseline.
- Build automation that re-applies the baseline on every host.
- Drift detection alerts.

## Common pitfalls

- CIS Benchmark implemented without considering Australian-specific recommendations in
  the ACSC guides.
- Baseline applied at build but never re-checked.
- Hardening applied to workstations but not to servers (or vice versa).
- Application hardening (NGINX, Apache, IIS, MySQL, PostgreSQL) skipped because the
  team focused on OS hardening.
- Web browser baseline missing because users install browsers themselves.

## Cross-references

- Essential Eight: user application hardening, patch operating systems, patch
  applications.
- Guidelines for System Management.
- Guidelines for Software Development (overlap on server-side application hardening).

## Sources

- ACSC, ISM Guidelines for System Hardening.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism/cyber-security-guidelines/guidelines-system-hardening>
- ACSC, Hardening Microsoft Windows 10 and Windows 11.
  <https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/system-hardening>
