# Media Plan Creative & Executional Depth — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add validation rules and template fields to the media-plan skill so `auto_regional_launch` proposals match TARGET_REAL creative density, serialized IP continuity, on-site interaction loops, and local circle resource depth.

**Architecture:** Five existing markdown contract files receive targeted edits — two add validation gates (ideation, execution), two enrich research output shape (research-rubric, highlight-canvas), and one expands the proposal template (proposal-template). No new files; all changes are conditional on `auto_regional_launch`.

**Tech Stack:** Markdown contract files only; no code. Verification via `grep` / file read.

---

## File Structure

| File | Action | Responsibility |
|---|---|---|
| `skills/media-plan/shared/highlight-mechanism-canvas.md` | Modify | Add serialized IP + activity density rules to canvas contract |
| `skills/media-plan/phases/ideation.md` | Modify | Add `keep` validity gates that enforce the new canvas rules |
| `skills/media-plan/shared/research-rubric.md` | Modify | Add circle pool + sponsorship pool as recommended research items |
| `skills/media-plan/phases/execution.md` | Modify | Add validation rules + handoff fields for interaction/sales/experience |
| `skills/media-plan/shared/proposal-template.md` | Modify | Expand Program Blueprint Card, Launch Event Plan, phase tables |

---

## Pre-Flight Check

Before starting Task 1, confirm the design doc is at:
`docs/superpowers/specs/2026-04-26-media-plan-creative-execution-depth-design.md`

If missing, stop and re-run the design phase.

---

## Task 1: `highlight-mechanism-canvas.md` — Add serialized IP rule

**Files:**
- Modify: `skills/media-plan/shared/highlight-mechanism-canvas.md`

- [ ] **Step 1: Insert serialized IP requirement after Strategy pillars mapping rule**

Locate the line ending with `maps to Strategy pillar: [pillar name]`.` and add the new rule immediately after it.

Edit:
```markdown
old_string:
- For `auto_regional_launch`, each named pillar in `Stage pillars` must map to one of the `Strategy pillars` from `## Core Strategic Idea`. Include the mapping inline: `[name] — [role tag] — maps to Strategy pillar: [pillar name]`.
```

```markdown
new_string:
- For `auto_regional_launch`, each named pillar in `Stage pillars` must map to one of the `Strategy pillars` from `## Core Strategic Idea`. Include the mapping inline: `[name] — [role tag] — maps to Strategy pillar: [pillar name]`.
- **Serialized IP requirement (auto_regional_launch only):** The canvas must name at least one **serialized IP program** that appears in all three stages (Early / Mid / Late) with a clear phase-evolution logic. Example: "AI Creator Contest" → Early (launch + creation), Mid (voting + award at launch event), Late (winner showcase + owner co-creation). A hero event that only appears in one stage does not satisfy this rule. If no serialized IP is present, mark the direction `revise`.
```

- [ ] **Step 2: Verify insertion**

Run:
```bash
grep -n "Serialized IP requirement" skills/media-plan/shared/highlight-mechanism-canvas.md
```

Expected: one match with line number.

- [ ] **Step 3: Commit**

```bash
git add skills/media-plan/shared/highlight-mechanism-canvas.md
git commit -m "feat(highlight-canvas): add serialized IP requirement for auto_regional_launch

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 2: `highlight-mechanism-canvas.md` — Add activity density rule

**Files:**
- Modify: `skills/media-plan/shared/highlight-mechanism-canvas.md`

- [ ] **Step 1: Insert activity density requirement before Local life map**

Locate the end of the `Stage pillars` output format block (the line `    - …` after `Late:`), and add the new rule before `- Local life map:`.

Edit:
```markdown
old_string:
  - Late:
    - …
- Local life map:
```

```markdown
new_string:
  - Late:
    - …
- **Activity density requirement (auto_regional_launch only):** Each stage (Early / Mid / Late) must list **at least three concrete, named activities** — not channel placeholders like "Douyin KOL seeding" or "WeChat Moments flight." Named activities include: "AI短视频创意大赛," "高端社区快闪定展," "车主&KOC沙龙." If any stage has fewer than three named activities, mark the direction `revise`.
- Local life map:
```

- [ ] **Step 2: Verify insertion**

Run:
```bash
grep -n "Activity density requirement" skills/media-plan/shared/highlight-mechanism-canvas.md
```

Expected: one match.

- [ ] **Step 3: Commit**

