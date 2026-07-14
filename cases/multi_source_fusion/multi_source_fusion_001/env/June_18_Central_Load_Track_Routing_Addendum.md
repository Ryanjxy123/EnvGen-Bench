# June 18 Central Load-Track Routing Addendum

**Effective:** 2026-06-18 00:00 local campaign time  
**Scope:** Apply only after the selected product is HelioGrid Flex and its leading reporting region is Central.  
**Authority:** This addendum narrows the current Central C-C2 placement. It overrides the base C-C2 campaign label, badge, lead/proof copy, CTA, qualification, and disclosure package only after the winning load track and utility program are calculated.

## Routing calculation

Join `Central_Load_Track_Eligibility.csv` to already eligible **Central HelioGrid Flex** orders by `order_id`.

1. Keep only the highest `profile_version` for each `profile_id`.
2. Require `validation_status = Verified`, `enrollment_status = Enrolled`, and `territory_status = Participating`.
3. Require `posted_date` on or before **2026-06-13**.
4. Require `effective_from` on or before 2026-06-18 and `effective_to` blank or on/after 2026-06-18.
5. Exclude duplicate, research-only, pending, scheduled, future-effective, and late routing rows.
6. Sum the already calculated line-level **program-eligible net contribution** by `load_track` without recalculating revenue, credits, or funding.
7. Select the highest-contribution load track. Within that winning track, select the highest-contribution `utility_program`.
8. Do not combine EV and heat-pump tracks in the customer-facing audience. Do not list a non-winning utility program as an alternative.

## Current copy rows

Use exactly one row after the two-stage routing decision.

### EV_CHARGER + LoneStar FlexCharge — current row `EV-LS-R1`
- Placement key: `IG-PF-C-CONVERT-EV-LS`
- Rollout wave: `C-C2-EV-LS`
- Campaign label: **Central EV Solar Conversion Pilot**
- Leadership badge: **May 2026 Central EV-Track Program-Eligible Net-Contribution Leader**
- Lead benefit: **Coordinate rooftop solar with qualifying Level 2 charging during participating utility event windows, with normal charging schedules outside events.**
- Proof 1: **Installer-set EV charging profiles align rooftop-solar input with a compatible Level 2 charger.**
- Proof 2: **App event status shows when charging timing is active and when the normal charging schedule resumes.**
- CTA: **Check LoneStar EV-flex eligibility**
- Qualification: **For owner-occupied Central rooftop-solar homes in participating LoneStar FlexCharge territories, with a compatible inverter pathway and a verified qualifying Level 2 EV charger.**
- Disclosure A: **Energy-cost and charging outcomes are not guaranteed.**
- Disclosure B: **Outcomes vary with solar production, vehicle charging demand, utility event frequency, and installer settings.**
- Disclosure C: **Availability is limited to eligible LoneStar FlexCharge territories in TX; availability may differ within the state.**
- Disclosure D: **Utility enrollment, an installer site review, and compatible-charger verification are required before activation.**
- Disclosure E: **Charging timing may change during utility event windows.**
- Disclosure F: **Customers can override an event; overriding may reduce program benefits.**

### EV_CHARGER + Heartland EV Shift — alternate current row `EV-HL-R1`
- Campaign label: **Heartland EV Solar Conversion Pilot**
- CTA: **Check Heartland EV-shift eligibility**
- Territory wording: eligible participating territories in IL and WI; availability may differ within either state.
- Use EV-specific benefit, proof, qualification, and disclosures with the Heartland program name.

### HEAT_PUMP + LoneStar HeatFlex — alternate current row `HP-LS-R1`
- Campaign label: **Central Heat-Pump Solar Conversion Pilot**
- CTA: **Check LoneStar heat-flex eligibility**
- Replace charging language with qualifying heat-pump operation and heat-pump schedules.
- Territory wording: eligible LoneStar HeatFlex territories in TX; availability may differ within the state.

### HEAT_PUMP + NorthLake HeatFlex or Heartland HeatFlex — alternate current rows
- Use the matching utility-program name and state scope.
- Replace EV charging language with qualifying heat-pump language.

## Exclusions

The base generic C-C2 row is superseded for this routed creative. Do not use an `EV charger or heat pump` alternative, a combined flexible-load audience, a generic Central conversion-pilot CTA, or all-state IL/MN/TX/WI disclosure after a single winning track and utility program have been selected. Do not expose track totals, program totals, margins, profile IDs, placement keys, rollout codes, or routing fields in the image.
