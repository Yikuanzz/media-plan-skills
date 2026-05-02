# Regional Auto Launch Plan — Auto-Continuation & Activity Form Constraints Design

> **Scope**: Modify `skills/regional-auto-launch-plan/` to enable automatic continuation after Pre-Brief completion, while encoding activity-form preferences and exclusions as enforceable constraints.
> **Approach**: Centralized contract (方案 2) — one new shared file referenced by both global gates and action dispatch template.

---

## Problem Statement

Current `SKILL.md` requires explicit user confirmation at four blocking checkpoints:

- `BLOCKING-A`: After Strategy (Core Theme + slogan + stage sub-themes)
- `BLOCKING-B`: After Action Phase 1
- `BLOCKING-C`: After Action Phase 2
- `BLOCKING-D`: After Action Phase 3

The user wants Pre-Brief to automatically drive the full workflow forward with minimal friction, while keeping strict quality gates. Additionally, the user has explicit activity-form preferences (low-cost flash events, regional precision targeting, digital-first, dealer-linked闭环) and exclusions (large auto shows, international launches, high-cost flash events).

## Design Decisions

| Decision | Choice | Rationale |
|---|---|---|
| Auto-continuation scope | Keep `BLOCKING-A`, auto-continue through B/C/D | Strategy (Core Theme + slogan) is the highest-leverage creative decision; user wants to retain control there. Action phases are more mechanical and benefit from speed. |
| Activity-form constraints location | New `shared/activity-form-constraints.md` | Single source of truth; referenced by both global constraints and sub-agent dispatch prompt. Avoids duplication and drift. |
| Compliance enforcement | Hard veto (`non-compliant` = reject) + scoring bonus (`partial` = note required) | Clear binary rule for exclusions; flexible guidance for preferences. |
| Schema extension | Add field `14` to Activity Card | Makes compliance explicit and auditable in every card. |

---

## Architecture

```text
skills/regional-auto-launch-plan/
├── SKILL.md                          ← global constraint reference + auto-display checkpoint definitions
├── phases/
│   └── action.md                     ← stage-level auto-display checkpoints + updated output contract
└── shared/
    ├── action-playbook-template.md   ← dispatch prompt + schema field 14 + review hand-off updates
    └── activity-form-constraints.md  ← NEW: exclude list + preference list + validation rules + field definition
```

---

## Chapter A: `shared/activity-form-constraints.md` (New File)

```markdown
# Activity Form Constraints

Central contract for activity-type exclusions and preferences in `regional-auto-launch-plan`. All upstream and downstream contracts reference this file; do not duplicate its contents elsewhere.

## Exclude List (hard veto)

The following activity forms are **prohibited** in any Activity Card. A card proposing any of these must be rejected automatically.

- 大型车展（面积 >= 5000㎡ 或单场地费用 >= CNY 100k）
- 国际发布会（含海外嘉宾、跨国直播、双语物料）
- 高成本线下快闪（单点位 >= CNY 30k 或不含可追踪转化链路）
- 纯品牌曝光无转化链路的活动（无法归因到线索/试驾/订单）
- 需要 >4 周筹备周期的重搭建项目

## Preference List (positive signals)

When generating Activity Cards, **prioritize** the following forms. Preference does not mean mandatory; it means these forms score higher during idea-scorecard evaluation.

| Category | Preferred Forms | Rationale |
|---|---|---|
| 低成本线下快闪 | 商场中庭静态展、社区入口微型展位、加油站/充电站联动展示 | 低搭建、快落地、区域精准 |
| 区域化精准投放 | 本地生活平台（美团/大众点评开屏、信息流）、城市交通广播早晚高峰段、社区电梯广告 | 可按 geo 定向、成本可控、效果可追踪 |
| 数字营销为主 | 短视频平台挑战赛（Douyin）、本地 KOL 试驾直播、朋友圈定向广告（LBS 3km 圈选） | 数据回流完整、A/B 测试友好、dealer 可复用素材 |
| 可执行用户互动 | 城市试驾巡游、社区体验日、线上预约试驾抽奖 | 用户参与门槛低、线索收集直接 |
| 经销商联动闭环 | 线索分配 SOP、门店承接话术包、转化追踪看板 | 从曝光到订单的完整归因 |

## Validation Rules

When evaluating an Activity Card, apply these rules in order:

1. **Exclude check first**: If the card's core form matches any Exclude List item, mark `non-compliant` and reject.
2. **Preference scoring**: If compliant, count how many Preference List categories the card touches. More categories = higher preference score.
3. **Dealer-linkage mandatory**: Any offline card must explicitly describe dealer involvement (venue, staff, or lead handoff). Cards without this are `partial`.
4. **Traceability mandatory**: Any online card must describe how leads/orders are tracked (UTM, unique code, CRM tag). Cards without this are `partial`.

## Field Definition

In Activity Card Schema, add field `14`:

- **14. Activity Form Compliance** (`mandatory`)
  - Value: `compliant` | `partial` | `non-compliant`
  - Determined by applying Validation Rules 1-4 above.
  - Cards with `non-compliant` cannot be selected as `primary` or `alternative`.
  - Cards with `partial` require a note explaining which rule triggered it and a mitigation plan.
```

---

## Chapter B: `SKILL.md` Changes

### B.1 Global constraints — add activity-form reference

After existing rule 8 (`CORE THEME, NOT SERIALIZED IP`), add rule 9:

```markdown
9. **ACTIVITY FORM CONSTRAINTS** - All activity design must comply with `./shared/activity-form-constraints.md`. Exclude List items are hard vetos; Preference List items receive scoring bonus during idea evaluation. Every offline card must include dealer-linkage; every online card must include traceability.
```

