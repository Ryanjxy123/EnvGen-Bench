# Pilot Case Review

This file is for design-level review of the 8 pilot cases. It is different from
technical validation.

There are two review modes:

- Automated review: run `benchmark/scripts/auto_review_pilot_cases.py`.
- Human/design review: use this file to inspect and override the automated
  result when needed.

The automated review produces:

```text
benchmark/pilot_review_auto.json
benchmark/pilot_review_auto.md
```

Use automated review as the first-pass gate. Human review is most useful for
cases marked `revise`, `reject`, or `hold`, or for a sampled quality audit
before scaling to 200 cases.

Technical validation answers:

- Are required files present?
- Are JSON files valid?
- Do env files open and render?
- Do key expected facts match env data?

This review answers:

- Is the task logically solvable?
- Does the task evaluate the intended ability?
- Does the prompt avoid leaking the answer?
- Are the expected facts complete enough for scoring?
- Is the scoring checklist usable for image evaluation?
- Should this pilot be promoted, revised, or rejected?

## Review Outcomes

Use one of these outcomes for each case:

| Outcome | Meaning |
| --- | --- |
| `promote` | Case is strong enough to become part of the final benchmark after minor polish |
| `revise` | Case idea is useful, but env/task/facts/checklist need changes |
| `reject` | Case does not fit the benchmark or cannot be made reliable without major redesign |
| `hold` | Need user decision or additional evidence before judging |

## Automated Review Command

Run:

```powershell
D:\MiniConda\envs\genbench\python.exe benchmark\scripts\auto_review_pilot_cases.py
```

For new expansion work, prefer the generic script:

```powershell
D:\MiniConda\envs\genbench\python.exe benchmark\scripts\auto_review_cases.py --cases-root benchmark\pilot_cases
```

The script scores each case against 10 criteria:

- task matches intended dimension
- env sufficiency
- web policy correctness
- no answer leakage
- ground truth completeness
- scoring checklist usability
- difficulty appropriateness
- image target clarity
- failure mode coverage
- maintainer clarity

Each criterion is scored from 0 to 2, for a maximum of 20 points. The script
assigns `promote`, `revise`, or `reject` using the same threshold below.

Important limitation: automated review is heuristic. It can catch many
structure and logic risks, but it cannot fully judge whether a final generated
image is aesthetically good or whether every possible model failure mode is
covered.

## Strict Review Command

Run the stricter pilot gate:

```powershell
D:\MiniConda\envs\genbench\python.exe benchmark\scripts\strict_review_cases.py
```

Run the future full-benchmark gate:

```powershell
D:\MiniConda\envs\genbench\python.exe benchmark\scripts\strict_review_cases.py --mode full
```

For any custom case root, pass `--cases-root`:

```powershell
D:\MiniConda\envs\genbench\python.exe benchmark\scripts\strict_review_cases.py --cases-root benchmark\pilot_cases --mode full
```

The pilot mode reports missing embedded PDF images or standalone visual assets
as warnings. The full mode turns those realism gaps into score deductions for
task types where visual evidence is expected.

Outputs:

- Pilot mode: `benchmark/strict_review_auto.json` and
  `benchmark/strict_review_auto.md`
- Full mode: `benchmark/strict_review_full.json` and
  `benchmark/strict_review_full.md`

## Stricter Review Extensions

For scaling beyond the pilot set, use a stricter review pass in addition to the
current 20-point pilot review. The stricter pass should not only ask whether a
case is valid; it should ask whether the case can expose weak agents.

Recommended stricter checks:

- Distractor handling: env files contain plausible irrelevant or stale
  information, and expected facts mark what must be excluded.
- Evidence traceability: every critical expected fact has a clear source and,
  when needed, derivation notes.
- Operation coverage: the case requires the intended operation, such as
  filtering, calculation, summarization, relationship extraction, state update,
  or multi-source fusion.
- PDF complexity: sampled PDF cases include realistic layout elements such as
  tables, captions, callouts, logos, screenshots, diagrams, or appendix-style
  sections.
