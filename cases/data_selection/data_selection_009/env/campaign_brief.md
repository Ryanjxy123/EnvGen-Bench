# Library Resource Recommendation Spotlight Rules

Use the source data and rule file only.
When mappings or support tables are present, resolve display labels before finalizing the image; do not show raw code values as the primary labels.
Filter candidates before ranking. Exclude invalid status/window rows, threshold failures, internal/test/draft/archived/cancelled records, and any row blocked by optional selection limits.
After sorting, select the first 5 candidates while allowing at most 1 per category_label.
Do not show filtered-out or below-cutoff candidates as final featured selections.
