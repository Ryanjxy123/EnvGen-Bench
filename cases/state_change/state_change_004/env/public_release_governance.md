# OrbitDesk public release checkpoint resolution standard

This is the authoritative operating standard for customer-facing rollout checkpoints. It supersedes shortcuts or assumptions in the archived brief.

## 1. Resolve each requested cutoff independently

Resolve the current cutoff and the previous public checkpoint independently. The current cutoff is supplied by `task.md`.

For the comparison point, use **Checkpoint Register** and select the latest row before the current cutoff that is:
- `Public checkpoint`,
- `Published`,
- `Production`,
- `Primary`,
- active at the cutoff.

Do not use draft, internal, secondary-source, scheduled, or future checkpoint rows.

## 2. Approval-backed change resolution

Use **Release Portfolio** only as the baseline.

A change candidate is eligible only when:
- `lifecycle_state` is `Ready`;
- `effective_at` is at or before the cutoff being resolved;
- every required team has a latest action of `Approve` by that cutoff.

Required teams:
- `OperationalState`: Release Operations + Quality Engineering
- `Build`: Release Operations + Quality Engineering + Security Engineering
- `PublicCopy`: Product Marketing + Documentation
- `CustomerPolicy`: Release Operations + Customer Support + Security Engineering
- `Issue`: Customer Support + Security Engineering + Documentation
- `SupportRoute`: Customer Support + Documentation + Security Engineering
- `Stage`: Release Operations + Quality Engineering + Customer Support

For each team, use its highest `action_sequence`, then latest `acted_at`. A later Hold, Reject, or Veto overrides an earlier approval.

For each field, order eligible candidates by `effective_at`, then `sequence_no`, newest first.
- Direct text fields use the newest eligible candidate.
- Code-valued fields require catalog validation. If the referenced record fails validation, continue backward through earlier eligible candidates before using the portfolio baseline.

## 3. Catalog validation

- **Build Catalog:** Signed + Published + active. Every current customer-visible manifest row must be Ready and checksum Verified. Any failed customer-visible row invalidates the build.
- **Component Manifest:** for the selected manifest and cutoff, include only current customer-visible rows. Calculate each package kind as `ceiling(sum(compressed_bytes) / 1,000,000)`. Calculate update-payload savings as `(full_MB - update_MB) / full_MB × 100`, rounded to one decimal place.
- **Copy Bundles:** Approved + Published + active. All three referenced features must be Active, launch-ready, legally Cleared, Stable-compatible, valid for OrbitDesk Sync 4.12.0, and active at the cutoff. One failed feature rejects the whole bundle.
- **Eligibility Policy Catalog:** Approved + Published + active.
- **Issue Packs:** every pack row and referenced issue must be Approved + Published + active for OrbitDesk Sync 4.12.0 and Stable. One invalid issue rejects the whole pack.
- **Support Route Catalog:** Approved + Published + active. Destination is `base_url` plus `path`.
- Scheduled, draft, retired, expired, future-effective, or wrong-product records are not current.

## 4. Distribution and checkpoint comparison

Resolve distribution separately at the current cutoff and the previous public checkpoint.

For each deployment method and required region:
1. select the newest snapshot at or before the relevant cutoff where status is Final, environment is Production, and source tier is Primary;
2. apply the newest Approved Production correction whose `effective_at` is at or before that cutoff;
3. ignore Monitoring, Preliminary, Staging, Secondary, future, pending, and withdrawn rows.

Manual download may use one valid GLOBAL snapshot.

Automatic update must use exactly:
- North America
- Europe
- Asia-Pacific except Japan
- Japan
- Latin America

Worldwide automatic delivered and eligible counts are the sums of the corrected regional counts. The worldwide percentage is the weighted ratio, rounded to one decimal place. Never average regional percentages.

For checkpoint change:
- count change = current count minus previous count;
- percentage-point change = current displayed percentage minus previous displayed percentage;
- calculate each regional percentage from corrected counts before calculating its change.

## 5. Eligibility state and changes

Resolve the selected policy independently at each cutoff.

Within that policy:
- use only Approved decisions active at the cutoff;
- General Allowed rows establish the default;
- a more specific active decision overrides the default for its named cohort, region, and deployment method;
- publish every active non-general decision that changes eligibility;
- expired decisions are not current.

For the public change summary, compare public qualification meaning, not internal decision codes:
- `added`: active now but not at the previous checkpoint;
- `expired`: active at the previous checkpoint but not now because its interval ended;
- `continued`: equivalent cohort/region/method/decision remains active.

## 6. Issue state and changes

Resolve the selected issue pack independently at each cutoff.

Publish every current issue with severity, affected cohort, and full workaround.

For the change summary, compare normalized public issue text:
- same public issue text at both checkpoints = continuing issue;
- current only = newly published;
- previous only = resolved;
- if a continuing issue's severity changes, state the old and new severity.

## 7. Stage and next checkpoint

Evaluate eligible stage candidates newest-to-oldest after current distribution, qualifications, and issues are resolved.

A stage rule is valid only when:
- manual percentage meets `required_manual_percent`;
- worldwide automatic percentage meets `minimum_auto_percent`;
- active non-general qualification count does not exceed `maximum_active_qualifications`;
- the lowest of the five regional percentages meets **Stage Gate Criteria.minimum_regional_percent**;
- current High-severity issue count does not exceed **maximum_high_severity_issues**;
- at least **required_non_decreasing_regions** regions have a current percentage not below their previous checkpoint percentage;
- both the Stage Rules row and Stage Gate Criteria row are Published and active.

Use the first valid stage candidate. Do not promote to a newer stage whose gates are not met.

For the next checkpoint:
- start after the selected stage change's effective calendar date;
- count the rule's `checkpoint_business_days`;
- use the selected `calendar_code`;
- for duplicate dates, use the highest calendar version;
- skip rows marked non-business, including weekends and release freezes;
- apply the rule's UTC clock time.

## 8. Public publishing rules

The final image must present one resolved public state and a concise checkpoint comparison. It must separate:
1. public release availability,
2. manual-download availability,
3. automatic-update delivery,
4. cohort-specific eligibility.

Include all requested exact counts, percentages, deltas, active qualifications, copy, package arithmetic, current issues, change summaries, CTA, and stage basis.

Do not expose internal IDs, codes, approval records, workflow states, sequence numbers, internal effective timestamps, supersession histories, rejected candidates, or another release.
