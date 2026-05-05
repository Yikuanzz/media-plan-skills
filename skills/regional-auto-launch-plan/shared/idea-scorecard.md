# Idea Scorecard

Use this scorecard to compare candidate Activity Cards within the same pillar.

## Five-Dimension Review Scoring

Score each card on a 1-5 scale per dimension, then apply weights for a weighted total score.

| Dimension | Weight | What to check | Key fields |
| --- | --- | --- | --- |
| Real audience pull | 30% | Is there a believable reason the target audience will join now, not later? | 5, 6 |
| Delivery feasibility | 20% | Can local dealer/team execute this flow with realistic resources and timeline? | 7, 8 |
| Budget feasibility | 20% | Does the card stay inside stage and total budget red lines? | 11 |
| Theme alignment | 15% | Is the idea aligned with Core Theme + stage sub-theme and sourced from insight? | 1, 2, 13 |
| Emotional resonance / propagation potential | 15% | Does it create emotionally shareable moments and natural social spread? | 6, 7, 9 |

Weighted score formula:

`total_score = pull*0.30 + delivery*0.20 + budget*0.20 + theme*0.15 + emotion*0.15`

## Selection Rule (Primary vs Alternative)

1. Reject any card that violates hard gates (mandatory fields missing, budget red lines broken, or no clear source trace).
2. Among valid cards, select highest `total_score` as `primary`.
3. Select second highest `total_score` as `alternative`.
4. If two cards tie on `total_score`, pick the one with higher `Real audience pull`; if still tied, pick higher `Emotional resonance / propagation potential`; if still tied, pick higher `Delivery feasibility`.
5. If hard-gate filtering leaves fewer than two valid cards, allow exactly one re-dispatch round and re-score.
6. If still fewer than two valid cards after that re-dispatch round, raise an explicit blocking exception and request user confirmation before using a single-card temporary fallback.

Budget output requirement for Phase 2 reviews: include both venue-related amount and venue-related ratio in the budget evidence used for feasibility checks.

Preference bonus rule:

- Add `+1` preference bonus when card includes `大众文化热点借势`.
- Add `+1` preference bonus when card includes `AI/科技热点共创`.
- Total preference bonus cap remains `+3`.

## Review Log Template

```md
## Pillar: <pillar-name>

### Candidate Scores
| Card | Pull (30%) | Delivery (20%) | Budget (20%) | Theme (15%) | Emotion (15%) | Weighted Total | Hard-Gate Status |
| --- | --- | --- | --- | --- | --- | --- | --- |
| A |  |  |  |  |  |  | pass/fail |
| B |  |  |  |  |  |  | pass/fail |
| C (optional) |  |  |  |  |  |  | pass/fail |

### Decision
- Primary: <card-id>
- Alternative: <card-id>
- Reason: <1-2 lines with strongest differentiator>
```
