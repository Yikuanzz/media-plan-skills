---
name: industry-insight-research
description: Use when a media planning brief is intake-ready and needs recent public evidence, hotspot signals, and category cases before strategy or ideation can proceed.
---

# Industry Insight Research

## Purpose

Build a decision-useful research pack for media planning. Keep the output contract embedded in this file so the skill still works when hosts copy only one skill directory. Keep facts separate from inference.

## Embedded Runtime Contract

The upstream brief is ready for research only when intake status is `ready` and these fields are all specific enough to use: `business_goal`, `target_audience`, `timeline`, `budget_or_resource_level`, `geography_or_region`, and `channel_constraints`.

Research passes only when claims are directly relevant to the brief, specific enough to influence channel, message, audience, or execution choices, current enough for the decision being made, supported by at least two evidence classes, and backed by at least one concrete source for each important claim. Mark research `fail` when claims are generic, stale, unsupported, opinion-only, single-class, or not decision-useful.

Use this output shape:

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

## Entry Gate

- Start only after the brief is `ready` under the embedded intake contract above.
- Research only what can change channel, message, audience, or execution choices.
- If the question needs current market evidence, use recent public sources rather than recalled knowledge.

## Research Rules

- Prefer public sources from the last 12 months unless the topic clearly moves slower.
- Research sufficiency requires at least two evidence classes chosen from hotspot signals, industry or competitor cases, public data, and platform signals.
- Support every important claim with at least one source link, title, and date.
- Split each finding into `Fact` and `Inference` inside the finding text so evidence and interpretation do not blur.
- Mark the verdict `fail` if sources are stale, generic, opinion-only, too weak to guide decisions, or drawn from fewer than two evidence classes.

## Output

- Follow the embedded `## Research Verdict`, `## Key Findings`, `## Gaps`, and `## Recommendation For Next Step` shape above.
- List the evidence classes used in `## Research Verdict`.
- In `## Key Findings`, keep the rubric structure and make `Finding` clearly separate evidence from inference while leaving `Why it matters` and `Source` as their own lines.
- Name missing evidence directly in `## Gaps` and return `refine research` or `ask user for inputs` when the rubric does not pass.
