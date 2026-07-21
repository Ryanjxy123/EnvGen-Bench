# Visual VQA Type Catalog

## 文件作用

本文件统计 benchmark 当前所有正式 case 使用的规范图片类型、类型对应的视觉质量 VQA，以及 2/1/0 三档评分标准。新增 case 时，应先在本目录中查找与 task 所要求交付物视觉职责相同或高度相近的类型：若已有对应类型，必须直接复用该类型名称、VQA 和三档标准；只有现有类型均不能准确描述新 task 的视觉功能时，才新增类型及其统一规则。这样可以避免同类图片因命名细微差异产生不同评分机制，也避免把视觉职责明显不同的图片过度合并。

维护流程：

1. 根据新 case 的 `task.md` 判断最终图片的视觉用途和信息架构，不按 benchmark 任务维度分类。
2. 优先匹配下方已有规范类型，并完整复用该类型的 `visual_rendering_quality` 设置。
3. 若必须新增类型，同时更新 `envgen-evaluation/scripts/migrate_case_vqa.py` 的类型模板和映射，以及 `benchmark/schemas/scoring_checklist.schema.json` 的类型枚举。
4. 添加或修改 case 后运行 `python envgen-evaluation/scripts/generate_visual_vqa_catalog.py --case-root benchmark/cases --output benchmark/visual_vqa_catalog.md` 刷新本文件，再运行全量 case 校验。

> 本文件是当前 case 配置的统计目录；实际评分时，评测器仍直接读取各 case 的 `scoring_checklist.json`。

## 当前总览

- 正式 case：22 个
- 规范图片类型：14 类
- 每个 case 的视觉质量 VQA：1 条
- 视觉评分尺度：整数 0、1、2；其中 2 分为严格成品门槛

| 图片类型 | Case 数 | Case 汇总 |
|---|---:|---|
| `executive_dashboard` | 3 | `data_insight_002`, `data_insight_006`, `data_insight_011` |
| `paid_social_ad` | 3 | `design_specification_001`, `design_specification_002`, `design_specification_004` |
| `instructional_guide` | 2 | `procedure_instruction_001`, `procedure_instruction_003` |
| `public_information_poster` | 2 | `data_selection_002`, `data_selection_005` |
| `release_announcement` | 2 | `state_change_001`, `state_change_004` |
| `social_campaign_creative` | 2 | `multi_source_fusion_001`, `multi_source_fusion_003` |
| `customer_display_card` | 1 | `data_selection_003` |
| `data_story_infographic` | 1 | `data_insight_001` |
| `digital_banner_ad` | 1 | `design_specification_007` |
| `er_diagram` | 1 | `relationship_diagram_001` |
| `escalation_hierarchy_chart` | 1 | `relationship_diagram_003` |
| `exhibit_panel` | 1 | `data_selection_006` |
| `promotional_poster` | 1 | `document_brief_001` |
| `reference_infographic` | 1 | `document_brief_006` |

## 统一严格判分原则

以下原则适用于全部 14 类视觉质量 VQA，并应同步写入实际评测提示词：

- 只评价图片中可见的视觉呈现与该图片类型的视觉功能，不因事实正确、元素“有出现”或图片成功生成而自动加分。
- **0 分不等于没有图片。** 图片即使完整生成，只要整体明显粗糙、层级混乱、模板感强、可读性差、视觉职责未成立，或需要大幅重做，也应评为 0。
- **1 分代表可用或还不错。** 主要信息能理解、基本能使用，但仍有明显普通感、局部瑕疵或需要正常设计修改，均评为 1。
- **2 分只给极少数精品。** 必须达到专业发布、投放、印刷、展示或正式评审级别，视觉概念明确、构图成熟、细节精致、正常尺寸下全面可读，并且几乎没有值得指出的明显问题。
- 判分必须从整体效果出发，不能因为某几个局部做得好就忽略整体粗糙。多个中等问题叠加，可以使结果从 1 降到 0。
- 保守判分：在 1 与 2 之间犹豫时给 1；在 0 与 1 之间犹豫时，如果需要大幅修改才能正式使用，则给 0。

## 类型详情

### `customer_display_card`

- Case 数：1
- Case：`data_selection_003`
- 当前原始 `target_image_type` 映射：

  - `cafe_lunch_specials_image`：`data_selection_003`

视觉质量 VQA：

> As a customer-facing menu, resource spotlight, or counter-display card, does the image convert the featured entries and their names, prices or equivalent decision values, categories, availability, and supporting details into a genuinely display-ready visual that can be understood quickly at normal viewing size without zooming? Evaluate the smallest meaningful text, the distinction between primary choices and secondary evidence, the efficiency of comparison, the visual treatment of summaries or recommendations, the use of the full canvas, and whether the result feels intentionally merchandised rather than like a report, worksheet, webpage, or collection of bordered text boxes. Do not award 2 merely because the information is complete, aligned, or free of rendering errors.

评分标准：

