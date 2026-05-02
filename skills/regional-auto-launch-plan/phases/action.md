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
6. If hard-gate filtering leaves fewer than two valid cards, allow exactly one re-dispatch round and re-score; if still fewer than two valid cards, raise explicit blocking exception for user confirmation.

## Hard Gates in Action Phase

- Every card follows `Activity Card Schema` with fields `1-7` mandatory.
- Fields `8-13` should be deep; if unavailable, mark `partial` with missing-evidence note.
- Budget must satisfy all hard constraints from `budget-allocation-rule.md`.

## Auto-Display Checkpoints (was BLOCKING-B/C/D)

Phase transitions no longer require explicit user confirmation. After each phase's pillars are complete, output an `## Auto-Display Summary` and proceed automatically.

### After Phase 1

Output:
```md
## Phase 1 Auto-Display Summary
- Primary cards: <list>
- Alternative cards: <list>
- Budget snapshot: <online/offline/total>
- Activity form compliance: <all compliant | partial items noted>
- Next: dispatching Phase 2 pillars automatically.
```

### After Phase 2

Output:
```md
## Phase 2 Auto-Display Summary
- Primary cards: <list>
- Alternative cards: <list>
- Budget snapshot: <online/offline/total + venue-related amount + venue-related ratio>
- Activity form compliance: <all compliant | partial items noted>
- Next: dispatching Phase 3 pillars automatically.
```

### After Phase 3

Output:
```md
## Phase 3 Auto-Display Summary
- Primary cards: <list>
- Alternative cards: <list>
- Budget snapshot: <online/offline/total>
- Activity form compliance: <all compliant | partial items noted>
- Next: moving to Operations automatically.
```

## Output Contract for Next Phase

Before handing off to `Phase: Operations`, output:

1. `## Action Playbook` with all stage/pillar primary cards
2. `## Alternative Cards` with one backup per pillar
3. `## Budget Allocation Table` with online/offline split by stage and overall total; Phase 2 row must include venue-related amount and venue-related ratio for the 60% validation
4. `## Auto-Display Log` with summaries for Phase 1/2/3 (replacing the old Blocking Log)
5. `## Activity Form Compliance Report` with per-card compliance status (`compliant` / `partial` / `non-compliant`) and any rejection notes
