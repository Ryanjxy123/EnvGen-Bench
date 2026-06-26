# Data Selection Case Quality Audit: data_selection_005

- Final quality level: `revise`
- Final quality score: `68`
- Static audit score: `68`
- Agentic audit score: `None`
- Case strength score: `None`
- Recommendation: revise before admission

## Strengths
- high distractor ratio
- uses multiple env formats or multi-table structure
- broad negative/unselected coverage
- all selection operation families detected

## Issues
- too few structured rows
- fewer than five critical facts
- too few selection-complexity critical facts
- negative facts have too few forbidden_patterns
- Critical facts not bound by grounded checklist items: ['unselected_opportunities_not_featured']
- Negative facts are not sufficiently covered by grounded items or score caps
- fewer than 3 ranking/quota/threshold critical facts
- fewer than 5 critical facts

## Recommended Fixes
- Make critical facts depend on thresholds, ranking, tie-breaks, group caps, or below-cutoff exclusions.
- Bind distractors to negative facts with forbidden_patterns and score caps.
- Bind every critical_required fact to grounded checklist items.
- Clarify evaluator-only calculation_notes so expected facts can be recomputed from env files.

## Strong-level Gate Review
- Case construction strength: `not_run`
- Data scale: `rows=not_run; distractor_ratio=not_run`
- Are distractors answer-changing? `True`
- Why this case is not strong: fewer than 3 ranking/quota/threshold critical facts, fewer than 5 critical facts
