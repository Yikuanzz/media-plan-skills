# Regional Auto Launch Plan — Auto-Continuation & Activity Form Constraints Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Modify `skills/regional-auto-launch-plan/` to enable automatic continuation through Action phases (keep BLOCKING-A only) and enforce activity-form preferences/exclusions via a new centralized contract.

**Architecture:** Add one new shared contract file (`activity-form-constraints.md`) referenced by both global gates and sub-agent dispatch template. Replace BLOCKING-B/C/D with non-blocking Auto-Display Summaries. Add field `14` to Activity Card Schema for compliance auditing.

**Tech Stack:** Markdown skill package, ripgrep assertions, git.

---

### Task 1: Create `shared/activity-form-constraints.md`

**Files:**
- Create: `skills/regional-auto-launch-plan/shared/activity-form-constraints.md`
- Test: `skills/regional-auto-launch-plan/shared/activity-form-constraints.md`

- [ ] **Step 1: Verify target file does not exist**

Run:
```bash
ls skills/regional-auto-launch-plan/shared/activity-form-constraints.md 2>/dev/null || echo "FILE_NOT_FOUND"
```
Expected: `FILE_NOT_FOUND`

- [ ] **Step 2: Create the file with full content**

Write to `skills/regional-auto-launch-plan/shared/activity-form-constraints.md`:

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

- [ ] **Step 3: Run contract assertion**

Run:
```bash
rg -n "Exclude List|Preference List|Validation Rules|Field Definition|non-compliant|partial|compliant" skills/regional-auto-launch-plan/shared/activity-form-constraints.md
```
Expected: all keywords found.

- [ ] **Step 4: Commit**

```bash
git add skills/regional-auto-launch-plan/shared/activity-form-constraints.md
git commit -m "feat(regional-auto-launch-plan): add activity form constraints contract"
```

---

### Task 2: Modify `SKILL.md` — add global constraint rule 9

**Files:**
- Modify: `skills/regional-auto-launch-plan/SKILL.md`
- Test: `skills/regional-auto-launch-plan/SKILL.md`

- [ ] **Step 1: Write failing assertion**

Run:
```bash
rg -n "ACTIVITY FORM CONSTRAINTS|activity-form-constraints.md" skills/regional-auto-launch-plan/SKILL.md
```
Expected: no matches (or only partial matches from existing file references).

- [ ] **Step 2: Add global constraint rule 9**

In `skills/regional-auto-launch-plan/SKILL.md`, locate the line:

```markdown
8. **CORE THEME, NOT SERIALIZED IP** - Do not force serialized IP programs. Use evidence-backed `Core Theme` and stage sub-themes.
```

After it, add:

```markdown
9. **ACTIVITY FORM CONSTRAINTS** - All activity design must comply with `./shared/activity-form-constraints.md`. Exclude List items are hard vetos; Preference List items receive scoring bonus during idea evaluation. Every offline card must include dealer-linkage; every online card must include traceability.
```

- [ ] **Step 3: Re-run assertion**

Run:
```bash
rg -n "ACTIVITY FORM CONSTRAINTS|activity-form-constraints.md" skills/regional-auto-launch-plan/SKILL.md
```
Expected: both strings found.

- [ ] **Step 4: Commit**

```bash
git add skills/regional-auto-launch-plan/SKILL.md
git commit -m "feat(regional-auto-launch-plan): add activity form constraints to global gates"
```

---

### Task 3: Modify `SKILL.md` — replace BLOCKING-B/C/D with Auto-Display Checkpoints

**Files:**
- Modify: `skills/regional-auto-launch-plan/SKILL.md`
- Test: `skills/regional-auto-launch-plan/SKILL.md`

- [ ] **Step 1: Verify current BLOCKING markers exist**

Run:
```bash
rg -n "BLOCKING-B|BLOCKING-C|BLOCKING-D" skills/regional-auto-launch-plan/SKILL.md
```
Expected: all three markers found.

- [ ] **Step 2: Replace BLOCKING-B/C/D definitions in Step 5 (Action)**

In `skills/regional-auto-launch-plan/SKILL.md`, locate the `### Step 5: Action` section. Find and replace:

Old text:
```markdown
**BLOCKING-B**: After all Phase 1 pillars are complete, request user confirmation before Phase 2 dispatch.

**BLOCKING-C**: After all Phase 2 pillars are complete, request user confirmation before Phase 3 dispatch.

**BLOCKING-D**: After all Phase 3 pillars are complete, request user confirmation before Operations.
```

New text:
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

- [ ] **Step 3: Update output contract in SKILL.md**

In the `### Step 5: Action` section, find the output contract (near the bottom of the step). Update item 4 and add item 5:

