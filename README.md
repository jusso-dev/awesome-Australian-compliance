# awesome-australian-compliance

A pack of Claude Code skills and reference docs that make AI coding agents useful on Australian
government and regulated work. It is not legal advice and it is not a substitute for a registered
IRAP assessor or a privacy lawyer.

## Install

```sh
git clone https://github.com/jusso-dev/awesome-australian-compliance.git
cd awesome-australian-compliance
./tools/install.sh
```

This symlinks each directory under `skills/` into `~/.claude/skills/`. Updates flow through with a
`git pull`. The same skills also work in Cursor, Codex and OpenCode by copying or symlinking
`skills/*` into the equivalent agent skills directory for those tools.

## 30 second demo

In a project repo, with the skills installed, ask Claude Code:

> Audit this repository against Essential Eight Maturity Level 1 and produce a punch list.

The `essential-eight` skill fires on the phrase and the maturity level, walks the repo for the
detection heuristics in `skills/essential-eight/SKILL.md`, and produces a per-control assessment
with evidence, gaps, and remediations citing the Australian Cyber Security Centre's published
controls.

## What this pack is

A working developer's reference. Every control, principle and obligation is written so an
agent can use it: plain-English requirement, why it exists, what evidence an assessor will ask
for, where to look in a typical codebase, common implementation patterns, and gotchas. Every
claim links to a primary source with a last-verified date. Mappings between frameworks are
expressed in `mappings/` so an agent can pivot between them.

## What this pack is not

It does not replace a lawyer, a privacy officer, or an IRAP-registered assessor. It does not
paraphrase paid frameworks such as ISO 27001 or NIST beyond cell references in the mapping
tables. It does not include classified material and it does not exceed PROTECTED in scope.

## Framework coverage

| Framework | Phase | Status | Last verified |
| --- | --- | --- | --- |
| Essential Eight (ML1, ML2, ML3) | 1 | TODO | TODO(source) |
| Information Security Manual (ISM) | 1 | TODO | TODO(source) |
| IRAP assessment workflow | 1 | TODO | TODO(source) |
| Privacy Act 1988 and the 13 Australian Privacy Principles | 1 | TODO | TODO(source) |
| Notifiable Data Breaches scheme | 1 | TODO | TODO(source) |
| Protective Security Policy Framework (PSPF) | 1 | TODO | TODO(source) |
| APRA CPS 234 | 2 | not started | n/a |
| DTA Digital Service Standard and CAAF | 2 | not started | n/a |
| Consumer Data Right security profile | 2 | not started | n/a |
| VPDSF (Vic), IS18 (Qld), NSW CSP, WA CSP | 2 | not started | n/a |
| My Health Records Act and TGA SaMD | 2 | not started | n/a |

Classification ceiling for Phase 1 is PROTECTED. Hosting examples are vendor-agnostic with notes
on Australian regions where data residency matters.

## Quick start for other agent tools

- **Claude Code (web or CLI)**: run `./tools/install.sh`. Skills load from `~/.claude/skills/`.
- **Cursor**: copy or symlink `skills/*` into your Cursor agents directory.
- **Codex**: point your agents directory at this repo's `skills/`.
- **OpenCode**: copy or symlink `skills/*` into the OpenCode skills directory.

## Repository layout

```
skills/         per-framework skills with SKILL.md trigger files
mappings/       cross-framework mapping tables
templates/      drop-in SSP, SoA, PIA, NDB runbook, IRP templates
_shared/        glossary, canonical sources, disclaimer
tools/          install script and future automation
```

## Contributing

Read [CONTRIBUTING.md](./CONTRIBUTING.md) before opening a PR. The headline rules are: cite a
primary source for every claim, record a last-verified date, use Australian spelling, no em
dashes, no emojis, and do not paraphrase paid frameworks.

## Disclaimer

See [_shared/disclaimer.md](./_shared/disclaimer.md). This pack is general information for
software engineers and security practitioners. It is not legal advice and it is not an IRAP
assessment.

## Licence

MIT. See [LICENSE](./LICENSE).
