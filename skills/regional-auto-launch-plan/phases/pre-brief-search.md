# Phase: Pre-brief Search

Run one lightweight public-signal pass before intake to narrow follow-up questions for regional auto launch planning.

## When To Run

- Run when the user already gives at least one concrete signal: brand/model, city or region, launch window, channel clue, or target audience clue.
- Skip when the prompt is too vague to form meaningful search queries.

## Required Read

- `../shared/pre-brief-source-map.md`
- `../shared/query-playbook.md`

## Rules

- Use pre-brief search only for signal discovery and question narrowing.
- Never auto-fill required intake fields from search hints.
- Prefer fresh signals (recent 30-90 days for fast-moving topics; extend only when the brief requires historical context).
- Keep low-trust or contradictory signals as provisional notes for Insight validation.
- If search quality is weak, mark `inconclusive` instead of forcing a direction.

## Output Contract

```md
## Pre-Brief Search Context
- status: used | skipped | inconclusive
- known_signals:
  - <brand/model/city/window/channel clues>
- items_to_confirm_at_intake:
  - <missing required fields>
- provisional_risks:
  - <weak-source or contradictory notes>

## Inspiration Hints
- candidate_angles:
  - <regional launch angle + why>
- supporting_signals:
  - <source class + short takeaway>
- avoid_angles:
  - <angles that currently lack evidence>
```

## Gate

- Resolve this phase to one status only: `used`, `skipped`, or `inconclusive`.
- Intake can start only after one resolved status is emitted.
