# Data Insight Case Quality Audit: data_insight_005

- Final quality level: `pass`
- Final quality score: `84`
- Static audit score: `100`
- Agentic audit score: `None`
- Case strength score: `None`
- Recommendation: 入库/继续使用

## 主要优点
- valid rows >= 20
- distractor ratio >= 15%
- at least two env files
- at least four critical facts
- at least two calculated critical facts
- four or more data-insight operation families
- contains normalization/rate/median/threshold/tie signal

## 主要问题
- Strong is capped at pass until --strength case_strength_review runs.

## 最小修改建议
- 暂无必须修改项。

## Strong-level Gate Review
- Case construction strength: `not_run`
- Cross-file rule support: `not_run`
- Data scale: `rows=not_run; valid=not_run`
- Are distractors answer-changing? `True`
- Is the task too direct? `too_easy_risk=not_run`
- Why this case is not strong: Strong is capped at pass until --strength case_strength_review runs.
