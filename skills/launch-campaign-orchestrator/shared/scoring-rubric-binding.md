# Scoring Rubric Binding

This file defines how to **bind any tender's evaluation rubric** to the workflow's internal `idea-scorecard.md` and Review Pass. It exists so the workflow does not assume a specific procurement scoring scheme. Tender rubrics vary in dimensions, weights, and grading bands — the workflow reads `intake.evaluation_rubric_breakdown` and produces a binding map.

## Why this file exists

Earlier versions referenced one specific tender's 5-dimension rubric (创新性 / 可落地性 / 竞品对标 / 品牌契合度 / 方案逻辑性). That hardcoded one client's scoring template into the engine. The fix: the workflow internally scores ideas against `idea-scorecard.md`'s **stable** dimensions, then **maps** internal scores to the tender's actual rubric per the binding produced from `intake.evaluation_rubric_breakdown`.

## When to run binding

- Right after Intake when `bid_or_tender = true` and `evaluation_rubric_breakdown` is populated.
- Re-run if the rubric changes mid-project.
- Output: `{artifact_root}/00-rubric-binding.md` (see `SKILL.md` **Artifact root**).

## Binding Procedure

1. **Read** `intake.evaluation_rubric_breakdown`. Record dimension count, weights, and grading band criteria.
2. **For each tender dimension `D_i`**, determine which internal scorecard dimensions evidence it. Use the binding cheatsheet below as a starting point; specific rubrics may demand custom mappings.
3. **Compose the binding map** — a per-tender-dimension list of which internal evidence the proposal relies on, including which `Lead` fields surface in the proposal copy.
4. **Identify gaps** — tender dimensions with no internal evidence ⇒ block until upstream phase fills them.

## Binding Cheatsheet (common tender dimensions ↔ internal evidence)

These mappings are **starting heuristics**, not contracts. Always check actual rubric criteria text and adjust.

| Common tender dim | Likely internal evidence | Skill file location |
|---|---|---|
| 创新性 / Innovation | `idea-scorecard.Freshness`, `idea-scorecard.Divergence Quality`, `lead.crazy_dose` content, count of S-tier ideas with HS lineage | scorecard, lead-pool, activity-card-draw |
| 可落地性 / Landability | `lead.safe_dose` content, Hotspot Timeline placement, Energy Curve coherence, Beijing/target-city grounding matrix completeness, channel mix vs `intake.channel_constraints` | strategy-plan, lead-pool |
| 竞品对标 / Competitor benchmark | Insight `CL-*` atoms, hotspot competitor parallel (which competitor borrowed which `HS-*` recently), market environment `ME-*` | insight (CL/ME modules), hotspot-harvest cross-link |
| 品牌契合度 / Brand fit | Narrative Spine `core_tension` + `narrative_keywords` alignment, `lead.packaging_pass` (direct/reworked) coverage, `intake.brand_tonality_anchors` adherence | narrative-spine, lead-pool packaging |
| 方案逻辑性 / Logical coherence | Phase outputs end-to-end (Insight → Hotspot → Spine → Cards → Pool → Strategy), Energy Curve discipline, Review Pass result | quality-self-check, all phases |
| 创意丰富度 / Creative breadth | Activity Card Draw raw idea count, value-category coverage, direction coverage | activity-card-draw |
| 受众洞察 / Audience insight | Insight `AU-*` atoms, HS atom `audience_cluster` distribution | insight (AU module), hotspot-harvest |
| 媒介策略 / Media strategy | Strategy Plan grounding matrix channel mix, Energy Curve dose_choice, KPI mapping per stage | strategy-plan |
| 风险控制 / Risk control | `crazy_dose` mitigation notes, `safe_dose` fallbacks, low-trust hotspot guardrails | lead-pool, quality-self-check |
| 数据 / 复盘 / 效果评估 | Lead `kpi_targets`, Strategy Plan post-launch Stage, success_metric alignment | lead-pool, strategy-plan |

## Binding Output Template

Write to `{artifact_root}/00-rubric-binding.md`:

```markdown
# Rubric Binding: <project name>

## Source Rubric (from intake)
- D1 创新性 (weight 5): excellent / good / ok / fail criteria...
- D2 可落地性 (weight 5): ...
- ...

## Binding Map

| Tender Dim | Weight | Internal Evidence | Surface in Proposal | Gap |
|---|---|---|---|---|
| D1 创新性 | 5 | idea-scorecard.Freshness avg ≥ 7; Divergence Quality avg ≥ 6; ≥3 S-tier leads with HS lineage; crazy_dose flagged in stage description | 提案 § "创新引爆" / Lead 卡片的 crazy 标签 | 无 / 待补 |
| D2 可落地性 | 5 | safe_dose 全覆盖; Hotspot Timeline 每条 lead 有窗口落点; Beijing grounding matrix 覆盖 ≥4 G-cat | 提案 § "节奏与落地" / 时间线甘特图 | 无 |
| D3 竞品对标 | 5 | CL-* 原子 ≥4 条; 同期竞品在 HS-* 上的动作分析 ≥3 条 | 提案 § "竞品营销动作对标" 章节 | 待补 CL-005 / CL-006 |
| ... | ... | ... | ... | ... |

## Gap Resolution

- Gaps must be closed before declaring `## Rubric Binding complete`.
- Each gap lists the upstream phase to return to.

## Surface Guidance

The proposal writing must explicitly **name** which tender dimension each chapter / section serves. Procurement evaluators search by their rubric — chapters that don't surface the rubric language risk being scored as missing.
```

## Quality Gate

- [ ] Every tender dimension in `intake.evaluation_rubric_breakdown` appears in the binding map.
- [ ] Every binding entry has at least one **internal evidence** source plus a **surface in proposal** location.
- [ ] Gaps are listed with upstream-phase return.
- [ ] No tender dimension is left as "待补" without a return route.

## Anti-pattern

| Symptom | Why it fails |
|---|---|
| Binding map mirrors a previous brief's 5 dimensions verbatim | Hardcoded — re-derive from `intake.evaluation_rubric_breakdown` |
| Internal evidence column is empty / generic ("good plan") | Not auditable — must point to specific Lead fields, scorecard rows, atomic resources |
| Tender dim "未提供材料 (fail)" criterion is ignored | The fail band is the most actionable warning — at minimum, ensure no dimension surface lacks any material |
| Gaps listed but no return route | Binding must be actionable — every gap maps to a phase to revisit |
