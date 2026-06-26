# Data Insight Case Quality Audit: data_insight_009

- Final quality level: `strong`
- Final quality score: `100`
- Static audit score: `100`
- Agentic audit score: `100`
- Case strength score: `100`
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
- 未发现硬性问题。

## 最小修改建议
- 暂无必须修改项。

## Strong-level Gate Review
- Case construction strength: `strong`
- Cross-file rule support: `['env/resilience_rules.json', 'env/resilience_notes.md']`
- Data scale: `rows=100; valid=70`
- Are distractors answer-changing? `True`
- Is the task too direct? `too_easy_risk=low`
- Why this case is / is not strong: strong-level blockers are clear.
