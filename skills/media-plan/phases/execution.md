# Execution Phase

## Goal

Turn the selected strategy direction into a validated execution-plan handoff that fits the real channels, timeline, budget, and resource constraints.

## Required Reads

- `../shared/brief-intake-template.md`
- `../shared/highlight-mechanism-canvas.md`
- `../shared/proposal-template.md`
- `../shared/content-assets.md`

## Rules

- Observe **Step 5 BLOCKING** in `../SKILL.md`: obtain explicit user confirmation of `## Selected Direction Handoff` before execution planning begins.
- Start only after intake is `ready`, research verdict is `pass`, and ideation has produced an explicit `## Selected Direction Handoff`.
- Start only after the chosen direction has a complete `## Highlight Mechanism Canvas`.
- Require `deliverables_needed`, `constraints`, and `success_metric` before planning starts.
- Use the selected channels, deliverables, timeline, budget or resource level, and constraints as hard limits.
- If the chosen direction already conflicts with those limits, stop and route back before planning details.
- Validate whether the hero event, stage choreography, and conversion mechanism still make sense under the stated constraints.
- If the plan relies on disconnected actions rather than a coherent mechanism, route back to ideation instead of patching with generic execution filler.
- `Pillar roster by phase` must name how each `Stage pillars` line rolls into time (month or week) and, if the brief provides it, owner or dependency. If the roster has no clear link to the selected theme, hero, or conversion chain, stop and return to ideation; do not emit `Validation status: validated`.
- `Calendar anchors` must tighten `Calendar alignment` into execution-ready dates or windows and tie them to budget, venue, or permit logic where relevant.
- Produce proposal-ready material for the proposal’s Phased Execution Plan, Phased Event Menu (with **cognitive** column), and Content Assets alignment, plus a validated execution handoff. Event Menu rows should reference **Content asset** names where applicable.
- **Program Blueprint Card completeness**: Every Program Blueprint Card must contain non-placeholder entries for `Interaction flow`, `Lead capture path`, and `Sales mechanism`. If any card is missing these three fields or they are generic ("TBD", "待定", "待确认"), set `Validation status: blocked` and route back to ideation to strengthen the mechanism.
- **Launch Event closed-loop requirement**: The Launch Event Plan must show a documented `Interaction → Lead capture → Conversion incentive` loop. If the loop is broken or absent, set `Validation status: blocked`.
- **Platform content angle**: If platform execution is part of the plan, every Program Blueprint Card must include `Platform content angle` — which platform(s) this program targets and what content angle/format is used per platform. If a program is multi-platform, list each platform's differentiated angle.
- **Hashtag / topic tag requirement**: If social distribution is in scope, every Program Blueprint Card must include at least 2 concrete hashtag or topic tag examples (e.g., `#AI帮我带娃出行#`, `#一车装下整个家#`). Generic tags ("#新车上市#") are insufficient.
- **Online Actions hashtag column**: In Phase Online Actions tables that include social channels, add a `话题标签` column. Every row should have at least one concrete hashtag or topic tag. Rows without tags must be marked `n/a` with justification.

## Required Handoff Shape

```md
## Validated Execution-Plan Handoff
- Recommendation:
- Why it fits:
- Highlight mechanism carried forward:
- Hero event and stage logic:
- Pillar roster by phase: (align names with `Stage pillars` in `## Highlight Mechanism Canvas`; add month/week stamps and owner or dependency if known)
- Calendar anchors: (execution-ready windows from `Calendar alignment`; link to budget, venue, or approvals)
- Phase rhythm:
- Channel and deliverable actions:
- Conversion chain:
- Sales mechanism roster: (list every named sales mechanism by phase, with trigger condition and expected conversion action)
- Circle resource activation plan: (which researched circle pools or sponsorship pools are activated in which phase, by what method)
- Differentiated experience event (Late stage): (name, venue, format, and cognitive job)
- Resource or owner logic:
- KPI logic:
- Risks and dependencies:
- Scope changes or blockers:
- Validation status: validated | blocked
```
