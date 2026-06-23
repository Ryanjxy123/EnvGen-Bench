# Benchmark Blueprint

This document turns `Constructing dependencies.md` into an executable benchmark
plan. It should stay aligned with that source document.

## Dataset Size

Target size: 200 cases.

Recommended split:

| Set | Count | Ratio | Web Permission | Information Source |
| --- | ---: | ---: | --- | --- |
| Closed-Env Set | 140 | 70% | Web search forbidden | The answer exists completely in `env/` |
| Web-Required Set | 40 | 20% | Web search allowed and required | `env/` gives main context but misses required external information |
| Web-Helpful Set | 20 | 10% | Web search allowed but optional | `env/` is sufficient; web may help verify or refine |

## Task Dimensions

The benchmark follows the 8 task dimensions defined in
`Constructing dependencies.md`.

| Task Type | Case Count | Core Ability | Example Target |
| --- | ---: | --- | --- |
| `data_selection` | 25 | Select correct objects from structured data | Promotional poster, product recommendation image |
| `data_insight` | 25 | Calculate statistics and extract insights | Infographic, annual summary poster |
| `document_brief` | 25 | Extract key facts from long documents | Course poster, event poster, product intro image |
| `design_specification` | 25 | Follow visual and brand constraints | Brand poster, launch image, social media image |
| `procedure_instruction` | 25 | Convert procedure documents into steps | Instructional image, workflow image |
| `relationship_diagram` | 25 | Extract entities and relationships | Architecture diagram, org chart, dependency diagram |
| `state_change` | 25 | Use the latest state and avoid stale facts | Current campaign poster, update announcement |
| `multi_source_fusion` | 25 | Combine multiple files and constraints | Integrated marketing image, complex campaign image |

Suggested web split per task type:

| Task Type | Closed | Web-Required | Web-Helpful |
| --- | ---: | ---: | ---: |
| `data_selection` | 18 | 5 | 2 |
| `data_insight` | 18 | 5 | 2 |
| `document_brief` | 18 | 5 | 2 |
| `design_specification` | 18 | 5 | 2 |
| `procedure_instruction` | 17 | 5 | 3 |
| `relationship_diagram` | 17 | 5 | 3 |
| `state_change` | 17 | 5 | 3 |
| `multi_source_fusion` | 17 | 5 | 3 |
| **Total** | **140** | **40** | **20** |

## Evaluation Dimensions

| Dimension | Weight | Meaning |
| --- | ---: | --- |
| Task Completion | 15% | Whether the final image completes the task's core output purpose, not merely whether an image exists |
| Grounded Requirement Satisfaction | 55% | Whether required content, data, entities, relations, steps, states, and constraints match `env/` and `task.md` |
| Information Structuring | 15% | Whether mostly-correct environment information is selected, compressed, grouped, and prioritized for image expression |
| Visual Rendering Quality | 15% | Whether the generated image is readable, clear, visually coherent, and suitable for the task |

Use `Visual Rendering Quality` as the canonical dimension name. If older notes
use `Visual Communication Quality`, treat it as the same concept and normalize
new files to `Visual Rendering Quality`.

For legacy cases that still use a robustness dimension, use Task Completion
15%, Grounded Requirement Satisfaction 50%, Information Structuring 15%, Visual
Rendering / Communication Quality 10%, and Robustness 10%.

Visual quality must not compensate for missing grounded facts. A polished
placeholder, generic mockup, empty-field template, or image using text such as
`coming soon`, `unavailable`, `pending`, `details will be available`, `cannot
finalize`, or `not accessible` can receive visual-quality credit, but should
score low on Task Completion, Grounded Requirement Satisfaction, and
Information Structuring.

Expected facts should distinguish `critical_required`, `major_required`,
`optional`, and `negative_only` roles. Optional facts are not required to appear;
negative-only facts should be scored only when wrongly included.

## Design Principles

- Do not make every task type use one fixed env file format.
- Use only the files needed by each case.
- Env files may be generated locally, manually authored, downloaded from public
  sources, or crawled from public web pages when that is useful for realism.
- If an env file comes from the web, cache the file in `env/` and record its
  source metadata so the case remains reproducible.
- Do not leak the answer in `task.md`.
- Put ground-truth facts in `expected_facts.json`, not in the user-facing task.
- Use `scoring_checklist.json` to make each case evaluable.
- Keep each case independently inspectable and runnable.
- Prefer realistic, internally consistent environment data.
- For Closed-Env cases, all required facts must be present in `env/`.
- For Web-Required cases, document exactly what external information is missing.
- For Web-Helpful cases, ensure the task remains solvable without web search.

## PDF And Document Realism

PDFs and long-form documents should not always be clean fact containers. In the
full benchmark, document-like env files should include realistic difficulty
when it helps test agent capability:

- Include extra sections that are plausible but irrelevant to the requested
  image.
- Include distractor facts that should be excluded, such as superseded dates,
  alternative products, cancelled events, deprecated instructions, or unrelated
  examples.
