# June 18 Campaign Change Control

**Effective:** 2026-06-18 00:00 local campaign time  
**Authority:** This note overrides earlier request language only for the fields listed below. All other requirements in the campaign request remain active.

## Controlling updates

1. The product-ranking metric is **Program-Eligible Net Contribution**, not net revenue. Begin with campaign-addressable net revenue after all order, customer, service-area, SKU-scope, discount, and Accepted-credit rules.
2. Apply `Program Funding` only after line eligibility and net revenue are established:
   - keep only the highest `entry_version` for each `funding_id`;
   - require `decision_status = Approved`;
   - require `posted_date` on or before **2026-06-12**;
   - require `effective_from` on or before 2026-06-18 and `effective_to` blank or on/after 2026-06-18;
   - require the funding row `objective_code` to equal the product's `SKU Master.program_code`;
   - join `Funding Type Map`, add rows mapped to `Add`, subtract rows mapped to `Subtract`, and ignore rows mapped to `Ignore` or `badge_eligible = No`.
3. Rank products by the resulting contribution. Net revenue alone, total funding, gross revenue, and unit count are reference metrics only.
4. For the selected product only, rank reporting regions by the same contribution metric. Do not use all-product regional totals or funding-agnostic totals.
5. Build the placement key as `IG-PF-{region_code}-{program_code}` using `Region Codes` and the selected product's `SKU Master.program_code`. Do not use a generic `VERIFY` key when a program-specific key exists.
6. Use claim revision **R5** for a `CONVERT` result on June 18. R4 is superseded; R6 is future-effective. A current-looking row for another region, objective, platform, or rollout wave is not valid.
7. The current placement row controls the campaign label, CTA, badge template, qualification ID, and complete disclosure-ID set. The claims register supplies the customer-facing wording for those IDs.
8. The image must contain one lead benefit and exactly two audience-priority proof points. Do not add a third co-equal product claim.
9. Required qualification and disclosure copy must appear inside the image. A caption, file name, alt text, analyst note, or accompanying explanation does not satisfy this requirement.
10. Concise customer-facing semantic equivalents are valid when every material condition remains explicit. Exact sentence reproduction is not required, but the qualification must retain every cohort condition and the four disclosures must remain separately identifiable; a generic summary such as “terms apply” is not equivalent.
11. The approved placement badge is customer-facing copy. Its required metric label, including **Program-Eligible Net-Contribution Leader**, is permitted. The prohibition on internal analysis applies to numeric revenue/contribution/funding amounts, calculations, workbook fields, codes, IDs, and other internal values—not to the approved badge metric label by itself.

## Central Flex routing refinement

10. If the calculated result is HelioGrid Flex in Central, apply `June_18_Central_Load_Track_Routing_Addendum.md` after product and region ranking. Calculate the winning load track and then the winning utility program from `Central_Load_Track_Eligibility.csv`. The selected addendum row overrides the generic C-C2 label, badge, lead/proof package, CTA, qualification, and disclosures.
11. A generic `EV charger or heat pump` audience, combined flexible-load copy, or all-Central-state disclosure is not current after a single winning track and utility program are resolved.

## Conflict order

For conflicts, apply this order: this change-control note -> Central load-track routing addendum when applicable -> current placement row -> claims register -> audience readout -> original request. Asset validity is governed by the asset register and campaign date.
