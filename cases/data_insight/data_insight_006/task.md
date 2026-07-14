Can you turn the October campus energy packet into a one-page decision snapshot for the facilities review?

Use only the files in `env/`. Apply the review protocol before calculating anything: resolve superseded revisions, keep only final eligible interval-meter rows, use active meter-to-facility mappings and the valid FY2026 calibration, aggregate multi-meter facilities correctly, and apply the active demand threshold matched to both load class and campus area.

The snapshot must report:

- review coverage: included facilities, contributing meters, retained October rows, and rejected October candidate rows;
- total adjusted October use, its five-week baseline-equivalent, and the percentage change;
- the peak campus week, its adjusted kWh, and its share of October use;
- the top three facilities by adjusted October use, with each value and share, plus their combined share;
- the leading campus area by adjusted use, with value and share;
- the two highest eligible normalized intensities;
- every demand-watch facility, showing maximum adjusted demand, matched threshold, and percentage above threshold;
- the two strongest increases and two largest decreases versus baseline weekly average;
- a concise method/audit note confirming the multi-meter, calibration, revision, and exclusion treatment.

Keep adjusted energy (kWh), maximum weekly demand (kW), normalized intensity (kWh per 1,000 occupied sq ft), shares, and baseline changes distinct. Produce a summarized meeting artifact, not raw rows, SQL, or a source-table dump.
