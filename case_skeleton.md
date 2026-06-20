# Case Skeleton

This document defines the minimum outer shell for every benchmark case.

It is intentionally lighter than a template. A skeleton says what every case
must contain; a template will later say how each task type is usually written.

## Required Layout

```text
<case_id>/
├── env/
├── task.md
├── metadata.json
├── expected_facts.json
└── scoring_checklist.json
```

## Required Files

### `env/`

The environment directory contains all files available to the tested agent.

Allowed file formats depend on the task dimension. A case should include only
the formats it needs, not every format listed in the high-level plan.

Env files can be:

- generated locally by scripts or manual authoring;
- downloaded from public sources;
- crawled from public web pages;
- derived from another file, such as converting public HTML into PDF or CSV
  into XLSX;
- mixed from multiple origins.

If a file is downloaded or crawled, place the cached copy in `env/` and record
its source details in `metadata.json`. A case should not rely on a live external
file during evaluation unless its `web_policy` is `web_required`.

Do not put review-generated artifacts in `env/`. In particular, `qa_render/`
PNGs, PDF preview screenshots, audit images, and files named like
`public_reference_*.jpg` should not be agent-visible inputs. If a public image is
used only to make a PDF feel realistic, embed it in the PDF and record the
source metadata on the PDF env file instead of exposing the standalone source
photo as another env document.

Do not put generated/manual synthetic visual-reference images in `env/`.
This includes fake logos, generic product panels, recursive preview/reference
images, `*_reference.png` placeholders, decorative diagrams, and PNG/JPG files
whose only purpose is to make the case look visual. If an image is visible to
the agent as a standalone env file, it must be a real public/official image
with `origin=public_download` or `origin=public_crawl` plus `source_url`,
`retrieved_at`, `license_note`, and `conversion_note`. Otherwise embed the
visual naturally inside a sourced PDF or replace it with text/PDF/JSON rules.

For image or PDF assets sourced from the web, prefer official public sources,
public-domain material, or clearly licensed Creative-Commons/public
documentation assets. Record `source_url`, `retrieved_at`, `license_note`, and
`conversion_note` when applicable. Do not use a real logo, person, or product
image as a fictional asset unless the case intentionally targets that real
entity.

Examples:

- Data tasks may use `.csv`, `.xlsx`, `.json`, `.sqlite`, or SQL files.
- Document tasks may use `.pdf`, `.md`, `.txt`, or `.html` in the v1 benchmark.
- Design tasks may use `brand_guide.pdf`, `style_guide.md`,
  `visual_rules.json`, `template.yaml`, or `platform_specs.txt`.
- Procedure tasks may use manuals, operation guides, support notes, schedules,
  or mixed documents.
- Relationship tasks may use architecture notes, dependency configs, team CSVs,
  service lists, or system docs.
- State-change tasks may use changelogs, version notes, status tables, diffs,
  or current-state files.
- Multi-source tasks should combine multiple relevant file types.

PDF and long-document env files may contain realistic noise. They can include
irrelevant sections, obsolete facts, secondary examples, tables, captions,
screenshots, diagrams, logos, or other embedded images. If those elements matter
for the task or could mislead the agent, `expected_facts.json` should record
which facts or visual references must appear, which are distractors, and which
must not appear in the final image.

### `task.md`

The user-facing request given to the agent.

It should specify the image goal but should not directly reveal the computed or
selected answer.

### `metadata.json`

Machine-readable case metadata:

- case id
- task type
- web policy
- target image type
- difficulty
- env file summary, including source origin when relevant
- evaluator notes

### `expected_facts.json`

Ground-truth facts that the final image should reflect. This file is not shown
to the tested agent.

It should contain enough information to verify grounded correctness, such as:

- selected objects
- computed statistics
- extracted facts
- required visual constraints
- ordered procedure steps
- entity-relation edges
- latest valid state
- fused facts from multiple files

### `scoring_checklist.json`

Per-case scoring checklist aligned with the four benchmark dimensions:

- Task Completion
- Grounded Requirement Satisfaction
- Information Structuring
- Visual Rendering Quality

The checklist should be specific enough for human or model-assisted evaluation.

## Naming

Use stable lowercase ids:

```text
data_selection_001
data_insight_001
document_brief_001
design_specification_001
procedure_instruction_001
relationship_diagram_001
state_change_001
multi_source_fusion_001
```

## Recommended Case Lifecycle

1. Draft the case idea.
2. Create realistic env files.
3. Write `task.md` without answer leakage.
4. Write `expected_facts.json`.
5. Write `scoring_checklist.json`.
6. Run schema validation.
7. Run automated review.
8. Audit for solvability, groundedness, distractor handling, and scoring
   feasibility.