- **2 分：** Score 2 only if **all** of the following professional-display gates are clearly satisfied; failure of any one gate limits the score to 1 at most:

  1. **Immediate decision hierarchy:** The featured entries, their principal value or benefit, and the most important category, status, price, availability, or recommendation cue can be identified within seconds. Primary, secondary, and tertiary information are unmistakably differentiated rather than presented with nearly equal visual weight.
  2. **Normal-size readability:** Every meaningful label and supporting value, including the smallest summary, availability, nutrition, metadata, or recommendation text, is comfortably readable at the intended display size without zooming or close inspection. Dense small print, tightly packed lines, or long low-emphasis lists prevent 2.
  3. **Visual synthesis rather than information dumping:** Comparisons, highlights, summaries, and recommendations are visually distilled through purposeful typography, badges, icons, grouping, concise callouts, charts, imagery, or other appropriate devices. Long bullet inventories, paragraph-like metadata blocks, raw calculations, or report-style summaries cannot receive 2 even when accurate.
  4. **Refined entry design:** Repeated entries have deliberate rhythm, proportion, internal alignment, and selective emphasis. They must not resemble default bordered rows, spreadsheet records, form fields, plain database cards, or mechanically duplicated text panels. Imagery is not mandatory, but an image-free design must demonstrate exceptional typographic composition and visual merchandising.
  5. **Whole-canvas composition:** Content density, negative space, margins, and vertical distribution are intentionally balanced across the complete canvas. There may be no conspicuous unused lower region, oversized canvas, large empty areas inside entries, top-heavy arrangement, or visible sense that the design ended before the canvas did.
  6. **Production finish:** Typography, spacing, dividers, color, contrast, alignment, status treatments, and emphasis are consistently polished, accessible, and specific to the customer context. No malformed glyph, bracket-like placeholder styling, clipping, overlap, accidental crop, weak contrast, unstable baseline, inconsistent column alignment, or visible production residue is allowed.

  A design that is accurate and orderly but text-heavy, generic, repetitive, report-like, sparsely filled, or dependent on numerous small bullet points is not exceptional and must not receive 2.

- **1 分：** Score 1 if the card is understandable, factually presentable, and substantially usable, but requires visible design refinement before professional customer display. Typical 1-point outputs include clean repeated cards with weak visual differentiation; small but technically readable supporting text; dense nutrition, metadata, summary, or recommendation sections; long bullet lists; report-like or worksheet-like organization; ordinary typography; plain bordered panels; weak price, status, or benefit emphasis; inconsistent information density; excessive empty space within or below the content; or a composition that is easy to read only through careful inspection. A result may be complete, aligned, and error-free yet still receive only 1 when it organizes information rather than visually communicating and merchandising it.

- **0 分：** Score 0 if the card is visually poor, amateurish, unreliable, or impractical for customer use. This includes cases where featured entries or their key values are difficult to identify or compare; important text is too small, crowded, or low-contrast for normal viewing; hierarchy is confusing; summaries overwhelm the featured content; the layout is severely empty, dense, repetitive, or badly proportioned; alignment and spacing materially impair scanning; or substantial redesign is required. Blank, corrupted, severely unreadable, clipped, overlapping, misleading, or otherwise broken outputs are also 0.

### `data_story_infographic`

- Case 数：1
- Case：`data_insight_001`
- 当前原始 `target_image_type` 映射：

  - `annual_summary_infographic`：`data_insight_001`

视觉质量 VQA：

> As a data-story infographic, does the image communicate one dominant insight through an immediately legible narrative sequence, well-chosen visual evidence, meaningful comparisons, a clear takeaway, and refined publication-quality composition rather than a collection of disconnected cards?

评分标准：

- **2 分：** Score 2 only if the infographic is outstanding and publication-ready: one main insight dominates immediately; evidence, comparisons, annotations, and conclusion form a persuasive visual sequence; charts or encodings are purposeful, proportionate, and easy to interpret; all labels, values, units, and notes are readable at normal size; typography, spacing, color, alignment, and density are consistently sophisticated; and the page feels custom-designed, cohesive, and visually memorable without sacrificing accuracy or clarity. There must be no meaningful clutter, generic KPI-card dumping, weak takeaway, misleading encoding, malformed text, clipping, overlap, or rendering residue. Any notable narrative or design weakness prevents 2.

- **1 分：** Score 1 if the infographic is understandable and reasonably well designed, with a visible main message and usable evidence, but it remains ordinary or imperfect—for example, a weak reading order, limited comparison, crowded charts, generic cards, uneven emphasis, small annotations, or a takeaway that is present but not visually decisive.

- **0 分：** Score 0 even if the required numbers appear when the overall visual story fails: there is no clear dominant insight, the page reads as a cluttered dashboard or raw report, comparisons are hard to interpret, charts or labels are confusing, hierarchy is weak, or the composition looks visibly poor and needs substantial redesign. Blank, corrupted, severely unreadable, materially misleading, or largely incoherent outputs are also 0.

### `digital_banner_ad`

- Case 数：1
- Case：`design_specification_007`
- 当前原始 `target_image_type` 映射：

  - `nutrition_mobile_banner_ad`：`design_specification_007`

视觉质量 VQA：

> As a digital banner or email-header advertisement, does the narrow composition deliver a single decisive focal path across brand, headline, benefit, hero element, CTA where required, and compliance text, while remaining balanced, readable, and visually premium within the constrained horizontal crop?

评分标准：

- **2 分：** Score 2 only if the banner is exceptionally refined and placement-ready: the message is understood almost instantly; brand, headline, benefit, hero element, and CTA are prioritized with precise left-to-right balance; every essential line remains readable at intended display size; crop and safe zones feel intentional; the composition uses the narrow canvas elegantly rather than squeezing a poster into it; and typography, imagery, spacing, contrast, and finish are premium and cohesive. No meaningful tiny text, awkward crop, detached CTA, weak brand separation, clipping, malformed glyph, collision, or generic template feel is allowed. Any uncertainty about real deployment quality prevents 2.

- **1 分：** Score 1 if the banner is clear and usable and looks acceptable or good, but it has visible limitations such as slightly crowded copy, small secondary text, modest brand presence, an ordinary crop, uneven horizontal balance, a somewhat detached CTA, or generally generic execution.

- **0 分：** Score 0 even when the image is valid if the banner format is handled poorly: the core message or identity is not quickly understood, text is squeezed or too small, crop is awkward, balance is visibly weak, CTA or compliance text is unusable, or the composition looks amateurish and needs major redesign. Blank, corrupted, severely unreadable, clipped, or broken banners are also 0.

