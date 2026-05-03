# Phase: Strategy

Convert approved insight evidence into a proposal-ready strategic spine.

## Inputs (must be ready)

- Insight phase gate is `pass`.
- Read:
  - `../shared/core-theme-derivation.md`
  - `../shared/highlight-mechanism-canvas.md`
  - `../shared/persistence-rules.md`

## Required outputs (all mandatory)

1. `3.1 Differentiated Value Presentation`:
   - Input: functional/emotional/identity value analysis from `2.1`.
   - Output: 品牌基础层 (4-dimension brand endorsement) → 痛点解决层 (3 core value propositions with solutions) → 产品目标层 (one传播力 market-role sentence).
2. `3.2 Slogan Derivation Chain` with explicit brand + audience + product links (brand link must include trust-value anchor).
3. `3.3 Core Theme + Three Stage Sub-Themes + Core Impact Strategy`:
   - Core Theme with source trace, stage consistency, and dual-axis balance (technology + `<primary-buyer-identity>`).
   - Core Impact Strategy: three directions (声量传播 / 出行场景 / 目标客群转化), each with strategic内涵 + >=2落地动作 examples + one overall strategy declaration.
   - `<primary-buyer-identity>` pulled from the Insight Handoff Pack `audience_tension_candidate` field, not assumed by this phase.
4. `3.4 Integrated Map` (`rhythm x audience x channel`) + `Marketing MAP` table mapped to the three action stages.

## Proposal assembly consistency pack (mandatory)

Include a handoff section that proposal phase can use directly:

```md
## Strategy Handoff Pack
- chapter_anchors:
  - 3.1: ...
  - 3.2: ...
  - 3.3: ...
  - 3.4: ...
- slogan_derivation_trace:
  - brand_anchor_ref: <insight evidence id>
  - audience_insight_ref: <insight evidence id>
  - primary_buyer_identity_ref: <2.5 identity value + section ref>
  - product_value_ref: <insight evidence id>
- stage_theme_map:
  - phase_1_subtheme: <name + rationale>
  - phase_2_subtheme: <name + rationale>
  - phase_3_subtheme: <name + rationale>
- action_alignment_requirements:
  - required_pillar_storyline: <per stage>
  - must_keep_constraints: <budget realism / audience pull / channel fit>
```

## Gate

Set `Strategy Gate = pass` only when:

- all four required outputs are complete,
- 3.1 brand foundation layer includes 4-dimension expansion (产品定义/技术研发/品质生产/服务渠道),
- 3.1 pain-point layer has 3 value propositions each with concrete solution evidence,
- 3.1 product-goal layer has one传播力 market-role sentence,
- derivation links are traceable to insight evidence,
- trust-value anchor is explicit in slogan chain,
- stage sub-themes are distinct and aligned with Core Theme,
- dual-axis balance check is complete with explicit reference to which buyer-identity axis was selected and which insight section supports it,
- handoff pack is complete for proposal assembly.

If any check fails, set `Strategy Gate = fail`, repair in this phase, then re-check.

## Persistence Output Contract

- Before Action begins, write `02-strategy.md` as final chapter text for `## 3. Strategy Plan` (`3.1`-`3.4`, Compact then Expanded).
- `02-strategy.md` must include all three MAP tables: Three-Stage Rhythm Framework, Marketing MAP (6 columns), and Communication MAP (5 columns).
- Preserve `BLOCKING-A`: Action starts only after user confirms one selected strategy package.
- `BLOCKING-A` response must provide `3-5` strategy packages; each package includes:
  - `Slogan`
  - `Core Theme`
  - `Phase 1` sub-theme
  - `Phase 2` sub-theme
  - `Phase 3` sub-theme
  - short recommendation reason (`why this package fits`)
- `BLOCKING-A` response must end with explicit selection request (`confirm one package id`) before Action.
- If `02-strategy.md` write fails, keep `Strategy Gate = fail` and stop.
