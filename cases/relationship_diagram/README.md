# Relationship Diagram

These cases require the agent to resolve the active entity set and typed
relationships before drawing a scoped diagram.

| Case | Deliverable | Core operations |
| --- | --- | --- |
| `relationship_diagram_001` | Service-to-Cash production ER diagram | Catalog baseline, correction bundle, request/deployment histories, atomic groups, active production changes. |
| `relationship_diagram_003` | Campus safety escalation map | Base assignments, duty overrides, bulletins, role substitution, escalation routes and engagements. |

Review emphasis: reproduce scope and cutoff logic, then check every required
node and edge direction while excluding rolled-back, inactive, canary-only, or
otherwise out-of-scope relationships.

