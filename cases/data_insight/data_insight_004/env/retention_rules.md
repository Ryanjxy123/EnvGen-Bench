# August onboarding cohort rules

The cohort is customer accounts with `signup_date` from 2026-08-01 through
2026-08-07, inclusive.

Activation requires both events below within seven days after signup:

- `workspace_created`
- `first_report_published`

Week-4 retention requires at least one active event from day 22 through day 28
after signup, inclusive. Active events are:

- `dashboard_view`
- `report_export`
- `automation_run`
- `integration_sync`

Automation adoption among retained accounts counts retained cohort accounts
with at least one `automation_run` inside that account's week-4 window.

Use plan labels from `accounts.json` for segment names. Round percentages to
one decimal place when space allows.
