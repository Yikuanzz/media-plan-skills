# Quality Self-Check

Run this checklist before emitting `Review Pass`.

## Anti-Compression Thresholds

- C3 minimum words per card field: 120
- C7 minimum words per SWOT quadrant: 60
- C1 minimum recent campaigns per competitor: 2
- C5 minimum title examples per required platform row: 1
- C6 minimum tactics per KOL layer: 2
- C4 minimum cards per Phase 2 segment: 1 primary + 1 alternative

## Standard 1: Content

- Core claims have source, year, and method context.
- Competitor judgments include five-dimension comparison and recent campaign evidence.
- Audience insights are traceable to insight modules.
- Stage actions are traceable to strategy chain, not ad-hoc additions.
- City evidence includes consumption, media habits, spatial distribution, and culture anchor.

## Standard 2: Language

- Headings are conclusion-led.
- Paragraph openings state decisions first.
- Verb-driven wording; avoid empty buzzwords.
- Subject ownership is explicit.
- Quantified expressions are preferred over vague adjectives.

## Standard 3: Structure

- Compact before Expanded in each chapter where both exist.
- Insight, Strategy, and Action chapters include Expanded depth.
- Heading hierarchy remains parallel/progressive/contrast-consistent.
- Activity Card fields follow canonical order.
- Budget table includes online/offline split and stage totals.

## Standard 4: Creativity

- Core Theme source explanation exists.
- Slogan derivation chain links brand, audience, and product.
- Three stage sub-themes are distinct and aligned.
- Every pillar has specific naming, not generic labels.
- At least one action demonstrates real attendance pull.

## Standard 5 (conditional): Rubric Coverage

Enable only when rubric is non-empty.

- Rubric lines are captured verbatim.
- Coverage Map has no `partial` and no `missing` before proposal draft.
- Every high-weight rubric item (`>=15%`) is expanded.
- `Rubric Mapping` section includes anchor + evidence for each row.
- Mandatory rubric clauses (required data / required case count / mandatory elements) are satisfied.

## Review Pass contract

- Each enabled standard is graded `pass` or `fail`.
- Rubric standard must always be represented as `enabled` or `skipped`.
- If rubric standard is `skipped`, `skip_reason` must be explicit (`rubric_not_provided`).
- `Review Pass = pass` only when every enabled standard is `pass`.
- Any single `fail` means overall `Review Pass = fail` and requires route-based repair loop.

```md
## Review Pass

### Content
- verdict: pass/fail
- failed_items: [...]

### Language
- verdict: pass/fail
- failed_items: [...]

### Structure
- verdict: pass/fail
- failed_items: [...]

### Creativity
- verdict: pass/fail
- failed_items: [...]

### Anti-Compression Coverage
- verdict: pass/fail
- failed_items:
  - Cx: <failure detail>

### Rubric Coverage
- state: enabled/skipped
- skip_reason: rubric_not_provided/null
- verdict: pass/fail/null
- failed_items: [...]/null

### Overall
- verdict: pass/fail
- rule: all-enabled-standards-must-pass
```

## Standard 6: Anti-Compression Coverage (always enabled)

- C1: `01-insight.md` section `2.4` has per-competitor `### 2.4.<n>` blocks with 5 fixed dimensions and >=2 recent campaigns.
- C2: `01-insight.md` section `2.6` has per-persona `### 2.6.<n>` blocks with 7 fixed dimensions.
- C3: every `primary` card in `04/05/06` has 8 fixed `####` headings and each field >=120 words.
- C4: `05-action-phase2.md` contains `4.3.A`, `4.3.B`, `4.3.C`; each includes one primary + one alternative.
- C5: online primary `#### 媒介平台矩阵` includes five required platforms each with >=1 title example.
- C6: online primary `#### KOL 矩阵` includes `头部 KOL`, `腰部 KOL`, `KOC`; each with >=2 tactics.
- C7: SWOT quadrants in `2.7` are >=60 words and include city-evidence label reference.

Any single fail forces overall `Review Pass = fail`.