- Use tables, callout boxes, headings, footnotes, captions, or appendix-like
  sections when they are natural for the document type.
- PDFs may include images, diagrams, screenshots, logos, or embedded visual
  references, but standalone generated/manual image files in `env/` are
  prohibited by default. Fake logos, generic product panels, recursive preview
  images, `*_reference.png` assets, and decorative PNG/JPG diagrams should not
  be agent-visible task material.
- When realism is more important than exact synthetic control, use cached
  public images, public PDFs, official manuals, public-domain/Creative-Commons
  diagrams, government reports, or institution brochures. A standalone image
  env file is allowed only when it is a real public/official asset with complete
  source metadata; otherwise embed the visual naturally inside a sourced PDF.
- Ground-truth files must explicitly state which PDF facts, images, captions, or
  visual references are required, optional, or should not appear.
- If a PDF contains visual information needed for scoring, validation should
  include rendering checks in addition to text extraction.

The goal is not to make every PDF complex. The goal is to vary document
difficulty so the benchmark can distinguish agents that merely extract obvious
text from agents that can filter, cross-check, and reason over realistic
documents.

## Stricter Review Direction

Use `review_policy.md` and `benchmark/scripts/strict_review_cases.py` as the
current strict promotion policy. Strict review must make a `pass` / `revise` /
`reject` decision from both numeric scores and critical gates; a structurally
complete case is not sufficient for promotion.

The pilot review can stay lightweight while the full benchmark should use a
stricter gate. Future review scripts should check at least:

- Env-to-task alignment: every required task operation must have evidence in
  `env/` or in a documented web requirement.
- Distractor coverage: cases should define negative facts or exclusion rules
  when the env contains plausible but wrong information.
- Derivation traceability: computed, selected, latest-state, or fused facts
  should include derivation notes.
- Source diversity: the full 200-case set should avoid overusing the same file
  combination or the same document pattern.
- PDF realism: sampled PDF cases should include text extraction checks, render
  checks, and, when relevant, visual-element checks.
- Scoring auditability: every high-weight checklist item should map to one or
  more expected facts or visual constraints.

## Env File Source Policy

Environment files can come from several sources:

| Origin | Meaning | Recommended Use |
| --- | --- | --- |
| `generated` | Created by us with scripts or manual authoring | Structured data, synthetic brand guides, controlled examples |
| `public_download` | Downloaded from a stable public URL | PDFs, public reports, manuals, brochures, standards |
| `public_crawl` | Extracted from public web pages | HTML pages, public documentation snippets, product/event pages |
| `derived` | Converted from another source, such as HTML to PDF or CSV to XLSX | Format variation and controlled transformations |
| `mixed` | Combines generated and external material | Multi-source cases or realism-enhanced cases |

Rules:

- Prefer generated files when exact control of facts is important.
- Prefer public downloads or crawls when realism matters, especially for PDFs,
  manuals, reports, or web-native documents that are cumbersome to author.
- Prefer external visual assets only when the asset's license, provenance, and
  reuse conditions are clear. Good sources include official public documents,
  Wikimedia Commons, public-domain government material, openly licensed
  educational diagrams, and stable vendor documentation.
- Do not use real brand logos, products, or people as assets for a fictional
  brand case unless the case is explicitly about that real entity and the source
  policy permits it.
- Cache every downloaded image or PDF under `env/`; do not hotlink images from
  inside prompts or generated PDFs.
- Do not depend on a live URL at evaluation time unless the case is explicitly
  `web_required`.
- For Closed-Env and Web-Helpful cases, the downloaded or crawled artifact must
  be cached under `env/`; the agent should not need to re-fetch it.
- Record source URL, retrieval date, license or usage note, and any conversion
  steps in `metadata.json` whenever an env file is externally sourced.
- If a public image is resized, cropped, converted, embedded in a PDF, or used
  as a visual distractor, record that transformation in `conversion_note`.
- Avoid private, paywalled, login-gated, unstable, or legally unclear sources.
- If external content is long, keep only the portions needed for the case when
  allowed, and record that the file is excerpted.
- If a web source later disappears, the cached env file should still make the
  case solvable.

Helper command for caching a public image or PDF:

```powershell
D:\MiniConda\envs\genbench\python.exe benchmark\scripts\fetch_public_asset.py `
  --url "https://example.org/public-asset.png" `
  --out "pilot_cases/example_001/env/public_asset.png" `
  --license-note "Public-domain or clearly licensed source; verify before use." `
  --conversion-note "Downloaded unchanged; later embedded in generated PDF."
```

The helper writes the asset and a `.source.json` sidecar with URL, retrieval
date, license note, conversion note, SHA-256, and file size. The case metadata
should still include the same source information for evaluator visibility.

## Pilot-First Workflow

1. Create one pilot case for each task dimension.
2. Review whether each pilot has enough but not excessive environment evidence.
3. Refine the schemas based on real pilot needs.
4. Extract task-specific templates only after pilots are stable.
5. Expand to the full 200-case set.
