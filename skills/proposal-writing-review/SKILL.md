---
name: proposal-writing-review
description: Use when upstream media-planning work is complete enough to assemble and review the final markdown proposal, and unsupported claims, weak creative, or execution mismatch must be routed back before delivery.
---

# Proposal Writing Review

## Purpose

Assemble the final markdown proposal and review it before delivery. Keep the proposal and review contract embedded in this file so the skill still works when hosts copy only one skill directory. Do not patch missing substance with filler.

## Embedded Runtime Contract

Proposal writing starts only when all of the following are true:

- Intake status is `ready`.
- Research verdict is `pass`.
- `## Selected Direction Handoff` is present for the chosen direction.
- `## Validated Execution-Plan Handoff` is present and has `Validation status: validated`.
- At least one idea is scored as `keep` or otherwise confirmed viable.
- `deliverables_needed`, `constraints`, and `success_metric` are all present in the brief and are not `unknown`, `tbd`, or similar placeholders.

Treat the execution-plan handoff as valid only when it includes all of the following fields:

- `Recommendation`
- `Why it fits`
- `Phase rhythm`
- `Channel and deliverable actions`
- `Resource or owner logic`
- `KPI logic`
- `Risks and dependencies`
- `Scope changes or blockers`
- `Validation status: validated`

Use this final proposal structure:

```md
# Proposal Title

## 1. Brief Snapshot

## 2. Objective And Success Metric

## 3. Audience And Context

## 4. Research-Based Insights

## 5. Strategic Direction

## 6. Core Idea Options

## 7. Recommended Execution Plan

## 8. Risks And Open Questions

## 9. Decision Request And Next Step
```

Review every proposal against these failure modes before delivery:

- Missing or inferred brief fields
- Weak, stale, generic, unsupported, or single-class research
- Cliche or interchangeable idea directions
- Strategy and execution mismatch
- Missing or blocked late-stage execution gates
- Thin sections with no decision-oriented next step

## Entry Gate

- Start only when the embedded proposal entry conditions are satisfied and the execution-plan handoff meets the embedded `## Validated Execution-Plan Handoff` requirements above.
- Pull inputs from the approved intake summary, passing research pack, scored idea evaluation, and the validated execution-plan handoff.
- If evidence, idea quality, or execution fit is still unresolved, stop and return upstream first.

## Writing Rules

- Follow the embedded proposal template exactly and draft all nine sections in markdown.
- Make each section decision-useful: state the conclusion, the reason, and the implication instead of leaving abstract observations.
- Keep market, audience, and category claims evidence-backed; if a claim cannot be supported, remove it or send the workflow back to research.
- Keep the recommendation visibly traceable from brief to research to idea choice to execution plan.
- Do not use cliche creative language, generic campaign framing, or recommendations that drift from the approved execution fit.

## Review Rules

- Review the draft against the embedded proposal template and failure-mode checklist before delivery.
- Route back to execution planning if the handoff omits any required item from `## Validated Execution-Plan Handoff`.
- Route back upstream for missing evidence, weak or interchangeable creative, thin conclusions, or execution mismatch.
- Return the earliest failing stage instead of fixing substantive gaps inside the final draft.
