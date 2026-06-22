# Support metric rules

Use the June 2026 export to create a support-leadership view.

- Include only rows where `opened_date` is in June 2026.
- Include only `status=resolved`, `record_type=customer_ticket`, and `requester_type=external`.
- A ticket meets first-response SLA when `first_response_min` is less than or equal to the plan threshold in `plan_sla.json`.
- Queue speed should use median `handle_min` across valid tickets.
- Average handle time should use arithmetic mean `handle_min` across valid tickets.
- Round percentages to one decimal place when space allows.

Do not use export-wide row counts or operational planning rows as customer results.