Old:
```markdown
4. `## Blocking Log` with explicit confirmations for `BLOCKING-B`, `BLOCKING-C`, `BLOCKING-D`
```

New:
```markdown
4. `## Auto-Display Log` with summaries for Phase 1/2/3 (replacing the old Blocking Log)
5. `## Activity Form Compliance Report` with per-card compliance status (`compliant` / `partial` / `non-compliant`) and any rejection notes
```

- [ ] **Step 4: Run assertions**

Run:
```bash
rg -n "Auto-Display Checkpoints|Phase 1 Auto-Display Summary|Phase 2 Auto-Display Summary|Phase 3 Auto-Display Summary|Auto-Display Log|Activity Form Compliance Report" skills/regional-auto-launch-plan/SKILL.md
```
Expected: all strings found.

Run:
```bash
rg -n "BLOCKING-B|BLOCKING-C|BLOCKING-D" skills/regional-auto-launch-plan/SKILL.md
```
Expected: only `BLOCKING-B` and `BLOCKING-C` and `BLOCKING-D` found in historical/contextual references (like the global hard gates section or the symptom table), NOT in the Step 5 Action execution section as active blocking points. If found in Step 5, verify the replacement was complete.

- [ ] **Step 5: Commit**

```bash
git add skills/regional-auto-launch-plan/SKILL.md
git commit -m "feat(regional-auto-launch-plan): replace BLOCKING-B/C/D with auto-display checkpoints"
```

---

### Task 4: Modify `phases/action.md` — replace Blocking with Auto-Display

**Files:**
- Modify: `skills/regional-auto-launch-plan/phases/action.md`
- Test: `skills/regional-auto-launch-plan/phases/action.md`

- [ ] **Step 1: Verify current blocking section exists**

Run:
```bash
rg -n "Stage-Level Blocking Checkpoints|BLOCKING-B|BLOCKING-C|BLOCKING-D" skills/regional-auto-launch-plan/phases/action.md
```
Expected: all markers found.

- [ ] **Step 2: Replace the entire blocking section**

In `skills/regional-auto-launch-plan/phases/action.md`, locate:

```markdown
## Stage-Level Blocking Checkpoints
```

Replace from that heading through the end of the `BLOCKING-D` subsection (just before `## Output Contract for Next Phase`) with:

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
```

- [ ] **Step 3: Update output contract in phases/action.md**

In `skills/regional-auto-launch-plan/phases/action.md`, find:

```markdown
4. `## Blocking Log` with explicit confirmations for `BLOCKING-B`, `BLOCKING-C`, `BLOCKING-D`
```

Replace with:

```markdown
4. `## Auto-Display Log` with summaries for Phase 1/2/3 (replacing the old Blocking Log)
5. `## Activity Form Compliance Report` with per-card compliance status (`compliant` / `partial` / `non-compliant`) and any rejection notes
```

- [ ] **Step 4: Run assertions**

Run:
```bash
rg -n "Stage-Level Auto-Display Checkpoints|Phase 1 Auto-Display Summary|Phase 2 Auto-Display Summary|Phase 3 Auto-Display Summary|Auto-Display Log|Activity Form Compliance Report" skills/regional-auto-launch-plan/phases/action.md
```
Expected: all strings found.

Run:
```bash
rg -n "BLOCKING-B|BLOCKING-C|BLOCKING-D" skills/regional-auto-launch-plan/phases/action.md
```
Expected: no matches (the markers should only remain in SKILL.md for historical reference, not in the action phase file).

- [ ] **Step 5: Commit**

```bash
git add skills/regional-auto-launch-plan/phases/action.md
git commit -m "feat(regional-auto-launch-plan): convert action phase blocking to auto-display"
```

---

### Task 5: Modify `shared/action-playbook-template.md` — add field 14 and dispatch constraints

**Files:**
- Modify: `skills/regional-auto-launch-plan/shared/action-playbook-template.md`
- Test: `skills/regional-auto-launch-plan/shared/action-playbook-template.md`

- [ ] **Step 1: Verify current schema ends at Group D**

Run:
```bash
rg -n "Group D|Group E|Activity Form Compliance" skills/regional-auto-launch-plan/shared/action-playbook-template.md
```
Expected: `Group D` found; `Group E` and `Activity Form Compliance` NOT found.

- [ ] **Step 2: Add Group E (field 14) to Schema**

In `skills/regional-auto-launch-plan/shared/action-playbook-template.md`, locate:

```markdown
### Group D - Risk and Trace (2)

12. Risks and mitigation (multi-sentence paragraph; include positioning/content/channel/mindset counter-moves and internal Plan B)
13. Source trace (one sentence linking back to Insight evidence)
```

After it, add:

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

- [ ] **Step 3: Add Activity Form Constraints to Sub-Agent Dispatch Prompt**

In `skills/regional-auto-launch-plan/shared/action-playbook-template.md`, locate:

```markdown
## Non-Negotiable Principles (all must hold)
1) Low-cost realism: avoid inflated production ideas outside regional scope.
2) Fast impact: include near-term trigger nodes, not long pre-build dependency.
3) Executable delivery: dealer/local team can execute with available resources.
4) Real audience pull: explain concrete motivation, not slogan-only gimmicks.
```

After it, add:

```markdown
## Activity Form Constraints (non-negotiable)

Before proposing any activity, read `../shared/activity-form-constraints.md` and enforce:

