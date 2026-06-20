# Strict Review Policy

`benchmark/scripts/strict_review_cases.py` is the canonical strict reviewer for
case promotion. It intentionally scores harder than `auto_review_cases.py` and
uses gates in addition to a numeric score.

## Decision Values

- `pass`: total score is at least 85, all critical gates pass, and no unresolved
  warnings remain.
- `revise`: total score is at least 65 but the case has warnings, non-fatal gate
  failures, weak visual realism, incomplete semantic verification, or checklist
  usability issues.
- `reject`: total score is below 65, required files cannot be opened, source
  traceability is broken, critical facts are obviously wrong, or severe answer
  leakage is detected.

Visual and semantic gates are hard ceilings: if `visual_asset_quality_gate`,
`pdf_realism_gate`, or `semantic_consistency_gate` fails without a severe reject
condition, the highest decision is `revise`.

## Score Dimensions

| Dimension | Points | Purpose |
| --- | ---: | --- |
| `structural_validity` | 20 | Required files, schema-level consistency, env file existence, metadata consistency. |
| `source_traceability` | 15 | Every expected fact cites readable sources; public assets include provenance and license fields. |
| `semantic_grounding` | 20 | Expected facts are traced or recomputed from env data where possible. |
| `task_operation_depth` | 10 | The task requires real filtering, calculation, extraction, state resolution, diagramming, or fusion. |
| `visual_asset_quality` | 15 | PDF/image realism, render density, entropy, edge detail, repetition, and public-source preference. |
| `scoring_usability` | 10 | Checklist items are executable, fact-mapped, visually specific, and distinguish scoring levels. |
| `anti_leakage_and_negative_coverage` | 10 | Critical answers are not in task.md; distractors and must-not-appear facts are covered. |

## Critical Gates

- `schema_gate`
- `source_traceability_gate`
- `semantic_consistency_gate`
- `visual_asset_quality_gate`
- `pdf_realism_gate`
- `no_answer_leakage_gate`
- `scoring_usability_gate`

The reviewer reports `failed_gates` for each case. A high total score cannot
override a failed critical gate.

## Agent-Visible Material Hygiene

Review artifacts must never become task materials. `qa_render/` images, PDF
screenshots, audit previews, and other review-generated files are evaluator-only
cache outputs. They must not be listed in `metadata.env_files`, referenced by
`task.md`, or embedded as explanatory text inside PDFs.

Standalone source images named like `public_reference_*.jpg` should also not be
agent-visible env documents. When a public image is used only to improve PDF
realism, embed it naturally inside the relevant PDF and record `source_url`,
`retrieved_at`, `license_note`, and `conversion_note` on that PDF entry.

Standalone generated/manual synthetic image assets are disallowed by default.
This includes fake logos, generic product panels, decorative diagrams,
recursive preview/reference images, and any visual-reference PNG/JPG that is
not a real sourced public/official asset. Such files should be removed or
replaced with a task-relevant public document, official asset, or realistic
embedded visual inside a sourced PDF.

## Visual Quality Rules

For document, design, multi-source, asset assembly, and persona/image cases,
prefer realistic public assets over generated placeholders. Good sources include
official public PDFs, government or school documents, Wikimedia Commons,
public-domain images, and clearly licensed institutional materials.

When an env file uses `public_download`, `public_crawl`, or `mixed`, metadata
must include:

- `source_url`
- `retrieved_at`
- `license_note`
- `conversion_note`

Standalone generated or synthetic images must not be agent-visible env files.
If a standalone image is unavoidable, it must be a real public/official image
with `origin=public_download` or `origin=public_crawl` and complete source
metadata. Synthetic PDF visuals are allowed only as fallback material and should
not receive full realism credit by default.

The strict reviewer uses heuristics including render dimensions, non-white pixel
ratio, image entropy, edge density, connected component count, dominant-color
ratio, embedded PDF image count, page render availability, banned placeholder
tokens, and perceptual hash similarity.

## Semantic Grounding Rules

Expected facts must be more than field-complete. The reviewer attempts to
re-read available CSV, JSON, YAML, SQLite, SQL, text, Markdown, PDF, and XLSX
sources. It checks that critical values trace back to cited env files and that
task-specific notes explain selection, aggregation, state changes, rule
interpretation, document extraction, asset constraints, relationship edges, and
web requirements.

If a fact cannot be fully recomputed automatically, the case receives a warning
and lower score. It should not receive full credit merely because the
`expected_facts.json` shape is valid.

## Leakage Rules

`task.md` may name files, fields, and rules, but it must not reveal final
critical expected values. One critical answer value appearing in `task.md`
forces revision. Multiple critical answer values appearing in `task.md` are a
reject-level issue.

## Commands

```powershell
python benchmark\scripts\strict_review_cases.py --cases-root benchmark\pilot_cases --mode pilot
```

```powershell
python benchmark\scripts\strict_review_cases.py --cases-root benchmark\cases --mode full
```

Reports are written to `benchmark/strict_review_auto.json` and
`benchmark/strict_review_auto.md` in pilot mode, or `benchmark/strict_review_full.*`
in full mode.
