# Service-to-Cash controlled production-activation relationship diagram

Turn the material in `env/` into one ER-style relationship diagram for the service-platform architecture review.

First derive the approved Catalog 4.8 production model from the enterprise catalog, release scope notice, and model review pack. Next resolve the correction bundle from the request register, request event log, bundle log, and controlled-correction rules. Finally, use the deployment wave and unit records to determine which request-level corrections were actually active in production.

The requested output is the **Central Service-to-Cash production snapshot at 16:30 on 30 June 2026**. Use the 16:00 correction-event cutoff and the 16:20 deployment-event cutoff. A request can be approved and implementation-ready but still be absent from the final model when its deployment unit was rolled back, suspended, verified only in canary, placed in another wave, or invalidated by an atomic group.

Resolve the task in this order:

1. derive the approved Catalog 4.8 baseline;
2. select the applicable correction bundle;
3. resolve request histories, scope, environment, effective time, dependencies, supersession, and apply sequence;
4. select the current production deployment wave;
5. resolve each deployment unit at the deployment cutoff;
6. enforce all-or-nothing atomic groups and unit dependencies;
7. apply only the request changes that survive both control layers.

Use one wide landscape ER-style diagram with these sections from left to right:

1. Customer & Coverage
2. Planning & Dispatch
3. Field Execution
4. Billing & Cash

For every included entity, show its current primary key and only the current foreign keys used by visible relationships. Show only the approved single business fact for controlled bridge or evidence records. Show relationship direction and min/max cardinality at both ends using one consistent notation.

An inactive deployment leaves the prior model state in place. Therefore, do not assume that every implementation-ready rename, field removal, or field replacement appears in production. Re-evaluate the final entity name, PK, visible fact, FK set, and relationship set after the deployment layer is resolved.

Add a compact root-request provenance tag to every entity whose active entity identity or displayed business fact differs from the Catalog 4.8 baseline. Do not show internal event history, unit state, atomic-group names, rejected proposals, future waves, staging results, or rollback records as active model content.

Use `Service-to-Cash | Production correction view — 30 Jun 2026 16:30` as the title. The subtitle must identify Catalog 4.8, bundle `CB-0626-B`, wave `DW-0630-C`, and the final entity and relationship totals.

The output must be one self-contained architecture-review diagram that can be checked without reopening the source files.