- **Hard veto**: Exclude List items are never allowed. If your idea falls into any excluded category, discard it and generate a new candidate.
- **Preference bonus**: Ideas that hit 2+ Preference List categories score higher.
- **Offline mandate**: Every offline card must explicitly describe dealer involvement (venue, staff, or lead handoff).
- **Online mandate**: Every online card must describe how leads/orders are tracked (UTM, unique code, or CRM tag).
- **Field 14**: Every card must include field `14. Activity Form Compliance` with a valid value and explanation.
```

- [ ] **Step 4: Update Main-Agent Review Hand-off**

In `skills/regional-auto-launch-plan/shared/action-playbook-template.md`, locate:

```markdown
## Main-Agent Review Hand-off

After collecting all candidate cards for a pillar, the main agent must score each card with `shared/idea-scorecard.md`, select one `primary`, keep one `alternative`, and carry forward both decision logs.
```

Replace with:

```markdown
## Main-Agent Review Hand-off

After collecting all candidate cards for a pillar, the main agent must:

1. Verify field `14` is present and valid for every card.
2. Reject any `non-compliant` card immediately (do not score it).
3. Score remaining cards with `shared/idea-scorecard.md`, adding a **preference bonus** (+1 point per Preference List category hit, max +3).
4. Select highest valid score as `primary`, second highest as `alternative`.
5. Carry forward both decision logs and compliance notes.
```

- [ ] **Step 5: Run assertions**

Run:
```bash
rg -n "Group E|Activity Form Compliance|Field 14|Hard veto|Preference bonus|Offline mandate|Online mandate|preference bonus" skills/regional-auto-launch-plan/shared/action-playbook-template.md
```
Expected: all strings found.

- [ ] **Step 6: Commit**

```bash
git add skills/regional-auto-launch-plan/shared/action-playbook-template.md
git commit -m "feat(regional-auto-launch-plan): add activity form compliance field and dispatch constraints"
```

---

### Task 6: Final integration check

**Files:**
- Test: all modified files

- [ ] **Step 1: Cross-file consistency check**

Run:
```bash
rg -n "activity-form-constraints.md" skills/regional-auto-launch-plan/SKILL.md skills/regional-auto-launch-plan/shared/action-playbook-template.md
```
Expected: both files reference the new shared contract.

- [ ] **Step 2: Verify no orphaned BLOCKING references in action files**

Run:
```bash
rg -n "BLOCKING-B|BLOCKING-C|BLOCKING-D" skills/regional-auto-launch-plan/phases/action.md skills/regional-auto-launch-plan/shared/action-playbook-template.md
```
Expected: no matches in these two files.

- [ ] **Step 3: Verify BLOCKING-A still exists in SKILL.md**

Run:
```bash
rg -n "BLOCKING-A" skills/regional-auto-launch-plan/SKILL.md
```
Expected: found (should remain as the only user confirmation checkpoint).

- [ ] **Step 4: Verify Auto-Display exists in both SKILL.md and phases/action.md**

Run:
```bash
rg -n "Auto-Display Summary" skills/regional-auto-launch-plan/SKILL.md skills/regional-auto-launch-plan/phases/action.md
```
Expected: found in both files.

- [ ] **Step 5: Verify field 14 exists in action-playbook-template.md**

Run:
```bash
rg -n "14\. Activity Form Compliance" skills/regional-auto-launch-plan/shared/action-playbook-template.md
```
Expected: found.

- [ ] **Step 6: Commit**

```bash
git add -A
git commit -m "chore(regional-auto-launch-plan): final integration check for auto-continuation and activity form constraints"
```

---

## Self-Review

### 1. Spec coverage

| Spec Requirement | Plan Task |
|---|---|
| New `shared/activity-form-constraints.md` with Exclude/Preference/Validation/Field | Task 1 |
| SKILL.md global constraint rule 9 | Task 2 |
| SKILL.md BLOCKING-B/C/D → Auto-Display | Task 3 |
| SKILL.md output contract update | Task 3 |
| phases/action.md blocking → auto-display | Task 4 |
| phases/action.md output contract update | Task 4 |
| action-playbook-template.md Schema field 14 (Group E) | Task 5 |
| action-playbook-template.md Dispatch Prompt constraints | Task 5 |
| action-playbook-template.md Review Hand-off compliance | Task 5 |
| BLOCKING-A preserved | Task 3, Task 6 |

All spec requirements covered. No gaps.

### 2. Placeholder scan

- No `TBD`, `TODO`, `implement later` found.
- No vague instructions like "add appropriate error handling".
- Every step has exact file paths, exact commands, and expected outputs.
- Code blocks contain full content for every creation/modification step.

### 3. Type/term consistency

- `activity-form-constraints.md` used consistently (not `activity_form_constraints` or variants).
- `Auto-Display Summary` / `Auto-Display Log` / `Auto-Display Checkpoints` naming consistent across SKILL.md and phases/action.md.
- Field `14` named `Activity Form Compliance` consistently.
- Value enum `compliant` | `partial` | `non-compliant` consistent across all files.
- Preference bonus: `+1 point per Preference List category hit, max +3` consistent.
