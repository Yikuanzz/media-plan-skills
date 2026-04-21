---
name: media-plan-orchestrator
description: Use when handling a semi-structured China-market media planning brief that should first be sharpened with a lightweight pre-brief search, then gated for missing inputs, routed through research and ideation, and held until proposal evidence and recommendation quality are complete.
---

# Media Plan Orchestrator

## Purpose

Turn a semi-structured China-market media planning brief into a review-ready proposal. Start with one lightweight pre-brief search pass when the user has given enough identifiable signal to make that useful, then follow the embedded runtime contract in this file for each stage. Do not guess missing inputs or declare completion early.

## Embedded Runtime Contract

- Treat this skill as self-contained at runtime. Some hosts copy only this skill into a temporary directory without sibling assets.
- Keep the runtime contract here aligned with the repo-level shared templates and review specs during maintenance, but do not require those files to be readable while executing.

### Intake Contract

- Required fields to start research: `business_goal`, `target_audience`, `timeline`, `budget_or_resource_level`, `geography_or_region`, `channel_constraints`
- Later-stage required fields before execution or proposal: `deliverables_needed`, `constraints`, `success_metric`
- Optional or later-stage fields that may remain open during intake: `project_background`, `project_name`, `primary_offer`, `channels_in_scope`, `deliverables_needed`, `constraints`, `success_metric`, `key_message`

Use this intake output shape:

```md
## Intake Summary
- Project background:
- Project:
- Goal:
- Audience:
- Geography / region:
- Channel constraints:
- Offer:
- Message:
- Channels:
- Deliverables:
- Timeline:
- Budget / resources:
- Success metric:

## Constraints
-

## Missing Fields
-

## Open Questions
-

## Intake Status
- ready | blocked
```

Intake rules:

- Treat every research-start field as mandatory before research starts.
- Allow optional or later-stage fields to remain open during intake when they are not yet needed for research.
- Treat `deliverables_needed`, `constraints`, and `success_metric` as later-stage gates: they may remain open during intake and research, but execution planning and proposal drafting must stop until they are all provided.
- Preserve `project_background` whenever the user provides it, and mark it as open if it is still unknown.
- Allow `key_message` to remain open during intake when messaging still needs to be developed from research.
- Do not invent missing details.
- Do not treat `unknown`, `tbd`, or similar placeholders as satisfying a required field.
- Collapse verbose user input into concise, decision-useful language.
- Keep open questions specific and answerable.
- Mark intake as `blocked` if any research-start field is missing or unknown.
- If the later-stage gate fails, route back for clarification on only the missing execution-critical fields instead of guessing.

### Research Contract

Research passes only when claims are directly relevant to the brief, specific enough to influence channel, message, audience, or execution choices, current enough for the decision being made, supported by at least two evidence classes, and backed by at least one concrete source for each important claim. Mark research `fail` when claims are generic, stale, unsupported, opinion-only, single-class, or not decision-useful.

Use this research output shape:

```md
## Research Verdict
- status: pass | fail
- confidence: high | medium | low
- evidence_classes_used:

## Key Findings
- Finding:
  - Why it matters:
  - Source:

## Gaps
-

## Recommendation For Next Step
- proceed | refine research | ask user for inputs
```

### Idea Contract

Score ideas on these five dimensions:

- `brief_fit`: matches the stated goal, audience, and offer
- `distinctiveness`: avoids category cliches and generic framing
- `research_support`: uses validated insight instead of guesswork
- `channel_fit`: works for the selected channels and formats
- `execution_feasibility`: fits timeline, budget, and team reality

Scoring rules:

- Score each dimension from `1` to `5`.
- `1` means weak or unsupported.
- `3` means acceptable but not strong.
- `5` means clear, specific, and execution-ready.
- Reject the idea if any dimension scores below `3`.
- Prefer ideas with a total score of `20` or higher out of `25`.
- Score evidence, not enthusiasm.
- Penalize ideas that could be reused for any brand with minor copy edits.
- Do not mark an idea as `keep` if execution feasibility is weak.

Use this idea output shape:

```md
## Idea Evaluation
| Idea | Brief Fit | Distinctiveness | Research Support | Channel Fit | Execution Feasibility | Total | Verdict |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Idea name | 0 | 0 | 0 | 0 | 0 | 0 | keep / revise / reject |

## Notes
- Idea name:
  - Strength:
  - Weakness:
  - Revision note:

## Selected Direction Handoff
- Selected direction:
- Why it won:
- Must preserve:
- Needs execution validation:
```

### Proposal Contract

Proposal writing starts only when all of the following are true:

- Intake status is `ready`.
- Research verdict is `pass`.
- `## Selected Direction Handoff` is present for the chosen direction.
- `## Validated Execution-Plan Handoff` is present and has `Validation status: validated`.
- At least one idea is scored as `keep` or otherwise confirmed viable.
- `deliverables_needed`, `constraints`, and `success_metric` are all present in the brief and are not `unknown`, `tbd`, or similar placeholders.