```bash
git add skills/media-plan/shared/highlight-mechanism-canvas.md
git commit -m "feat(highlight-canvas): add activity density requirement for auto_regional_launch

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 3: `ideation.md` — Add canvas completeness gate

**Files:**
- Modify: `skills/media-plan/phases/ideation.md`

- [ ] **Step 1: Insert Highlight Mechanism Canvas completeness rule**

Locate the end of the "Core Strategic Idea completeness rule" block (the line `If any field is missing, empty, or placeholder-only (e.g. "TBD", "待定"), mark the direction \`revise\`, not \`keep\`.`) and add the new gate after it.

Edit:
```markdown
old_string:
If any field is missing, empty, or placeholder-only (e.g. "TBD", "待定"), mark the direction `revise`, not `keep`.

## Notes Requirements
```

```markdown
new_string:
If any field is missing, empty, or placeholder-only (e.g. "TBD", "待定"), mark the direction `revise`, not `keep`.

### Highlight Mechanism Canvas completeness rule (auto_regional_launch)
For `auto_regional_launch`, a `keep` direction is **invalid** unless its `## Highlight Mechanism Canvas` satisfies **all** of the following:
1. Contains at least one **serialized IP** that appears in all three stages with phase-evolution logic.
2. Each stage (Early / Mid / Late) lists at least **three concrete, named activities** (not channel placeholders).
3. `Late` stage includes at least one **differentiated experience event** (e.g., test-drive camp, owner salon, premium outdoor experience, deep scenario trial) with a concrete venue or format named.

If any of the above is missing or placeholder-only, mark the direction `revise`, not `keep`.

## Notes Requirements
```

- [ ] **Step 2: Verify insertion**

Run:
```bash
grep -n "Highlight Mechanism Canvas completeness rule" skills/media-plan/phases/ideation.md
```

Expected: one match.

- [ ] **Step 3: Commit**

```bash
git add skills/media-plan/phases/ideation.md
git commit -m "feat(ideation): add canvas completeness gate for auto_regional_launch

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 4: `ideation.md` — Enrich Notes for city/regional briefs

**Files:**
- Modify: `skills/media-plan/phases/ideation.md`

- [ ] **Step 1: Append new Note fields after Hashtag extensibility**

Locate the block that ends with:
```markdown
- These four items (`One-line propagation theme`, `City or regional emotional binding`, `Product-sellpoint mapping`, `Hashtag extensibility`) must also be surfaced in either the `## Core Strategic Idea` block or the `## Highlight Mechanism Canvas` for the direction. They may not exist only inside `## Notes`.
```

Edit to append after that line:
```markdown
old_string:
- These four items (`One-line propagation theme`, `City or regional emotional binding`, `Product-sellpoint mapping`, `Hashtag extensibility`) must also be surfaced in either the `## Core Strategic Idea` block or the `## Highlight Mechanism Canvas` for the direction. They may not exist only inside `## Notes`.

## Core Strategic Idea requirement
```

```markdown
new_string:
- These four items (`One-line propagation theme`, `City or regional emotional binding`, `Product-sellpoint mapping`, `Hashtag extensibility`) must also be surfaced in either the `## Core Strategic Idea` block or the `## Highlight Mechanism Canvas` for the direction. They may not exist only inside `## Notes`.
- `Serialized IP candidates`: [name at least one IP that could span all three phases, with evolution logic per phase]
- `Differentiated experience event (Late stage)`: [concrete venue/format for a non-sales, experience-heavy activation]

## Core Strategic Idea requirement
```

- [ ] **Step 2: Verify**

Run:
```bash
grep -n "Serialized IP candidates" skills/media-plan/phases/ideation.md
```

Expected: one match.

- [ ] **Step 3: Commit**

```bash
git add skills/media-plan/phases/ideation.md
git commit -m "feat(ideation): add serialized IP and experience event to Notes

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 5: `research-rubric.md` — Add circle pool and sponsorship pool

**Files:**
- Modify: `skills/media-plan/shared/research-rubric.md`

- [ ] **Step 1: Insert after Premium venue pool**

Locate:
```markdown
- Premium venue pool:
```

Edit:
```markdown
old_string:
- Premium venue pool:
```

```markdown
new_string:
- Premium venue pool:
- Premium circle pool: [high-net-worth clubs, business associations, alumni networks, private membership groups relevant to target audience; e.g., "楚商联合会", "高端社区业主群", "EMBA校友会"]
- Local sponsorship pool: [regional events, venues, or cultural IPs that could be co-activated; e.g., "武汉天地商业体", "东湖绿道骑行节", "武汉网球公开赛"]
```