### `er_diagram`

- Case 数：1
- Case：`relationship_diagram_001`
- 当前原始 `target_image_type` 映射：

  - `er_style_relationship_diagram`：`relationship_diagram_001`

视觉质量 VQA：

> As an ER-style data-model diagram, are entities, keys, attributes where required, relationship labels, cardinalities, domain groupings, and model progression visually precise, technically legible, and polished enough for architecture review?

评分标准：

- **2 分：** Score 2 only if the ER diagram is exceptionally clean and review-ready: every entity name, identifier, attribute, relationship label, and cardinality is readable at normal size; notation is consistent everywhere; relationships can be traced without guessing; domain sections and progression are immediately clear; connectors are routed with minimal crossings; and spacing, alignment, box sizing, typography, and visual rhythm are highly controlled. It must feel like a carefully authored architecture artifact, with no ambiguous cardinality, crowded entity, clipped text, unstable alignment, detached line, or rendering defect. Any technically or visually uncertain element prevents 2.

- **1 分：** Score 1 if the model is understandable and usable for discussion, but it has visible issues such as small labels, crowded boxes, inconsistent spacing, modest crossing, weak grouping, slightly ambiguous notation, or generic diagram styling. It may be solid but not exemplary.

- **0 分：** Score 0 even if an ER diagram is present when the model is visually difficult or unreliable to inspect: cardinalities or relationships are ambiguous, entities are crowded or misaligned, connectors are tangled, labels are unreadable, domain grouping fails, or the diagram looks crude and requires substantial reconstruction. Blank, corrupted, severely unreadable, or materially incomplete outputs are also 0.

### `escalation_hierarchy_chart`

- Case 数：1
- Case：`relationship_diagram_003`
- 当前原始 `target_image_type` 映射：

  - `escalation_relationship_chart`：`relationship_diagram_003`

视觉质量 VQA：

> As an escalation hierarchy chart, does the image make authority, command spine, functional response groups, advisory or external roles, escalation direction, and relationship types immediately distinguishable through a disciplined, polished hierarchy?

评分标准：

- **2 分：** Score 2 only if the chart is exceptionally clear and operationally ready: authority levels are unmistakable at a glance; escalation paths can be traced without hesitation; command, advisory, and external relationships use consistent and unmistakably different visual treatments; groups are cleanly separated; labels are readable; and connector routing, spacing, alignment, typography, and balance are highly controlled. The result must look purpose-built for real incident use, with no tangled links, ambiguous direction, weak group boundary, detached connector, clipping, or amateurish layout. Any uncertainty about responsibility prevents 2.

- **1 分：** Score 1 if responsibility and escalation are mostly understandable and the chart is usable, but it has visible imperfections such as modest link tangling, unclear secondary authority, small labels, weak group separation, uneven node spacing, or advisory lines that are not sufficiently distinct.

- **0 分：** Score 0 even when roles and lines are present if the hierarchy is visually unreliable: authority levels are hard to distinguish, escalation direction is ambiguous, link types are confused, groups blend together, or the layout is cluttered, crude, or difficult to use under time pressure. Blank, corrupted, severely unreadable, or materially incomplete charts are also 0.

### `executive_dashboard`

- Case 数：3
- Case：`data_insight_002`, `data_insight_006`, `data_insight_011`
- 当前原始 `target_image_type` 映射：

  - `campus_energy_review_snapshot`：`data_insight_006`
  - `retail_store_triage_infographic`：`data_insight_011`
  - `warehouse_quality_decision_brief`：`data_insight_002`


视觉质量 VQA：

> As an executive dashboard or decision snapshot, does the image convert complex operational, financial, quality, energy, or performance data into an immediately actionable leadership view—so that the central decision, opportunity, risk, responsible entity, supporting evidence, and next action are understood within seconds at realistic meeting-screen size—without relying on repetitive KPI cards, dense worksheet-like tables, manual comparison, paragraph-style conclusions, tiny supporting text, or unresolved production defects?

评分标准：

