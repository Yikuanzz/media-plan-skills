# Pre-Brief Search Phase

## Goal

Use one lightweight public search pass to sharpen intake questions and surface candidate inspiration directions before formal brief normalization begins.

## When To Run

- Run when the user has already given identifiable signals such as a brand, product, category, campaign topic, platform, region, or event window.
- Skip only when the prompt is too vague to search meaningfully.

## Rules

- Search for recent signals, not final strategy conclusions.
- Default source priority follows `../shared/pre-brief-source-map.md` and should favor China-market platform and social signals first.
- Use stronger editorial, consulting, or official sources to calibrate high-stakes signals.
- Never let searched context satisfy required brief fields by inference.
- Treat weak, contradictory, or low-trust signals as provisional.

## Output Shape

```md
## Pre-Brief Search Context
- status: used | skipped | inconclusive
- Known signals:
- Items to confirm:
- Notes for later research:

## Inspiration Hints
- Likely relevant directions:
- Supporting recent signals:
- Directions to avoid:
- Unknowns that block inspiration choice:
```
