# Changelog

All notable changes to this project are documented here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and the project uses semantic
versioning.

## [Unreleased]

### Added

- Initial repository scaffold: README, LICENSE (MIT), CONTRIBUTING, CHANGELOG.
- `.github/workflows/lint.yml` running `markdownlint` and a link check on every push and PR.
- `_shared/` directory with `glossary.md`, `sources.md` and `disclaimer.md`.
- `tools/install.sh` symlinking `skills/*` into `~/.claude/skills/`.
- Phase 1 directory scaffolding for `essential-eight`, `ism`, `irap`, `privacy-act-apps`,
  `pspf`, `mappings/` and `templates/`.
- Essential Eight `SKILL.md` with trigger conditions, working pattern and source list.
- Essential Eight per-control pages for all eight mitigation strategies, with detection
  heuristics for an agent walking a real codebase or estate.
- Essential Eight ML1, ML2, ML3 maturity-level pages describing the threat model and
  per-strategy deltas at each level.
- Essential Eight audit checklist producing per-strategy, per-control findings against a
  target Maturity Level.
- Essential Eight worked examples: Windows AppLocker / WDAC, macOS Gatekeeper plus Santa,
  Linux fapolicyd.
- ISM `SKILL.md` with a version-aware trigger and an explicit pin-the-release working
  pattern.
- ISM `versions.md` register seeded back to ISM December 2019, with status flags
  (`current`, `superseded`, `unverified`, `withdrawn`) so a maintainer can confirm
  releases rather than guess.
- ISM `classifications.md` covering OFFICIAL through PROTECTED at a working level, with
  technology-decision implications.
- ISM per-guideline pages: Cyber Security Roles, Cyber Security Incidents, Procurement
  and Outsourcing, Cyber Security Documentation, Physical Security, Personnel Security,
  Communications Infrastructure, Communications Systems, Enterprise Mobility, Evaluated
  Products, ICT Equipment, Media, System Hardening, System Management, System
  Monitoring, Software Development, Database Systems, Email, Networking, Cryptography,
  Gateways, Data Transfers, Cyber Supply Chain Risk Management.
- ISM worked examples: an SSP-section example with release-pinning conventions, and a
  release-to-release diff walkthrough.
- `privacy-act-apps` `SKILL.md` with code signals, working pattern and a PIA-drafting
  flow.
- Per-APP pages for APP 1 through APP 13.
- Notifiable Data Breaches scheme runbook covering the 30-day assessment window, the
  serious-harm test, remedial action, and notification mechanics.
- Privacy worked examples: a PIA outline for an agency customer portal, and an NDB
  walkthrough for a credential-exposure incident.
- Cross-framework mappings under `mappings/`: Essential Eight to ISM guidelines,
  ISM guidelines to ISO/IEC 27001:2022 Annex A categories (cell references only),
  Australian Privacy Principles to GDPR (cell references only), PSPF policies to ISM
  guidelines.

## [0.0.1] - 2026-05-13

- Repository initialised on branch `claude/build-au-compliance-pack-Rrgbp`.
