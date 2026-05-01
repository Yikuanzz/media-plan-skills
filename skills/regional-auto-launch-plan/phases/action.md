# Phase: Action

Build three-stage execution cards aligned to approved strategy, then stop at stage-level blocking checkpoints.

## Inputs (must be ready)

- `BLOCKING-A` is confirmed (Core Theme + slogan + three stage sub-themes).
- Read `../shared/action-playbook-template.md` for Activity Card Schema and dispatch prompt.
- Read `../shared/idea-scorecard.md` for primary/alternative selection logic.
- Read `../shared/budget-allocation-rule.md` for hard budget gates.

## Stage and Pillar Structure (mandatory)

- Phase 1 pillars: `1-online`, `1-offline`
- Phase 2 pillars: `2-offline-core`, `2-offline-aux`, `2-online`
- Phase 3 pillars: `3-offline-conv`, `3-offline-trial`, `3-online`

Each pillar must output:

- one `primary` Activity Card
- one `alternative` Activity Card
- review log with four-dimension weighted scoring

## Execution Pattern per Pillar

1. Main agent writes one pillar brief (audience anchor, KPI target, budget cap, risk notes).
2. Dispatch `N=2-3` sub-agents using the shared dispatch prompt template.
3. Score candidates with the four-dimension review scorecard.
4. Select highest valid score as `primary`, second highest as `alternative`.
5. Validate mandatory fields and budget red lines before locking results.

## Hard Gates in Action Phase

- Every card follows `Activity Card Schema` with fields `1-7` mandatory.
- Fields `8-13` should be deep; if unavailable, mark `partial` with missing-evidence note.
- Budget must satisfy all hard constraints from `budget-allocation-rule.md`.

## Stage-Level Blocking Checkpoints

### BLOCKING-B (after Phase 1)

Trigger only when both `1-online` and `1-offline` pillars have `primary + alternative` cards and review logs.

Required confirmation request:

```md
## BLOCKING-B
Phase 1 primary cards are ready for confirmation.
- Confirmed cards: <list>
- Phase 1 budget snapshot: <online/offline/total>
Please confirm before we dispatch Phase 2 pillars.
```

### BLOCKING-C (after Phase 2)

Trigger only when `2-offline-core`, `2-offline-aux`, and `2-online` pillars are all complete and red-line checks pass.

Required confirmation request:

```md
## BLOCKING-C
Phase 2 primary cards are ready for confirmation.
- Confirmed cards: <list>
- Phase 2 budget snapshot: <online/offline/total + venue-related ratio>
Please confirm before we dispatch Phase 3 pillars.
```

### BLOCKING-D (after Phase 3)

Trigger only when `3-offline-conv`, `3-offline-trial`, and `3-online` pillars are all complete and red-line checks pass.

Required confirmation request:

```md
## BLOCKING-D
Phase 3 primary cards are ready for confirmation.
- Confirmed cards: <list>
- Phase 3 budget snapshot: <online/offline/total>
Please confirm before moving to Operations.
```

## Output Contract for Next Phase

Before handing off to `Phase: Operations`, output:

1. `## Action Playbook` with all stage/pillar primary cards
2. `## Alternative Cards` with one backup per pillar
3. `## Budget Allocation Table` with online/offline split by stage and overall total
4. `## Blocking Log` with explicit confirmations for `BLOCKING-B`, `BLOCKING-C`, `BLOCKING-D`