- Visual evidence: if an embedded image, diagram, or logo matters, the case has
  render-based validation and scoring notes, not text extraction only.
- Non-leakage: `task.md` should describe the goal without naming computed or
  selected answers unless the name is inherently part of the user request.
- Scoring map: high-point checklist items should map back to expected facts or
  explicit visual constraints.

Suggested stricter outcome rule for the full benchmark:

| Outcome | Suggested Rule |
| --- | --- |
| `promote` | Passes technical validation, automated review, and strict review with no critical issues |
| `revise` | Structurally valid but has weak distractors, unclear derivation, or underspecified scoring |
| `reject` | Cannot reliably test the intended ability or cannot be scored from available evidence |

## Global Pilot Review

Fill this section after reviewing all 8 cases.

| Question | Review Notes |
| --- | --- |
| Do the 8 pilots cover all task dimensions from `Constructing dependencies.md`? | TODO |
| Are file formats varied enough without making dependencies heavy? | TODO |
| Are Closed-Env, Web-Helpful, and Web-Required boundaries clear? | TODO |
| Are the tasks too easy, too artificial, or too similar to each other? | TODO |
| Are expected facts detailed enough to support image scoring? | TODO |
| Are scoring checklists concrete enough for human/model-assisted evaluation? | TODO |
| Should any schema fields be added before scaling to 200 cases? | TODO |
| Which pilots should become templates for bulk generation? | TODO |

## Per-Case Review Rubric

Score each item from 0 to 2:

```text
0 = fails or unclear
1 = partially works / needs revision
2 = works well
```

Recommended promotion threshold:

- `promote`: 16-20 total, no critical issue
- `revise`: 10-15 total, or one fixable critical issue
- `reject`: below 10, or task cannot be made grounded/evaluable

Critical issue examples:

- `task.md` leaks the answer directly.
- Required answer cannot be derived from env or allowed web use.
- Expected facts contradict env files.
- Scoring checklist cannot judge the generated image.
- Web policy conflicts with actual information needs.
- Image target is too vague to evaluate.

## Case 1: `data_selection_001`

Path: `benchmark/pilot_cases/data_selection_001/`

Task dimension: Data Selection-to-Image

Review table:

| Criterion | Score | Notes |
| --- | ---: | --- |
| Task matches intended dimension | TODO | Does it truly test structured-data filtering and ranking? |
| Env sufficiency | TODO | Are `products.csv` and `campaign_rules.json` enough to solve it? |
| No answer leakage in `task.md` | TODO | Does the user prompt avoid naming the selected products? |
| Ground truth completeness | TODO | Are selected and excluded products fully specified? |
| Scoring checklist usability | TODO | Can a reviewer judge the final poster using the checklist? |
| Difficulty appropriateness | TODO | Is it medium rather than trivial? |
| Image target clarity | TODO | Is "promotional poster" specific enough? |
| Format realism | TODO | Are CSV + JSON realistic for this task type? |
| Failure mode coverage | TODO | Does it catch wrong category, retired, low discount, and zero inventory? |
| Maintainer clarity | TODO | Would a future maintainer understand how the answer is derived? |

Outcome: TODO

Required revisions before promotion:

- TODO

## Case 2: `data_insight_001`

Path: `benchmark/pilot_cases/data_insight_001/`

Task dimension: Data Insight-to-Infographic

Review table:

| Criterion | Score | Notes |
| --- | ---: | --- |
| Task matches intended dimension | TODO | Does it require calculation rather than lookup? |
| Env sufficiency | TODO | Are workbook and mapping enough? |
| No answer leakage in `task.md` | TODO | Does the task avoid giving computed values? |
| Ground truth completeness | TODO | Are total, top month, growth quarter, and top categories specified? |
| Scoring checklist usability | TODO | Can a reviewer verify numbers and infographic structure? |
| Difficulty appropriateness | TODO | Are calculations nontrivial but not fragile? |
| Image target clarity | TODO | Is "annual sales infographic" specific enough? |
| Format realism | TODO | Is XLSX + JSON realistic? |
| Failure mode coverage | TODO | Would it catch raw-data dumping or wrong metric aggregation? |
| Maintainer clarity | TODO | Are calculation notes enough to audit the answer? |

