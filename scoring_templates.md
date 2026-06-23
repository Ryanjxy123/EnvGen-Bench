# Scoring Templates

Use these templates when writing or reviewing case checklists. The common rule
is: environment-grounded correctness dominates the score, while visual polish
is independent and cannot compensate for missing core facts.

## Standard Weights

| Dimension | Weight | Main question |
| --- | ---: | --- |
| Task Completion | 15% | Does the image complete the requested artifact purpose with the required core content? |
| Grounded Requirement Satisfaction | 55% | Are critical/major env facts correct, optional facts handled fairly, and negative-only distractors excluded? |
| Information Structuring | 15% | Are mostly-correct facts selected, compressed, grouped, ordered, and emphasized well? |
| Visual Rendering Quality | 15% | Is the image readable, polished, coherent, and platform-appropriate? |

For legacy robustness cases, use 15% / 50% / 15% / 10% / 10% across Task,
Grounded, Structuring, Visual, and Robustness.

## Fact Roles

| Role | Required in image? | Scoring behavior |
| --- | --- | --- |
| `critical_required` | Yes | Missing/wrong values heavily reduce grounded score. |
| `major_required` | Yes | Missing/wrong values reduce grounded score; light paraphrase is acceptable. |
| `optional` | No | Omission receives full credit; score only if included incorrectly. |
| `negative_only` | No | Award credit when absent; deduct only when explicitly included. |

## Task-Type Grounding Focus

| Task type | Grounded core |
| --- | --- |
| `data_selection` | Correct selected objects, correct excluded objects, and correct displayed fields. |
| `data_insight` | Correct calculations, aggregation, ordering, comparisons, and conclusions. |
| `design_specification` | Current approved copy, layout, brand rules, required visual components, and forbidden/deprecated exclusions. |
| `document_brief` | Final public information extracted from long documents, with drafts/internal/outdated details excluded. |
| `multi_source_fusion` | Facts merged across files, conflict precedence resolved, and unsupported source claims excluded. |
| `procedure_instruction` | Correct step order, critical actions, conditions, branches, warnings, and completion states. |
| `relationship_diagram` | Correct nodes, edges, directionality, hierarchy, grouping, and relationship semantics. |
| `state_change` | Correct current state after updates, before/after distinctions, and deprecated information excluded. |

## Dimension Guidance

Task Completion is not just image existence. It should score low for polished
placeholders, generic mockups, raw tables, empty templates, or images that admit
the content could not be finalized.

Grounded Requirement Satisfaction should carry the case. Critical facts should
have the largest item weight or be bound to high-value checklist items. Optional
facts must not be counted as missing.

Information Structuring should depend on mostly-correct facts. A clean layout
with wrong or absent core content should receive little structuring credit.

Visual Rendering Quality should ignore factual correctness except for genuine
readability. Missing facts are not unreadable text; only text that visually
cannot be read should reduce readability credit.
