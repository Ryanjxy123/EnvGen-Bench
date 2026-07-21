# Riverside Spring Fair — Public Volunteer Portfolio Rules

## 1. Record resolution

Selection cutoff: `2026-04-23 12:00`.

For every versioned source:
1. keep only rows whose controlling timestamp is at or before the cutoff;
2. group rows by the entity key used by that source;
3. choose the row with the greatest timestamp;
4. when timestamps tie, choose the greatest `revision`;
5. use the controlling row as a whole and never combine fields from different revisions.

Ignore all later corrections.

## 2. Event schedule

- Target event: `RSF-2026`
- Target site: `CG-WELCOME`
- Service date: `2026-04-26`

Use the controlling schedule for the event name, date, meeting location, registration deadline, registration URL, rain-plan location, and public contact.

The controlling site must be operational, public, and have a weather plan whose status is `ready` or `not_required`.

## 3. Base opportunity eligibility

An opportunity must:
- belong to the target event, site, and service date;
- have `shift_status = open`;
- have `recruitment_audience = public`;
- require `none` or `basic` training;
- accept a 16-year-old volunteer, meaning `minimum_age <= 16`;
- last from 90 through 210 minutes inclusive.

## 4. Registration and Public openings

Use the controlling registration snapshot and capacity-hold row.

`raw_open_spots = capacity - confirmed_count - reserved_count`

If `hold_status = active`:

`public_open_spots = raw_open_spots - approved_group_hold_count - issued_offer_hold_count`

Otherwise:

`public_open_spots = raw_open_spots`

The opportunity must:
- have `registration_status = accepting`;
- have 2–6 Public openings inclusive;
- have `public_open_spots / capacity` from 0.15 through 0.55 inclusive.

Never display raw openings as Public openings.

## 5. Readiness, safety, attendance, and staffing feasibility

Use the controlling readiness, public-requirement, safety-route, and attendance rows.

The opportunity must:
- have approved readiness and approved public requirements;
- have `trained_leads_assigned >= required_leads`;
- have ready orientation material and ready check-in support;
- satisfy `current_supervisor_load + public_open_spots <= supervisor_capacity`;
- have approved safety, an open route, ready equipment, and a ready emergency plan;
- have historical show rate at least 0.72;
- have late-cancel rate no more than 0.18.

Calculate:

`expected_attendance = confirmed_count × historical_show_rate + standby_count × 0.5`

The staffing tests use this expected-attendance value:
- below target: `expected_attendance < target_staffing`;
- can reach minimum: `expected_attendance + public_open_spots >= minimum_staffing`.

Do not substitute confirmed count for expected attendance in these two tests.

## 6. Ranking

For each qualifying opportunity calculate:

`recruitment_score = 0.35 × staffing_gap_score + 0.25 × visitor_impact_score + 0.20 × coordinator_urgency + 0.10 × attendance_reliability_score + 0.10 × signup_momentum_score`

Sort by:
1. recruitment score descending;
2. Public openings descending;
3. start time ascending.

Assign one global eligibility rank to every qualifying opportunity and keep the first 12 for portfolio construction.

## 7. Five-opportunity portfolio

Evaluate every five-opportunity combination from the ranked top 12.

A valid portfolio must:
- contain five distinct role families;
- contain 16–20 total Public openings;
- include at least four Step-free-route opportunities;
- include at least two Seated-option opportunities;
- include at least three Indoor-backup opportunities;
- include at least one opportunity with `minimum_age <= 14`;
- include at least one shift starting by 9:00 AM;
- include at least one shift ending at or after 5:00 PM;
- contain no more than two opportunities from the same meeting zone.

Choose the valid portfolio with:
1. greatest total recruitment score;
2. then greatest total Public openings;
3. then lexicographically smallest vector of global eligibility ranks.

Present the selected opportunities in ascending global eligibility rank. If ranks are printed, preserve the original global values. For this selected set, the visible ranks are not to be compressed into a new 1–5 sequence.

## 8. Public calculations

- `check_in_time = shift start - check_in_minutes_before`
- `potential_volunteer_hours = public_open_spots × shift duration in hours`
- Fit and availability sets use the controlling public-requirement row.
- “Check in before 10:00 AM” means check-in time strictly earlier than 10:00 AM.
- “End by 1:00 PM” means shift end at or before 1:00 PM.

For the Full-Day Pair:
- use only selected opportunities;
- shifts must not overlap;
- the second check-in must be at least 30 minutes after the first shift ends;
- maximize combined shift hours;
- then maximize combined Public openings;
- then choose the earlier first check-in.
