# October 2026 campus energy review protocol

Use only the closed-env files in this packet. The register is intentionally interleaved and includes corrected versions, estimates, pending records, reference entries, retired meters, and out-of-scope facilities.

## Eligibility and joins

1. Analyze `OCT-2026`; use `BASELINE-2026` only for the comparison benchmark.
2. A register row is eligible only when it is an `interval_meter` reading, its ledger state is `posted`, its quality status is `approved`, and its role is `operational`.
3. For the same meter and period, retain the eligible row with the greatest `revision_no`; earlier eligible revisions are superseded.
4. The meter must have an `active` registry mapping covering the period date, and the mapped facility must have an `active` profile with `include_in_review = 1`.
5. The meter must have an `approved` calibration record covering the period date and belonging to the FY2026-R2 family. Draft, expired, future, or otherwise non-matching calibration rows are not valid.

## Calculations

- Convert each retained raw energy and demand reading using the applicable meter multiplier.
- When a facility has more than one active meter, add its adjusted meter values for each week before calculating facility totals or facility demand.
- October facility use is the sum of its five retained weekly adjusted energy values. Campus October use is the sum across included facilities.
- The peak campus period is the October week with the greatest campus adjusted energy. Report its share of the October total.
- For baseline movement, compare each facility's average retained October week with its average retained baseline week. Report the sharpest increase and the largest decrease.
- Normalized intensity is October adjusted energy per 1,000 occupied square feet and is calculated only for facilities with `intensity_eligible = 1`.
- A facility is on demand watch when its maximum weekly adjusted facility demand is above the active threshold matching both its load class and campus area. Report adjusted demand, threshold, and percentage above threshold.

## Audit scope

The review coverage is the number of included facilities and contributing meters after all rules are applied. The rejected October candidate count is the number of OCT-2026 register rows not retained because they fail eligibility, are superseded, lack an active mapping or valid calibration, or map to an out-of-scope facility.

Round displayed kWh to whole numbers. Show demand, intensity, shares, and percentage changes to one decimal.