- **2 分：** Score 2 only if **all** of the following executive-readiness gates are clearly satisfied. Failure of any one gate limits the score to 1 at most:

  1. **Immediate decision gate:** The principal leadership decision, priority, intervention, opportunity, or recommended action is evident within seconds. The viewer does not need to inspect several cards, compare rows manually, or read a paragraph before understanding what requires attention and why.
  2. **Decision-to-evidence hierarchy:** The primary conclusion dominates, followed by the few metrics that justify it, while diagnostic details are clearly subordinate. Title, summary KPIs, comparisons, alerts, detailed records, methodology notes, and footnotes do not compete at similar visual weight.
  3. **Explicit action direction:** When the content supports an intervention or recommendation, the dashboard clearly communicates the affected entity, the required direction of action, and the reason or threshold behind it. A generic or paragraph-style “key takeaway” without a concise action structure prevents 2.
  4. **Visual synthesis rather than KPI-card accumulation:** Cards, charts, tables, rankings, and callouts each perform a distinct analytical role. Repeated boxes that merely apply the same structure to different values, without adding trend, benchmark, threshold, ranking, or decision context, prevent 2.
  5. **Meaningful comparison:** Leaders can identify relative performance, exceptions, trends, gaps, and priorities without performing mental arithmetic across distant elements. Rankings, deltas, benchmarks, reference lines, distributions, or tightly aligned comparisons make the analytical relationship explicit.
  6. **Table restraint:** Any detail table is supporting, visually subordinate, and limited to information needed for verification or follow-up. A spreadsheet-like block with numerous rows or columns, especially when it occupies a major portion of the dashboard or uses small text, prevents 2 even when neatly styled.
  7. **Meeting-size readability:** Every decision-critical title, KPI, unit, status, label, owner, annotation, takeaway, and necessary table entry remains comfortably readable when the complete dashboard is shown on a normal meeting display or presentation slide. Text that is readable only by zooming into the high-resolution source prevents 2.
  8. **Concise insight writing:** Takeaways, recommendations, and explanatory notes are edited into short, structured statements, action callouts, or compact evidence chains. Dense multi-line paragraphs, long sentences spanning the page, or several conclusions compressed into one box prevent 2.
  9. **Controlled metric density:** Only metrics necessary to support the decision receive meaningful visual space. Excessive secondary values, duplicated figures, minor operational details, and numerous low-priority labels that increase scanning effort prevent 2.
  10. **Coherent status semantics:** Color, icons, borders, labels, and emphasis use a consistent and immediately understandable status system. Positive, neutral, caution, and critical states do not rely on color alone, and the same treatment does not communicate conflicting meanings across sections.
  11. **Proportional alert emphasis:** The visual strength of each warning or success signal matches its decision importance. Decorative red or green borders, oversized percentages without context, or weakly labeled alerts that exaggerate or obscure the underlying issue prevent 2.
  12. **Grid and edge safety:** Cards, charts, tables, titles, annotations, and footer notes remain inside deliberate safe margins and align to a coherent grid. No element touches the canvas edge, appears cropped, uses unstable column widths, or creates visibly uneven rhythm.
  13. **Whole-page resolution:** The dashboard has a clear beginning, analytical middle, and resolved decision ending. No section feels like an unrelated second dashboard, appended worksheet, oversized footer panel, or compressed afterthought.
  14. **Production integrity:** There are no missing-icon squares, replacement glyphs, placeholder symbols, malformed characters, clipped labels, inconsistent number formats, broken units, weak contrast, overlaps, editor residue, or unreadably small footnotes. Any visible unresolved glyph or rendering defect prevents 2.
  15. **Calm executive finish:** Typography, spacing, alignment, borders, fills, emphasis, and visual density feel restrained, authoritative, and specific to the decision context. A generic card dashboard, slide-template composition, or decorated spreadsheet cannot receive 2.

  A dashboard that is accurate, aligned, and color-coded but relies on repeated KPI boxes, a dense small-text table, manual comparison, a paragraph-style takeaway, weak action direction, or unresolved glyphs is usable reporting—not exceptional executive communication—and cannot receive 2.

- **1 分：** Score 1 if the dashboard is understandable, substantially usable in a meeting, and visually acceptable or good, but still requires visible refinement before senior-level presentation. Typical 1-point outputs include clean but generic KPI-card layouts; correct status coloring with limited analytical synthesis; a useful but overly detailed table; small secondary labels; manually inferred rankings; modest decision emphasis; a long takeaway paragraph; weak action direction; repeated card structures; minor grid or safe-margin problems; or a composition that presents the data correctly but does not sufficiently reduce leadership interpretation effort. A dashboard may be factually complete, orderly, and free of major corruption yet still receive only 1 when it behaves more like a formatted report or worksheet than a decisive executive brief.

- **0 分：** Score 0 if the dashboard is visually unreliable, materially difficult to interpret, misleading, or unsuitable as a decision tool. This includes cases where the main priority or action is buried or absent; important values, units, statuses, table entries, or conclusions are unreadable at normal viewing size; viewers must reconstruct the story from raw rows; status encoding is contradictory or misleading; worksheet-like detail dominates the page; major sections are clipped, incomplete, or badly aligned; unresolved rendering defects materially affect use; or substantial redesign is required. Blank, corrupted, severely unreadable, overlapping, materially misleading, or otherwise broken outputs are also 0.

### `exhibit_panel`

- Case 数：1
- Case：`data_selection_006`
- 当前原始 `target_image_type` 映射：

  - `museum_exhibit_feature_panel`：`data_selection_006`

视觉质量 VQA：

> As a museum feature panel or exhibit-introduction graphic, does the image transform objects, stories, themes, locations, and interpretive context into a complete, spatially resolved, visitor-ready exhibit composition rather than a numbered catalog, metadata list, report page, or minimally styled directory? Evaluate the entire canvas at realistic public-viewing distance: title containment and safe margins, visual or narrative anchors, object-to-caption relationships, interpretive hierarchy, visitor reading paths, text density, institutional character, and whether the panel creates understanding or curiosity beyond merely listing object names and fields. Do not award 2 merely because entries are aligned, numbered, readable, consistently separated, or set in formal typography.

评分标准：

