# Design: Enrich auto_regional_launch creative and executional depth

## Context

The existing `media-plan` skill already has a structural alignment with TARGET_REAL (6-chapter flow, strategy derivation layer, bid gating). However, when the skill was used to generate the 奕境DH1 Wuhan launch proposal, the output fell short on two clusters compared to the human reference:

1. **Creative density + serialized IP**: TARGET_REAL has concrete named activities in every phase (AI短视频创意大赛, 高端社区快闪定展, 楚商联合会私享会, etc.) and a serialized IP (AI Creator Contest) that evolves across all three phases. The skill output had generic channel placeholders in some phases and no cross-phase IP continuity.

2. **On-site mechanics + sales mechanisms + circle resources**: TARGET_REAL's launch event has a closed loop of on-site interaction → lead capture → conversion incentive (5大打卡集章区, 空间挑战赛, 智能带娃区 → 留资 → 购车优惠). It also leverages concrete local circle resources (楚商联合会, 米其林私宴) and sales mechanisms (三人成团). The skill output lacked these executional details.

This design adds validation rules and template fields to close those gaps without adding new files or bloating the skill.

## Design principles

1. **Validation-first, not content-heavy** — The root cause is "not required," not "not capable." We add mandatory rules to existing contracts rather than new archetype libraries.
2. **Bid-scoring aware** — Every new rule maps to at least one of the 5 scoring dimensions (创新性, 可落地性, 竞品对标, 品牌契合度, 方案逻辑性).
3. **Auto-launch scoped** — New rules are conditional on `auto_regional_launch`; general proposals are not affected.
4. **Backward compatible** — Existing 5-file TARGET_REAL alignment commits are untouched; this design layers on top.

## Files changed

| File | Change |
|---|---|
| `shared/highlight-mechanism-canvas.md` | Add serialized IP and activity density rules |
| `phases/ideation.md` | Add `keep` validity gates for new canvas rules |
| `shared/proposal-template.md` | Expand Program Blueprint Card, enrich Launch Event Plan, add sales mechanism column |
| `shared/research-rubric.md` | Add circle pool and sponsorship pool to City Evidence Pack |
| `phases/execution.md` | Add validation rules and handoff fields for new requirements |

---

## 1. `shared/highlight-mechanism-canvas.md`

### New rule: Serialized IP requirement

After the existing `Strategy pillars` mapping rule, add:

```markdown
- **Serialized IP requirement (auto_regional_launch only):** The canvas must name at least one **serialized IP program** that appears in all three stages (Early / Mid / Late) with a clear phase-evolution logic. Example: "AI Creator Contest" → Early (launch + creation), Mid (voting + award at launch event), Late (winner showcase + owner co-creation). A hero event that only appears in one stage does not satisfy this rule. If no serialized IP is present, mark the direction `revise`.
```

**Scoring mapping**: 创新性 (serialized IP demonstrates creative continuity), 方案逻辑性 (cross-phase narrative cohesion).

### New rule: Activity density requirement

After the `Stage pillars` format block, add:

```markdown
- **Activity density requirement (auto_regional_launch only):** Each stage (Early / Mid / Late) must list **at least three concrete, named activities** — not channel placeholders like "Douyin KOL seeding" or "WeChat Moments flight." Named activities include: "AI短视频创意大赛," "高端社区快闪定展," "车主&KOC沙龙." If any stage has fewer than three named activities, mark the direction `revise`.
```

**Scoring mapping**: 可落地性 (concrete activities prove executability), 方案逻辑性 (phase granularity shows planning depth).

---

## 2. `phases/ideation.md`

### New gate: Highlight Mechanism Canvas completeness (auto_regional_launch)

After the existing "Core Strategic Idea completeness rule" block, add:

```markdown
### Highlight Mechanism Canvas completeness rule (auto_regional_launch)
For `auto_regional_launch`, a `keep` direction is **invalid** unless its `## Highlight Mechanism Canvas` satisfies **all** of the following:
1. Contains at least one **serialized IP** that appears in all three stages with phase-evolution logic.
2. Each stage (Early / Mid / Late) lists at least **three concrete, named activities** (not channel placeholders).
3. `Late` stage includes at least one **differentiated experience event** (e.g., test-drive camp, owner salon, premium outdoor experience, deep scenario trial) with a concrete venue or format named.

If any of the above is missing or placeholder-only, mark the direction `revise`, not `keep`.
```

**Scoring mapping**: 创新性 (differentiated experience event), 可落地性 (concrete venue/format), 品牌契合度 (experience event tied to brand positioning).

### Notes enrichment

Append to the city/regional briefs Notes block:

```markdown
- `Serialized IP candidates`: [name at least one IP that could span all three phases, with evolution logic per phase]
- `Differentiated experience event (Late stage)`: [concrete venue/format for a non-sales, experience-heavy activation]
```

---

## 3. `shared/proposal-template.md`

### Edit 1: Program Blueprint Card expansion

Replace the existing card template with:

```markdown
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

**Scoring mapping**: 可落地性 (interaction flow + lead capture prove executability), 创新性 (sales mechanism creativity).

