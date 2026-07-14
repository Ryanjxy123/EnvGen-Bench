# Close Feed Glossary

`monthly_store_close` is the store-level close stream that remains in the books after store operations finishes the monthly close process.

`planning_refresh` is a manager planning view that may still change before close.

`district_rollup_copy` is a district-level subtotal or reconciliation copy. It is useful when checking totals, but it is not a single-store final line.

`qa_rebuild` is a quality-control rebuild from the data pipeline.

`cutover_archive` is an older pipeline pull kept for transition checks.

`posting_state` describes where a line was in the close process. `signed_off` means operations has stopped editing that month. Other states are working, rollup, sandbox, or archive views.

`lifecycle` describes whether a location is in the current operating rotation. A `seasonal_pause` location can still have historical rows, but it is not part of the current operating set that leadership is triaging.
