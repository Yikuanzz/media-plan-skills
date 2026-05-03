# Phase: Action

Build three-stage execution cards aligned to approved strategy, then emit Auto-Display Summaries at stage transitions.

## Inputs (must be ready)

- `BLOCKING-A` is confirmed (user selected one strategy package: Core Theme + slogan + three stage sub-themes).
- Read `../shared/action-playbook-template.md` for Activity Card Schema and dispatch prompt.
- Read `../shared/launch-execution-template.md` for Phase 2 launch execution package details.
- Read `../shared/lead-capture-playbook.md` for platform capture, lead scoring, warming, and dealer intake SOP.
- Read `../shared/conversion-mechanics-playbook.md` for促单机制、试驾转订单路径、以及下定跟进规则。
- Read `../shared/private-domain-operations.md` for留客种子动作和私域承接要求（Action阶段仅做seed，不做完整运营编排）。
- Read `../shared/activity-form-constraints.md` for活动形态排除清单与低成本优先策略。
- Read `../shared/idea-scorecard.md` for primary/alternative selection logic.
- Read `../shared/budget-allocation-rule.md` for hard budget gates.
- Read `../shared/continuation-activity-templates.md` for Phase 3 structured activity templates (referral/deep test-drive/dealer sales).
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
- `Lead Capture Gate`: each phase must define capture entry, lead scoring tier (H/W/C), and dealer intake owner/SLA.
- `Conversion Gate`: each phase must define conversion mechanism and the test-drive-to-order handoff; Phase 3 must include促单深度动作（close trigger + deposit follow-up owner).
- `Retention Seeding Gate`: each phase must define at least one private-domain seed action (WeCom/community/referral/lifecycle touchpoint).
- `Activity Form Gate`: high-cost/high-complexity forms listed in `activity-form-constraints.md` must be rejected unless explicit user exception exists.
- `Circle Infiltration Gate`: each stage must include at least one activity that reaches the buyer inside their existing life circle rather than waiting for showroom visits. Valid circle types depend on `<primary-buyer-identity>`:
  - family -> parent communities, school/kindergarten partnerships, residential compounds
  - business elite -> chamber of commerce, golf clubs, private dining
  - adventure -> outdoor clubs, trail groups, camping communities
  - performance -> track clubs, driving schools, motorsport events
  At least 2 circle types must appear across the three phases.
- `Hot-Spot Optional Gate`: hotspot tie-in is optional. If used, it must be validated in `2.2 Market Environment` and cannot use industry trade shows as primary storyline event.
- `Owned Launch Event Gate`: at least one launch event across Phase 2/3 must provide complete execution package:
  - 选址建议: at least 1 main site + 1 backup with rationale
  - 现场空间部署: stage/interaction/static/test-drive/check-in zones
  - 核心流程: 引流 -> 价值讲解 -> 正式亮相 -> 收尾钩子 -> 现场促单
  - 集客留资: on-site capture method and handoff owner
  - 转化闭环: 咨询 -> 预约试驾 -> 到店 -> 订单
- `Launch Template Gate`: for `4.2` core launch, output must pass `launch-execution-template.md` blocks A-E.
- Each phase must include >=1 budget-busting event in selected primary cards with `actual cost + perceived value` disclosure.
- Phase 2 must include >=1 non-traditional launch ritual. Ritual design must follow this derivation sequence:
  - Step 1 - Identify protagonist type from `<primary-buyer-identity>`:
    - family-oriented -> real families with authentic travel/space pain points
    - performance-driven -> real drivers with lap time/corner control frustrations
    - adventure-seeking -> real outdoor enthusiasts with terrain/range failure stories
    - status-focused -> real business figures with peer-recognition/time-cost stories
    - young-individual -> real creators with self-expression/identity-constraint stories
  - Step 2 - Select a format that embeds product value into live experience, not stated presentation. Format must pass propagation test: "Would an attendee spontaneously photograph or share this moment without being asked?" If no, the format fails.
    - Family -> pain-point theater (real daily frustrations performed; product resolves live)
    - Performance -> on-site challenge (task exposes competitor limit; product removes it live)
    - Adventure -> survival reveal (real failure retold; product feature solves in situ)
    - Status -> private ritual (exclusive audience; product shown through sensory/craft experience)
    - Individual -> co-creation drop (protagonist co-creates with product as medium)
    These archetypes are starting points, not fixed output.
  - Step 3 - Validate anti-pattern ban (hard veto, identity-agnostic):
    - Leadership unveiling ceremony
    - PPT-driven product walkthrough
    - Media group photo as finale
    - Spec recitation by MC
  - Step 4 - Confirm two mandatory outputs:
    - one emotionally specific moment attendees can describe in one sentence
    - one visual/audio element working as standalone social clip (<=30 seconds, self-contained meaning)
