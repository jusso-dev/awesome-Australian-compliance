# awesome-australian-compliance

A drop-in pack of reference docs and AI coding "skills" that make Claude Code (and similar
agentic tools) actually useful on Australian government and regulated work. It is not legal
advice and it is not a substitute for a registered IRAP assessor or a privacy lawyer.

## What this gives you

After you install this pack, when you ask your AI coding assistant something like
"audit this repo against Essential Eight ML2" or "does this app meet APP 11 obligations",
it stops guessing and starts working from the actual published Australian frameworks. It
knows:

- The Essential Eight, all eight strategies, with Maturity Levels 1, 2 and 3
- The Information Security Manual (ISM), organised by guideline group
- The IRAP assessment workflow, plus drop-in SSP and SoA templates
- The Privacy Act 1988 and all 13 Australian Privacy Principles
- The Notifiable Data Breaches scheme and a runbook for responding to one
- The Protective Security Policy Framework (PSPF) core requirements

It also knows what evidence an assessor will ask for, where in a typical codebase to look
for it, and what the common gotchas are. Every claim links back to a primary source
(cyber.gov.au, oaic.gov.au, legislation.gov.au and equivalents).

If you have used Claude Code or similar tools before, you can skip to [Install](#install).
If "skill" and "agentic coding tool" are new terms, the next two sections explain what
this actually is and why you might want it.

## What is a "skill" and why does this pack ship skills?

Claude Code, Cursor and a few other coding tools let you drop a folder of markdown files
into a special location on disk. Each folder is called a **skill**. A skill is just
markdown plus a YAML header that tells the AI when to read the rest of the folder.

The YAML header in a skill says, in effect: "When the user asks about X, read these files
before answering." Once installed, the AI quietly loads the relevant skill when the topic
comes up. You do not have to invoke it, prompt-engineer it, or copy text into a chat.

This repo is a curated set of those skill folders, written for Australian compliance work.
The Essential Eight skill fires when you ask Essential Eight questions. The ISM skill
fires when you ask ISM questions. They cross-reference each other so the AI can answer
"map our ML2 posture to the relevant ISM controls" without you stitching it together by
hand.

You can also just read the markdown directly. The same files double as a developer
reference if you do not use an AI assistant at all. See [Reading without an AI assistant](#reading-without-an-ai-assistant).

## What changes after you install it

Concretely, before and after, on the same prompt:

**Before** (`Audit this repo against Essential Eight ML2`)

> Claude gives a generic answer that mixes US frameworks with what it can remember about
> the Essential Eight. It hallucinates control numbers. It does not know about the
> Assessment Process Guide. It does not look at your `package.json` or your Terraform.

**After** (same prompt, this pack installed)

> Claude loads `skills/essential-eight/SKILL.md`, pins the target Maturity Level, walks
> the repo using the detection heuristics for each of the eight strategies, and produces
> a per-control finding with file paths, the requirement quoted from the ACSC Maturity
> Model, the gap, and a concrete remediation. ISM control IDs are included by reference.
> Every citation is a cyber.gov.au URL.

The pack does not change Claude. It changes what Claude has read.

## Install

You need [Claude Code](https://docs.anthropic.com/claude/docs/claude-code) installed
first. Then:

```sh
git clone https://github.com/jusso-dev/awesome-australian-compliance.git
cd awesome-australian-compliance
./tools/install.sh
```

This symlinks every folder under `skills/` into `~/.claude/skills/`. Updates flow
through with a `git pull`. Restart Claude Code so it picks them up.

For Cursor, Codex or OpenCode, point the installer at the relevant skills directory:

```sh
./tools/install.sh --target ~/.cursor/skills
```

Run `./tools/install.sh --help` for `--copy` (no symlinks) and `--dry-run`.

## 30 second demo

In a project repo, with the skills installed, open Claude Code and run:

```text
Audit this repository against Essential Eight Maturity Level 2.
Produce a per-control finding with evidence, gap and remediation.
```

Claude will:

1. Load the `essential-eight` skill because the phrase matches the trigger description.
2. Pin ML2 as the target.
3. Walk your codebase: dependency manifests, IaC, CI configs, IdP config if present.
4. Emit a finding for each of the eight strategies with file paths and line ranges as
   evidence.
5. Cite the relevant ACSC Maturity Model section and cross-link the related ISM controls.

The same pattern works for "is this app APP 11 compliant", "draft an NDB notification for
this scenario", "produce a PSPF Core Requirement 7 evidence pack", and so on.

## Reading without an AI assistant

If you never plan to use Claude Code or Cursor, the markdown is still useful. Browse
[`skills/`](./skills) directly. Each folder has a `SKILL.md` that summarises the
framework and a deeper set of files under `controls/`, `guidelines/`, `apps/` or
`core-requirements/`. [`mappings/`](./mappings) shows how the frameworks line up against
each other. [`templates/`](./templates) is a set of drop-in document templates (SSP,
SoA, PIA, NDB runbook, incident response plan).

`_shared/sources.md` is the canonical list of primary-source URLs with last-verified
dates.

## Framework coverage

| Framework | Phase | Status | Last verified |
| --- | --- | --- | --- |
| Essential Eight (ML1, ML2, ML3) | 1 | in progress | TODO(source) |
| Information Security Manual (ISM) | 1 | not started | TODO(source) |
| IRAP assessment workflow | 1 | not started | TODO(source) |
| Privacy Act 1988 and the 13 Australian Privacy Principles | 1 | not started | TODO(source) |
| Notifiable Data Breaches scheme | 1 | not started | TODO(source) |
| Protective Security Policy Framework (PSPF) | 1 | not started | TODO(source) |
| APRA CPS 234 | 2 | not started | n/a |
| DTA Digital Service Standard and CAAF | 2 | not started | n/a |
| Consumer Data Right security profile | 2 | not started | n/a |
| VPDSF (Vic), IS18 (Qld), NSW CSP, WA CSP | 2 | not started | n/a |
| My Health Records Act and TGA SaMD | 2 | not started | n/a |

Classification ceiling for Phase 1 is PROTECTED. Hosting examples are vendor-agnostic
with notes on Australian regions where data residency matters.

## What this pack is not

- Not legal advice. Talk to a lawyer for legal advice.
- Not an IRAP assessment. Talk to an
  [IRAP-registered assessor](https://www.cyber.gov.au/about-us/about-asd/programs-and-services/irap)
  for an assessment.
- Not a Privacy Impact Assessment for your system. The PIA template is a starting point,
  not a deliverable.
- Not a paraphrase of paid frameworks (ISO 27001, NIST, SOC 2). Those appear only as cell
  references in `mappings/`.
- Not classified material. SECRET and above are out of scope.

## Repository layout

```
skills/         per-framework skills with SKILL.md trigger files
mappings/       cross-framework mapping tables
templates/      drop-in SSP, SoA, PIA, NDB runbook, IRP templates
_shared/        glossary, canonical sources, disclaimer
tools/          install script and future automation
```

## Contributing

Read [CONTRIBUTING.md](./CONTRIBUTING.md) before opening a PR. The headline rules are:
cite a primary source for every claim, record a last-verified date, use Australian
spelling, no em dashes, no emojis, and do not paraphrase paid frameworks.

## Disclaimer

See [_shared/disclaimer.md](./_shared/disclaimer.md). This pack is general information
for software engineers and security practitioners. It is not legal advice and it is not
an IRAP assessment.

## Licence

MIT. See [LICENSE](./LICENSE).
