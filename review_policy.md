# Case Review Policy

This policy defines when a new or revised case may enter the active benchmark.
Structural validity alone is not enough: the case must be solvable, grounded,
non-leaking, visually evaluable, and consistent with the current scoring model.

## Decisions

- `pass`: every required gate passes; the case may be promoted.
- `revise`: the case is recoverable but has at least one unresolved gate.
- `reject`: the case is unsolvable, materially incorrect, severely leaking, or
  cannot be evaluated reliably.

## Required Gates

| Gate | Pass condition |
| --- | --- |
| Structure | Required files exist, JSON parses, IDs agree, and every declared env file exists. |
| Solvability | All required answers are derivable under the declared web policy and cutoff rules. |
| Grounding | Expected facts trace to cited env evidence; calculations, joins, filtering, precedence, and exclusions are reproducible. |
| Leakage | `task.md` describes the operation and deliverable without revealing resolved answers. |
| Scoring | Checklist uses `image_vqa_0_2`, 0.8/0.2 weights, executable grounded VQAs, and one canonical visual VQA. |
| Asset hygiene | Agent-visible files are task-relevant, readable, legally usable, and free of review caches or answer-key artifacts. |
| Cross-file consistency | Task, metadata, facts, checklist, source files, dates, and negative requirements agree. |

A failure in solvability, grounding, leakage, or scoring prevents promotion.

## Dimension-Specific Review

| Dimension | Evidence the reviewer must reproduce |
| --- | --- |
| `data_insight` | Row eligibility, calculation basis, aggregation, ranking, and reported insight. |
| `data_selection` | Candidate eligibility, ordering, caps, tie-breaks, and final selected set. |
| `design_specification` | Freeze-time package, copy, platform, rights, and asset resolution. |
| `document_brief` | Authority order, document extraction, amendments, and required public content. |
| `multi_source_fusion` | Cross-file joins, common decision basis, routing, and final content/asset package. |
| `procedure_instruction` | Source precedence, ordered steps, quantities, safety gates, and excluded alternatives. |
| `relationship_diagram` | Entity set, edge semantics, scope/time resolution, and excluded or inactive links. |
| `state_change` | As-of state, supersession/fallback rules, previous-vs-current comparison, and stale-fact exclusion. |

## Evaluation Checklist

Grounded facts should use `evaluation_role` deliberately:

- `critical_required`: indispensable visible content.
- `major_required`: required but may allow a clear semantic equivalent.
- `optional`: absence does not reduce credit.
- `negative_only`: scored only when forbidden content appears.

Each grounded VQA must state a question, expected answer, and explicit `0/1/2`
acceptance rule. The single visual VQA must match the case's canonical image
type in `visual_vqa_catalog.md`; cases sharing an image type must reuse the same
visual question and criteria.

## Source and Artifact Hygiene

- Keep evaluation offline unless `web_policy` explicitly permits web use.
- Cache required external sources and record URL, retrieval date, license or
  usage note, and any conversion.
- Do not expose QA renders, screenshots, audit reports, answer sheets, or
  generated placeholder references to the tested agent.
- Use standalone images only when they are legitimate task assets with clear
  provenance; embed tone-only reference images inside their source document.
- Remove temporary build and review artifacts before promotion.

## Promotion Check

Run the repository validator from this repository:

```powershell
python ..\envgen-evaluation\scripts\validate_cases.py --case-root .\cases
```

Promote only after it reports zero issues and a reviewer has manually verified
the gates above. Generated audit reports and render caches must not be committed
to the case.
