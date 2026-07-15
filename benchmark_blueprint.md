# Benchmark Blueprint

EnvGen-Bench tests whether an agent can turn task-local evidence into a correct,
usable image. The benchmark measures the reasoning that precedes generation:
retrieval, filtering, calculation, precedence resolution, cross-source fusion,
and verification.

## Current Scope

The active benchmark contains **22 optimized closed-environment cases**.
Expansion is quality-gated rather than count-driven: a case enters the active
set only after it satisfies `case_skeleton.md` and `review_policy.md`.

| Task dimension | Active cases | Core operation |
| --- | --- | --- |
| `data_insight` | `001`, `002`, `006`, `011` | Calculate, aggregate, compare, rank, and communicate data findings. |
| `data_selection` | `002`, `003`, `005`, `006` | Resolve eligibility and histories, then select under ordered constraints. |
| `design_specification` | `001`, `002`, `004`, `007` | Resolve current copy, placement, rights, and asset rules into a compliant design. |
| `document_brief` | `001`, `006` | Extract authoritative facts from realistic documents and amendments. |
| `multi_source_fusion` | `001`, `003` | Join analytical, audience, campaign, compliance, and asset evidence. |
| `procedure_instruction` | `001`, `003` | Convert manuals and local overrides into a safe, ordered visual procedure. |
| `relationship_diagram` | `001`, `003` | Resolve entities and active relationships into a scoped diagram. |
| `state_change` | `001`, `004` | Reconstruct an as-of state and exclude stale, pending, or invalid records. |

## Evaluation Model

Every case uses `image_vqa_0_2`.

| Component | Weight | Rule |
| --- | ---: | --- |
| Task completion | gate | Missing or invalid `rendered_image.png` gives total score 0. |
| Grounded Requirement Satisfaction | 80% | Case-specific VQAs scored `0/1/2`, then averaged. |
| Visual Rendering Quality | 20% | Exactly one canonical image-type VQA scored `0/1/2`. |

Grounded accuracy is the primary objective. A polished image must still lose
credit for missing facts, wrong calculations, stale state, unsupported claims,
incorrect relationships, unsafe steps, or forbidden content.

## Case Design Axes

A strong case combines several independent difficulties without becoming
artificially noisy:

- **Evidence resolution:** joins, revisions, cutoffs, approvals, fallbacks, and
  source authority.
- **Reasoning operation:** selection, calculation, comparison, ordering,
  diagramming, or multi-source synthesis.
- **Negative control:** plausible but invalid, stale, out-of-scope, or unsafe
  alternatives that must be excluded.
- **Visual communication:** an image type whose function matches the task and
  whose required content can be judged from the rendered pixels.
- **Auditability:** every scored answer is traceable and every acceptance rule
  distinguishes `0`, `1`, and `2` reliably.

Difficulty should come from meaningful dependency resolution, not unnecessary
file count, obscure formatting, or answer leakage.

## Environment and Source Policy

- Current cases are `closed_env`; required facts must be locally available.
- Use only task-relevant files and realistic format combinations.
- Cache external sources and record provenance, retrieval date, usage terms,
  and transformations.
- Keep review caches, generated answer aids, and temporary build artifacts out
  of agent-visible material.
- Use documents and assets that remain readable and reproducible without live
  network access.

Future `web_required` or `web_helpful` cases may be added only when their web
dependency is explicit, stable, reproducible, and supported by the evaluation
runtime.

## Build and Promotion Flow

1. Choose a dimension and a genuinely distinct dependency pattern.
2. Build the minimal realistic `env/` and write a non-leaking `task.md`.
3. Resolve the task independently and encode traceable expected facts.
4. Write grounded VQAs and reuse the canonical visual VQA for the image type.
5. Audit solvability, precedence, negatives, provenance, and cross-file
   consistency.
6. Validate the repository and promote only cases that pass review.
