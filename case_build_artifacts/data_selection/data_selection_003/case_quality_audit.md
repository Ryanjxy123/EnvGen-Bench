# Data Selection Case Quality Audit: data_selection_003

- Final quality level: `reject`
- Final quality score: `49`
- Static audit score: `58`
- Agentic audit score: `None`
- Case strength score: `None`
- Recommendation: revise before admission

## Strengths
- structured row count is sufficient for selection
- high distractor ratio
- uses multiple env formats or multi-table structure
- at least five critical facts
- broad negative/unselected coverage
- all selection operation families detected

## Issues
- too few selection-complexity critical facts
- direct_value_leak in task.md: nut-free quick lunch specials
- direct_value_leak in task.md: Nut-free quick lunch specials
- negative facts have too few forbidden_patterns
- Critical facts not bound by grounded checklist items: ['unselected_items_not_featured']
- Negative facts are not sufficiently covered by grounded items or score caps
- Severe issue blocks acceptance.

## Recommended Fixes
- Remove final selected objects, rankings, and answer artifacts from task.md, metadata notes, and env file names.
- Make critical facts depend on thresholds, ranking, tie-breaks, group caps, or below-cutoff exclusions.
- Bind distractors to negative facts with forbidden_patterns and score caps.
- Bind every critical_required fact to grounded checklist items.
- Clarify evaluator-only calculation_notes so expected facts can be recomputed from env files.

## Strong-level Gate Review
- Case construction strength: `not_run`
- Data scale: `rows=not_run; distractor_ratio=not_run`
- Are distractors answer-changing? `True`
- Why this case is not strong: Severe issue blocks acceptance.
