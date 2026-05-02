# Phase: Action

Build three-stage execution cards aligned to approved strategy, then emit Auto-Display Summaries at stage transitions.

## Inputs (must be ready)

- `BLOCKING-A` is confirmed (Core Theme + slogan + three stage sub-themes).
- Read `../shared/action-playbook-template.md` for Activity Card Schema and dispatch prompt.
- Read `../shared/idea-scorecard.md` for primary/alternative selection logic.
- Read `../shared/budget-allocation-rule.md` for hard budget gates.
- Read `../shared/persistence-rules.md` for project path and chapter write triggers.

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

## Stage-Level Auto-Display Checkpoints

Phase transitions no longer require explicit user confirmation. After each phase's pillars are complete, output an `## Auto-Display Summary` and proceed automatically.

### After Phase 1

Trigger when both `1-online` and `1-offline` pillars have `primary + alternative` cards and review logs.

Required output:

```md
## Phase 1 Auto-Display Summary
- Confirmed primary cards:
  - <1-online primary card name>
  - <1-offline primary card name>
- Alternative cards:
  - <1-online alternative card name>
  - <1-offline alternative card name>
- Phase 1 budget snapshot:
  - Online: <amount>
  - Offline: <amount>
  - Total: <amount>
- Activity form compliance: <all compliant | partial: <note>>
- Proceeding to Phase 2 automatically.
```

### After Phase 2

Trigger when `2-offline-core`, `2-offline-aux`, and `2-online` pillars are all complete and red-line checks pass.

Required output:

```md
## Phase 2 Auto-Display Summary
- Confirmed primary cards:
  - <2-offline-core primary>
  - <2-offline-aux primary>
  - <2-online primary>
- Alternative cards: <list>
- Phase 2 budget snapshot:
  - Online: <amount>
  - Offline: <amount>
  - Total: <amount>
  - Venue-related: <amount> (<ratio>% of Phase 2)
- Activity form compliance: <all compliant | partial: <note>>
- Proceeding to Phase 3 automatically.
```

### After Phase 3

Trigger when `3-offline-conv`, `3-offline-trial`, and `3-online` pillars are all complete and red-line checks pass.

Required output:

```md
## Phase 3 Auto-Display Summary
- Confirmed primary cards: <list>
- Alternative cards: <list>
- Phase 3 budget snapshot:
  - Online: <amount>
  - Offline: <amount>
  - Total: <amount>
- Activity form compliance: <all compliant | partial: <note>>
- Moving to Operations automatically.
```

## Output Contract for Next Phase

Before handing off to `Phase: Operations`, output:

1. `## Action Playbook` with all stage/pillar primary cards
2. `## Alternative Cards` with one backup per pillar
3. `## Budget Allocation Table` with online/offline split by stage and overall total; Phase 2 row must include venue-related amount and venue-related ratio for the 60% validation
4. `## Auto-Display Log` with summaries for Phase 1/2/3 (replacing the old Blocking Log)
5. `## Activity Form Compliance Report` with per-card compliance status (`compliant` / `partial` / `non-compliant`) and any rejection notes
6. `## Persisted Files Snapshot`
   - `03-action-overview.md`
   - `04-action-phase1.md`
   - `05-action-phase2.md`
   - `06-action-phase3.md`
   - `07-action-alternatives.md`

## Persistence Events (mandatory)

1. After `BLOCKING-A` confirm:
   - write `03-action-overview.md` with chapter 4 intro + `4.1 Stage Overview` + budget placeholder rows (`TBD`).
2. On Phase 1 auto-display trigger:
   - write `04-action-phase1.md` (`4.2` full text: `1-online` + `1-offline`, each with primary + alternative);
   - backfill Phase 1 budget row in `03-action-overview.md`.
3. On Phase 2 auto-display trigger:
   - write `05-action-phase2.md` (`4.3.A/B/C` full text);
   - enforce venue ratio evidence for `<=60%`;
   - backfill Phase 2 budget row in `03-action-overview.md`.
4. On Phase 3 auto-display trigger:
   - write `06-action-phase3.md` (`4.4` full text);
   - write `07-action-alternatives.md` (`4.5` full alternatives);
   - finalize budget table in `03-action-overview.md`.
5. If any write fails:
   - stop progression and emit blocking error.

## Anti-Compression Hard Gates in Action

- C3: every primary card must use `### <pillar>.primary <name>` + 8 fixed `####` sub-headings.
- C3: each required `####` field must be >=120 words.
- C4: `05-action-phase2.md` must contain `### 4.3.A`, `### 4.3.B`, `### 4.3.C`; each section includes one primary + one alternative.
- C5: every online primary card `#### 媒介平台矩阵` must include Douyin, Xiaohongshu, Dongchedi, Video Account, Weibo, each with >=1 title example.
- C6: every online primary card `#### KOL 矩阵` must include `头部 KOL`, `腰部 KOL`, `KOC`; each layer includes >=2 tactics.
- Fail-fast: if any C3-C6 item fails, do not emit that phase auto-display summary.