- [ ] **Step 2: Verify**

Run:
```bash
grep -n "Premium circle pool\|Local sponsorship pool" skills/media-plan/shared/research-rubric.md
```

Expected: two matches.

- [ ] **Step 3: Commit**

```bash
git add skills/media-plan/shared/research-rubric.md
git commit -m "feat(research-rubric): add circle pool and sponsorship pool to City Evidence Pack

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 6: `research-rubric.md` — Enrich Proposal Ammunition

**Files:**
- Modify: `skills/media-plan/shared/research-rubric.md`

- [ ] **Step 1: Insert after Family/emotional scene hooks**

Locate:
```markdown
- Family/emotional scene hooks: [for auto family-SUV briefs, emotional entry points beyond tech specs]
```

Edit:
```markdown
old_string:
- Family/emotional scene hooks: [for auto family-SUV briefs, emotional entry points beyond tech specs]
```

```markdown
new_string:
- Family/emotional scene hooks: [for auto family-SUV briefs, emotional entry points beyond tech specs]
- Circle resource anchors: [specific local circles or associations that can be activated for circle-penetration or private-salon events]
- Sponsorship/venue integration hooks: [regional events or venues that can host or co-brand with launch activities]
```

- [ ] **Step 2: Verify**

Run:
```bash
grep -n "Circle resource anchors\|Sponsorship/venue integration hooks" skills/media-plan/shared/research-rubric.md
```

Expected: two matches.

- [ ] **Step 3: Commit**

```bash
git add skills/media-plan/shared/research-rubric.md
git commit -m "feat(research-rubric): add circle and sponsorship hooks to Proposal Ammunition

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 7: `execution.md` — Add validation rules

**Files:**
- Modify: `skills/media-plan/phases/execution.md`

- [ ] **Step 1: Insert after existing Rules block**

Locate the end of the Rules section (the line `Produce proposal-ready material for the proposal's Phased Execution Plan...`) and add the new validation rules after it, before `## Required Handoff Shape`.

Edit:
```markdown
old_string:
- Produce proposal-ready material for the proposal's Phased Execution Plan, Phased Event Menu (with **cognitive** column), and Content Assets alignment, plus a validated execution handoff. Event Menu rows should reference **Content asset** names where applicable.

## Required Handoff Shape
```

```markdown
new_string:
- Produce proposal-ready material for the proposal's Phased Execution Plan, Phased Event Menu (with **cognitive** column), and Content Assets alignment, plus a validated execution handoff. Event Menu rows should reference **Content asset** names where applicable.
- **Program Blueprint Card completeness (auto_regional_launch)**: Every Program Blueprint Card must contain non-placeholder entries for `Interaction flow`, `Lead capture path`, and `Sales mechanism`. If any card is missing these three fields or they are generic ("TBD", "待定", "待确认"), set `Validation status: blocked` and route back to ideation to strengthen the mechanism.
- **Launch Event closed-loop requirement (auto_regional_launch)**: The Launch Event Plan must show a documented `Interaction → Lead capture → Conversion incentive` loop. If the loop is broken or absent, set `Validation status: blocked`.

## Required Handoff Shape
```

- [ ] **Step 2: Verify**

Run:
```bash
grep -n "Program Blueprint Card completeness\|Launch Event closed-loop" skills/media-plan/phases/execution.md
```

Expected: two matches.

- [ ] **Step 3: Commit**

```bash
git add skills/media-plan/phases/execution.md
git commit -m "feat(execution): add auto_regional_launch validation rules for cards and launch event

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 8: `execution.md` — Expand handoff shape

**Files:**
- Modify: `skills/media-plan/phases/execution.md`

- [ ] **Step 1: Insert after Conversion chain in handoff**

Locate within `## Validated Execution-Plan Handoff`:
```markdown
- Conversion chain:
```

Edit:
```markdown
old_string:
- Conversion chain:
- Resource or owner logic:
```

```markdown
new_string:
- Conversion chain:
- Sales mechanism roster: (list every named sales mechanism by phase, with trigger condition and expected conversion action)
- Circle resource activation plan: (which researched circle pools or sponsorship pools are activated in which phase, by what method)
- Differentiated experience event (Late stage): (name, venue, format, and cognitive job)
- Resource or owner logic:
```

- [ ] **Step 2: Verify**

Run:
```bash
grep -n "Sales mechanism roster\|Circle resource activation plan\|Differentiated experience event" skills/media-plan/phases/execution.md
```

Expected: three matches.

