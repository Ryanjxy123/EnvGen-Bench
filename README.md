# EnvGen-Bench

EnvGen-Bench evaluates whether an image-generation agent can read a task-local
environment, resolve the required facts and constraints, and produce one
grounded final image. It tests environment reasoning rather than generic prompt
following.

## Active Dataset

The repository currently contains **22 optimized cases** across eight task
dimensions. Only case directories listed below are active; deleted cases and
the former ZIP copies are not part of the dataset.

| Task dimension | Cases |
| --- | ---: |
| `data_insight` | 4 |
| `data_selection` | 4 |
| `design_specification` | 4 |
| `document_brief` | 2 |
| `multi_source_fusion` | 2 |
| `procedure_instruction` | 2 |
| `relationship_diagram` | 2 |
| `state_change` | 2 |
| **Total** | **22** |

All current cases use `closed_env`: every fact required to solve a task is
available in its `env/` directory. See [`cases/README.md`](cases/README.md) for
the complete case index.

## Case Contract

```text
cases/<task_type>/<case_id>/
├── env/                    # visible to the tested agent
├── task.md                 # visible to the tested agent
├── metadata.json           # evaluator-only
├── expected_facts.json     # evaluator-only
└── scoring_checklist.json  # evaluator-only
```

Review caches and evaluator artifacts must not be copied into an agent
workspace. A valid run returns only `rendered_image.png`.

## Evaluation

Every case uses `image_vqa_0_2`:

- Task completion is a gate: a missing or invalid PNG receives total score 0.
- Grounded Requirement Satisfaction is weighted 80% and uses case-specific
  VQAs scored `0/1/2`.
- Visual Rendering Quality is weighted 20% and uses exactly one canonical VQA
  for the case's image type, also scored `0/1/2`.
- Visual polish cannot compensate for missing or incorrect grounded content.

The evaluation runtime lives in the sibling `envgen-evaluation/` repository.
From this repository, validate the complete active set with:

```powershell
python ..\envgen-evaluation\scripts\validate_cases.py --case-root .\cases
```

To validate a subset:

```powershell
python ..\envgen-evaluation\scripts\validate_cases.py `
  --case-root .\cases `
  --dimension data_insight `
  --cases data_insight_001,data_insight_002
```

## Authoring References

- [`benchmark_blueprint.md`](benchmark_blueprint.md): current scope, task
  dimensions, and benchmark design.
- [`case_skeleton.md`](case_skeleton.md): required case structure and scoring
  contract.
- [`review_policy.md`](review_policy.md): promotion gates for new or revised
  cases.
- [`scoring_templates.md`](scoring_templates.md): checklist format and visual
  VQA reuse rules.
- [`visual_vqa_catalog.md`](visual_vqa_catalog.md): canonical visual VQAs by
  image type.
