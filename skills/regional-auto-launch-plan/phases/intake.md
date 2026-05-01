# Phase: Intake

Normalize the user brief with the intake contract and decide whether downstream Insight can start.

## Required Read

- `../shared/brief-intake-template.md`

## Inputs (must be ready)

- Pre-brief phase status is resolved: `used` | `skipped` | `inconclusive`.

## Rules

- Use the output shape from `brief-intake-template.md` exactly.
- Keep user wording intact for high-impact clauses (constraints, success metric, rubric, tender requirements).
- Ask follow-up questions only for missing required fields when status is `blocked`.
- Optional fields must not block readiness; keep explicit `N/A` when absent.
- Do not backfill required fields from pre-brief hints, defaults, or assumptions.

## Required Output Blocks

When pre-brief ran (`used` or `inconclusive`), return these blocks before intake summary:

```md
## Pre-Brief Search Context
...

## Inspiration Hints
...
```

Then emit the intake contract blocks:

```md
## Intake Summary
...

## Missing Fields
...

## Open Questions
...

## Intake Status
- ready | blocked
```

## Gate

- Set `ready` only when every required field in `brief-intake-template.md` is resolved with decision-usable values.
- If any required field is unresolved, set `blocked` and ask targeted questions only for those fields.
