# Phase: Strategy Plan

## Purpose

Build the narrative arc, energy curve, hotspot timeline, regional grounding,
and proposal structure. Select and map leads to stages. Ensure narrative role
balance and memory anchor coverage.

This phase is where the divergent leads (with their `crazy_dose` / `safe_dose`
preserved) get **placed in time and place**: which lead fires in which week,
which `{target_city}` neighborhood, on which channel, at which intensity level.

## Required Reads

- `./phases/lead-pool.md` (read `{artifact_root}/02-lead-pool.md`)
- `./phases/hotspot-harvest.md` (read `{artifact_root}/01h-hotspot-harvest.md` for `expiry_window`s **and `## City Pack`**)
- `./shared/brief-intake-template.md` (resolves `{target_city}` / `{launch_window}` / `{brand}` / `{product}`)
- `./shared/local-grounding-pattern.md` (G1–G9 + C1–C12 categories used by the grounding matrix)
- `./shared/scoring-rubric-binding.md` (when bid_or_tender; ensures Strategy Plan surfaces every tender dimension)
- `./shared/energy-curve-template.md`
- `./shared/proposal-template.md`
- `./shared/quality-self-check.md`
- `./shared/hotspot-angle-playbook.md` (for direction × stage mapping)

## Action

### Step 1 — Hotspot Timeline Layout

Before defining proposal structure, lay out a **hotspot timeline** — a calendar
table mapping `HS-*` atoms to weekly windows around the launch date.

Inputs:
- `{launch_window}` (resolved from `intake.launch_window`)
- Each `HS-*` atom's `expiry_window` and `lifecycle_phase`
- `{target_city}` from intake

Output template (intake = 北京 / 奕境 DH1 / 2026-06 case shown as **EXAMPLE**):

```markdown
## Hotspot Timeline (Pre-launch / Launch / Post-launch)

| Window | Calendar Range | Active HS-* | Lead candidates | Stage label |
|---|---|---|---|---|
| Pre-launch -4w | <launch_window -4w> | HS-002, HS-007 | L001, L004 | 悬念期 |
| Pre-launch -2w | <launch_window -2w> | HS-003, HS-009 | L002, L007 | 揭秘期 |
| Launch week | <launch_window>     | HS-001, HS-005 | L003, L008, L011 | 上市期 |
| Post-launch +2w | <launch_window +2w> | HS-006, HS-010 | L009, L012 | 延续期 |
| Post-launch +4w | <launch_window +4w> | HS-007, HS-008 | L010, L013 | 长尾期 |
```

Rules:
- Every active `HS-*` atom (not 衰退) lands in **at least one** window.
- Every active Lead lands in **at least one** window. Leads spanning multiple
  windows reuse `crazy_dose` for peaks and `safe_dose` for valleys.
- Windows that only contain `safe_dose` deliveries are intentional white space.

### Step 2 — Proposal Structure

Stage count and naming derived from the timeline above + intake + Spine + user intent.
NOT preset 3-phase. Flexible: 2-phase, 4-phase, or custom naming.

Common patterns for new-car launch:
- **4-stage**: 悬念期 → 揭秘期 → 上市期 → 延续期
- **5-stage** (recommended for this case): 悬念期 → 揭秘期 → 上市期 → 延续期 → 长尾期
- **3-stage** (compressed): 预热 → 上市 → 后续

### Step 3 — Narrative Transition Map

Map each emotional transition (from Spine `narrative_transitions`) to serving leads.
Define failure guards per transition. Leads with `packaging_pass: reworked` must
explicitly cite their `rework_note` strategy in this map.

```markdown
## Narrative Transition Map

| Transition | Serving Leads | Crazy/Safe Dose Choice | Failure Guard |
|---|---|---|---|
| 焦虑 → 好奇 | L001 (direct), L006 (reworked: tone_shift) | L001 crazy / L006 safe | 信息淹没 → 加 OOH 露出 |
| 好奇 → 体验 | L003, L008 | both safe (转化阶段) | 体验门槛过高 → 加家庭专属预约 |
| 体验 → 归属 | L007, L012 | L007 crazy / L012 safe | 交付落差 → 强化 30 天回访 |
```

### Step 4 — Energy Curve (with dose annotation)

Each stage gets:
- `emotion`
- `intensity` (0–100)
- `narrative role mix`
- **`dose_choice`** — which leads in this stage use `crazy_dose` vs `safe_dose`

Constraints:
- Intensity 100 appears **only once**.
- Adjacent stages differ by **≥20**.
- White space is intentional breathing room.
- **At most 1 stage per workflow can be all `crazy_dose`** (the launch peak); other stages are mixed.

### Step 5 — Local Grounding Matrix (`{target_city}`-specific)

Force every active Lead through a 2-axis matrix derived from the **City Pack** appended to `{artifact_root}/01h-hotspot-harvest.md` (which itself follows `./shared/local-grounding-pattern.md`):