- **2 分：** Score 2 only if **all** of the following museum-installation gates are clearly satisfied. Failure of any one gate limits the score to 1 at most:

  1. **Complete title and edge-safety gate:** The full exhibition title, subtitle, section headings, object names, captions, summaries, and footer content must be completely contained within the canvas with deliberate safe margins. No major text may touch, cross, or appear cropped by an image edge. Any clipped or partially missing title, subtitle, object name, or primary heading automatically prevents 2; substantial title cropping or loss of identity requires 0.
  2. **Immediate interpretive proposition:** Visitors must understand within seconds what the panel is about and why the featured material matters. The panel must communicate an interpretive idea, historical relationship, thematic question, or narrative frame—not merely announce a title followed by object metadata.
  3. **Visual or narrative anchoring:** Objects, stories, places, or themes must be supported by meaningful object imagery, archival material, illustration, maps, diagrams, timelines, spatial groupings, or an equivalently strong typographic narrative device. Imagery is not mandatory in every valid panel, but an entirely image-free design must demonstrate exceptional interpretive art direction and cannot resemble a numbered inventory, index, directory, or database export.
  4. **Object-to-context integration:** Each featured object or story must have an unmistakable relationship to its caption, era, location, theme, or interpretive text. Metadata fields must be visually integrated into the story rather than repeated as identical label-value lines beneath every entry.
  5. **Interpretive hierarchy:** Title, introductory context, featured objects or stories, supporting metadata, thematic connections, and concluding takeaway must have clearly different visual roles. Object names, eras, galleries, themes, and summary information must not appear with nearly equal weight or force visitors to decode a repetitive field structure.
  6. **Visual synthesis rather than catalog listing:** The panel must edit, group, compare, connect, or contextualize its material. A vertical numbered list of names followed by repeated fields such as era, gallery, category, or theme is not sufficient for 2, even when accurate, evenly spaced, and attractively typeset.
  7. **Visitor-distance readability:** Primary content must be readable from an appropriate standing distance, while captions and supporting text must remain comfortable at normal close viewing. Oversized headings combined with comparatively small metadata, long text lines, or typography that requires visitors to move excessively close prevent 2.
  8. **Comfortable pacing and dwell structure:** The panel must offer intentional entry points, pauses, focal moments, and a resolved reading path. Repeated rows with identical rhythm, long uninterrupted lists, excessive horizontal rules, or monotonous top-to-bottom scanning prevent 2.
  9. **Purposeful summary and ending:** Any summary, legend, theme list, object count, era span, or location index must add interpretation or navigation value. A footer that simply repeats information already visible above, or reads like a dataset summary, prevents 2.
  10. **Distinct institutional character:** Typography, color, imagery, materials, spacing, and composition must feel specifically appropriate to a museum, gallery, archive, science center, or cultural institution. Formal serif typography and muted colors alone do not establish museum-grade design.
  11. **Whole-canvas resolution:** The panel must feel intentionally composed from edge to edge, with balanced margins, controlled negative space, and a clear visual ending. There may be no accidental cropping, awkward empty bands, excessive unused space, weak alignment, unfinished lower area, or mismatch between content volume and canvas dimensions.
  12. **Production finish:** No malformed glyph, clipped line, overlapping element, weak crop, detached caption, inconsistent baseline, unstable spacing, ambiguous numbering, low-contrast text, visible placeholder, or other production defect is allowed.

  A clean, readable page consisting mainly of a large heading, a numbered list of object names, repeated metadata lines, separator rules, and a factual footer is an organized catalog page—not an exceptional exhibit panel—and cannot receive 2.

- **1 分：** Score 1 if the panel is readable, informative, mostly complete, and usable as a preliminary visitor graphic, but still requires visible interpretive or visual refinement before installation. Typical 1-point outputs include text-led object directories; repeated name–era–location–theme records; minimal or absent imagery; weak narrative framing; generic institutional styling; monotonous row rhythm; redundant dataset-like summaries; oversized title treatment; limited visual connection among objects; modest visitor pacing; or minor spacing and margin problems. A panel may be accurate, aligned, and professionally typeset yet still receive only 1 when it catalogs information rather than creating a convincing museum interpretation.

- **0 分：** Score 0 if the panel is visually incomplete, materially cropped, difficult to use, misleading, or unsuitable for public installation. This includes a major title, subtitle, object name, caption, or section being cut off by the canvas; object-caption relationships being unclear; interpretive hierarchy being absent; text scale or density making normal viewing impractical; the result functioning primarily as a raw inventory or minimally styled source-data list; or substantial redesign being required. Blank, corrupted, severely unreadable, overlapping, materially incomplete, or otherwise broken panels are also 0.

### `instructional_guide`

- Case 数：2
- Case：`procedure_instruction_001`, `procedure_instruction_003`
- 当前原始 `target_image_type` 映射：

  - `classroom_bench_instruction_image`：`procedure_instruction_003`
  - `instructional_workflow_image`：`procedure_instruction_001`

视觉质量 VQA：

> As an instructional guide, workflow image, setup card, safety card, care guide, or classroom bench card, does the image transform the full procedure into a complete, glance-followable, and operationally safe visual aid rather than a densely typeset instruction sheet, so that users can distinguish each action, object, quantity, condition, transition, repetition, warning, checkpoint, and completion cue without repeatedly reading paragraph-like text, with the smallest instructional text readable at the intended physical size, sequence and repeated cycles visually encoded, warnings placed beside the relevant actions, icons or diagrams corresponding correctly to the instructions, and the entire page remaining consistent and complete?

评分标准：