### Edit 2: Launch Event Plan enrichment

Replace the existing Launch Event Plan with:

```markdown
#### Launch Event Plan
- Venue:
- Core agenda:
- **On-site interaction → lead capture → conversion incentive loop**: (describe the full closed loop: what visitors do on-site, how they are prompted to leave contact info, and what immediate conversion incentive they receive)
- On-site traffic collection method:
- **Circle resource integration**: (which local premium circles, clubs, or associations are invited or co-hosting, and how they are activated)
```

**Scoring mapping**: 可落地性 (closed-loop on-site mechanics), 品牌契合度 (circle resource integration shows local brand fit).

### Edit 3: Phase table column addition

Add a fifth column `销售机制 / Sales mechanism` to the Online Actions and Offline Actions tables in all three phases:

```markdown
| 时间 | 动作 | 产出物 | 关键节点 | 销售机制 |
| --- | --- | --- | --- | --- |
```

**Rule**: If `bid_or_tender=true`, every row in the Offline Actions table must have a non-empty `销售机制` entry, or the row must be marked with `n/a` and justified.

**Scoring mapping**: 可落地性 (sales mechanism per action shows executability), 方案逻辑性 (every action tied to conversion logic).

---

## 4. `shared/research-rubric.md`

### City Evidence Pack expansion

After `Premium venue pool:`, add:

```markdown
- Premium circle pool: [high-net-worth clubs, business associations, alumni networks, private membership groups relevant to target audience; e.g., "楚商联合会", "高端社区业主群", "EMBA校友会"]
- Local sponsorship pool: [regional events, venues, or cultural IPs that could be co-activated; e.g., "武汉天地商业体", "东湖绿道骑行节", "武汉网球公开赛"]
```

These are **recommended**, not mandatory-fail. If missing, flag in `## Gaps`.

### Proposal Ammunition expansion

After `Family/emotional scene hooks:`, add:

```markdown
- Circle resource anchors: [specific local circles or associations that can be activated for circle-penetration or private-salon events]
- Sponsorship/venue integration hooks: [regional events or venues that can host or co-brand with launch activities]
```

**Scoring mapping**: 竞品对标 (circle resources are competitive moats), 品牌契合度 (local sponsorship shows cultural fit).

---

## 5. `phases/execution.md`

### Validation rules addition

After the existing Rules block, add:

```markdown
- **Program Blueprint Card completeness (auto_regional_launch)**: Every Program Blueprint Card must contain non-placeholder entries for `Interaction flow`, `Lead capture path`, and `Sales mechanism`. If any card is missing these three fields or they are generic ("TBD", "待定", "待确认"), set `Validation status: blocked` and route back to ideation to strengthen the mechanism.
- **Launch Event closed-loop requirement (auto_regional_launch)**: The Launch Event Plan must show a documented `Interaction → Lead capture → Conversion incentive` loop. If the loop is broken or absent, set `Validation status: blocked`.
```

### Handoff shape expansion

In the `## Validated Execution-Plan Handoff` block, after `Conversion chain:`, add:

```markdown
- Sales mechanism roster: (list every named sales mechanism by phase, with trigger condition and expected conversion action)
- Circle resource activation plan: (which researched circle pools or sponsorship pools are activated in which phase, by what method)
- Differentiated experience event (Late stage): (name, venue, format, and cognitive job)
```

---

## Scope boundaries

### In scope
- Validation rules for serialized IP, activity density, and differentiated experience events in ideation and canvas
- Template field expansion for Program Blueprint Cards, Launch Event Plan, and phase tables
- Research enrichment for circle pools and sponsorship pools
- Execution validation gates for interaction/lead-capture/sales-mechanism completeness

### Out of scope
- New shared contract files (archetype libraries, playbooks)
- Changes to general_proposal template
- Changes to pre-brief search, intake, or research phase workflow sequencing
- Changes to source-trust-policy or query-playbook
- New research module files

## Implementation order

1. `shared/highlight-mechanism-canvas.md` — Add rules (no downstream dependencies).
2. `phases/ideation.md` — Add validation gates (depends on 1).
3. `shared/research-rubric.md` — Add recommended items (no downstream dependencies).
4. `phases/execution.md` — Add validation rules and handoff fields (depends on 1, 2, 3).
5. `shared/proposal-template.md` — Expand template (depends on all above; proposal assembly is last).

## Bid scoring dimension mapping summary

| Scoring dimension | Primary rules addressing it |
|---|---|
| 创新性 | Serialized IP requirement; differentiated experience event (Late stage) |
| 可落地性 | Activity density (≥3 named activities per phase); interaction flow + lead capture path + sales mechanism in Program Blueprint Cards; sales mechanism column in phase tables |
| 竞品对标 | Circle resource anchors in research; circle resource integration in Launch Event Plan |
| 品牌契合度 | Differentiated experience event tied to brand positioning; circle resource integration showing local brand fit |
| 方案逻辑性 | Cross-phase IP continuity; closed-loop on-site mechanics; every action tied to conversion logic |
