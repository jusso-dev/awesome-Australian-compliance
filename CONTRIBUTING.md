# Contributing

Thanks for thinking about contributing. This pack only works if every claim in it is grounded in
a primary source and written so an AI coding agent can act on it without hallucinating. The rules
below exist to keep that property.

## Ground rules

1. **Cite primary sources.** Only cyber.gov.au, oaic.gov.au, protectivesecurity.gov.au,
   apra.gov.au, dta.gov.au, legislation.gov.au and the equivalent state government domains. No
   blog posts, no vendor whitepapers, no second-hand summaries.
2. **Record last-verified dates.** Every cited URL needs an entry in
   [`_shared/sources.md`](./_shared/sources.md) with the date you last opened it and confirmed
   the content still matched. If a source changes, update both the citation and the affected
   skill content in the same PR.
3. **No paraphrasing of paid frameworks.** ISO 27001, NIST and SOC 2 are only ever referenced
   as cell labels in `mappings/` tables. Do not write standalone content explaining them.
4. **Australian spelling.** `organisation`, `authorise`, `behaviour`, `licence` as noun,
   `license` as verb, `centre`, `defence`, `analyse`. `markdownlint` does not catch this so
   reviewers will.
5. **No em dashes, no emojis, no AI throat-clearing.** No "robust", "seamless",
   "comprehensive", "game-changing", "leverage" or "delve into". Write the way a senior
   engineer would write an incident postmortem.
6. **No legal advice.** State requirements in plain English and link to the legislation. Do not
   write "you must" without a citation behind it. If something is genuinely uncertain, mark it
   `TODO(source)` and leave it for someone with a citation.
7. **Working detail, not summaries.** Every control or principle should include the requirement
   in plain English, why it exists, what evidence an assessor will ask for, where to look in a
   typical codebase, common implementation patterns, and the gotchas assessors flag.

## Skill description triggers

The `description:` field in each `SKILL.md` is the most important line in the repo. It is what
makes the skill fire in Claude Code, Cursor and other agent runtimes. When you change a
description:

- Make the trigger conditions concrete. Include the user phrasings you expect ("is this
  Essential Eight ML2 compliant").
- Disambiguate from generic security skills. End the description with a line that says
  `Do NOT trigger for non-AU frameworks unless mapping is requested`.
- Test the trigger by asking Claude Code an adjacent but out-of-scope question and confirming
  the skill does not fire.

## PR checklist

- [ ] Every new claim has a primary-source citation
- [ ] Every new URL is in `_shared/sources.md` with a last-verified date
- [ ] Australian spelling throughout
- [ ] No em dashes, no emojis
- [ ] `markdownlint` passes locally (`npx markdownlint-cli '**/*.md'`)
- [ ] Link check passes locally (`npx markdown-link-check ...`)
- [ ] If you touched a `SKILL.md` description, you also tested the trigger in Claude Code

## Issue templates and ADRs

Significant changes (new framework, restructure, deprecation) get an Architecture Decision
Record under `docs/adr/` (created on first use). Smaller content updates can go straight to a
PR.

## Versioning

Semantic versioning at the repo level. Phase 1 ships as v0.1.0 through v1.0.0. Skill-level
breaking changes (renames, trigger changes that break existing prompts) require a minor bump
and a CHANGELOG entry.
