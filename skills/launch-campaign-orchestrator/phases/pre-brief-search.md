# Phase: Pre-brief Search

Run one lightweight public-signal pass before intake to narrow follow-up questions for launch campaign communications (上市传播 / 新车上市).

## When To Run

- Run when the user already gives at least one concrete signal: brand or product/model, launch or campaign window, primary channel or touchpoint clue, geography or markets, or target audience clue.
- Skip when the prompt is too vague to form meaningful search queries (emit `skipped`).

## Required Reads

- `./shared/pre-brief-source-map.md`
- `./shared/query-playbook.md`

## Rules

- Use pre-brief search only for signal discovery and question narrowing.
- Never auto-fill required intake fields from search hints (`./shared/brief-intake-template.md`).
- Prefer fresh signals (recent 30–90 days for fast-moving topics; extend only when historical context matters for the narrative).
- Keep low-trust or contradictory signals as provisional notes for Insight validation.
- If search quality is weak, mark `inconclusive` instead of forcing a direction.

## Output Contract

```markdown
## Pre-Brief Search Context
- status: used | skipped | inconclusive
- known_signals:
  - <brand/product/window/channel/audience/geo clues>
- items_to_confirm_at_intake:
  - <missing required fields or ambiguity>
- provisional_risks:
  - <weak-source or contradictory notes>

## Inspiration Hints
- candidate_angles:
  - `<public signal: platform/topic or event window>` + `<one-line angle_of_entry folding into launch story—NOT side-by-side 1+1>` + `<why brief-fit now>`
- supporting_signals:
  - <source class + short takeaway>
- avoid_angles:
  - <angles that currently lack evidence>
```

## Persistence

Write the resolved output (matching **Output Contract**) to `{artifact_root}/00-pre-brief.md`.

## Gate

- Resolve this phase to one status only: `used`, `skipped`, or `inconclusive`.
- Persist output to `{artifact_root}/00-pre-brief.md` before handoff.
- Intake can start only after one resolved status is emitted.
