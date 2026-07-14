# Production activation resolution rules

These rules are applied **after** the correction-request rules in `controlled_correction_instructions.md`.

## Activation snapshot

- Architecture snapshot: `2026-06-30 16:30`
- Deployment-event cutoff: `2026-06-30 16:20`
- Target catalog: `4.8`
- Target bundle: the bundle selected by the correction-control rules
- Target scope: `Central Service-to-Cash`
- Target environment: `production`

## Wave selection

1. Group `deployment_wave_log.csv` by `wave_id` and ignore events after the deployment-event cutoff.
2. For each wave, use its latest qualifying event.
3. Select the wave that matches the target catalog, selected bundle, scope, and environment; whose latest state is `ACTIVATED`; and whose effective time is on or before the architecture snapshot.
4. A superseded, future-effective, other-scope, staging, or post-cutoff wave is not the current production wave.

## Unit activation

1. A correction request must first be applicable under the correction-request rules. Request approval or `IMPLEMENTATION_READY` alone does not make it active in production.
2. Use only units in the selected wave and resolve each unit by its latest event at or before the deployment-event cutoff.
3. A unit is active only when its latest state is `PRODUCTION_VERIFIED`.
4. `ROLLED_BACK`, `SUSPENDED`, `FAILED`, `CANARY_ONLY`, and post-cutoff verification do not activate a unit.
5. Units in the same `atomic_group_id` are all-or-nothing. If any member of the group is not active, none of the group's requests changes the production model.
6. Every unit listed in `depends_on_unit_ids` must also be active.
7. Apply the surviving active requests by `apply_order`. An inactive deployment leaves the pre-deployment model state in place.
8. A fact-level correction changes only the single displayed business fact; entity identity, PK, FKs, and relationships remain unchanged unless another active request changes them.

## Diagram handoff

- Subtitle: `Catalog 4.8 | Bundle CB-0626-B | Wave DW-0630-C | 27 entities | 33 relationships`.
- Add a compact root-request provenance tag to an entity when its active entity name or displayed business fact differs from the Catalog 4.8 baseline.
- Do not show deployment unit IDs, event states, rollback notes, or atomic-group names as diagram nodes.
- Rolled-back or suspended changes must not appear as the current production state.