- **2 分：** Score 2 only if **all** of the following real-deployment gates are clearly satisfied. Failure of any one gate limits the score to 1 at most:

  1. **Glance-followable action structure:** Each step must expose the principal action, object, quantity or setting, and immediate outcome through clear visual separation. Users should not need to parse paragraph-like prose or several similarly weighted sentences to determine what to do next.
  2. **Operational sequence clarity:** The order, phase changes, branches, returns, waits, repetitions, and completion points must be visually unmistakable. Repeated cycles such as washing, checking, tightening, watering, restarting, or waiting must be encoded so that the number of repetitions and the point of return cannot be confused.
  3. **Action-to-visual correspondence:** Icons, diagrams, illustrations, arrows, panels, or other visual devices must materially clarify tools, orientation, placement, motion, connections, quantities, or expected states. Visuals are not mandatory for every step, but a predominantly text-only guide must demonstrate exceptional typographic process design and cannot resemble a memo, worksheet, manual excerpt, or numbered document.
  4. **Immediate parameter recognition:** Critical quantities, durations, temperatures, counts, directions, settings, materials, and result criteria must be visually distinct from explanatory text. Important parameters buried inside sentences, long lines, or low-emphasis body copy prevent 2.
  5. **Contextual warning placement:** Safety warnings, contamination risks, prohibited actions, fragile steps, and irreversible actions must appear at or immediately beside the step where the risk occurs. A general warning block placed only at the bottom or far from the relevant action is insufficient for 2 when users could act before seeing it.
  6. **Warning hierarchy proportional to risk:** High-risk warnings must be visually more prominent than routine notes and must not rely only on a small icon, pale background, or dense sentence. The user must be able to distinguish danger, caution, timing, optional advice, and ordinary instruction instantly.
  7. **Normal-size readability under use conditions:** Every meaningful instruction, warning, label, parameter, legend, and result cue must be comfortably readable at the intended print or display size while the user is performing the task. Small body text, tightly packed lines, long text blocks, or narrow line spacing that demand close inspection prevent 2.
  8. **Controlled information density:** Steps must be concise enough to scan during execution. Dense multi-sentence steps, excessive parenthetical information, long inline lists, repeated procedural prose, or numerous facts with equal visual weight prevent 2 even when no text is technically illegible.
  9. **Distinct checkpoints and outcomes:** Wait states, validation checks, success conditions, failure conditions, result interpretation, and final completion cues must be visually separated from ordinary actions. Users must know when to stop, verify, repeat, proceed, or seek help without searching through body text.
  10. **Complete and polished artifact:** The full sequence, final section, warnings, footer, legends, and completion state must be visibly contained and finished. No clipped content, orphaned heading, malformed glyph, inconsistent numbering, ambiguous color coding, weak contrast, unstable alignment, incomplete final step, or visible production residue is allowed.

  A clean numbered page made mainly of bold step titles followed by small explanatory paragraphs, with limited action diagrams and warnings separated from their relevant steps, is an organized instruction sheet rather than an exceptional instructional visual and cannot receive 2.

- **1 分：** Score 1 if the guide is understandable, mostly complete, and generally usable, but still requires visible refinement before dependable real-world deployment. Typical 1-point outputs include clearly numbered but text-heavy procedures; long explanatory lines beneath each step; limited diagrams or action icons; quantities and timings embedded inside prose; repeated cycles explained verbally rather than visually; warnings placed mainly in separate footer boxes; modest distinction between action, parameter, note, and result; small but readable text; generic colored labels; uneven spacing; or a layout that resembles a formatted handout, manual page, checklist, or classroom worksheet. A guide may be accurate, aligned, and logically ordered yet still receive only 1 when users must read carefully rather than act at a glance.

- **0 分：** Score 0 if the guide is visually unreliable, materially difficult to follow, incomplete, or unsafe for practical use. This includes cases where sequence or phase boundaries are confusing; steps, repetitions, quantities, directions, tools, warnings, or result criteria are difficult to locate; essential safety information is visually buried or detached from the risky action; text density or size makes consultation impractical during execution; icons or diagrams conflict with the instructions; the final state is unclear; or substantial redesign is required to prevent mistakes. Blank, corrupted, severely unreadable, clipped, overlapping, misleading, materially incomplete, or otherwise broken outputs are also 0.

### `paid_social_ad`

- Case 数：3
- Case：`design_specification_001`, `design_specification_002`, `design_specification_004`
- 当前原始 `target_image_type` 映射：

  - `finance_app_compliance_ad`：`design_specification_004`
  - `paid_instagram_story_event_creative`：`design_specification_002`
  - `saas_feature_linkedin_paid_image`：`design_specification_001`

视觉质量 VQA：

> As a paid social-media advertisement, does the image integrate brand, approved hero visual, headline, benefit or event message, proof or compliance content, and CTA into one platform-native, conversion-focused, highly polished composition rather than an internal draft or generic template?

评分标准：

- **2 分：** Score 2 only if the ad is exceptional and ready for paid placement without revision: brand, hero, message, benefit or proof, CTA, and required compliance text form one decisive focal hierarchy; the crop feels native to the declared platform; all essential text is readable at intended feed or story size; visual style is distinctive, premium, and coherent; and spacing, typography, imagery, contrast, and safe zones are meticulously controlled. No generic template feel, weak hero, competing copy, detached CTA, undersized disclaimer, malformed glyph, awkward crop, or visible rendering flaw is allowed. Any meaningful campaign-quality concern prevents 2.

- **1 分：** Score 1 if the ad is clear, usable, and looks acceptable or good, but it remains ordinary or visibly imperfect—for example, generic styling, modest brand or hero prominence, slightly small compliance text, competing messages, detached CTA, or a somewhat awkward crop.

- **0 分：** Score 0 even when all expected elements are present if the ad looks visibly poor or would not be credible as paid media: focal hierarchy is weak, brand or offer is unclear, crop is badly handled, text is difficult to read, disclaimer or CTA is unusable, or the composition appears amateurish and needs substantial redesign. Blank, corrupted, severely unreadable, or broken outputs are also 0.

### `promotional_poster`

- Case 数：1
- Case：`document_brief_001`
- 当前原始 `target_image_type` 映射：

  - `course_poster`：`document_brief_001`

视觉质量 VQA：

> As a promotional poster or recommendation flyer, does the image create an immediate focal offer, clearly prioritize featured items and supporting details, and combine persuasive visual energy with an elegant hierarchy, readable action information, and high-end poster craft, so that the core offer is understood instantly, the hero focal point is strong, the CTA is easy to find, and the overall composition feels publication-ready rather than generic or unfinished?

评分标准：

- **2 分：** Score 2 only if the poster is exceptionally compelling and publication-ready: the core offer or recommendation is understood instantly; featured items, prices or details, and action information are clearly separated and easy to scan; the hero focal point is strong; typography, imagery, color, spacing, alignment, and margins are sophisticated and cohesive; promotional emphasis feels deliberate rather than loud or generic; and the whole composition is memorable, balanced, and nearly flawless. No cramped details, unclear CTA, generic sale-template look, weak imagery, malformed text, clipping, overlap, or visible cleanup issue is allowed. Any meaningful professional revision prevents 2.

