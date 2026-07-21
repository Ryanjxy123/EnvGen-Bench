# Governed architecture-view projection rules

Apply these rules only after resolving the Catalog 4.8 baseline, correction bundle, production wave, and active deployment units.

## Review target

- Architecture snapshot: `2026-06-30 16:35`
- Architecture-view event cutoff: `2026-06-30 16:27`
- Target catalog: `4.8`
- Target bundle and wave: the current production bundle and wave resolved by the earlier control layers
- Target scope: `Central Service-to-Cash`
- Target audience: `Architecture Review Board`

## Select the current profile

1. In `architecture_view_profile_log.csv`, ignore events after the architecture-view cutoff.
2. Resolve each profile by its latest permitted event.
3. Select the profile that matches the target catalog, bundle, wave, scope, and audience; has latest state `ACTIVATED`; and is effective by the architecture snapshot.
4. Superseded, canary-only, wrong-audience, wrong-scope, future-catalog, post-cutoff, and other-wave profiles do not control the diagram.
5. Use only the manifest identified by the selected profile.

## Resolve manifest rules

1. In `architecture_view_manifest.csv`, group by `rule_key`.
2. Ignore rows after the architecture-view cutoff.
3. For each key, select the latest `recorded_at`. When timestamps tie, the larger `revision_no` controls.
4. Apply only controlling rows whose `rule_state` is `ACTIVE`.
5. Apply active rules in ascending `apply_order`.
6. Rule targets are matched to the production entity identity before any view rename.

## Rule effects

- `HIDE_ENTITY`: omit the entity and every incident relationship. Because only relationship-driving FKs are shown, omit FKs that no longer drive a visible relationship.
- `HIDE_RELATIONSHIP`: omit that relationship and omit its child FK from the visible entity.
- `RENAME_ENTITY`: change only the diagram display name; carry the current PK, visible FKs, and surviving relationships to the new display name.
- `RENAME_FACT`: replace only the approved displayed business-fact label; do not change PKs, FKs, or relationships.
- The projection may remove or rename content, but it does not create a new relationship unless an explicit active rule says so.

## Provenance tags

- Preserve the active root correction tag when production identity or the displayed fact already differs from Catalog 4.8.
- Add the controlling `VP-...` rule tag when the architecture view changes an entity display name, displayed fact, or visible FK set.
- Combine tags compactly on one line, for example `[CR-4801 · VP-106/VP-107]`.
- Do not tag unchanged entities or display hidden-rule history.

## Final handoff

The final diagram is the governed architecture view, not the 27-entity/33-relationship production intermediate. Use the title:

`Service-to-Cash | Governed architecture view — 30 Jun 2026 16:35`

The subtitle must identify Catalog 4.8, bundle `CB-0626-B`, wave `DW-0630-C`, profile `ARV-0630-C`, and the final entity and relationship totals.

Keep the four domain containers in the approved left-to-right order. Show each current PK, only FKs driving visible relationships, the approved single fact on controlled bridge/evidence records, relationship direction, and min/max cardinality at both ends. Do not show the hidden production details, inactive profiles, manifest history, old aliases, or removed direct shortcuts.
