# Environment-Grounded Image Generation Benchmark

This benchmark evaluates whether an agent can use environment files to generate
a correct image plan and final image. The core ability under test is grounded
information handling before image generation, not generic image prompting.

The expected agent workflow is:

```text
Read environment files
Understand the user task
Retrieve / filter / calculate / extract / combine / verify facts
Build image-generation conditions
Generate the final image
Score the image against environment-grounded facts
```

## Current Stage

This directory contains the benchmark skeleton, 8 polished seed pilot cases, 16
additional development cases, and the plan for controlled expansion. It does
not lock every task type into one fixed file format.

The current working set has 24 cases under `benchmark/pilot_cases/`. These are
development cases, not the final published `benchmark/cases/` set.

## Directory Layout

```text
benchmark/
+-- README.md
+-- benchmark_blueprint.md
+-- case_skeleton.md
+-- case_generation_plan.md
+-- pilot_plan.md
+-- schemas/
|   +-- metadata.schema.json
|   +-- expected_facts.schema.json
|   +-- scoring_checklist.schema.json
+-- pilot_cases/
+-- cases/
    +-- data_selection/
    +-- data_insight/
    +-- document_brief/
    +-- design_specification/
    +-- procedure_instruction/
    +-- relationship_diagram/
    +-- state_change/
    +-- multi_source_fusion/
```

## Case Files

Every benchmark case should use the same outer shell:

```text
<case_id>/
+-- env/
+-- task.md
+-- metadata.json
+-- expected_facts.json
+-- scoring_checklist.json
```

The `env/` directory is intentionally flexible. A case should include only the
files needed for that task, such as CSV, XLSX, JSON, SQLite, PDF, MD, TXT,
HTML, YAML, PNG, JPG, or other formats allowed by the task dimension.

The v1 benchmark avoids office-document env files that require heavyweight
external renderers, keeping validation lightweight and portable.

## Visibility

Files visible to the tested agent:

- `env/`
- `task.md`

Files used by benchmark builders, validators, and evaluators:

- `metadata.json`
- `expected_facts.json`
- `scoring_checklist.json`

## Validation And Review

Automation for validation, review, and model benchmarking lives under
`evaluation/` so that `benchmark/` stays focused on benchmark definitions and
case assets.

Run generic validation and review over any case root:

```powershell
D:\MiniConda\envs\genbench\python.exe evaluation\scripts\validate_cases.py --cases-root benchmark\pilot_cases
D:\MiniConda\envs\genbench\python.exe evaluation\scripts\auto_review_cases.py --cases-root benchmark\pilot_cases
D:\MiniConda\envs\genbench\python.exe evaluation\scripts\strict_review_cases.py --cases-root benchmark\pilot_cases --mode full
```

The older pilot-specific scripts are kept for compatibility, but new expansion
work should use the generic scripts.
