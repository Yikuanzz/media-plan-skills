# Research Rubric

## Pass / Fail Criteria

### Pass

- Claims are directly relevant to the brief.
- Evidence is specific enough to influence channel, message, audience, or execution choices.
- Sources are current enough for the decision being made.
- The research pack uses at least two evidence classes chosen from hotspot signals, industry or competitor cases, public data, and platform signals.
- At least one concrete source supports each important claim.
- The summary distinguishes evidence from inference.

### Fail

- Claims are generic and could apply to any category.
- Evidence comes only from unsourced opinion, recycled AI language, or stale references.
- The research pack relies on only one evidence class.
- Important strategic claims have no source.
- Findings do not change or sharpen the recommendation.

## Required Output Shape

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

## Rules

- Keep findings tied to decisions, not trivia.
- Name missing evidence explicitly.
- Mark the verdict `fail` if fewer than two evidence classes are present.
- If the verdict is `fail`, do not pretend the strategy is validated.
