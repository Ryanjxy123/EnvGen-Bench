# State Change

These cases reconstruct a controlled as-of state from histories, approvals,
corrections, and policy rules, then communicate only the current public result.

| Case | Deliverable | Core operations |
| --- | --- | --- |
| `state_change_001` | Northstar Workspace 5.8 release announcement | Release/build/package resolution, rollout timing and scope, regional exceptions, plans and prerequisites. |
| `state_change_004` | OrbitDesk Sync 4.12 rollout checkpoint | Approval quorum, fallback catalogs, telemetry correction, weighted coverage, checkpoint comparison, policy changes. |

Review emphasis: resolve current and comparison states independently, apply
effective times and fallbacks, and exclude stale, future, rejected, internal, or
superseded facts.

