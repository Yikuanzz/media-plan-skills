# Action Playbook Template

Use this contract in `Phase: Action` after `BLOCKING-A` is confirmed.

## Activity Card Schema

Each pillar card must follow this 13-field schema. Fields `1-7` are mandatory; fields `8-13` should be filled as deeply as available and may be marked `partial` only when evidence is genuinely unavailable.

### Group A - Identity (4)

1. Creative card name (`mandatory`, must reflect Core Theme sub-theme)
2. Stage and sub-theme (`mandatory`)
3. Time window (`mandatory`, include cycle and peak nodes)
4. Venue/position (`mandatory`, tag `online` / `offline` / `hybrid`)

### Group B - Audience Pull (3)

5. Target audience + persona anchor (`mandatory`, no vague labels)
6. Attraction mechanism (`mandatory`, one sentence on why people will actually show up)
7. Core flow and sub-steps (`mandatory`, list each step clearly)

### Group C - Execution (4)

8. Resource list (partners, KOL/KOC, props, materials, incentive policy)
9. Content and distribution rhythm (node-based, include differentiated outputs across Douyin/Xiaohongshu/Dongchedi/Video Account/Weibo)
10. Conversion loop and KPI (quantified)
11. Cost estimate with 4 sub-fields:
   - stage budget band
   - card amount (`% of total` and `% of stage`)
   - online/offline attribute
   - top spending explanation

### Group D - Risk and Trace (2)

12. Risks and mitigation (multi-sentence paragraph; include positioning/content/channel/mindset counter-moves and internal Plan B)
13. Source trace (one sentence linking back to Insight evidence)

## Sub-Agent Dispatch Prompt Template

Use for each pillar with `N=2-3` sub-agents.

```md
You are a planning sub-agent for `regional-auto-launch-plan`.

## Mission
- Build one complete Activity Card candidate for pillar: <pillar-name>
- Region context: <city-or-region>
- Target audience anchor: <audience-anchor>
- Stage KPI target: <kpi-target>
- Budget cap for this card: <budget-cap>

## Non-Negotiable Principles (all must hold)
1) Low-cost realism: avoid inflated production ideas outside regional scope.
2) Fast impact: include near-term trigger nodes, not long pre-build dependency.
3) Executable delivery: dealer/local team can execute with available resources.
4) Real audience pull: explain concrete motivation, not slogan-only gimmicks.

## Global Constraints
- Output must follow all fields in `Activity Card Schema` (1-13, in order).
- Fields 1-7 are mandatory and cannot be `partial`.
- If fields 8-13 are uncertain, mark `partial` and state what evidence is missing.
- Respect budget red lines in `shared/budget-allocation-rule.md`.

## Phase-Specific Constraints
- If stage is `Phase 1 (Pre-heat)`:
  - online-led, offline-light; focus on warming and lead filtering.
  - do not propose city-scale ceremony or heavy venue build.
  - single-card budget should usually stay <= CNY 25k.
- If stage is `Phase 2 (Launch Burst)`:
  - must include linked actions around `N-7 / N / N+3` key nodes.
  - venue and build can be spending focus but cannot break phase red lines.
  - single-card budget should usually stay <= CNY 80k.
- If stage is `Phase 3 (Sustain)`:
  - focus on conversion of hesitant leads and referral growth.
  - KPI must be measurable in orders, leads, or test-drive appointments.
  - single-card budget should usually stay <= CNY 30k.

## Output Format
Return exactly one markdown card in this shape:

### Candidate Card - <short card name>
1. ...
2. ...
...
13. ...
```

## Main-Agent Review Hand-off

After collecting all candidate cards for a pillar, the main agent must score each card with `shared/idea-scorecard.md`, select one `primary`, keep one `alternative`, and carry forward both decision logs.
