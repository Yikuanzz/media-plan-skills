# Phase: Strategy

Convert approved insight evidence into a proposal-ready strategic spine.

## Inputs (must be ready)

- Insight phase gate is `pass`.
- Read:
  - `../shared/core-theme-derivation.md`
  - `../shared/highlight-mechanism-canvas.md`

## Required outputs (all mandatory)

1. `3.1 Three-Layer Value System` (functional/emotional/identity).
2. `3.2 Slogan Derivation Chain` with explicit brand + audience + product links.
3. `3.3 Core Theme + Three Stage Sub-Themes` with source trace and stage consistency.
4. `3.4 Integrated Map` (`rhythm x audience x channel`) mapped to the three action stages.

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
- derivation links are traceable to insight evidence,
- stage sub-themes are distinct and aligned with Core Theme,
- handoff pack is complete for proposal assembly.

If any check fails, set `Strategy Gate = fail`, repair in this phase, then re-check.
