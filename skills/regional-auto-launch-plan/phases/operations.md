# Phase: Operations

Build the operations assurance layer after Action is confirmed and before Service Team.

## Inputs (must be ready)

- Phase 3 Auto-Display Summary is emitted.
- Read `../shared/operations-assurance-template.md`.
- Read `../shared/persistence-rules.md`.
- Action output includes final stage KPI definitions (field `10` semantics preserved).

## Required output blocks (all mandatory)

1. Group Matrix (`3-5群` only).
2. Content Dispatch Flow (one sentence).
3. Feedback Loop (`monitor -> aggregate -> feedback`).
4. Reporting Matrix (default four levels, three allowed when justified).
5. Node Checkpoints (Phase 1/2/3 aligned and KPI-aligned to Action field `10`).

## Gate

Set `Operations Gate = pass` only when:

- all 5 blocks are complete,
- Group Matrix range is valid (`3-5群`), and
- Node Checkpoints maintain stage and KPI alignment.

If any condition fails, set `Operations Gate = fail`, repair in this phase, then re-check. Do not enter `Phase: Service Team` while gate is fail.

## Output handoff

Emit:

```md
## Operations Assurance
<all five blocks populated>

## Operations Gate
- verdict: pass/fail
- failed_items: [...]
```

## Persistence Output Contract

- On `Operations Gate = pass`, write `08-operations.md` with final chapter `## 5. Operations Assurance`.
- If write fails, keep gate as fail and stop before Service Team.