# Guidelines for Media

This guideline covers physical and removable media: USB drives, optical media, tape,
internal drives that are removed for handling separately.

## In plain English

Removable media is a side channel. Track it. Encrypt it. Sanitise it before reuse. Destroy
it before disposal.

## Key topics

- Removable media policy.
- Encryption of removable media.
- Sanitisation procedures by media type (magnetic, solid-state, optical).
- Reclassification when reusing media across classifications (typically downgrade only
  under specific conditions).
- Destruction at end of life.

## Where to look

- Media register.
- Endpoint policies controlling USB ports (block-by-default with exceptions).
- DLP policies for media write operations.
- Destruction service contracts.

## Common evidence

- Media register entries.
- Endpoint policy export blocking writes to removable media for users without
  authorisation.
- Sanitisation tooling and operator training records.
- Destruction certificates.

## Common pitfalls

- USB ports left open by default.
- Encrypted drives with key custody held by the same engineer who issued the drive (no
  separation).
- Sanitisation procedure not appropriate to the media type (a degausser does not work on
  solid-state media).
- Recycling old SSDs without cryptographic erase confirmation.

## Cross-references

- Guidelines for ICT Equipment.
- Guidelines for Physical Security.

## Sources

- ACSC, ISM Guidelines for Media.
  <https://www.cyber.gov.au/resources-business-and-government/essential-cybersecurity/ism/cyber-security-guidelines/guidelines-media>