Outcome: TODO

Required revisions before promotion:

- TODO

## Case 3: `document_brief_001`

Path: `benchmark/pilot_cases/document_brief_001/`

Task dimension: Document Brief-to-Image

Review table:

| Criterion | Score | Notes |
| --- | ---: | --- |
| Task matches intended dimension | TODO | Does it test extraction from document content? |
| Env sufficiency | TODO | Are `course_brief.pdf` and `instructor_bio.md` enough? |
| No answer leakage in `task.md` | TODO | Does prompt avoid listing exact title/schedule/highlights? |
| Ground truth completeness | TODO | Are title, instructor, schedule, audience, and highlights specified? |
| Scoring checklist usability | TODO | Can a reviewer judge poster content and unsupported claims? |
| Difficulty appropriateness | TODO | Is document extraction meaningful enough? |
| Image target clarity | TODO | Is "course poster" specific enough? |
| Format realism | TODO | Is PDF + MD realistic without extra document-render dependencies? |
| Failure mode coverage | TODO | Would it catch invented dates, instructor, or highlights? |
| Maintainer clarity | TODO | Are expected facts linked to their sources clearly? |

Outcome: TODO

Required revisions before promotion:

- TODO

## Case 4: `design_specification_001`

Path: `benchmark/pilot_cases/design_specification_001/`

Task dimension: Design Specification-to-Image

Review table:

| Criterion | Score | Notes |
| --- | ---: | --- |
| Task matches intended dimension | TODO | Does it test visual/brand constraint following? |
| Env sufficiency | TODO | Are PDF, JSON, and launch copy enough? |
| Web policy correctness | TODO | Is `web_helpful` truly optional rather than required? |
| No answer leakage in `task.md` | TODO | Does task avoid restating all constraints directly? |
| Ground truth completeness | TODO | Are required colors, copy, logo placement, and forbidden elements specified? |
| Scoring checklist usability | TODO | Can a reviewer judge visual constraint compliance? |
| Difficulty appropriateness | TODO | Is it more than a simple copy task? |
| Image target clarity | TODO | Is square launch social image clear enough? |
| Failure mode coverage | TODO | Would it catch prohibited red/cartoon/handwritten/wrong logo placement? |
| Maintainer clarity | TODO | Are PDF and JSON constraints consistent? |

Outcome: TODO

Required revisions before promotion:

- TODO

## Case 5: `procedure_instruction_001`

Path: `benchmark/pilot_cases/procedure_instruction_001/`

Task dimension: Procedure Document-to-Instructional Image

Review table:

| Criterion | Score | Notes |
| --- | ---: | --- |
| Task matches intended dimension | TODO | Does it test step extraction and ordering? |
| Env sufficiency | TODO | Are manual PDF and quick-start note enough? |
| No answer leakage in `task.md` | TODO | Does task avoid directly listing steps? |
| Ground truth completeness | TODO | Are ordered steps and excluded troubleshooting details specified? |
| Scoring checklist usability | TODO | Can a reviewer judge sequence correctness? |
| Difficulty appropriateness | TODO | Is there enough irrelevant/troubleshooting content to filter? |
| Image target clarity | TODO | Is onboarding instructional image clear enough? |
| Format realism | TODO | Is PDF + TXT realistic? |
| Failure mode coverage | TODO | Would it catch reset pin as a wrong main step? |
| Maintainer clarity | TODO | Are source precedence and step compression clear? |

Outcome: TODO

Required revisions before promotion:

- TODO

## Case 6: `relationship_diagram_001`

Path: `benchmark/pilot_cases/relationship_diagram_001/`

Task dimension: Relationship Extraction-to-Diagram

Review table:

