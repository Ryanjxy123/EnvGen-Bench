# Riverside Spring Fair — Public Volunteer Portfolio Rules

Use only records available at or before `2026-04-23 12:00`. For every versioned source, choose the greatest timestamp not after the cutoff; when timestamps tie, choose the greatest `revision`. Ignore later corrections.

## Event schedule
- Target event: `RSF-2026`; target site: `CG-WELCOME`; service date: `2026-04-26`.
- Use the controlling schedule for the event name, date, meeting location, registration deadline, registration URL, rain-plan location, and public contact.
- The controlling site must be operational, public, and have a ready or unnecessary weather plan.

## Base opportunity eligibility
An opportunity must belong to the target event/site/date, be open to the public, require none or basic training, accept age 16 volunteers, and last 90–210 minutes inclusive.

## Controlling registration and public openings
Use the controlling registration snapshot and controlling capacity-hold record.

`raw_open_spots = capacity - confirmed_count - reserved_count`

`public_open_spots = raw_open_spots - approved_group_hold_count - issued_offer_hold_count`

Only subtract holds when the controlling hold status is `active`; otherwise subtract zero. The opportunity must be accepting registrations, have 2–6 public open spots, and have a public-open ratio from 0.15 through 0.55 inclusive. Do not display raw openings as public openings.

## Readiness, requirements, safety, and attendance
Use the controlling readiness, public-requirement, safety-route, and attendance records. The opportunity must:
- have approved readiness and approved public requirements;
- have enough trained leads, ready orientation material, and ready check-in support;
- satisfy supervisor load after adding public openings;
- have approved safety, an open route, ready equipment, and a ready emergency plan;
- have historical show rate at least 0.72 and late-cancel rate no more than 0.18;
- remain below target staffing but be able to reach minimum staffing if every public opening is filled.

Calculate `expected_attendance = confirmed_count × historical_show_rate + standby_count × 0.5`.

## Ranking
For each qualifying opportunity calculate:

`recruitment_score = 0.35 × staffing_gap_score + 0.25 × visitor_impact_score + 0.20 × coordinator_urgency + 0.10 × attendance_reliability_score + 0.10 × signup_momentum_score`

Sort by recruitment score descending, then public openings descending, then start time ascending. Keep the first 12 qualifying opportunities for portfolio construction.

## Five-opportunity portfolio
Evaluate every five-opportunity combination from the ranked top 12. A valid portfolio must:
- contain five distinct role families;
- have 16–20 total public openings;
- include at least four step-free-route opportunities;
- include at least two seated-option opportunities;
- include at least three indoor-backup opportunities;
- include at least one opportunity whose minimum age is 14 or younger;
- include at least one shift starting by 9:00 AM and one ending at or after 5:00 PM;
- contain no more than two opportunities from the same meeting zone.

Choose the valid portfolio with the greatest total recruitment score. Break ties by greater total public openings, then the lexicographically smaller vector of eligibility ranks. Present the selected opportunities in eligibility-rank order.

## Public calculations
- `check_in_time = shift start - check_in_minutes_before`.
- `potential_volunteer_hours = public_open_spots × shift duration in hours`.
- Availability and fit sets must use the controlling public-requirement records.
- For the Full-Day Pair, consider selected-role pairs whose shifts do not overlap and whose second check-in is at least 30 minutes after the first shift ends. Maximize combined shift hours, then combined public openings, then choose the earlier first check-in.
