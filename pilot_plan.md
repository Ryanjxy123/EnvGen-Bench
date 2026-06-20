# Pilot Case Plan

This file plans the first 8 pilot cases, one for each task dimension. These
are not final task templates. They are deliberately varied so that the pilot
round can reveal what the benchmark schema must support.

## Pilot Goals

- Verify that the common case skeleton works across all 8 task dimensions.
- Ensure env file formats remain flexible and task-appropriate.
- Check that `task.md` can describe the image goal without leaking answers.
- Check that `expected_facts.json` can hold enough ground truth for scoring.
- Check that `scoring_checklist.json` can support the 4 evaluation dimensions.

## Env File Policy For Pilots

The `env_files` field below lists the concrete files planned for the first
pilot of each task type. It is not an exhaustive list of allowed files and must
not be interpreted as a fixed template for that task type.

For the full 200-case benchmark:

- A case may use one file if that file is sufficient and realistic.
- A case may use multiple files when the task requires cross-file reasoning.
- A task type should vary file formats across cases.
- A task type should not always use the exact same file count or file names.
- The allowed file types should follow `Constructing dependencies.md`, but a
  case does not need to include every allowed type.
- Multi-source Fusion cases should normally use more files than single-source
  task types.

Each pilot therefore includes:

- `env_files`: concrete files for this pilot case.
- `format_variation_pool`: allowed alternatives to use when expanding the task
  type into many cases.
- `full_benchmark_variation_note`: how to vary this task type later.

## Pilot 1: Data Selection-to-Image

```yaml
case_id: data_selection_001
task_type: data_selection
web_policy: closed_env
target_image_type: promotional_poster
difficulty: medium
env_files:
  - products.csv
  - campaign_rules.json
format_variation_pool:
  - products.xlsx
  - product_catalog.json
  - inventory.sqlite
  - filter_rules.json
  - campaign_rules.sql
full_benchmark_variation_note:
  Use different structured sources across cases. Some cases can use a single
  table plus a prompt rule; others can split product, inventory, category, and
  campaign rules across CSV, JSON, XLSX, SQLite, or SQL files.
core_operation:
  - Filter products by category, status, inventory, and discount.
  - Sort eligible products by discount or campaign priority.
  - Select the top products for a promotional image.
expected_fact_focus:
  - Correct selected product ids.
  - Correct product names, prices, and discount labels.
  - Excluded products and exclusion reasons.
main_scoring_focus:
  - Shows only eligible products.
  - Does not mix in out-of-stock, inactive, or wrong-category products.
  - Presents the result as a promotion image rather than a plain data table.
```

## Pilot 2: Data Insight-to-Infographic

```yaml
case_id: data_insight_001
task_type: data_insight
web_policy: closed_env
target_image_type: annual_summary_infographic
difficulty: medium
env_files:
  - sales_2025.xlsx
  - region_mapping.json
format_variation_pool:
  - sales.csv
  - monthly_metrics.json
  - transactions.sqlite
  - revenue_by_region.sql
  - metrics.log
full_benchmark_variation_note:
  Vary between spreadsheet-heavy cases, database-backed cases, JSON metric
  cases, and mixed data-plus-log cases. The key requirement is that the agent
  must compute or compare values before generating the image.
core_operation:
  - Calculate total revenue.
  - Find the best month.
  - Identify the fastest-growing quarter.
  - Rank top categories.
expected_fact_focus:
  - Numeric statistics.
  - Top-k categories.
  - Growth calculation method.
main_scoring_focus:
  - Uses correct calculated values.
  - Highlights insights instead of dumping raw data.
  - Uses an infographic structure with clear hierarchy.
```

## Pilot 3: Document Brief-to-Image

```yaml
case_id: document_brief_001
task_type: document_brief
web_policy: closed_env
target_image_type: course_poster
difficulty: medium
env_files:
  - course_brief.pdf
  - instructor_bio.md
format_variation_pool:
  - course_intro.pdf
  - event_page.html
  - brochure.txt
  - registration_notes.md
full_benchmark_variation_note:
  Vary document formats across cases. For v1, prefer PDF, Markdown, TXT, and
  HTML.
core_operation:
  - Extract course title, instructor, schedule, audience, and key highlights.
  - Compress long document content into image-ready copy.
expected_fact_focus:
  - Exact course title.
  - Correct time and instructor.
  - Three valid course highlights from the documents.
main_scoring_focus:
  - Captures the important facts.
  - Avoids unsupported claims.
  - Produces a poster-like summary rather than a long text block.
```

## Pilot 4: Design Specification-to-Image

```yaml
case_id: design_specification_001
task_type: design_specification
web_policy: web_helpful
target_image_type: product_launch_social_image
difficulty: medium
env_files:
  - brand_guide.pdf
  - visual_rules.json
  - launch_copy.md
format_variation_pool:
  - style_guide.md
  - template.yaml
  - platform_specs.txt
  - product_brief.pdf
  - logo_usage_rules.json
full_benchmark_variation_note:
  Vary whether constraints come from PDF brand guides, Markdown style guides,
  JSON visual rules, YAML templates, or platform text specs. Cases should not
  always include all constraint files.
core_operation:
  - Apply brand colors, placement rules, and forbidden elements.
  - Use launch copy while respecting visual constraints.
  - Optional web use may verify current social image aspect-ratio norms, but
    env remains sufficient.
expected_fact_focus:
  - Required brand colors.
  - Logo placement.
  - Forbidden visual elements.
  - Required launch message.
main_scoring_focus:
  - Follows visual and brand constraints.
  - Does not use prohibited colors or elements.
  - Keeps product launch message prominent.
```