| Criterion | Score | Notes |
| --- | ---: | --- |
| Task matches intended dimension | TODO | Does it test entity and relationship extraction? |
| Env sufficiency | TODO | Are prose notes and YAML dependency config enough? |
| No answer leakage in `task.md` | TODO | Does task avoid listing the full edge set? |
| Ground truth completeness | TODO | Are entities, directed edges, and exclusions specified? |
| Scoring checklist usability | TODO | Can a reviewer judge diagram edges and grouping? |
| Difficulty appropriateness | TODO | Is unrelated Recommendation Service a useful distractor? |
| Image target clarity | TODO | Is system architecture diagram clear enough? |
| Format realism | TODO | Is MD + YAML realistic? |
| Failure mode coverage | TODO | Would it catch invented services or wrong checkout path? |
| Maintainer clarity | TODO | Are edge directions and relation types clear? |

Outcome: TODO

Required revisions before promotion:

- TODO

## Case 7: `state_change_001`

Path: `benchmark/pilot_cases/state_change_001/`

Task dimension: State / Change Reasoning-to-Image

Review table:

| Criterion | Score | Notes |
| --- | ---: | --- |
| Task matches intended dimension | TODO | Does it test latest-state reasoning? |
| Env sufficiency | TODO | Are old announcement, changelog, and status table enough? |
| No answer leakage in `task.md` | TODO | Does task avoid giving the latest values directly? |
| Ground truth completeness | TODO | Are latest and stale values specified? |
| Scoring checklist usability | TODO | Can a reviewer detect stale information in the poster? |
| Difficulty appropriateness | TODO | Are conflicts meaningful but resolvable? |
| Image target clarity | TODO | Is current event poster clear enough? |
| Format realism | TODO | Is MD + CSV realistic? |
| Failure mode coverage | TODO | Would it catch old date/location/sponsor/theme usage? |
| Maintainer clarity | TODO | Are source precedence rules clear enough? |

Outcome: TODO

Required revisions before promotion:

- TODO

## Case 8: `multi_source_fusion_001`

Path: `benchmark/pilot_cases/multi_source_fusion_001/`

Task dimension: Multi-source Fusion-to-Image

Review table:

| Criterion | Score | Notes |
| --- | ---: | --- |
| Task matches intended dimension | TODO | Does it require combining multiple source types? |
| Env sufficiency | TODO | Are sales, product docs, brand guide, audience, and config enough for env-grounded facts? |
| Web policy correctness | TODO | Is web truly required only for current Instagram size/aspect guidance? |
| No answer leakage in `task.md` | TODO | Does task avoid naming the winning product directly? |
| Ground truth completeness | TODO | Are winner, selling points, brand, audience, and web fact specified? |
| Scoring checklist usability | TODO | Can a reviewer judge fusion and web-use boundaries? |
| Difficulty appropriateness | TODO | Is it hard but still solvable? |
| Image target clarity | TODO | Is social media campaign image clear enough? |
| Failure mode coverage | TODO | Would it catch promoting the wrong product or overusing web facts? |
| Maintainer clarity | TODO | Are env facts and web-required fact clearly separated? |

Outcome: TODO

Required revisions before promotion:

- TODO

## Review Summary

Fill this after reviewing the cases.

| Case ID | Total Score | Outcome | Main Action |
| --- | ---: | --- | --- |
| `data_selection_001` | TODO | TODO | TODO |
| `data_insight_001` | TODO | TODO | TODO |
| `document_brief_001` | TODO | TODO | TODO |
| `design_specification_001` | TODO | TODO | TODO |
| `procedure_instruction_001` | TODO | TODO | TODO |
| `relationship_diagram_001` | TODO | TODO | TODO |
| `state_change_001` | TODO | TODO | TODO |
| `multi_source_fusion_001` | TODO | TODO | TODO |

## Decisions Before Scaling

Use this section to record decisions before generating the full 200-case set.

- TODO: Which pilots become task templates?
- TODO: Which task types need richer distractors?
- TODO: Which task types need more realistic external/public-source env files?
- TODO: Should `web_required` cases store expected web citations or only expected web facts?
- TODO: Should the scoring checklist add per-item severity labels?
- TODO: Should we create task-specific expected-facts schemas before scaling?