- **1 分：** Score 1 if the poster is understandable, usable, and visually decent or attractive, but it remains ordinary or has visible flaws such as a modest focal point, cramped details, uneven item emphasis, generic promotional styling, slightly weak CTA, or minor typography and spacing issues.

- **0 分：** Score 0 even when the offer is technically present if the poster looks visibly poor, confusing, or unconvincing: focal hierarchy is weak, items or action details are hard to scan, imagery or typography is crude, composition is cluttered or empty, or the result requires substantial redesign. Blank, corrupted, severely unreadable, clipped, or broken posters are also 0.

### `public_information_poster`

- Case 数：2
- Case：`data_selection_002`, `data_selection_005`
- 当前原始 `target_image_type` 映射：

  - `grant_winner_announcement`：`data_selection_002`
  - `volunteer_recruitment_image`：`data_selection_005`

视觉质量 VQA：

> As a public-information, recruitment, route, award, community, advocacy, or detour poster, does the image transform the public message into an immediately understandable, visually purposeful, and publication-ready poster rather than merely placing readable text into a document-like layout? Judge the clarity of the main takeaway, audience and applicable time, place, route, status, or action details; the strength of visual hierarchy and information grouping; the meaningful use of the full canvas; the suitability of visual devices for the message; and the overall accessibility, specificity, polish, and public-facing credibility.

评分标准：

- **2 分：** Score 2 only for an exceptional, professionally art-directed poster that is ready for prominent public distribution without revision. The main public takeaway and any applicable action, audience, time, place, route, award, status, or community detail must be understood within seconds through a decisive focal point and a clearly differentiated reading sequence. Information must be visually synthesized rather than merely listed: typography, scale, grouping, icons, imagery, diagrams, maps, emphasis devices, or other graphic elements must meaningfully help viewers distinguish priorities, categories, routes, winners, changes, or actions. The full canvas must feel intentionally composed, with strong balance, controlled density, efficient use of space, refined alignment, consistent spacing, accessible contrast, and polished margins. The design must feel specific to the message and audience, not like a generic report, slide, form, spreadsheet, or repeated-card template. All visible text must remain comfortably readable at normal viewing size, and no malformed glyph, weak contrast, clipping, overlap, accidental crop, decorative distraction, inconsistent styling, or production residue is allowed. Large dead zones, excessive unused space, monotonous repeated boxes, text-only document composition, weak visual storytelling, generic template styling, or any section that appears unfinished automatically prevents 2.

- **1 分：** Score 1 if the poster is understandable, usable, and visually acceptable or good, but it remains visibly underdesigned or would require professional refinement before prominent public release. This includes clean but document-like or slide-like layouts; mostly textual lists placed inside repeated cards; limited meaningful imagery or visual encoding; weak distinction between primary and secondary information; ordinary or generic styling; excessive empty space; uneven use of the canvas; monotonous section treatment; modest action or takeaway emphasis; small supporting text; or minor spacing, accessibility, balance, and consistency issues. A poster may be fully legible and free of rendering defects yet still receive only 1 when its visual communication is basic rather than exceptional.

- **0 分：** Score 0 if the poster is visually poor, unreliable, or not practically suitable for public use. This includes cases where the essential message, affected audience, applicable timing, location, route, status, or action is difficult to identify; hierarchy and grouping are confusing; typography or contrast materially harms reading; the composition is severely unbalanced or unfinished; decoration competes with information; visual encoding is misleading; or substantial redesign is needed for dependable public communication. Blank, corrupted, severely unreadable, materially misleading, clipped, overlapping, or otherwise broken posters are also 0.

### `reference_infographic`

- Case 数：1
- Case：`document_brief_006`
- 当前原始 `target_image_type` 映射：

  - `coordination_infographic`：`document_brief_006`

视觉质量 VQA：

> As a partner-orientation quick-reference infographic intended for both projection and print, does the image make the core model, clarification notes, relationship cues, and scenario examples immediately scannable through exceptional hierarchy, legibility, connector clarity, and dual-format production polish?

评分标准：

- **2 分：** Score 2 only if the artifact is outstanding and fully ready for both a projected 16:9 slide and a printed US-letter handout: every title, body line, note, relationship label, and example is comfortably readable at normal use size; the core model, three clarification notes, and four scenario examples are instantly grouped and navigable; connectors and labels are precise and never compete with text; light-canvas requirements, margins, spacing, alignment, typography, density, and contrast are impeccably controlled; and the entire piece feels custom, elegant, and production-finished. Any crowding, small text, generic card layout, weak grouping, awkward connector, rendering artifact, or uncertainty about either projection or print quality prevents 2.

- **1 分：** Score 1 if the artifact is understandable and useful as a quick reference, but a professional reviewer would still revise it before distribution because of issues such as crowded cards, slightly small or uneven text, generic organization, weak grouping, awkward connectors, modest legibility, or inconsistent spacing.

- **0 分：** Score 0 even when most sections are present if the quick reference is visually poor or impractical: projection or print readability is weak, relationships are difficult to follow, section grouping is confusing, density is excessive, or the layout needs substantial redesign. Blank, corrupted, severely unreadable, materially incomplete, or broken outputs are also 0.

### `release_announcement`

- Case 数：2
- Case：`state_change_001`, `state_change_004`
- 当前原始 `target_image_type` 映射：

  - `current_software_release_announcement`：`state_change_001`
  - `current_software_rollout_announcement`：`state_change_004`

视觉质量 VQA：