### B.2 BLOCKING-B/C/D → Auto-Display Checkpoints

Replace the `BLOCKING-B`, `BLOCKING-C`, `BLOCKING-D` sections in Step 5 (Action) with auto-display summaries.

Old:
```markdown
**BLOCKING-B**: After all Phase 1 pillars are complete, request user confirmation before Phase 2 dispatch.
```

New:
```markdown
### Auto-Display Checkpoints (was BLOCKING-B/C/D)

Phase transitions no longer require explicit user confirmation. After each phase's pillars are complete, output an `## Auto-Display Summary` and proceed automatically.

#### After Phase 1

Output:
```md
## Phase 1 Auto-Display Summary
- Primary cards: <list>
- Alternative cards: <list>
- Budget snapshot: <online/offline/total>
- Activity form compliance: <all compliant | partial items noted>
- Next: dispatching Phase 2 pillars automatically.
```

#### After Phase 2

Output:
```md
## Phase 2 Auto-Display Summary
- Primary cards: <list>
- Alternative cards: <list>
- Budget snapshot: <online/offline/total + venue-related amount + venue-related ratio>
- Activity form compliance: <all compliant | partial items noted>
- Next: dispatching Phase 3 pillars automatically.
```

#### After Phase 3

Output:
```md
## Phase 3 Auto-Display Summary
- Primary cards: <list>
- Alternative cards: <list>
- Budget snapshot: <online/offline/total>
- Activity form compliance: <all compliant | partial items noted>
- Next: moving to Operations automatically.
```
```

### B.3 BLOCKING-A remains unchanged

Strategy 后的 `BLOCKING-A` 仍是唯一需要显式用户确认的检查点：

```markdown
**BLOCKING-A**: After strategy output, require explicit user confirmation of Core Theme + slogan + three stage sub-themes before Action.
```

### B.4 Output contract update

Action Phase 的输出契约中，`Blocking Log` 改为 `Auto-Display Log`：

```markdown
Before handing off to `Phase: Operations`, output:
1. `## Action Playbook` with all stage/pillar primary cards
2. `## Alternative Cards` with one backup per pillar
3. `## Budget Allocation Table` with online/offline split by stage and overall total
4. `## Auto-Display Log` with summaries for Phase 1/2/3
5. `## Activity Form Compliance Report` with per-card compliance status
```

---

## Chapter C: `phases/action.md` Changes

Replace `Stage-Level Blocking Checkpoints` with `Stage-Level Auto-Display Checkpoints`:

```markdown
## Stage-Level Auto-Display Checkpoints

Phase 1/2/3 transitions no longer block for user confirmation. Instead, emit a summary, pause briefly (log output only), and continue automatically.

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
```

---

## Chapter D: `shared/action-playbook-template.md` Changes

### D.1 Schema — add field 14

In Activity Card Schema, after Group D, add Group E:

```markdown
### Group E - Activity Form Compliance (1)

14. Activity Form Compliance (`mandatory`)
    - Value: `compliant` | `partial` | `non-compliant`
    - Determined by applying rules in `../shared/activity-form-constraints.md`:
      1. Exclude check first: if core form matches Exclude List, mark `non-compliant`.
      2. Preference scoring: count Preference List categories touched.
      3. Dealer-linkage check: offline cards must describe dealer involvement.
      4. Traceability check: online cards must describe lead/order tracking method.
    - `non-compliant` cards cannot be selected as `primary` or `alternative`.
    - `partial` cards require a note explaining which rule triggered it and a mitigation plan.
```

### D.2 Sub-Agent Dispatch Prompt — add constraints section

After `## Non-Negotiable Principles`, add:

```markdown
## Activity Form Constraints (non-negotiable)

Before proposing any activity, read `../shared/activity-form-constraints.md` and enforce:

- **Hard veto**: Exclude List items are never allowed. If your idea falls into any excluded category, discard it and generate a new candidate.
- **Preference bonus**: Ideas that hit 2+ Preference List categories score higher.
- **Offline mandate**: Every offline card must explicitly describe dealer involvement (venue, staff, or lead handoff).
- **Online mandate**: Every online card must describe how leads/orders are tracked (UTM, unique code, or CRM tag).
- **Field 14**: Every card must include field `14. Activity Form Compliance` with a valid value and explanation.
```

### D.3 Main-Agent Review Hand-off — add compliance step

Replace existing review hand-off with:

```markdown
## Main-Agent Review Hand-off

After collecting all candidate cards for a pillar, the main agent must:

1. Verify field `14` is present and valid for every card.
2. Reject any `non-compliant` card immediately (do not score it).
3. Score remaining cards with `shared/idea-scorecard.md`, adding a **preference bonus** (+1 point per Preference List category hit, max +3).
4. Select highest valid score as `primary`, second highest as `alternative`.
5. Carry forward both decision logs and compliance notes.
```

---

## Verification Checklist

- [ ] `shared/activity-form-constraints.md` exists with Exclude List, Preference List, Validation Rules, and Field Definition
- [ ] `SKILL.md` references `activity-form-constraints.md` in global constraints
- [ ] `SKILL.md` has Auto-Display Checkpoints for Phase 1/2/3 (not BLOCKING-B/C/D)
- [ ] `SKILL.md` still has `BLOCKING-A` unchanged
- [ ] `phases/action.md` has Auto-Display Checkpoints with required output format
- [ ] `phases/action.md` output contract includes `Auto-Display Log` and `Activity Form Compliance Report`
- [ ] `shared/action-playbook-template.md` Schema has field 14 (Group E)
- [ ] `shared/action-playbook-template.md` Dispatch Prompt has Activity Form Constraints section
- [ ] `shared/action-playbook-template.md` Review Hand-off includes compliance verification and preference bonus
