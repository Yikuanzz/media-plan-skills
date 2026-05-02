# Action Playbook Template

Use this contract in `Phase: Action` after `BLOCKING-A` is confirmed.

## Activity Card Schema

Each pillar card must follow this 14-field schema. Fields `1-7` and `14` are mandatory; fields `8-13` should be filled as deeply as available and may be marked `partial` only when evidence is genuinely unavailable.

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

### Group E - Activity Form Compliance (1)

14. Activity Form Compliance (`mandatory`)
    - Value: `compliant` | `partial` | `non-compliant`
    - Determined by applying rules in `../shared/activity-form-constraints.md`:
      1. Exclude check first: if core form matches Exclude List, mark `non-compliant`.
      2. Preference scoring: count Preference List categories touched.
      3. Dealer-linkage check: offline cards must describe dealer involvement.
      4. Traceability check: online cards must describe lead/order tracking method.
    - `non-compliant` cards cannot be selected as `primary` or `alternative`.
    - `partial` cards require a note explaining which rule triggered it and a mitigation plan.
    - For hybrid cards, evaluate both Rule 3 and Rule 4. If both trigger `partial`, list both reasons in the note.

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

## Activity Form Constraints (non-negotiable)

Before proposing any activity, read `../shared/activity-form-constraints.md` and enforce:

- **Hard veto**: Exclude List items are never allowed. If your idea falls into any excluded category, discard it and generate a new candidate.
- **Preference bonus**: Ideas that hit 2+ Preference List categories score higher.
- **Offline mandate**: Every offline card must explicitly describe dealer involvement (venue, staff, or lead handoff).
- **Online mandate**: Every online card must describe how leads/orders are tracked (UTM, unique code, or CRM tag).
- **Field 14**: Every card must include field `14. Activity Form Compliance` with a valid value and explanation.

## Global Constraints
- Output must follow all fields in `Activity Card Schema` (1-14, in order).
- Fields 1-7 and 14 are mandatory and cannot be `partial`.
- If fields 8-13 are uncertain, mark `partial` and state what evidence is missing.
- Respect budget red lines in `shared/budget-allocation-rule.md`.
- Per-card budget cap is deterministic: `single-card cap = min(stage guideline cap, total_budget * 0.30)`.
- If stage guideline and hard cap conflict, the hard cap (`total_budget * 0.30`) wins.

## Phase-Specific Constraints
- If stage is `Phase 1 (Pre-heat)`:
  - online-led, offline-light; focus on warming and lead filtering.
  - do not propose city-scale ceremony or heavy venue build.
  - single-card budget should usually stay <= CNY 25k.
- If stage is `Phase 2 (Launch Burst)`:
  - must include linked actions around `N-7 / N / N+3` key nodes.
  - venue and build can be spending focus but cannot break phase red lines.
  - stage guideline cap is `CNY 80k`, but enforce `min(CNY 80k, total_budget * 0.30)` as final cap.
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
14. ...
```

## Main-Agent Review Hand-off

After collecting all candidate cards for a pillar, the main agent must:

1. Verify field `14` is present and valid for every card.
2. Reject any `non-compliant` card immediately (do not score it).
3. Score remaining cards with `shared/idea-scorecard.md`, adding a **preference bonus** (+1 point per Preference List category hit, max +3).
4. Select highest valid score as `primary`, second highest as `alternative`.
5. Carry forward both decision logs and compliance notes.

## Primary Card Expanded Schema (anti-compression)

Each `primary` card in phase outputs must use:

```md
### <pillar>.primary <creative name>
#### 活动目的
#### 核心创意亮点
#### 活动玩法
#### 执行流程
#### 媒介平台矩阵
#### KOL 矩阵
#### 转化闭环
#### 话题标签
```

Rules:

- Each `####` section must be >=120 words.
- For online pillars, `媒介平台矩阵` and `KOL 矩阵` must satisfy C5/C6 in quality self-check.
- Keep original 13-field schema as semantic appendix (mapping only), not as compressed output form.
