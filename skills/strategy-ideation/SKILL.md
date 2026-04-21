---
name: strategy-ideation
description: Use when a media planning brief has passed intake and research gates and needs multiple strategy directions scored for distinctiveness, support, and execution fit before recommendation.
---

# Strategy Ideation

## Purpose

Generate and filter strategy directions before recommendation writing. Keep the scoring contract embedded in this file so the skill still works when hosts copy only one skill directory. Keep every option anchored to the brief plus research pack.

## Embedded Runtime Contract

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

Use this output shape:

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

## Entry Gate

- Start only after intake is `ready` and research verdict is `pass`.
- Do not invent concepts that are detached from the stated goal, audience, offer, channels, constraints, or validated findings.

## Direction Rules

- Produce at least three distinct directions before choosing one.
- Make each direction traceable to specific brief inputs and research findings.
- Reject cliche, interchangeable, or trend-chasing ideas before final selection.
- If the research pack cannot support differentiated directions, stop and route back to research or ask for sharper brief inputs.

## Scoring

- Score every direction on all five dimensions in the embedded scorecard above.
- Reject any direction with a score below `3` on any dimension.
- Prefer directions scoring `20` or higher out of `25`.
- Do not keep a direction with weak execution feasibility, even if it sounds distinctive.

## Output

- Return the `## Idea Evaluation` table and `## Notes` section exactly as shaped above.
- If one direction remains recommended for downstream work, also return `## Selected Direction Handoff` exactly as shaped above.
- In `## Notes`, use only `Strength`, `Weakness`, and `Revision note`, and place the brief anchor or supporting research signal inside those fields when relevant.
- In `## Selected Direction Handoff`, name the exact winning direction, why it won, what execution planning must preserve, and what still needs execution validation.
- If all directions fail, do not force a winner; return upstream for stronger research or clearer brief constraints.
