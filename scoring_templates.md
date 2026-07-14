# Scoring Templates

Use `scoring_checklist.schema.json` for all cases. Image evaluation has two
scored dimensions:

Before assigning a visual type to a new case, consult
[`visual_vqa_catalog.md`](visual_vqa_catalog.md) and reuse an existing type when
its visual purpose matches the task.

| Dimension | Weight | Mechanism |
| --- | ---: | --- |
| Grounded Requirement Satisfaction | 80% | One or more case-specific VQAs, each scored `0/1/2`; average and scale to 0-100. |
| Visual Rendering Quality | 20% | Exactly one task-type-specific VQA with explicit score-0/1/2 criteria. |

Task completion is a gate: a missing or invalid `rendered_image.png` produces a
total score of 0 without judge calls.

## Required Case Structure

```json
{
  "case_id": "example_001",
  "evaluation_mode": "image_vqa_0_2",
  "dimension_weights": {
    "grounded_requirement_satisfaction": 0.8,
    "visual_rendering_quality": 0.2
  },
  "grounded_requirement_satisfaction": {
    "vqa_items": []
  },
  "visual_rendering_quality": {
    "image_type": "promotional_poster",
    "vqa_items": [
      {
        "id": "visual_q01",
        "question": "Type-specific visual quality question.",
        "score_criteria": {
          "2": "Strict production-ready standard; every gate must pass and no visible defect is allowed.",
          "1": "Understandable and usable, but at least one visible issue requires professional revision.",
          "0": "Broken, severely unreadable, incoherent, or practically unusable."
        }
      }
    ]
  }
}
```

Cases with the same `image_type` must use byte-for-byte identical visual
questions and score criteria. The canonical templates are maintained by
`envgen-evaluation/scripts/migrate_case_vqa.py` and copied into every case; the
runtime evaluator reads the case directly and never classifies image type.

Score 2 is intentionally strict. All important content must be readable at
normal size; structure and type-specific function must be immediate; alignment,
spacing, hierarchy, contrast, typography, color, margins, and balance must be
controlled; and no overlap, clipping, malformed glyph, broken connector,
misleading encoding, editor residue, or other cleanup issue may be visible.