## Pilot 5: Procedure Document-to-Instructional Image

```yaml
case_id: procedure_instruction_001
task_type: procedure_instruction
web_policy: closed_env
target_image_type: onboarding_instruction_image
difficulty: medium
env_files:
  - user_manual.pdf
  - quick_start_notes.txt
format_variation_pool:
  - operation_guide.pdf
  - procedure.md
  - support_notes.txt
  - setup_schedule.xlsx
  - troubleshooting_appendix.pdf
full_benchmark_variation_note:
  Vary between manual-only cases, procedure-document cases, schedule-assisted
  cases, and mixed manual-plus-notes cases. The agent should extract steps
  rather than copy every instruction.
core_operation:
  - Extract and order setup steps.
  - Compress detailed instructions into 4 to 6 clear steps.
expected_fact_focus:
  - Correct step order.
  - Required safety or setup notes.
  - Removed irrelevant troubleshooting details.
main_scoring_focus:
  - Uses a clear instructional sequence.
  - Steps are accurate and not reordered incorrectly.
  - Visual structure supports following the process.
```

## Pilot 6: Relationship Extraction-to-Diagram

```yaml
case_id: relationship_diagram_001
task_type: relationship_diagram
web_policy: closed_env
target_image_type: system_architecture_diagram
difficulty: medium
env_files:
  - architecture_notes.md
  - dependency_config.yaml
format_variation_pool:
  - system_docs.md
  - service_list.json
  - team_structure.csv
  - dependency_config.yaml
  - architecture_notes.txt
full_benchmark_variation_note:
  Vary source formats and relation types. Some cases should derive edges from
  prose; others from YAML, CSV, JSON, or mixed structured/unstructured files.
core_operation:
  - Extract services, databases, queues, and dependency edges.
  - Group components into meaningful layers.
expected_fact_focus:
  - Entity list.
  - Directed dependency edges.
  - Layer or group assignments.
main_scoring_focus:
  - Shows correct entities and relationships.
  - Avoids invented services.
  - Diagram layout makes dependencies understandable.
```

## Pilot 7: State / Change Reasoning-to-Image

```yaml
case_id: state_change_001
task_type: state_change
web_policy: closed_env
target_image_type: current_event_poster
difficulty: hard
env_files:
  - old_campaign.md
  - changelog.md
  - current_status.csv
format_variation_pool:
  - updated_info.json
  - version_notes.txt
  - status_table.csv
  - config_diff.yaml
  - old_campaign.pdf
full_benchmark_variation_note:
  Vary the conflict pattern. Some cases should use old-vs-new documents; others
  should use changelogs, status tables, JSON updates, version notes, or config
  diffs to determine the latest valid state.
core_operation:
  - Resolve conflicts between stale and current information.
  - Use only currently valid campaign facts.
  - Avoid canceled or superseded details.
expected_fact_focus:
  - Latest date, location, sponsor, and theme.
  - Canceled items that must be excluded.
  - Source precedence rules.
main_scoring_focus:
  - Uses latest valid state.
  - Does not include outdated campaign information.
  - Communicates the current announcement clearly.
```

## Pilot 8: Multi-source Fusion-to-Image

```yaml
case_id: multi_source_fusion_001
task_type: multi_source_fusion
web_policy: web_required
target_image_type: social_media_campaign_image
difficulty: hard
env_files:
  - sales.csv
  - product_docs.md
  - brand_guide.pdf
  - audience_profile.json
  - campaign_config.yaml
format_variation_pool:
  - sales.xlsx
  - product_docs.pdf
  - brand_guide.pdf
  - audience_profile.json
  - campaign_config.yaml
  - platform_specs.txt
  - market_notes.html
full_benchmark_variation_note:
  Multi-source cases should intentionally combine several file types. In the
  full benchmark, vary whether the missing or auxiliary information comes from
  web search, platform specs, campaign config, audience profile, or product
  documentation.
missing_external_information:
  - Current platform-specific image size requirement for the requested social
    platform.
core_operation:
  - Find the monthly sales winner.
  - Extract product selling points.
  - Apply brand constraints.
  - Adapt tone to the audience profile.
  - Search web for the required current platform size.
expected_fact_focus:
  - Sales-winning product.
  - Correct selling points.
  - Brand constraints.
  - Audience-driven tone.
  - Web-sourced platform size requirement.
main_scoring_focus:
  - Correctly fuses all sources.
  - Uses web only for the missing external requirement.
  - Does not let external information override env-grounded facts.
```

## Open Design Questions

These should be resolved after reviewing the first 8 pilot cases:

- Should `expected_facts.json` use one flexible schema or task-specific
  sub-schemas?
- Should web-enabled cases store citations, cached web facts, or both?
- Should image evaluation be fully human-scored, model-assisted, or hybrid?
- Should final images be stored in each case directory, or should outputs live
  in a separate run directory?
- Should pilot cases become part of the final 200 cases after review, or remain
  a separate design set?
