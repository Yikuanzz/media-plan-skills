# Quality Self-Check

Run this checklist before emitting `Review Pass`.

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

### Rubric Coverage
- state: enabled/skipped
- skip_reason: rubric_not_provided/null
- verdict: pass/fail/null
- failed_items: [...]/null

### Overall
- verdict: pass/fail
- rule: all-enabled-standards-must-pass
```
