# Phase: Intake

Normalize the user brief with the intake contract and decide whether downstream Insight can start.

## Required Read

- `../shared/brief-intake-template.md`
- `../shared/persistence-rules.md`

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
- If slug derivation or `00-intake.md` write fails, set `Intake Status = blocked` and stop before Insight.

## Persistence Output Contract

When `Intake Status = ready`, do all items in order:

1. Derive `<project-slug>` using `../shared/persistence-rules.md`.
2. Create `<cwd>/<YYYY-MM-DD>-<project-slug>/`.
3. Write `00-intake.md` with:
   - `## 1. Task Brief`
   - intake required fields table (all required fields present)
   - rubric/tender source text verbatim (if provided)
4. Emit:

```md
## Persistence Path
- project_dir: <absolute-or-cwd-relative path>
- intake_file: <project_dir>/00-intake.md
```
