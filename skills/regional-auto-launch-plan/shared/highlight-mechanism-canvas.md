# Highlight Mechanism Canvas

Use this contract in `Phase: Strategy` to convert `Core Theme` and stage sub-themes into action-ready mechanism logic.

## Required Fields

- `Core Theme`: copied from strategy output; no renaming.
- `Stage sub-themes`: three entries mapped to `Phase 1` / `Phase 2` / `Phase 3`.
- `Audience pull trigger`: concrete reason people attend or engage in this region.
- `Spread trigger`: why this can generate sustained local discussion or creator participation.
- `Conversion trigger`: how attention moves to lead capture, test drive, or order-related actions.
- `Hero mechanism`: one highest-signal activation that represents the Core Theme.
- `Stage mechanism map`: per phase, list mechanism goal and required pillar storyline.
- `Platform differentiation`: how Douyin, Xiaohongshu, Dongchedi, Video Account, and Weibo play different roles.
- `Execution red lines`: budget, timeline, approval, legal, and delivery boundaries.

## Output Shape

```md
## Highlight Mechanism Canvas
- Core Theme:
- Stage sub-themes:
  - Phase 1:
  - Phase 2:
  - Phase 3:
- Audience pull trigger:
- Spread trigger:
- Conversion trigger:
- Hero mechanism:
- Stage mechanism map:
  - Phase 1:
    - mechanism_goal:
    - required_pillars: [1-online, 1-offline]
  - Phase 2:
    - mechanism_goal:
    - required_pillars: [2-offline-core, 2-offline-aux, 2-online]
  - Phase 3:
    - mechanism_goal:
    - required_pillars: [3-offline-conv, 3-offline-trial, 3-online]
- Platform differentiation:
  - Douyin:
  - Xiaohongshu:
  - Dongchedi:
  - Video Account:
  - Weibo:
- Execution red lines:
```

## Rules

- Do not pass strategy if any trigger is generic or missing.
- Stage mechanism goals must map to the three action phases and required pillars.
- Platform differentiation cannot reuse one identical message across all platforms.
- `Hero mechanism` must be executable under regional small-budget context.
