---
name: media-plan-orchestrator
description: Use when handling a semi-structured China-market media planning brief that must be gated for missing inputs, routed through research and ideation, and held until proposal evidence and recommendation quality are complete.
---

# Media Plan Orchestrator

## Purpose

Turn a semi-structured China-market media planning brief into a review-ready proposal. Use the shared assets in `../shared/` as the contract for each stage. Do not guess missing inputs or declare completion early.

## Shared Assets

- `../shared/brief-intake-template.md`
- `../shared/research-rubric.md`
- `../shared/idea-scorecard.md`
- `../shared/proposal-template.md`
- `../../docs/product-specs/2026-04-21-media-plan-skill-pressure-tests.md`

## Workflow

1. Intake gate.
Normalize the user brief into the intake template. Before research starts, require only the design-mandated intake fields listed under `Required Fields To Start Research`: `business_goal`, `target_audience`, `timeline`, `budget_or_resource_level`, `geography_or_region`, and `channel_constraints`. Do not treat `unknown`, `tbd`, or similar placeholders as satisfying the gate. If any required field is missing or unknown, return the intake summary, the missing-field list, focused open questions, and the `## Intake Status` section set to `blocked`. Other intake fields may remain open until later-stage work makes them necessary, but `deliverables_needed`, `constraints`, and `success_metric` must all be resolved before execution planning or proposal drafting. Do not start research while blocked.

2. Research validation.
Run research only after intake is `ready`. Use the research rubric output shape, require at least two evidence classes, and keep every important claim tied to at least one concrete source. If the verdict is `fail`, name the unsupported, stale, generic, single-class, or decision-useless claims and route back upstream with `refine research` or `ask user for inputs`.

3. Ideation and scoring.
Generate idea options only from a passing brief plus research chain. Score each idea with the shared scorecard. Reject any idea with a dimension below `3`, a weak feasibility fit, or obvious category cliches. If all ideas fail, route back upstream to stronger research or sharper brief inputs before proposing replacements.

4. Execution fit.
Turn only a viable idea with an explicit `## Selected Direction Handoff` into a recommendation that matches the stated channels, deliverables, timeline, budget, and constraints. Before execution planning starts, require `deliverables_needed`, `constraints`, and `success_metric` to be present and specific; treat `unknown`, `tbd`, or similar placeholders as missing. If any of those later-stage fields are missing, stop and route back to the user with clarification questions for only the missing fields. Validate the resulting execution-plan handoff before moving forward. If the strategy asks for actions the brief cannot support, the selected-direction handoff is ambiguous, or the execution-plan handoff is not validated, stop and either revise upstream output to fit reality or ask the user to change scope.

5. Proposal draft.
Enter proposal writing only when both the proposal template entry conditions and the validated execution-plan handoff are satisfied, including the later-stage brief fields `deliverables_needed`, `constraints`, and `success_metric`. If any of those fields are still open, stop and route back for clarification instead of filling gaps by inference. Draft all nine required sections and keep a visible chain from brief -> research -> idea evaluation -> selected direction handoff -> validated execution-plan handoff -> recommendation.

6. Proposal review.
Review the draft against the proposal template and `../../docs/product-specs/2026-04-21-media-plan-skill-pressure-tests.md`. If any section is thin, unsupported, generic, inconsistent with the execution fit, or missing a decision-oriented next step, send the workflow back to the earliest failing stage and name the blocker.

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
- Every proposal-template section is present and decision-useful.
- Final review finds no unresolved gaps, unsupported claims, or stage mismatches.

If any item fails, report the blocking gap and send the workflow back upstream instead of presenting a finished proposal.
