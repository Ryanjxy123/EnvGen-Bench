# Service-to-Cash governed architecture-view relationship diagram

Create one wide landscape ER-style relationship diagram from the files in `env/`. This is a closed-environment task; do not use the web.

Resolve the source material in four stages:

1. derive the approved Catalog 4.8 Central Service-to-Cash baseline;
2. resolve correction bundle `CB-0626-B` at the correction-event cutoff;
3. resolve the current production wave and active deployment units at the deployment cutoff;
4. resolve the active Architecture Review Board profile and apply its governed projection manifest at the architecture-view cutoff.

The target is the **governed architecture view at 16:35 on 30 June 2026**, not the larger production intermediate. Difficulty should be handled through exact state, revision, precedence, profile, alias, fact-freeze, and exclusion resolution—not by adding extra relationships.

Use the exact title:

**Service-to-Cash | Governed architecture view — 30 Jun 2026 16:35**

The subtitle must identify Catalog 4.8, bundle `CB-0626-B`, wave `DW-0630-C`, the selected architecture-view profile, and the final entity and relationship totals.

Use four left-to-right sections:

1. Customer & Coverage
2. Planning & Dispatch
3. Field Execution
4. Billing & Cash

For every included entity, show:

- the final governed display name;
- the current PK;
- only FKs that drive relationships still visible in the governed view;
- only the single approved business fact for controlled bridge/evidence records;
- compact provenance tags required by the projection rules.

For every visible relationship, show direction and min/max cardinality at both ends using one consistent notation.

Do not show hidden production-detail entities, removed direct shortcuts, inactive view profiles, lower revisions, post-cutoff rows, old aliases, rejected proposals, deployment history, or manifest history as current model content. The output must remain one self-contained architecture-review diagram.
