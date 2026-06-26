# Data Selection Case Quality Audit: data_selection_002

- Final quality level: `revise`
- Final quality score: `69`
- Static audit score: `69`
- Agentic audit score: `None`
- Case strength score: `None`
- Recommendation: revise before admission

## Strengths
- structured row count is sufficient for selection
- uses multiple env formats or multi-table structure
- broad negative/unselected coverage
- critical facts encode ranking/quota/threshold reasoning

## Issues
- distractor ratio below 30%
- fewer than five critical facts
- few structured distractor rows detected
- negative facts have too few forbidden_patterns
- Critical facts not bound by grounded checklist items: ['ranking_order', 'selected_grant_display_values', 'selected_grants', 'unselected_grants_not_featured']
- Negative facts are not sufficiently covered by grounded items or score caps
- fewer than 5 critical facts

## Recommended Fixes
- Add explicit filtering, ranking, group-limit/tie-break, display-value, and negative-exclusion signals.
- Add more tempting answer-changing distractors.
- Bind distractors to negative facts with forbidden_patterns and score caps.
- Bind every critical_required fact to grounded checklist items.
- Clarify evaluator-only calculation_notes so expected facts can be recomputed from env files.

## Strong-level Gate Review
- Case construction strength: `not_run`
- Data scale: `rows=not_run; distractor_ratio=not_run`
- Are distractors answer-changing? `False`
- Why this case is not strong: fewer than 5 critical facts
