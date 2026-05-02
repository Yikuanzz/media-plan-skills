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

1. `2.1 Product Value`
2. `2.2 Market Environment`
3. `2.3 Competitor Landscape`
4. `2.4 Competitor Deep Dive (5 dimensions + recent campaigns)`
5. `2.5 Audience Segmentation`
6. `2.6 Audience Regional Depth + City Evidence Pack`
7. `2.7 SWOT`

## Evidence and consistency rules

- Every module requires at least two evidence sources.
- City Evidence Pack must include consumption, media habits, spatial distribution, and cultural anchors.
- Competitor module must include five-dimension comparison and recent campaign references.
- Audience conclusions must be region-specific and decision-usable for strategy and action.

## Proposal assembly consistency pack (mandatory)

Emit a handoff block that proposal and strategy phases can consume directly:

```md
## Insight Handoff Pack
- chapter_anchors:
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
  - product_value_candidate: <insight refs>
- action_ready_signals:
  - stage_1_opportunity: <insight refs>
  - stage_2_opportunity: <insight refs>
  - stage_3_opportunity: <insight refs>
```

## Gate

Set `Insight Gate = pass` only when:

- all seven outputs are complete,
- each output has >=2 evidence sources,
- city evidence dimensions are complete,
- handoff pack is complete for strategy/proposal consistency.

If any check fails, set `Insight Gate = fail`, repair in this phase, then re-check.

## Persistence Output Contract

- Write `01-insight.md` as final chapter text for `## 2. Market Insight` (`2.1`-`2.7`).
- `2.4` must use per-competitor structure (`### 2.4.<n>`) with 5 fixed `####` dimensions + `#### 近期 Campaign` (>=2).
- `2.6` must use per-persona structure (`### 2.6.<n>`) with 7 fixed `####` dimensions.
- `2.7` SWOT four quadrants must each be >=60 words and cite at least one city evidence source label from `2.5/2.6`.
- If any structural check fails, keep `Insight Gate = fail`, repair in-phase, and do not emit pass.