- [ ] **Step 3: Commit**

```bash
git add skills/media-plan/phases/execution.md
git commit -m "feat(execution): add sales, circle, and experience fields to handoff shape

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 9: `proposal-template.md` — Expand Program Blueprint Card

**Files:**
- Modify: `skills/media-plan/shared/proposal-template.md`

- [ ] **Step 1: Replace Program Blueprint Card template in Phase 1**

Locate the first occurrence of the card template (under Phase 1):
```markdown
#### Program Blueprint Card: [Program name]
- Program name and role: (awareness / circle / lead / conversion)
- Objective and audience slice:
- Theme and hooks: (include one-line theme and example hashtags)
- Mechanism design: (e.g., track setup, grouping logic, or participation routes)
- Execution flow: (step-by-step such as launch → creation → voting → award)
- Deliverables and asset pack: (content templates, creator assets, event materials)
- Owner and partner model:
- Lead capture and conversion action:
- KPI linked to this program:
- Fallback plan:
```

Replace with:
```markdown
new_string:
#### Program Blueprint Card: [Program name]
- Program name and role: (awareness / circle / lead / conversion)
- Objective and audience slice:
- Theme and hooks: (include one-line theme and example hashtags)
- Mechanism design: (e.g., track setup, grouping logic, or participation routes)
- **Interaction flow**: (step-by-step user journey on-site or online: what the user does, in what order, and what triggers the next step)
- **Execution flow**: (brand-side step-by-step: launch → creation → voting → award)
- **Sales mechanism**: (conversion incentive tied to this program: e.g., "现场扫码预约试驾送定制周边", "三人成团享额外权益", "集章打卡解锁购车优惠券")
- Deliverables and asset pack: (content templates, creator assets, event materials)
- Owner and partner model:
- **Lead capture path**: (specific method and trigger: e.g., "扫码进入小程序留资 → 销售顾问24h内回访", "现场注册会员 → 自动派发试驾券")
- KPI linked to this program:
- Fallback plan:
```

- [ ] **Step 2: Replace cards in Phase 2 and Phase 3**

The Phase 2 card currently reads:
```markdown
#### Program Blueprint Card: [Program name]
- [same structure as Phase 1]
```

Replace with:
```markdown
new_string:
#### Program Blueprint Card: [Program name]
- Program name and role: (awareness / circle / lead / conversion)
- Objective and audience slice:
- Theme and hooks: (include one-line theme and example hashtags)
- Mechanism design: (e.g., track setup, grouping logic, or participation routes)
- **Interaction flow**: (step-by-step user journey on-site or online: what the user does, in what order, and what triggers the next step)
- **Execution flow**: (brand-side step-by-step: launch → creation → voting → award)
- **Sales mechanism**: (conversion incentive tied to this program: e.g., "现场扫码预约试驾送定制周边", "三人成团享额外权益", "集章打卡解锁购车优惠券")
- Deliverables and asset pack: (content templates, creator assets, event materials)
- Owner and partner model:
- **Lead capture path**: (specific method and trigger: e.g., "扫码进入小程序留资 → 销售顾问24h内回访", "现场注册会员 → 自动派发试驾券")
- KPI linked to this program:
- Fallback plan:
```

Do the same for the Phase 3 card.

- [ ] **Step 3: Verify**

Run:
```bash
grep -n "Interaction flow\|Lead capture path\|Sales mechanism" skills/media-plan/shared/proposal-template.md
```

Expected: at least 6 matches (3 cards × 2 fields each, plus the expanded Phase 1 card).

- [ ] **Step 4: Commit**

```bash
git add skills/media-plan/shared/proposal-template.md
git commit -m "feat(proposal-template): expand Program Blueprint Card with interaction, lead-capture, and sales fields

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 10: `proposal-template.md` — Enrich Launch Event Plan

**Files:**
- Modify: `skills/media-plan/shared/proposal-template.md`

- [ ] **Step 1: Replace Launch Event Plan under Phase 2**

Locate:
```markdown
#### Launch Event Plan
- Venue:
- Core agenda:
- On-site traffic collection:
```

Replace with:
```markdown
new_string:
#### Launch Event Plan
- Venue:
- Core agenda:
- **On-site interaction → lead capture → conversion incentive loop**: (describe the full closed loop: what visitors do on-site, how they are prompted to leave contact info, and what immediate conversion incentive they receive)
- On-site traffic collection method:
- **Circle resource integration**: (which local premium circles, clubs, or associations are invited or co-hosting, and how they are activated)
```