Treat the execution-plan handoff as valid only when it uses this shape and all fields are specific:

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

## Workflow

1. Pre-brief search.
Before asking intake follow-up questions, run one lightweight public search pass whenever the user has already given enough identifiable signal such as a brand, product, category, campaign topic, platform, or geography. Use that pass only to gather context that can sharpen later questions, such as recent market signals, category dynamics, likely channel context, or obvious items the user should confirm. Keep the search concise and recent, prefer public sources, and never let searched context satisfy required intake fields by inference. If the signal is too weak or the search is inconclusive, say so briefly and continue intake without blocking.

2. Intake gate.
Normalize the user brief into the intake template. Return a concise `## Pre-Brief Search Context` section before the intake summary using this shape:

```md
## Pre-Brief Search Context
- status: used | skipped | inconclusive
- Known signals:
- Items to confirm:
- Notes for later research:
```

Before research starts, require only the design-mandated intake fields listed under `Required Fields To Start Research`: `business_goal`, `target_audience`, `timeline`, `budget_or_resource_level`, `geography_or_region`, and `channel_constraints`. Do not treat `unknown`, `tbd`, or similar placeholders as satisfying the gate. If any required field is missing or unknown, return the pre-brief search context, the intake summary, the missing-field list, focused open questions, and the `## Intake Status` section set to `blocked`. Other intake fields may remain open until later-stage work makes them necessary, but `deliverables_needed`, `constraints`, and `success_metric` must all be resolved before execution planning or proposal drafting. Do not start research while blocked.

3. Research validation.
Run research only after intake is `ready`. Use the embedded research contract, require at least two evidence classes, and keep every important claim tied to at least one concrete source. If the verdict is `fail`, name the unsupported, stale, generic, single-class, or decision-useless claims and route back upstream with `refine research` or `ask user for inputs`.

4. Ideation and scoring.
Generate idea options only from a passing brief plus research chain. Score each idea with the embedded idea contract. Reject any idea with a dimension below `3`, a weak feasibility fit, or obvious category cliches. If all ideas fail, route back upstream to stronger research or sharper brief inputs before proposing replacements.

5. Execution fit.
Turn only a viable idea with an explicit `## Selected Direction Handoff` into a recommendation that matches the stated channels, deliverables, timeline, budget, and constraints. Before execution planning starts, require `deliverables_needed`, `constraints`, and `success_metric` to be present and specific; treat `unknown`, `tbd`, or similar placeholders as missing. If any of those later-stage fields are missing, stop and route back to the user with clarification questions for only the missing fields. Validate the resulting execution-plan handoff before moving forward. If the strategy asks for actions the brief cannot support, the selected-direction handoff is ambiguous, or the execution-plan handoff is not validated, stop and either revise upstream output to fit reality or ask the user to change scope.

6. Proposal draft.
Enter proposal writing only when both the embedded proposal entry conditions and the validated execution-plan handoff are satisfied, including the later-stage brief fields `deliverables_needed`, `constraints`, and `success_metric`. If any of those fields are still open, stop and route back for clarification instead of filling gaps by inference. Draft all nine required sections and keep a visible chain from brief -> research -> idea evaluation -> selected direction handoff -> validated execution-plan handoff -> recommendation.

7. Proposal review.
Review the draft against the embedded proposal contract and failure-mode checklist. If any section is thin, unsupported, generic, inconsistent with the execution fit, or missing a decision-oriented next step, send the workflow back to the earliest failing stage and name the blocker.

## Upstream Return Rules

- Missing critical intake fields: return to intake and ask only for the missing fields.
- Missing execution-critical later-stage fields: return to the user and ask only for the missing `deliverables_needed`, `constraints`, or `success_metric` fields.
- Evidence gaps or weak research: return to research and name which claims need better support.
- Cliche or low-scoring ideas: return to ideation or earlier brief/research refinement.
- Missing selected-direction handoff, ambiguous recommendation, or strategy and action mismatch: return to ideation or execution fit, and name the broken handoff.
- Thin proposal sections: return to the stage that should supply the missing substance instead of patching with filler.

## Completion Gate

Do not declare the work complete until all of the following are true:

- Intake status is `ready`.
- `deliverables_needed`, `constraints`, and `success_metric` are resolved and specific enough for execution and proposal work.
- Research verdict is `pass`.
- At least one idea remains viable after scoring.
- A single selected direction is handed off explicitly for execution planning.
- The recommendation fits the stated execution constraints.
- The execution-plan handoff is validated.
- Every proposal section is present and decision-useful.
- Final review finds no unresolved gaps, unsupported claims, or stage mismatches.

If any item fails, report the blocking gap and send the workflow back upstream instead of presenting a finished proposal.
