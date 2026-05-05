# Idea Scorecard

## Dimensions

| Dimension | Weight | Description |
|---|---|---|
| Freshness | High | 首次/首创程度 |
| Visual Impact | High | 颜值/打卡/二次传播潜力 |
| Buzz Potential | High | 争议/裂变/讨论度 |
| Trend Heat | High | 借势趋势当前热度；**不得**单凭「很热」占位—须见 `lead-template.md` 的 `public_heat_signal` + `angle_of_entry` + `spine_bridge` substantive bundle |
| Insight Fit | High | 与产品/区域/客群洞察的关联强度；若借趋势但 `angle_of_entry`/`spine_bridge` 缺一或泛泛，Trend Heat **封顶为中等档**，Insight Fit 一并下调 |
| Memorability | **High** | 是否具备一句话记忆锚点；能否通过"一年测试" |
| Transition Fit | **High** | 如何服务于叙事状态迁移（packaging_pass: direct 或 reworked 均可，但 reworked 必须有 substantive rework_note） |
| **Hotspot Coverage** | **High** | `hotspot_lineage` 中 `HS-*` 引用条数 + `divergence_card` direction 多样性。1 条 HS = 4 分；2+ 条 HS 跨 buckets = 6–8 分；3+ 条 HS 跨 buckets + direction 多样 = 9–10 分。无 HS 引用 = ≤3 分 |
| **Divergence Quality** | Medium | `crazy_dose` 是否真的「敢」：与 `safe_dose` 张力是否够。两者实质相同 = ≤3 分；张力清晰但任一边乏力 = 4–6 分；crazy 真敢且 safe 真稳 = 7–10 分 |
| Tier Appropriateness | Medium | S/A/B 判定是否合理 |
| Budget Feasibility | **Low** | 粗略预算适配度；不是否决维度 |

## Hotspot-aware scoring guards

When `value_category` is **够热** OR `hotspot_lineage` non-empty OR `insight_links` includes any **`HS-*`/`TR-*`/`CS-*`**:

- If `angle_of_entry` or `spine_bridge` is missing, vague, or contradicted by `narrative_alignment`, cap **Trend Heat** at mid-tier and reflect the penalty in **Transition Fit**.
- A **`shallow_stack_check`** that only repeats marketing speak (e.g.「强势结合」「赋能」without a mechanism) ⇒ treat **Trend Heat** as failing the substantive bundle in the Dimensions table.

Single-source meme bets remain scoreable but must obey `source-trust-policy.md` — do **not** let raw buzz outweigh a missing spine bridge.

## Hotspot Coverage threshold (pool-wide)

After scoring all leads, compute the pool's **average Hotspot Coverage**:

- Average ≥ 7 ⇒ healthy hotspot fuel.
- Average 5–7 ⇒ acceptable but flag in proposal review.
- Average < 5 ⇒ **return to Activity Card Draw** (atom diversity insufficient OR atoms underused).

A pool with high product/insight scores but low Hotspot Coverage indicates the team fell back into product-self-narration. This is the exact failure mode `run/r1/02-lead-pool.md` exhibited and the new workflow exists to prevent.

## Packaging Pass scoring guard

- `packaging_pass: direct` ⇒ Transition Fit scored normally.
- `packaging_pass: reworked` with substantive `rework_note` (friction + strategy + preserved + changed all stated) ⇒ Transition Fit scored normally; `Divergence Quality` may receive a **+1 bonus** because rework preserved an off-spine idea instead of discarding it.
- `packaging_pass: reworked` but `rework_note` is empty or marketing-speak ⇒ Transition Fit capped at mid-tier; flag for re-rework.

## Budget is Secondary

A lead that is "hot enough" should NOT be downvoted due to budget concerns.
Use fuzzing / downplaying / overflow strategies instead.

## Output

```markdown
## Scorecard
| Lead ID | Fresh | Visual | Buzz | Trend | Insight | Memo | Trans | Hotspot | Divergence | Tier | Budget | Total |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| L001 | ... | ... | ... | ... | ... | ... | ... | ... | ... | ... | ... | ... |
```

The total is a sum of the High-weight dimensions multiplied by 2, plus Medium and Low at face value, then divided by 100. This **internal scorecard is brand- and tender-agnostic**: it scores leads on dimensions that apply to any launch campaign.

For tender-specific scoring (procurement rubrics that vary across briefs), see `./scoring-rubric-binding.md`. The binding maps these internal dimensions onto the **actual** rubric in `intake.evaluation_rubric_breakdown` — which may have any number of dimensions, weights, and grading bands. Never hardcode a specific tender's rubric (e.g. "创新性 / 可落地性 / 竞品对标 / 品牌契合度 / 方案逻辑性") into this scorecard — that information lives only in `intake` per project.