- Cards without explicit source-id trace in field `13` cannot be selected as `primary`.

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
- Budget-busting event check: <pass/fail + event name + actual cost/perceived value>
- Lead ops check: <capture entry + H/W/C model + dealer SLA>
- Conversion mechanics check: <mechanic + path handoff owner>
- Private-domain seeding check: <seed action + target node>
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
- Budget-busting event check: <pass/fail + event name + actual cost/perceived value>
- Non-traditional launch ritual check:
  - protagonist type: <derived from primary-buyer-identity>
  - format archetype selected: <name>
  - propagation test result: <pass/fail + one-sentence emotional moment>
  - 30-second clip concept: <described>
  - anti-pattern violations: <none | item>
- Circle infiltration check: <circle types covered in Phase 1+2 so far>
- Hot-spot leverage check: <used/not-used + if used: event name + identity-fit rationale>
- Owned launch event check:
  - site options: <main + backup>
  - space layout: <zones listed>
  - core flow completeness: <pass/fail>
  - on-site lead capture path: <described>
- Lead ops check: <capture entry + H/W/C model + dealer SLA>
- Conversion mechanics check: <mechanic + path handoff owner>
- Private-domain seeding check: <seed action + target node>
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
- Budget-busting event check: <pass/fail + event name + actual cost/perceived value>
- Lead ops check: <capture entry + H/W/C model + dealer SLA>
- Conversion mechanics check: <mechanic + close trigger + deposit follow-up owner>
- Private-domain seeding check: <seed action + target node>
- Continuation template check: <which template (A/B/C) used per pillar + all mandatory fields complete>
- 螺旋上升永动机 logic check: <referral → order → advocacy → new lead chain present>
- Moving to Operations automatically.
```

## Phase 3 Continuation Template Gates (mandatory)

- `3-offline-conv` primary card must use Template A (口碑传递) or Template C (网点销售促进) from `../shared/continuation-activity-templates.md`.
- `3-offline-trial` primary card must use Template B (试驾价值体验) from `../shared/continuation-activity-templates.md`.
- `3-online` primary card must use Template A online variant (口碑传递 online) from `../shared/continuation-activity-templates.md`.
- Each template's mandatory fields must be complete; mark `partial` only when evidence is unavailable.
- 螺旋上升永动机 logic must be traceable across the three Phase 3 pillars.

## Output Contract for Next Phase

Before handing off to `Phase: Operations`, output:

1. `## Action Playbook` with all stage/pillar primary cards
2. `## Alternative Cards` with one backup per pillar
3. `## Budget Allocation Table` with online/offline split by stage and overall total; Phase 2 row must include venue-related amount and venue-related ratio for the 60% validation
4. `## Auto-Display Log` with summaries for Phase 1/2/3 (replacing the old Blocking Log)
5. `## Activity Form Compliance Report` with per-card compliance status (`compliant` / `partial` / `non-compliant`) and any rejection notes
6. `## Event Leverage Report` with one row per phase (`phase`, `event_name`, `actual_cost`, `perceived_value`, `cost_tier`)
7. `## Non-Traditional Launch Ritual Report` (Phase 2 only; include protagonist type, format archetype, propagation test result, and short-video asset plan)
8. `## Lead Operations Summary` (platform capture mechanics, H/W/C split, warming sequence key nodes, dealer intake SLA)
9. `## Conversion Mechanics Register` (selected mechanisms by phase, urgency trigger, test-drive-to-order path owner, deposit follow-up owner)
10. `## Private-Domain Seeding Plan` (WeChat node seed actions for each phase and Operations handoff note)
11. `## Launch Execution Blueprint` (follow `launch-execution-template.md`, include site/main+backup, layout table, run sheet, on-site capture, N-7/N/N+3 communication map)
12. `## Persisted Files Snapshot`
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
