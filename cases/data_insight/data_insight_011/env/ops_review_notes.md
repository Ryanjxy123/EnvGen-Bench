# Q4 2026 Store Operations Triage Notes

Leadership needs a short decision snapshot, not a data-audit page. The review quarter is October through December 2026, compared with July through September 2026. Resolve all source state as of **8 January 2027 at 5:00 PM**.

## 1. Resolve the controlling monthly close

The database contains several packages for each month.

1. In `close_package_log`, resolve each `package_id` using the latest permitted `recorded_at`; when timestamps tie, the larger `revision_no` controls.
2. Ignore package events after the review cutoff.
3. For each month, use the highest `package_version` whose resolved state is `signed_off` and whose `feed_type` is `monthly_store_close`.
4. Planning refreshes, district rollup copies, QA rebuilds, cutover archives, reopened packages, working restatements, and post-cutoff sign-offs are not final store performance.

Join the selected package rows across sales, returns, and staffing by store and month.

## 2. Resolve store scope, benchmarks, policy, and adjustments

For `store_scope_log`, `format_benchmarks`, `triage_policy_log`, and `metric_adjustment_log`, use the latest row at or before the cutoff; when timestamps tie, use the larger `revision_no`.

- Store and benchmark rows must be approved.
- Apply only adjustments whose controlling status is `approved`.
- A Q4-active store must meet the controlling policy's Q4 operating-day minimum.
- A comparable store must also meet both quarter-day minimums and have `comparable_flag = Y`.

The company Q4 headline includes all Q4-active stores. Quarter lift and every store/region ranking use only the comparable cohort.

## 3. Metric definitions

- **Adjusted net sales** = gross sales − return value + approved return-exclusion value.
- **Comparable quarter lift** = comparable Q4 adjusted net sales versus comparable Q3 adjusted net sales.
- **Labor productivity** = adjusted net sales ÷ labor hours.
- **Adjusted return rate** = (return value − approved return-exclusion value) ÷ gross sales.
- **Adjusted staffing coverage** = (covered hours + approved coverage-credit hours) ÷ scheduled hours.
- Regional staffing coverage is schedule-weighted, not a simple average.

## 4. Upside opportunity

Use the controlling policy. A scalable upside candidate must:

- be comparable;
- meet the minimum Q4 adjusted net-sales scale;
- meet the minimum Q4-over-Q3 growth;
- exceed its current format productivity benchmark by the required percentage;
- remain at or below the format return-rate ceiling;
- meet the staffing-coverage floor.

Rank qualified candidates by Q4 adjusted net sales, then productivity gap, then quarter lift. The raw growth leader is a separate signal and may fail the opportunity gate.

## 5. Intervention priority

For each comparable store, count these policy breaches:

- adjusted return rate is more than the permitted percentage-point margin above the format ceiling;
- adjusted staffing coverage is below the policy floor;
- comparable quarter lift is below the policy growth floor.

A store becomes a risk candidate only after reaching the minimum breach count. Rank risk candidates by breach count, then by the combined severity of the three breaches, then by Q4 adjusted net sales.

## 6. Required leadership story

The final image should make these decisions easy to verify without showing SQL or a raw database dump:

- company Q4 adjusted net sales and comparable lift;
- the single scalable upside location and the metrics that qualify it;
- the single intervention location and the metrics that trigger it;
- the comparable regional net-sales leader;
- the raw store growth leader and any failed opportunity gate;
- the schedule-weighted staffing-watch region;
- one concise action takeaway;
- a compact scope note naming active-store count, comparable-store count, certified-close basis, and approved-adjustment basis.
