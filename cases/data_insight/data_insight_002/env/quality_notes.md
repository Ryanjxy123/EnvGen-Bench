# Weekly warehouse quality review guidance

The operations review can authorize one new intervention and one additional watchlist placement.

## Close and record selection

A week is complete only when every fulfillment area whose effective profile status is `Active` has at least one `Fulfillment` record that is both `Closed` and `Approved`. A later partial week does not move the cutoff.

For each active area and week, select the highest revision that is simultaneously:

- `record_scope = Fulfillment`
- `workflow_state = Closed`
- `approval_state = Approved`

An earlier approved revision is superseded by a later approved revision. A later `Pending`, `Rejected`, `Reopened` or draft revision does not supersede the selected approved close. Internal Transfer, Recovery Run and QA Validation rows are reconciliation activity only.

## Effective-dated profiles and units

Join the profile row whose effective interval contains the week end. The profile controls the area name, warehouse zone, reporting unit, standard-unit conversion, weekly scale exposure, criticality and gap control limit.

Convert shipped and accepted quantities to standard units before aggregation. Gap volume is shipped standard units minus accepted standard units. Gap rate is gap volume divided by shipped standard units. Gap-rate change is review gap rate minus baseline gap rate and must be stated in percentage points.

A repeat breach week is a selected review week whose area gap rate is strictly above the effective profile control limit.

## Incident validity and severity

A valid review incident must satisfy all of these conditions:

- ticket type is `Quality Defect` or `Rework`;
- status is `Confirmed` or `Closed`;
- environment is `Production`;
- `duplicate_of` is blank;
- opened date falls inside the review window.

Severity points are Minor = 1, Major = 2 and Critical = 4. Severity-weighted incident rate equals valid severity points divided by the sum of effective weekly scale units across the review window, multiplied by 1,000.

## Priority method

Across active areas, min-max normalize these five measures:

- review gap rate: 30%;
- gap-rate worsening: 20%;
- severity-weighted incident rate: 20%;
- average review-window criticality: 15%;
- repeat-breach share: 15%.

Priority score is the weighted normalized total multiplied by 100. Use the score rounded to one decimal for ranking. If rounded scores tie, sort by review gap volume, then average review criticality, then area name. For a reported score margin, subtract the unrounded priority scores first, then round the resulting margin to one decimal.

High priority is 75.0 or above. Watch band is 55.0 through 74.9.

## Action coverage

An area is currently covered only when an intervention is Approved, has status Active or Monitoring, was approved and started no later than the cutoff week, and is not closed by the cutoff. Pending, proposed, requested, paused, revoked, scheduled-future, already-closed or post-cutoff actions do not block the new intervention slot.

Select the highest-scoring uncovered area for the new intervention. The next highest-scoring uncovered area is the watchlist choice.

## Packet use

`ops_packet_extract.csv` contains meeting material assembled at different times. It includes early score cuts, old profile mappings, unfiltered ticket counts, planning scenarios and draft action wording. It may explain discussion history, but it must not be used as the final scorecard source.