- [ ] **Step 2: Verify**

Run:
```bash
grep -n "On-site interaction → lead capture → conversion incentive loop\|Circle resource integration" skills/media-plan/shared/proposal-template.md
```

Expected: two matches.

- [ ] **Step 3: Commit**

```bash
git add skills/media-plan/shared/proposal-template.md
git commit -m "feat(proposal-template): enrich Launch Event Plan with closed-loop and circle integration

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 11: `proposal-template.md` — Add sales mechanism column to phase tables

**Files:**
- Modify: `skills/media-plan/shared/proposal-template.md`

- [ ] **Step 1: Update Phase 1 tables**

Locate the two tables under Phase 1 (Online Actions and Offline Actions):
```markdown
| 时间 | 动作 | 产出物 | 关键节点 |
| --- | --- | --- | --- |
```

Replace both occurrences with:
```markdown
new_string:
| 时间 | 动作 | 产出物 | 关键节点 | 销售机制 |
| --- | --- | --- | --- | --- |
```

- [ ] **Step 2: Update Phase 2 tables**

Do the same for the Online Actions and Offline Actions tables under Phase 2.

- [ ] **Step 3: Update Phase 3 tables**

Do the same for the Online Actions and Offline Actions tables under Phase 3.

- [ ] **Step 4: Add rule paragraph after existing rules**

Locate the last rule in the Writing Rules section:
```markdown
- Chapter 3 must echo `Core value`, `Marketing主线`, and `Strategy pillars` from `## Core Strategic Idea`.
- Chapter 2 must include audience persona, city localization insight, and market trend when research produced them.
```

Add after those lines:
```markdown
new_string:
- Chapter 3 must echo `Core value`, `Marketing主线`, and `Strategy pillars` from `## Core Strategic Idea`.
- Chapter 2 must include audience persona, city localization insight, and market trend when research produced them.
- **Sales mechanism column rule (auto_regional_launch)**: If `bid_or_tender=true`, every row in the Offline Actions table must have a non-empty `销售机制` entry, or the row must be marked with `n/a` and justified. Online Actions rows are encouraged but not required to have sales mechanism entries.
```

- [ ] **Step 5: Verify**

Run:
```bash
grep -n "销售机制\|Sales mechanism column rule" skills/media-plan/shared/proposal-template.md
```

Expected: multiple matches (6 table headers + 1 rule line).

- [ ] **Step 6: Commit**

```bash
git add skills/media-plan/shared/proposal-template.md
git commit -m "feat(proposal-template): add sales mechanism column to phase tables with bid-gated rule

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Final Verification

After all tasks complete, run a full-file sanity check:

```bash
echo "=== highlight-canvas ===" && grep -c "Serialized IP requirement\|Activity density requirement" skills/media-plan/shared/highlight-mechanism-canvas.md
echo "=== ideation ===" && grep -c "Highlight Mechanism Canvas completeness rule\|Serialized IP candidates\|Differentiated experience event" skills/media-plan/phases/ideation.md
echo "=== research-rubric ===" && grep -c "Premium circle pool\|Local sponsorship pool\|Circle resource anchors\|Sponsorship/venue" skills/media-plan/shared/research-rubric.md
echo "=== execution ===" && grep -c "Program Blueprint Card completeness\|Launch Event closed-loop\|Sales mechanism roster\|Circle resource activation" skills/media-plan/phases/execution.md
echo "=== proposal-template ===" && grep -c "Interaction flow\|Lead capture path\|Sales mechanism\|Circle resource integration\|销售机制\|Sales mechanism column rule" skills/media-plan/shared/proposal-template.md
```

Expected counts (minimum):
- highlight-canvas: 2
- ideation: 3
- research-rubric: 4
- execution: 4
- proposal-template: 8

If any count is 0, the corresponding edit was not applied correctly.

---

## Spec Coverage Check

| Spec Requirement | Implementing Task |
|---|---|
| Serialized IP rule in canvas | Task 1 |
| Activity density rule in canvas | Task 2 |
| Canvas completeness gate in ideation | Task 3 |
| Notes enrichment (IP + experience) | Task 4 |
| Circle pool + sponsorship pool in research | Task 5 |
| Proposal Ammunition enrichment | Task 6 |
| Execution validation rules | Task 7 |
| Execution handoff shape expansion | Task 8 |
| Program Blueprint Card expansion | Task 9 |
| Launch Event Plan enrichment | Task 10 |
| Sales mechanism column + rule | Task 11 |

All requirements covered. No gaps.
