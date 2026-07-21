# Paid-media publication handoff rules

The activation result is an approved creative input, not the final publishable ad.

## Cutoff and matching

- Publication cutoff: 23 June 2026 at 18:10 UTC.
- Launch day: 24 June 2026.
- Resolve `Paid_Media_Publishing_Register.xlsx` after the original activation workflow.
- A publication package must match ACT-117, MSG-063, SPRINT-JUNE-2026, PRF-044, GLOBAL-EN, LINKEDIN-SPONSORED-SINGLE and en-GB.
- Its effective window must include launch day.
- In Publication Status, use the latest event at or before the cutoff. When timestamps tie, the larger revision_no controls.
- The controlling package must resolve to Released.

## Publication precedence

The released publication package supersedes the activation's audience, offer, evidence, release time, proof claim, CTA, destination and qualifier. The product name, headline and supporting sentence remain from approved base copy.

Resolve every referenced overlay, manifest, legal pack and output specification using exact ID, market, placement, language, status and valid dates.

## Candidate asset pack

- Use the package's candidate_set_id.
- Rank its candidate packs by ascending priority_number.
- For each pack, resolve Delivery QA and Legal Clearance at or before the publication cutoff; same-timestamp higher revision_no controls.
- Select the first pack whose controlling QA state is Passed and whose controlling legal state is Cleared for the exact market, placement and language.
- A lower-priority passing pack cannot replace an earlier passing pack.
- A pack that visually resembles the target but fails safe-zone or text-integrity QA is not publishable.

Assets AST-291 through AST-294 are governed by Publishing_Asset_Addendum.xlsx. Existing bundle assets remain governed by Creative_Asset_Register.xlsx. Every selected asset must be approved, allowed for the placement, covered by paid-social rights on launch day and released before the cutoff.

## Final output

Use the selected output specification. The final ad remains concise: one product identity, one headline/support pair, one audience, one offer, one evidence line, one release line, one proof chip, one CTA and destination, one qualifier, one product-board hero and one separate FlowForge signature.

Do not display production IDs, package history, QA reasons, legal states, internal field names or rejected alternatives.
