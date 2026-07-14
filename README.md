# Environment-Grounded Image Generation Benchmark

This benchmark evaluates whether an agent can use environment files to produce
a grounded image plan and final image. The core capability under test is
retrieving, filtering, calculating, combining, and verifying information before
image generation—not generic image prompting.

The expected workflow is:

```text
Read environment files
Understand the task
Retrieve / filter / calculate / extract / combine / verify facts
Build image-generation conditions
Generate the final image
Score the image against environment-grounded facts
```

## Current Dataset

The active dataset contains 58 cases under `benchmark/cases/`:

| Task type | Cases |
| --- | ---: |
| `data_insight` | 12 |
| `data_selection` | 10 |
| `design_specification` | 10 |
| `document_brief` | 6 |
| `multi_source_fusion` | 5 |
| `procedure_instruction` | 5 |
| `relationship_diagram` | 5 |
| `state_change` | 5 |

The former pilot dataset and case-generation artifacts are no longer part of
the repository. `benchmark/cases/` is the only active case root.

## Directory Layout

```text
benchmark/
+-- README.md
+-- benchmark_blueprint.md
+-- case_skeleton.md
+-- environment.genbench.yml
+-- review_policy.md
+-- scoring_templates.md
+-- visual_vqa_catalog.md
+-- schemas/
|   +-- metadata.schema.json
|   +-- expected_facts.schema.json
|   +-- scoring_checklist.schema.json
+-- cases/
    +-- data_insight/
    +-- data_selection/
    +-- design_specification/
    +-- document_brief/
    +-- multi_source_fusion/
    +-- procedure_instruction/
    +-- relationship_diagram/
    +-- state_change/
```

## Case Contract

Every case uses the same outer structure:

```text
<case_id>/
+-- env/
+-- task.md
+-- metadata.json
+-- expected_facts.json
+-- scoring_checklist.json
```

`env/` contains only the files needed for the task. Cases may use CSV, XLSX,
JSON, SQLite, PDF, DOCX, PPTX, Markdown, text, YAML, images, and other formats
appropriate to the task. Consumers must provide the readers or renderers needed
for the formats used by the selected cases.

Files visible to the tested agent:

- `env/`
- `task.md`

Evaluator-only files:

- `metadata.json`
- `expected_facts.json`
- `scoring_checklist.json`

Review caches such as `qa_render/` are evaluator-only and must never be copied
into an agent workspace.

## Validation And Evaluation

Validation and model-evaluation code lives in the sibling
`envgen-evaluation/` project. Run commands from the workspace root.

Validate all active cases:

```powershell
python envgen-evaluation/scripts/validate_cases.py --case-root benchmark/cases
```

Validate selected cases:

```powershell
python envgen-evaluation/scripts/validate_cases.py `
  --case-root benchmark/cases `
  --dimension data_insight `
  --cases data_insight_001,data_insight_002
```

Generate the visual VQA catalog after adding or changing cases:

```powershell
python envgen-evaluation/scripts/generate_visual_vqa_catalog.py `
  --case-root benchmark/cases `
  --output benchmark/visual_vqa_catalog.md
```

See `envgen-evaluation/README.md` and `envgen-evaluation/RUNBOOK.md` for model
generation, scoring, and end-to-end evaluation commands.
