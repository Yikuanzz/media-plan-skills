# Phase: Activity Card Draw

## Purpose

This is the **divergent generation** phase. Output is **raw ideas (RI-\*)**, not leads. Spine-fit is **explicitly forbidden** as a generation gate here. The phase exists because spine-first generation produces product-self-narration (see `run/r1/02-lead-pool.md` for the failure case it solves).

The mental model is **抽卡发散**: each `HS-*` hotspot atom is the fuel; each card from `./shared/activity-card-deck.md` is the lens; each crossing yields ≥1 raw idea. We aim for over-supply, then converge in the next phase.

## Required Reads

- `./phases/hotspot-harvest.md` (read `{artifact_root}/01h-hotspot-harvest.md`)
- `{artifact_root}/01g-narrative-spine.md` (Narrative Spine output; **read for context only**, not as a generation gate)
- `./phases/narrative-spine.md` (phase contract only)
- `./shared/activity-card-deck.md`
- `./shared/hotspot-angle-playbook.md` (use the prompt formulas + double-dose rule)
- `./shared/hotspot-atom-template.md` (so `hotspot_lineage` references resolve)

## Action

### Step 1 — Heat × Category Cartesian Sweep

Build a matrix: rows = `HS-*` atoms, columns = 4 value categories (够新鲜 / 够亮眼 / 够爆 / 够热). For each cell, **draw at least 1 raw idea**. With 12 atoms and 4 categories, this floor alone yields ≥48 cells; mint at least 1 idea per non-empty cell. Skip a cell only when the atom's `lifecycle_phase`/`audience_cluster` truly cannot serve that value category — write a one-line `skip_reason`.

### Step 2 — Direction Re-cut (8 directions × selected atoms)

For each kept atom, pick 2–3 cards from **different directions** in `activity-card-deck.md`. Answer at least one `prompt_question` per drawn card with a concrete `{target_city}`-local hook resolved from the **City Pack** appended to `{artifact_root}/01h-hotspot-harvest.md` (G-cat / channel / local_signature). The same atom is now multi-cut: a 节庆 atom can be cut by `time_anchors` AND `culture_meme` AND `co_creation`.

### Step 3 — Double Dose per Idea (crazy_dose + safe_dose)

Every raw idea **must** carry two dose versions:

- `crazy_dose`: the most reckless / most reactive / most viral version. Goal: explode social discussion. Permission to disregard budget, brand etiquette, central-SOE caution.
- `safe_dose`: the most landable / most contractable / most evidence-backed version of the same core mechanism. Goal: make procurement/legal sleep at night.

Why double-dose? Strategy Plan needs both — peak stages take crazy_dose with mitigation; valley stages take safe_dose. Ideas without both doses are flagged incomplete.

### Step 4 — No Spine Check

If a raw idea feels "off-spine", **do not delete it**. Set `spine_friction: low | medium | high`. High-friction ideas are explicitly **encouraged** here — they often become the most distinctive leads after Packaging rework.

### Step 5 — Tag for Convergence

Every raw idea carries enough metadata for the next phase (Lead Pool Packaging) to cluster, dedupe, and rework:

```yaml
RawIdea:
  ri_id: RI-021                             # RI- prefix
  hook: "一句话钩子（先写敢的版本）"
  hotspot_lineage: [HS-007, HS-009]         # which atoms fueled this idea
  divergence_card: D-CC-3                   # which card was drawn
  value_category: 够爆 | 够新鲜 | 够亮眼 | 够热   # primary; multi-tag allowed
  one_line_concept: "做什么 + 在哪 + 谁参与 + 怎么传播"
  crazy_dose: |
    最敢的版本 — 可以放飞 budget / 调性 / 央企谨慎
  safe_dose: |
    最稳的版本 — 同一机制，能落地、能签合同、能让法务过
  spine_friction: low | medium | high
  spine_friction_note: |
    高摩擦原因一句话（如「央企调性 vs 抽象人格相冲」）
  why_not_1plus1: |
    为何这不是「热点 + 卖点」浅堆，而是 fold-in
  rough_channel_guess: [...]                 # 用 City Pack 里的 C1–C12 channel 类目
  local_hook_used: |
    具体到 G-cat / local_signature 的一句话定位
    EXAMPLE (target_city=北京): "G4_heritage_core: 胡同 + local_signatures: 京郊自驾"
    EXAMPLE (target_city=成都): "G4_heritage_core: 宽窄巷子 + G9_signature_route: 川西小环线"
    EXAMPLE (target_city=上海): "G2_lifestyle_scene: 安福路 + local_signatures: 法租界梧桐"
  status: raw | promoted | parked
```

### Step 6 — Cluster Hint (lightweight)

