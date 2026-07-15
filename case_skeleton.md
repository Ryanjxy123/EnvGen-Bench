# Case Skeleton

Every benchmark case uses the same outer contract.

```text
<case_id>/
├── env/
├── task.md
├── metadata.json
├── expected_facts.json
└── scoring_checklist.json
```

## Visibility

| Material | Tested agent | Evaluator |
| --- | ---: | ---: |
| `env/` | yes | yes |
| `task.md` | yes | yes |
| `metadata.json` | no | yes |
| `expected_facts.json` | no | yes |
| `scoring_checklist.json` | no | yes |
| QA renders and audit artifacts | no | temporary only |

## File Requirements

### `env/`

Contains only the files needed to solve the task. Use realistic formats and
enough controlled noise to require the target reasoning, but avoid redundant
files. Closed-env cases must cache every required source locally.

Externally sourced material must include provenance and usage information in
`metadata.json`. Review renders, answer sheets, debug files, and decorative
placeholder assets are not valid task inputs.

### `task.md`

States the user goal, output format, decision time or scope, required reasoning,
and forbidden content. It may identify sources and rules but must not reveal the
resolved answer.

### `metadata.json`

Defines at least:

- `case_id`, `task_type`, `web_policy`, `target_image_type`, and `difficulty`;
- every agent-visible env file and its role;
- source provenance when applicable;
- evaluator notes needed to interpret the case.

### `expected_facts.json`

Records reproducible ground truth. Each fact must identify its evidence and
importance, and should use one evaluation role:
`critical_required`, `major_required`, `optional`, or `negative_only`.
Calculated, selected, fused, diagrammed, or current-state facts must preserve
their derivation or resolution basis.

### `scoring_checklist.json`

Uses the current two-dimension image VQA contract:

```json
{
  "case_id": "example_001",
  "evaluation_mode": "image_vqa_0_2",
  "dimension_weights": {
    "grounded_requirement_satisfaction": 0.8,
    "visual_rendering_quality": 0.2
  },
  "grounded_requirement_satisfaction": {
    "vqa_items": [
      {
        "id": "grounded_q01",
        "question": "Case-specific grounded question.",
        "expected_answer": "Resolved answer.",
        "acceptance_rule": "Explicit criteria for scores 0, 1, and 2."
      }
    ]
  },
  "visual_rendering_quality": {
    "image_type": "promotional_poster",
    "vqa_items": [
      {
        "id": "visual_q01",
        "question": "Canonical type-specific visual question.",
        "score_criteria": {
          "0": "Broken, unreadable, or unusable.",
          "1": "Usable with visible revision needs.",
          "2": "Production-ready with every stated gate satisfied."
        }
      }
    ]
  }
}
```

Grounded contains one or more case-specific VQAs; visual contains exactly one
canonical type-specific VQA. Every item is scored `0/1/2`. A missing or invalid
`rendered_image.png` is a task-completion failure and receives total score 0.

## Naming and Placement

Use `<task_type>_<three-digit-id>` and place the case under the matching task
dimension, for example:

```text
cases/data_insight/data_insight_012/
```

Supported task dimensions are `data_insight`, `data_selection`,
`design_specification`, `document_brief`, `multi_source_fusion`,
`procedure_instruction`, `relationship_diagram`, and `state_change`.

## Promotion Checklist

1. Resolve the case independently from agent-visible files.
2. Confirm task, metadata, facts, and checklist agree.
3. Check required and forbidden content, source precedence, and cutoff logic.
4. Reuse the canonical visual VQA for the chosen image type.
5. Remove ZIP copies, review caches, and temporary artifacts.
6. Run the validator and apply `review_policy.md`.
