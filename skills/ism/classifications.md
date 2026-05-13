# Classifications

The Australian Government uses a small set of classifications and a related set of
Information Management Markers (IMMs) to label the sensitivity of information. ISM
controls list the classifications they apply to. This page covers up to PROTECTED.

The authoritative source is the Protective Security Policy Framework's policy on
"Sensitive and classified information" (PSPF Policy 8). The ISM relies on that policy
rather than restating it.

## Classification model (summary)

| Classification | Approximate meaning | This pack covers? |
| --- | --- | --- |
| UNOFFICIAL | Non-business information. No security impact. | yes |
| OFFICIAL | Routine business information. No or low security impact if compromised. | yes |
| OFFICIAL: Sensitive | Information whose unauthorised disclosure could cause limited damage. Marked with the suffix "Sensitive". | yes |
| PROTECTED | Information whose unauthorised disclosure could cause damage to the national interest, organisations or individuals. | yes |
| SECRET | Information whose unauthorised disclosure could cause serious damage. | no (out of scope for this pack) |
| TOP SECRET | Information whose unauthorised disclosure could cause exceptionally grave damage. | no (out of scope for this pack) |

## Information Management Markers

Caveats and IMMs are layered on top of the classification. Common ones:

- `Sensitive: Cabinet` - applies to Cabinet matters; specific handling rules apply.
- `Sensitive: Legal` - applies to legally privileged information.
- `Sensitive: Personal` - applies to personal information; in practice this almost always
  also engages Privacy Act obligations.

Caveats narrow handling further (releasability, codeword material). Phase 1 of this pack
does not cover caveats in detail.

## How classification interacts with ISM controls

Each ISM control lists the classifications it applies to. Examples (illustrative; quote
the live ISM for the live wording):

- A control might apply to PROTECTED only.
- Another might apply to OFFICIAL: Sensitive and PROTECTED.
- Another might apply to all classifications.

When producing an SSP or SoA, walk the controls applicable to the system's classification
and document each one. Controls that apply only at higher classifications are typically
listed as "not applicable" with the classification as the justification.

## How classification interacts with technology choices

Classification interacts with several technical decisions. The decisions are not always
intuitive.

- **Hosting region.** PROTECTED workloads must be hosted on cloud services and physical
  facilities certified at the relevant level by the ACSC. Even where the data is
  encrypted, regional placement is part of the certification. Hosting examples in this
  pack are vendor-agnostic; the certified providers and regions change and must be
  confirmed from cyber.gov.au.
- **Cryptography.** The ISM's cryptography guideline mandates specific algorithm choices,
  key lengths and protocols by classification. PROTECTED imposes stricter constraints
  than OFFICIAL.
- **Network connectivity.** PROTECTED systems generally have constrained connectivity
  to internet-facing services. Gateways and content filtering are not optional.
- **Personnel.** Handling PROTECTED information requires personnel clearances. This is
  out of scope of this pack but is part of any real PROTECTED system design.
- **Email and collaboration.** PROTECTED collaboration tooling is more restricted than
  OFFICIAL: Sensitive tooling. Confirm the agency's approved tool list.

## Common pitfalls

- **Assuming "OFFICIAL: Sensitive" means low risk.** It does not. OFFICIAL: Sensitive
  systems holding personal information of large numbers of citizens carry significant
  risk under the Privacy Act and the NDB scheme even where the ISM bar is lower.
- **Mixing classifications in the same data store.** A system handling PROTECTED data
  must treat the entire store as PROTECTED, even where most rows are lower-classified.
- **Forgetting that aggregation can raise classification.** Two pieces of OFFICIAL data
  combined can become OFFICIAL: Sensitive or PROTECTED. PSPF Policy 8 covers aggregation.
- **Treating IRAP certification as a one-off.** Certification is at a point in time and
  for a specific configuration. Any material change re-engages assessment.

## Cross-references

- PSPF Policy 8 (sensitive and classified information): see
  [`skills/pspf/`](../pspf/) when that skill is published.
- ISM guideline on cryptography:
  [`guidelines/cryptography.md`](./guidelines/cryptography.md).
- ISM guideline on networking:
  [`guidelines/networking.md`](./guidelines/networking.md).

## Sources

- Attorney-General's Department, PSPF Policy 8 - Sensitive and classified information.
  <https://www.protectivesecurity.gov.au/publications-library/policy-8-sensitive-and-classified-information>
- ACSC, Information Security Manual.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism>
