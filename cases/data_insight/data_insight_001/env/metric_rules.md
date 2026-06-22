# Metric rules for the 2025 sales visual

Use actual net revenue, not gross revenue, units, order count, or forecast revenue.

Valid rows must meet all of these conditions:
- fiscal_year is 2025
- status is completed
- record_type is transaction

Net revenue is calculated as:

`net revenue = gross_revenue - discount - refund`

Exclude cancelled, returned, internal_test, forecast, subtotal, draft_summary, and old-year rows. Forecast and subtotal rows can remain visible in source files, but they are planning or rollup artifacts rather than completed order rows.

For regional reporting, do not use city names as regions. Map each city through `region_mapping.json` and aggregate by the mapped reporting region.
