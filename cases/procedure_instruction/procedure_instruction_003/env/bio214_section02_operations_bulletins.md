# BIO 214 Teaching Laboratory Operations Bulletins

The bulletin text below is retained for audit. **Current document status and
applicability come from the `Document Release Register` worksheet in
`bio214_semester_lab_plan.xlsx`.** Use only a document whose register status is
Released and whose effective time is no later than the scheduled class. A later
released bulletin overrides only the topics it explicitly changes; all
untouched topics remain controlled by the earlier released bulletin.

---

## OPS-24 — Early pilot configuration

The pilot used one strip for four students, a 5% reserve, an “any blue
replicate” call, and a 20-minute read. This content is retained only as audit
history. Consult the release register before using it.

---

## OPS-27 — Section 02 station and result-control update

Applies to BIO 214 Section 02 Outbreak Tracing ELISA.

### Base station topology

Each four-student station uses two 12-well strips. Seats A and B share Strip 1;
seats C and D share Strip 2. For each strip, keep the wells in this order:

- wells 1–3: positive control,
- wells 4–6: negative control,
- wells 7–9: first seat in the strip pair,
- wells 10–12: second seat in the strip pair.

Use 50 µl per assigned well at every assay loading stage.

### Source-tip and wash-pipet isolation

For each strip, use a dedicated fresh micropipette tip for each source liquid:
positive control, negative control, the first student sample, the second student
sample, primary antibody, secondary antibody, and substrate. Never move a tip
between strips.

Assign one wash-buffer transfer pipet to each strip. It may be reused for wash
buffer on that strip only. It must not touch a sample or reagent source and must
not move to the other strip.

### Control gate and triplicate calls

Validate each strip independently. A strip is valid only if all three positive
control wells are blue and all three negative control wells remain colorless.
A valid strip uses these student calls:

- 3/3 blue = positive,
- 0/3 blue = negative,
- 1/3 or 2/3 blue = indeterminate.

Do not use majority voting. If controls fail, mark that strip invalid, do not
interpret either student on it, and notify the instructor. One strip cannot
validate the other.

### Tracing rule

Trace only from a valid strip with a definite positive student call. Do not
trace from an invalid strip or an indeterminate pattern.

---

## OPS-29 — Proposed room contingency

This proposal would move the class to SCI-216 and use a 15% reserve. It has no
force unless the release register shows a Released status.

---

## OPS-30 — Section 02 station-card material and safety control

Applies to Section 02 station cards. OPS-27 remains controlling for topology,
well allocation, the control gate, triplicate calls, and tracing.

### Privacy labels and exchange records

Use the active sample token—not a name or initials—on the yellow sample tube,
sample-sharing transfer pipet, student wells, and result record. Record the
three exchange partners in round order.

### Boundary-breach response

If a micropipette tip touches the wrong source, a used well, or the other strip,
discard it immediately and replace it before continuing. If a strip wash pipet
touches a sample/reagent source or the other strip, remove it from service,
obtain a replacement, and notify the instructor. Replacements are additional to
clean-start planned counts.

### Result records

For each strip, record the station/run identity, strip number, control status,
both active sample tokens, each exact three-well color pattern, each final call,
and the read time. Retain the three exchange partners in round order.

### Safety and disposal

Wear gloves and protective eyewear. Keep food and drink out of the work area.
Wash hands with soap before and after the exercise. For an eye splash, start the
eyewash immediately, rinse for at least 15 minutes, and alert the instructor.

Put used micropipette tips in sharps. Put used strips, paper towels,
sample-sharing transfer pipets, and strip-wash transfer pipets in the labeled
biohazard tray. Return no used item to clean supply.

The earlier issue-volume paragraph in this bulletin is not controlling for
ST-07 when a later released station bulletin replaces it.

---

## OPS-31 — Single-strip economy trial

This draft proposes one strip for four students, an 8% reserve, and sink
disposal. It is retained for review only. Consult the release register.

---

## OPS-34 — ST-07 run release reconciliation

Applies only to BIO 214 Section 02, the September 16, 2026 13:00 session, and
station ST-07. It supplements OPS-27 and OPS-30.

### Authoritative station records

Use the latest approved seat assignment effective by the class start, the
current Released exchange route, and the current Released station kit from the
semester workbook. A later approved seat replacement supersedes the earlier
seat row. Show the active route ID and station release ID on the card.

### Equipment and lot release

Show the current equipment-kit ID and the two strip-specific P50 identifiers
from the Released station-kit row. Use only the control pack, antibody pack, and
substrate lot assigned by that row after confirming in
`bio214_reagent_lot_ledger.csv` that each lot is Released, within date, scoped to
the antigen-detection procedure, and valid for ST-07. The active substrate lot’s
QC read window replaces the general read window for this station.

### ST-07 issue calculation

For each shared liquid, first compute the clean procedural volume. Add a 12%
reserve. Then add that lot’s dead-volume allowance from the lot ledger. Finally,
round upward to the lot’s stated issue increment. Apply the control-pack dead
volume separately to positive and negative control. Apply the antibody-pack
dead volume separately to primary and secondary antibody. Do not pool or add a
reserve to student samples.

### Exchange route and record traceability

Carry out the three exchange rounds exactly in the order of the current Released
route. Translate seat pairs to the active sample tokens on the card. The result
record must include the route ID, station release ID, equipment-kit ID, and all
three active lot IDs in addition to the OPS-30 result fields.

---

## OPS-35 — Extended substrate pilot

The pilot proposes a 12-minute substrate read and a different substrate lot. It
has no force unless the release register shows Released status before class.
