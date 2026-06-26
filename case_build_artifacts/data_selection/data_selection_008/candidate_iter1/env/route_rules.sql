# Mobile Clinic Route Poster Rules

Use the source data and rule file only.
Filter candidates before ranking. Exclude invalid status/window rows, threshold failures, internal/test/draft/archived/cancelled records, and any row blocked by optional selection limits.
After sorting, select the first 4 candidates while allowing at most 1 per district.
Do not show filtered-out or below-cutoff candidates as final featured selections.

-- SQL-style reminder:
-- FROM clinic_sites
-- WHERE eligibility filters pass
-- ORDER BY the ranking fields in route_rules.json
-- APPLY any district/group cap before taking final top N
