# Case Generation Plan

This plan defines the expansion step after the 8 polished pilot cases. The
16-case development batch has been generated under `benchmark/pilot_cases/`,
bringing the working set to 24 cases before scaling toward 200.

## Why 16 More First

The current pilots prove that the schema, env files, validation, and strict
review can work. The next risk is scale quality: repeated cases may become too
similar, too clean, or too easy. A 24-case set is large enough to expose those
problems without creating 200 cases that later need broad repair.

## Target Batch

The development batch adds two new cases per task type:

| Task Type | New Case IDs | Main Variation Goal |
| --- | --- | --- |
| `data_selection` | `data_selection_002`, `data_selection_003` | Use different structured formats and exclusion rules |
| `data_insight` | `data_insight_002`, `data_insight_003` | Add multi-sheet or SQL-backed calculations |
| `document_brief` | `document_brief_002`, `document_brief_003` | Use realistic PDFs with images, tables, and distractors |
| `design_specification` | `design_specification_002`, `design_specification_003` | Vary brand/source assets and forbidden visual constraints |
| `procedure_instruction` | `procedure_instruction_002`, `procedure_instruction_003` | Mix manuals, quick notes, diagrams, and troubleshooting distractors |
| `relationship_diagram` | `relationship_diagram_002`, `relationship_diagram_003` | Add unrelated nodes and direction-sensitive edges |
| `state_change` | `state_change_002`, `state_change_003` | Add multi-step updates, stale facts, and cancelled records |
| `multi_source_fusion` | `multi_source_fusion_002`, `multi_source_fusion_003` | Use unrelated sources, public assets, and one precise web gap |

## Format Targets

The second batch should deliberately use formats not overrepresented in the
pilots:

- Structured data: `.xlsx`, `.csv`, `.json`, `.sqlite`, `.sql`, `.yaml`
- Documents: `.pdf`, `.md`, `.txt`, `.html`
- Visual assets: `.png`, `.jpg`, embedded PDF images, public cached diagrams
- Optional derived files: downloaded public PDF converted or excerpted into a
  generated env file

Avoid adding `.docx` in v1 unless there is a strong reason and a portable render
workflow is available.

## Web Policy Mix

For the 16-case batch:

| Policy | Count | Rule |
| --- | ---: | --- |
| `closed_env` | 10 | Fully solvable from cached env files |
| `web_required` | 4 | Missing exactly one external fact, such as current platform size guidance |
| `web_helpful` | 2 | Env is sufficient; web may help presentation only |

Each web-required case must define `web_facts` in `expected_facts.json`.

## Quality Requirements

Every new case must pass:

```powershell
D:\MiniConda\envs\genbench\python.exe benchmark\scripts\validate_cases.py --cases-root benchmark\pilot_cases
D:\MiniConda\envs\genbench\python.exe benchmark\scripts\auto_review_cases.py --cases-root benchmark\pilot_cases
D:\MiniConda\envs\genbench\python.exe benchmark\scripts\strict_review_cases.py --cases-root benchmark\pilot_cases --mode full
```

## Public Asset Rules

Network assets are allowed when they improve realism. They must be cached under
`env/`, not hotlinked.

Use:

```powershell
D:\MiniConda\envs\genbench\python.exe benchmark\scripts\fetch_public_asset.py `
  --url "https://example.org/public-asset.png" `
  --out "pilot_cases/example_001/env/public_asset.png" `
  --license-note "Public-domain or clearly licensed source; verify before use." `
  --conversion-note "Downloaded unchanged; later embedded in generated PDF."
```

Then mirror the source fields in `metadata.json`.

## Suggested Case Ideas

| Case ID | Sketch |
| --- | --- |
| `data_selection_002` | Select grant winners from `.xlsx` plus eligibility `.yaml`; exclude late submissions |
| `data_selection_003` | Select menu items from SQLite inventory; exclude allergens and unavailable SKUs |
| `data_insight_002` | Calculate clinic wait-time trends from multi-sheet workbook |
| `data_insight_003` | Produce energy-use infographic from `.sql` seed file plus region mapping |
| `document_brief_002` | Public workshop flyer from PDF brochure with sponsor logos and unrelated appendix |
| `document_brief_003` | Product intro image from cached public-style report PDF plus excerpted notes |
| `design_specification_002` | Museum exhibit poster with public-domain reference image and strict palette |
| `design_specification_003` | App feature launch image with style tokens and misleading old template |
| `procedure_instruction_002` | Safety setup card from manual PDF with warning diagram and support-only steps |
| `procedure_instruction_003` | Cooking or lab workflow image from schedule table plus illustrated steps |
| `relationship_diagram_002` | Vendor data-flow diagram with unrelated analytics services |
| `relationship_diagram_003` | Org escalation chart with dotted-line advisory relationships |
| `state_change_002` | Transit detour poster from old notice, amendment log, and active route table |
| `state_change_003` | Conference session update from agenda diff plus cancelled-room record |
| `multi_source_fusion_002` | Tourism campaign image combining weather CSV, venue PDF, audience JSON, and web size |
| `multi_source_fusion_003` | Product comparison campaign using sales SQLite, public-style image asset, and brand rules |

## Promotion Rule

The 24-case working set should remain in `pilot_cases/` until it is promoted.
Do not expand beyond 24 cases until:

- All 24 pass generic validation.
- All 24 pass automated review.
- All 24 pass strict full review.
- A sampled visual render audit finds no unreadable embedded assets or broken
  PDF layouts.
