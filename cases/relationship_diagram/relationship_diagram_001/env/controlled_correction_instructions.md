# Controlled correction resolution rules

This file defines how to reconcile the baseline Catalog 4.8 model with the correction-control records.

## Review snapshot

- Target environment: `production`
- Target process scope: `Central Service-to-Cash`
- Architecture snapshot: `2026-06-30 16:30`
- Control-event cutoff: `2026-06-30 16:00`
- The selected bundle must be for Catalog 4.8, match the target scope, be both approved and released by the control-event cutoff, and be effective by the architecture snapshot.
- A later bundle event supersedes an earlier event for the same bundle.

## Request resolution

1. Start from the approved Catalog 4.8 production model derived from the original catalog, scope notice, and review pack.
2. Use only requests belonging to the selected bundle.
3. Ignore request events recorded after the control-event cutoff.
4. Resolve each request using its latest qualifying event. A request is applicable only when:
   - its latest qualifying state is `IMPLEMENTATION_READY`;
   - an earlier `APPROVED` event exists;
   - its proposed effective time is on or before the architecture snapshot;
   - its scope and environment match the target;
   - every request listed in `dependency_ids` is also applicable.
5. `REJECTED`, `WITHDRAWN`, `PENDING_REVIEW`, and `SUPERSEDED` requests are not applied.
6. Apply applicable requests in ascending `apply_sequence`.
7. When an applicable request supersedes another request, the superseded proposal must not survive in the final model.
8. A rename carries the existing relationships forward to the renamed entity unless a separate applicable request changes them.
9. A removed FK also removes the relationship driven by that FK.
10. Current relationship direction is determined by the child record that stores the FK.

## Diagram handoff

- Keep the original four-domain order.
- Show the current snapshot entity count and relationship count in the subtitle.
- For each changed entity, show the root correction request in a compact provenance tag:
  - the new coverage-decision entity uses its add-entity request;
  - a renamed entity uses its rename request.
- Do not show event histories, rejected proposals, future-effective changes, inactive bundle IDs, or internal implementation states as active diagram content.
- Continue to show only PKs, current relationship-driving FKs, and the single approved business fact for controlled bridge/evidence records.
