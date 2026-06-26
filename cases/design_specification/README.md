# Design Specification Cases

Cases where the agent must obey brand, style, layout, or visual constraints
before generating an image.

## Env Minimalism And Variation

Keep each Design Specification-to-Image env to the smallest viable set, typically 4-6 files: `latest_update.md`, `platform_specs.txt`, `visual_rules.json`, `asset_manifest.json`, `deprecated_assets.json`, and optionally `brand_brief.md`.

Use difficulty from priority conflicts, platform constraints, current visual-rule application, allowed asset use, and deprecated-material exclusion. Do not create difficulty by piling up redundant files.

Vary future cases across both domain and image shape: technology product launch images, medical service ads, education course promos, financial brand posters, environmental nonprofit graphics, B2B SaaS LinkedIn ads, community Instagram posters, and ecommerce product ads.

Prefer `brand_brief.md` when a PDF duplicates other files or renders poorly. If a PDF is required, keep it to 1-2 clean text-layer pages with clear hierarchy and no final-answer leakage.

## PDF Brand Guide Optimization

For `Design Specification-to-Image` cases, any brand guide PDF should look like a natural brand or visual-system manual, not an answer sheet, evaluator checklist, or raw rule table.

### Visual References

Brand guide PDFs may include 1-2 real reference images to improve naturalness, but only when the image source and license are clear. Prefer Wikimedia Commons public domain, CC BY, CC0, Unsplash, Pexels, or other clearly reusable sources.

Use reference images only for tone, subject matter, or brand atmosphere. Recommended image types include modern residential solar roofs, home battery or residential energy storage, solar panel details, and clean residential energy scenes.

Do not generate fake vector decorations, placeholder diagrams, artificial line icons, hand-drawn sketches, or pseudo-design elements. Do not use AI-generated or unsourced images. Do not include red emergency or outage imagery, cartoon mascots, old logo or old slogan visuals, final-poster-like templates, ready-made posters, title/logo/CTA mockups, final layout previews, or any image that directly leaks the expected answer.

### Raw Image Exposure

If a real image is used inside `brand_guide.pdf`, embed it into the PDF only. Do not keep the original image as an agent-visible env file such as `env/solar_roof_reference.jpg`, unless the task explicitly requires the agent to use that image as an asset.

Correct final env exposure is typically `env/brand_guide.pdf`, not the raw image cache. Remove any separate `env_files` metadata entry for the raw image unless the raw image is intentionally part of the task.

Track image source and license under the `brand_guide.pdf` metadata entry instead:

```json
{
  "path": "env/brand_guide.pdf",
  "role": "Natural brand guide describing positioning, visual tone, color system, logo use, layout tendencies, and style boundaries",
  "format": "pdf",
  "origin": "mixed",
  "source_url": "...",
  "retrieved_at": "YYYY-MM-DD",
  "license_note": "...",
  "conversion_note": "The PDF embeds one licensed/public-domain reference image for tone and subject matter only. The original image file is not exposed as an agent-visible env asset."
}
```

### PDF Layout Quality

Keep brand guide PDFs around 3 pages when practical. Avoid one image-heavy page followed by mostly empty pages.

Recommended structure:

- Page 1: Brand Positioning + Color System + one moderate-size reference image.
- Page 2: Logo Use + Visual Language + Layout Tendencies.
- Page 3: Style Boundaries + Typography + Production Notes.

Layout rules:

- Do not let an image dominate the whole page unless it is intentionally used as a restrained header banner.
- Avoid very large empty regions.
- Avoid awkward page breaks where a heading is separated from its paragraph.
- Keep captions short and natural.
- Do not add labels like “Reference motifs only” or “Logo clear-space sketch” unless there is an actual professional-looking diagram.
- Add this note once, preferably near the image caption or Production Notes: `Images in this guide are illustrative references for tone and subject matter, not mandatory final-layout templates.`

### PDF Text And Rasterization

Do not rasterize full PDF pages when creating or optimizing brand guide PDFs. The PDF should remain a real document, not a stack of page screenshots.

All headings, body text, captions, footer text, source notes, and production notes must remain selectable and searchable PDF text. Only actual photographic reference images should be embedded as image objects.

Avoid workflows that render a complete designed page to PNG/JPG and then save those page images into a PDF. This makes the guide look like a generated test artifact, prevents text search, and can break downstream PDF inspection.

Acceptable PDF construction:

- Use real PDF text operators, a document/PDF library, or another workflow that preserves text as text.
- Embed only the licensed reference photo or other legitimate raster image assets.
- Keep decorative blocks, rules, and simple shapes as PDF drawing primitives when possible.
- Verify that representative headings and paragraphs can be selected or searched after regeneration.

Do not accept a brand guide PDF where every page is one large image unless the case explicitly requires a scanned-document scenario, which Design Specification-to-Image brand guides normally should not use.

### Evaluation Consistency

Do not add new scoring items just because the PDF includes a reference image. The image inside the PDF should not become a required visual fact and should not be added to `expected_facts.json` as a critical requirement.

Required copy should remain authoritative only from the case copy source, usually `launch_copy.md`.

Scoring should continue to check only task-relevant design constraints, such as required copy, brand color system, logo position, platform format and safe margins, layout zones, forbidden or deprecated active design elements, and overall visual communication quality.

### Temporary Render Artifacts

Do not keep QA, render, or debug artifacts as part of the case. Folders such as `qa_render/`, `_qa_render/`, `render_debug/`, and `pdf_render_check/` may be used during PDF inspection, but they must not be included in the benchmark case package.

Recommended ignore patterns:

```gitignore
**/qa_render/
**/_qa_render/
**/render_debug/
**/pdf_render_check/
```

### Final Self-Check

Before finalizing a `Design Specification-to-Image` case, verify:

1. The PDF looks like a natural brand guide, not an answer sheet.
2. Any inserted image is licensed, sourced, and only embedded in the PDF.
3. The raw image file is not exposed in `env/` unless explicitly required by the task.
4. `metadata.json` records source and license information but does not list the raw image as an agent-visible env file.
5. `task.md`, `expected_facts.json`, and `scoring_checklist.json` remain aligned.
6. No new scoring requirement was introduced only because of the PDF reference image.
7. Temporary render folders are removed or ignored.
