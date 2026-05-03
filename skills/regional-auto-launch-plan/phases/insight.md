# Phase: Insight

Build a complete, evidence-backed insight base for proposal chapter `2` and downstream strategy derivation.

## Inputs (must be ready)

- Intake status is `ready`.
- Read:
  - `../shared/source-trust-policy.md`
  - `../shared/query-playbook.md`
  - `../shared/persistence-rules.md`
  - all `../shared/insight-modules/*.md`

## Required insight outputs (all mandatory)

0. `1. Task Thesis` (for proposal chapter 1 handoff)
   - core marketing proposition (one sentence)
   - three core tasks (positioning / full-domain reach / conversion loop)
   - one task declaration slogan
1. `2.1 Product Value`
2. `2.2 Market Environment`
3. `2.3 Competitor Landscape` (three-tier classification + image benchmark + landscape map)
4. `2.4 Competitor Deep Dive (5 dimensions + recent campaigns)`
5. `2.5 Audience Segmentation`
   - `2.5 Audience Segmentation` must explicitly derive and name `<primary-buyer-identity>` (e.g. family-oriented, performance-driven, status-focused, adventure-seeking).
   - This field is consumed by Strategy for dual-axis balance and by Action for circle-infiltration design.
   - If multiple segments exist, rank by purchase-decision weight.
6. `2.6 Audience Regional Depth + City Evidence Pack`
7. `2.7 SWOT`

## Evidence and consistency rules

- Every module requires at least two evidence sources.
- City Evidence Pack must include consumption, media habits, spatial distribution, and cultural anchors.
- City Evidence Pack must include a `City Battlefield Map` table with 3 poles and named anchors.
- Competitor module must include five-dimension comparison and recent campaign references.
- Audience conclusions must be region-specific and decision-usable for strategy and action.
- Insight chapter must include at least one markdown data table (`|...|`) for market/audience evidence presentation.
- Market Environment may include hotspot scan for launch window +/- 15 days. If hotspot is used, it must be validated against `<primary-buyer-identity>` and cannot use trade shows/industry expos as primary storyline event.

## Proposal assembly consistency pack (mandatory)

Emit a handoff block that proposal and strategy phases can consume directly:

```md
## Insight Handoff Pack
- chapter_anchors:
  - 1: ...
  - 2.1: ...
  - 2.2: ...
  - 2.3: ...
  - 2.4: ...
  - 2.5: ...
  - 2.6: ...
  - 2.7: ...
- evidence_index:
  - E1: <source + why it matters>
  - E2: <source + why it matters>
  - ...
- strategy_ready_signals:
  - brand_anchor_candidate: <insight refs>
  - audience_tension_candidate: <insight refs>
  - primary_buyer_identity: <derived value + supporting section ref>
  - product_value_candidate: <insight refs>
- action_ready_signals:
  - stage_1_opportunity: <insight refs>
  - stage_2_opportunity: <insight refs>
  - stage_3_opportunity: <insight refs>
```

## Gate

Set `Insight Gate = pass` only when:

- all required outputs are complete,
- task thesis block is complete,
- each output has >=2 evidence sources,
- city evidence dimensions are complete,
- city battlefield map is complete,
- handoff pack is complete for strategy/proposal consistency.

If any check fails, set `Insight Gate = fail`, repair in this phase, then re-check.

## Persistence Output Contract

- Write `01-insight.md` as final chapter text for `## 1. Task Thesis` and `## 2. Market Insight` (`2.1`-`2.7`).
- `2.3` must use three-tier classification table (`### 2.3.1` core/secondary/extended) + image benchmark (`### 2.3.2`) + landscape map table (`### 2.3.3`).
- `2.4` must use per-competitor structure (`### 2.4.<n>`) with 5 fixed `####` dimensions + `#### 近期 Campaign` (>=2).
- `2.6` must use per-persona structure (`### 2.6.<n>`) with 7 fixed `####` dimensions.
- `2.7` SWOT four quadrants must each be >=60 words and cite at least one city evidence source label from `2.5/2.6`.
- `2.2` or `2.5/2.6` must include an `Insight Data Table` with columns: metric, value, year/window, source.
- If any structural check fails, keep `Insight Gate = fail`, repair in-phase, and do not emit pass.