> As a current software release or rollout announcement, does the image transform the product identity, version, release state, availability or rollout timing, key improvements, qualifications, and next action into a distinctive, publication-ready launch visual rather than a readable specification sheet? Judge the immediacy of the current-state message, the visual prominence of version and status, the synthesis of launch highlights, the treatment of rollout or availability information, the strength and placement of the CTA, the intentional use of the full canvas, and whether the result feels like a designed customer launch campaign instead of a document, release note, help-center page, or technical fact sheet. Do not award 2 merely because the text is correct, aligned, legible, and separated by section rules.

评分标准：

- **2 分：** Score 2 only if **all** of the following launch-quality gates are clearly satisfied; failure of any one gate limits the score to 1 at most:

  1. **Immediate release-state communication:** Product identity, current version or rollout state, maturity or channel, and primary availability timing must be understood within seconds. Version and current status must function as deliberate launch elements, not merely appear inside a large heading or subtitle.
  2. **Campaign-level visual concept:** The composition must have a distinctive product-launch identity through product imagery, interface visuals, branded illustration, rollout graphics, purposeful iconography, or an exceptionally strong typographic concept. Product imagery is not mandatory, but a text-only design must demonstrate outstanding art direction and cannot resemble a memo, release note, brochure page, or specification sheet.
  3. **Visual synthesis of information:** Key improvements, rollout stages, eligibility, exceptions, system requirements, and supporting qualifications must be edited and visually grouped according to customer priority. Raw label-value lines, long technical lists, repeated plain text sections, or information separated only by horizontal rules do not constitute exceptional visual communication.
  4. **Decisive hierarchy:** The release message, customer benefit, launch highlights, rollout timing, qualifications, and action must have clearly different visual weights. Supporting compatibility or deployment details must not compete with the release headline or make the announcement feel like documentation.
  5. **Integrated and actionable CTA:** The next action must be prominent, specific, visually resolved, and clearly connected to the release message. A plain outlined rectangle, detached footer link, generic text button, or CTA surrounded by excessive empty space prevents 2.
  6. **Whole-canvas composition:** Content, imagery, negative space, margins, and vertical rhythm must be intentionally balanced across the complete canvas. There may be no conspicuous unused lower region, top-heavy composition, oversized canvas, abrupt end to the designed content, or large blank area that makes the artifact appear unfinished.
  7. **Premium production finish:** Typography, color, spacing, alignment, section transitions, badges, visual accents, and brand treatment must feel refined and consistent at normal viewing size. No tiny qualification text, weak contrast, awkward line break, generic divider treatment, malformed glyph, clipping, overlap, accidental crop, unstable alignment, or visible cleanup issue is allowed.

  A clean and accurate one-column announcement composed mainly of headings, label-value text, bullet points, horizontal dividers, and a basic CTA is a usable release information sheet, not an exceptional launch artifact, and cannot receive 2.

- **1 分：** Score 1 if the announcement is clear, readable, correct-looking, and substantially usable, but still needs visible creative or compositional refinement before prominent customer publication. Typical 1-point outputs include polished but document-like release summaries; plain single-column layouts; technical details presented as label-value lists; repeated horizontal section dividers; limited product imagery or launch storytelling; generic corporate colors; weak separation between launch highlights and system requirements; modest version or status treatment; a basic or detached CTA; excessive unused space; top-heavy content distribution; or styling that resembles release notes, documentation, a slide, or a help-center article. An artifact may be perfectly legible and free of rendering defects yet still receive only 1 when it communicates information without creating a convincing launch experience.

- **0 分：** Score 0 if the announcement is visually poor, unreliable, materially confusing, or unsuitable for customer publication. This includes cases where product identity, current version, release state, timing, eligibility, rollout scope, or next action is difficult to identify; current and superseded states visually compete; important qualifications are hidden or unreadable; hierarchy is chaotic; the layout is severely empty, crowded, fragmented, or unfinished; the CTA is effectively unusable; or substantial redesign is required. Blank, corrupted, severely unreadable, clipped, overlapping, misleading, or otherwise broken outputs are also 0.

### `social_campaign_creative`

- Case 数：2
- Case：`multi_source_fusion_001`, `multi_source_fusion_003`
- 当前原始 `target_image_type` 映射：

  - `instagram_portrait_feed_campaign_image`：`multi_source_fusion_001`
  - `product_campaign_image`：`multi_source_fusion_003`

视觉质量 VQA：

> As a customer-facing social campaign creative, does the image fuse the selected subject or product, audience-relevant setting, campaign message, approved benefit or proof, brand identity, and CTA into one distinctive, platform-native, highly polished feed composition?

评分标准：

- **2 分：** Score 2 only if the creative is exceptional and ready for campaign deployment: the subject or product is unmistakably dominant; setting, message, proof, brand, and CTA reinforce one another in a single coherent concept; the crop feels native to the intended feed placement; essential text is readable at feed size; and imagery, typography, color, spacing, and finish are distinctive, premium, and meticulously controlled. No generic campaign template, weak subject focus, disconnected proof, competing copy, detached CTA, awkward crop, malformed text, or rendering flaw is allowed. Any meaningful campaign-quality concern prevents 2.

- **1 分：** Score 1 if the creative is coherent, usable, and visually decent or attractive, but it remains ordinary or visibly imperfect—for example, generic styling, modest product or destination focus, disconnected proof points, competing copy, a weak CTA, or a slightly awkward crop.

- **0 分：** Score 0 even when campaign elements are present if the output looks poor or fails to cohere: subject, setting, message, proof, brand, and CTA feel disconnected; focal hierarchy is weak; text or crop is badly handled; or the composition requires substantial redesign before use. Blank, corrupted, severely unreadable, or broken creatives are also 0.
