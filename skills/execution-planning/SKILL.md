---
name: execution-planning
description: Use when a media plan direction is viable and needs proposal-grade actions, phasing, resource logic, KPIs, and risk controls checked against real constraints before proposal drafting.
---

# Execution Planning

## Purpose

Turn a chosen strategy into an execution plan that can survive proposal review. Keep every action tied to the brief, research, idea score, and stated constraints.

## Embedded Runtime Contract

Do not start execution planning unless all three later-stage brief fields are present and specific enough to use: `deliverables_needed`, `constraints`, and `success_metric`. Treat `unknown`, `tbd`, or similar placeholders as missing.

Use the selected channels, deliverables, timeline, budget or resource level, and constraints from the brief as hard limits.

The proposal slot this stage must supply is `## 7. Recommended Execution Plan`.

## Entry Gate

- Start only after intake is `ready`, research verdict is `pass`, and ideation has produced an explicit `## Selected Direction Handoff` for the chosen direction.
- Require `deliverables_needed`, `constraints`, and `success_metric` from the embedded runtime contract above before planning starts. Treat `unknown`, `tbd`, or similar placeholders as missing, and route back for clarification instead of guessing.
- Use the selected channels, deliverables, timeline, budget or resource level, and constraints from the embedded runtime contract above as hard limits.
- If the chosen direction already conflicts with those limits, stop and route back before planning details.

## Planning Rules

- Translate the strategy into concrete actions, deliverables, owners or resource logic, phase rhythm, KPIs, and risk controls.
- Keep the plan proportional to the available team, timeline, and budget; do not hide gaps behind ambitious wording.
- Make phase sequencing explicit enough that the proposal can show what happens first, what depends on what, and what success looks like.
- Use KPIs that match the stated business goal and success metric instead of generic awareness or engagement filler.
- If channels or actions do not actually support the strategy, or the strategy cannot be executed under the stated constraints, stop and revise the recommendation or ask for scope changes.

## Output

- Produce proposal-ready material for `## 7. Recommended Execution Plan`.
- Produce `## Validated Execution-Plan Handoff` exactly in the output shape below so downstream proposal writing and review can validate a concrete contract.
- Include phase rhythm, channel or deliverable actions, resource logic, KPI logic, and major risk controls in direct business language.
- Surface any execution mismatch as a blocker instead of smoothing it over in the draft.

## Validated Execution-Plan Handoff

Use this exact markdown shape:

```md
## Validated Execution-Plan Handoff
- Recommendation:
- Why it fits:
- Phase rhythm:
- Channel and deliverable actions:
- Resource or owner logic:
- KPI logic:
- Risks and dependencies:
- Scope changes or blockers:
- Validation status: validated | blocked
```

Do not mark the execution handoff as validated unless all fields are present and all of the following are true:

- `Recommendation` states the selected recommendation explicitly.
- `Why it fits` ties the recommendation back to the brief, research, and chosen idea.
- `Phase rhythm` makes the sequence of work explicit enough for proposal drafting.
- `Channel and deliverable actions` stay within the approved channels and the deliverables the brief can support.
- `Resource or owner logic` fits the stated timeline and budget or resource level.
- `KPI logic` ties back to the business goal and any stated success metric.
- `Risks and dependencies` captures the main execution risks proposal review must preserve.
- `Scope changes or blockers` names any required scope change, missing dependency, or unresolved execution gap instead of hiding it.
- `Validation status` is `validated` only when the plan fits the stated constraints; otherwise set it to `blocked` and return upstream.