- **Axis 1 — Geography categories `G1–G9`**: pre-resolved to concrete `{target_city}` place names in the City Pack. The matrix lists categories as `Gx (place_name1, place_name2)`.
- **Axis 2 — Channel categories `C1–C12`**: pre-resolved to concrete platforms / venues in the City Pack. Channel mix must respect `intake.channel_constraints`.

```markdown
## Local Grounding Matrix

| Lead | Geography (G-cat → places) | Channels (C-cat → platforms) | Why this combo |
|---|---|---|---|
| L001 | G1 (<place>) + G3 (<place>) | C3 + C4 | 高净值场域 + 社交圈层；中产决策者高频触点 |
| L007 | G8 (<place>) + G9 (<route>)  | C3 (live) + C11 (private)   | 真实自驾场景 + 直播裂变 |
| ... | ... | ... | ... |
```

Rules:
- Every active Lead has ≥1 geography pin (Gx with concrete place from City Pack) and ≥2 channels (Cx with concrete platform).
- Geography distribution covers **≥4 of the 9 categories** `G1–G9`; over-concentration in one G-cat signals lazy planning.
- ≥1 lead must touch `G8` (suburban belt) or `G9` (signature route) when `{intake.business_goal}` includes drive-experience or family-getaway hooks.
- If `{target_city}` lacks a given G-cat (e.g. an inland city without a relevant signature route), the City Pack notes the gap and the matrix is allowed to skip it — but documents the skip explicitly.

> **EXAMPLE — Beijing case** (intake.target_city=北京):
> `G1` resolves to SKP / 国贸商城 / 王府井 SKP-S；`G2` resolves to 三里屯太古里 / 798 / 朝阳大悦城；`G4` resolves to 前门 / 南锣鼓巷 / 什刹海；`G7` resolves to 鸟巢 / 工体 / 国家大剧院；`G8` resolves to 密云 / 怀柔 / 延庆；`G9` resolves to 阿那亚 / 草原天路 / 张家口 / 古北水镇。Lead 例：L007 北京→阿那亚 = G8+G9 + C3 + C11。
>
> **EXAMPLE — Chengdu case** (intake.target_city=成都):
> `G1` 太古里 / IFS；`G4` 宽窄巷子 / 锦里；`G8` 都江堰 / 青城山；`G9` 川西小环线 / 西岭雪山。Lead 例：L007 成都→稻城 = G8+G9 + C3 + C11。
>
> Re-derive the entire matrix per active intake — **never copy a row across briefs**.

### Step 6 — Lead Utilization Map

Map each stage to: Value Category, Execution Tier, Primary Role, Lead ID,
Write Style, Deformation Note, Energy Target, Memory Anchor, Dose Choice.

### Step 7 — Quality Checks

- Each stage covers ≥2 different Primary Narrative Roles.
- S-tier events total ≤ 2-3.
- B-tier proportion is not excessive.
- Each stage has ≥1 Memory Anchor.
- Hotspot timeline assigns every active Lead to ≥1 window.
- Local grounding matrix covers ≥4 of the 9 G-categories.
- Dose choice respects the energy curve (peaks=crazy, valleys=safe).
- (When `intake.bid_or_tender = true`) Every tender dimension in `{artifact_root}/00-rubric-binding.md` has a Strategy-Plan-level surface — chapter / table / annotation pointing to which stage / lead / matrix delivers it.

## BLOCKING

Stop and present the Strategy Plan including **Hotspot Timeline + Local Grounding Matrix + Energy Curve with dose annotation** (and Rubric-Surface Map when bid_or_tender). Require explicit user confirmation ("OK", "确认", "开始组装") before proceeding to Proposal Assembly.

## Output

Write to `{artifact_root}/03-strategy-plan.md`. Structure:

```markdown
# Strategy Plan: <project name>

## Hotspot Timeline
<Step 1 table>

## Proposal Structure
<Step 2 stages>

## Narrative Transition Map
<Step 3 table>

## Energy Curve (with dose)
<Step 4 table>

## Local Grounding Matrix
<Step 5 table>

## Lead Utilization Map
<Step 6 table>

## Rubric-Surface Map (when intake.bid_or_tender)
| Tender Dim | Strategy-Plan surface (stage / lead / table) |
|---|---|
| D1 创新性 | ... |
| D2 可落地性 | ... |
| ... | ... |

## Quality Check
<Step 7 results>
```

## Checkpoint

```markdown
## Strategy Plan complete
- [x] Hotspot Timeline laid out (every active HS-* and Lead placed)
- [x] Proposal structure defined
- [x] Narrative Transition Map built (with rework_note citations)
- [x] Energy Curve designed with peak + white space + dose annotation
- [x] Local Grounding Matrix complete (≥4 of 9 G-categories)
- [x] Lead Utilization Map complete
- [x] Rubric-Surface Map filled (when bid_or_tender)
- [x] Narrative Role Coverage Check passed
- [x] Memory Anchor Check passed
- [x] `{artifact_root}/03-strategy-plan.md` written
- [x] User confirmed (BLOCKING)
- [ ] Next: Proposal Assembly
```