After all raw ideas are minted, do **one** lightweight pass: tag each idea with a `cluster_hint` (a 2–4 word tag like `家庭安心仪式` / `央企老干部 meme` / `阿那亚自驾`). Do **not** fuse / dedupe yet — that is Lead Pool Packaging's job. The hint just gives the next phase a starting line.

## Output

Write to `{artifact_root}/02a-activity-cards.md` with the following structure (all `{...}` placeholders resolve from `intake`):

```markdown
# Activity Card Draw: {brand} {product} {target_city} 上市传播

## Heat × Category Sweep Matrix

| HS-id | 够新鲜 | 够亮眼 | 够爆 | 够热 |
|---|---|---|---|---|
| HS-001 | RI-001 | RI-002 | RI-003 | (skip: 长尾期不适合够热) |
| HS-002 | ... | ... | ... | ... |

## Raw Ideas

### Cluster Hint: <2-4 字短标签>

#### RI-001
```yaml
ri_id: RI-001
...
```

### Cluster Hint: <下一个>
...

## Coverage Summary

- Total raw ideas: ...
- Per value category: 够新鲜 X / 够亮眼 Y / 够爆 Z / 够热 W
- Per direction (D-TA / D-RL / D-CC / D-ME / D-CM / D-TP / D-SR / D-CR): ...
- HS-* atoms used: X / Y (each atom referenced by ≥2 ideas)
- spine_friction distribution: low X / medium Y / high Z
- Local-hook coverage: X% reference City Pack G-cat / local_signature
```

## Quality Gate

- [ ] **Idea count**: ≥30 raw ideas (`RI-*`).
- [ ] **HS coverage**: every `HS-*` atom referenced by ≥2 raw ideas.
- [ ] **Value-category floor**: each of 够新鲜 / 够亮眼 / 够爆 / 够热 has ≥6 raw ideas.
- [ ] **Direction floor**: ≥6 of the 8 directions in `activity-card-deck.md` have ≥3 raw ideas.
- [ ] **Double dose**: every raw idea has both `crazy_dose` and `safe_dose` filled (not the same sentence twice).
- [ ] **Friction distribution**: ≥30% of raw ideas have `spine_friction: medium | high` (we are deliberately preserving distinctive ideas, not pre-filtering them).
- [ ] **Local hook coverage**: ≥60% of raw ideas reference a concrete `{target_city}`-local hook resolved from City Pack (G1–G9 / channels / local_signatures). EXAMPLE (target_city=北京): 胡同 / 三里屯 / 阿那亚 / 京郊 / 北京马拉松 / 中关村 / 首钢园 / 国贸 / 王府井 / 望京 / 鸟巢 / 工体. EXAMPLE (target_city=成都): 太古里 / 宽窄巷子 / 玉林路 / 都江堰 / 川西环线. EXAMPLE (target_city=上海): 安福路 / 武康路 / 外滩 / 千岛湖. **Do not copy the previous brief's hook list** — re-derive from the active City Pack.
- [ ] **Anti-1+1**: every raw idea carries `why_not_1plus1`.

## Failure → Return

| Symptom | Return to |
|---|---|
| spine_friction 全是 low（创意太怂） | rerun this phase, draw more aggressive cards (D-CM-1, D-SR-2, D-CR-1) |
| HS coverage 不到 — 多数 atom 只被一条 RI 用过 | rerun Step 1 cartesian sweep, fill empty cells |
| 同一 atom 反复被同一 direction 切（缺角度） | rerun Step 2 with explicit direction rotation |
| 没有 crazy_dose vs safe_dose 张力 | rerun Step 3 — crazy 必须真的敢，safe 必须真的稳 |
| 都是泛全国 idea，没有 `{target_city}` hook | 回 Hotspot Harvest 补 City Events bucket / 重做 City Pack；或 rerun with `{target_city}` 本地 hooks 强制项 |
| Local hook 抄了上一标的城市 | 重新读 `intake.target_city`，重做 City Pack，再 redraw |

## BLOCKING

Do **not** advance to Lead Pool Packaging until raw idea count and coverage gates pass. Activity Card Draw is meant to over-supply — under-supply here means downstream packaging will fall back into product self-narration.

## Checkpoint

```markdown
## Activity Card Draw complete
- [x] ≥30 raw ideas
- [x] Each HS-* used by ≥2 ideas
- [x] Each value category has ≥6 ideas
- [x] ≥6 directions with ≥3 ideas
- [x] Every idea has crazy_dose + safe_dose
- [x] ≥30% ideas with spine_friction medium|high
- [x] ≥60% ideas have `{target_city}`-local hook (resolved from City Pack)
- [x] `{artifact_root}/02a-activity-cards.md` written
- [ ] Next: Lead Pool Packaging
```
