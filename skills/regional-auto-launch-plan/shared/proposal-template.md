# Proposal Template

Use this skeleton to assemble the final regional auto launch proposal.

## Depth model (mandatory)

- `Compact`: decision-first summary for fast review.
- `Expanded`: evidence, derivation logic, and implementation details.
- Every chapter that has both depths must place `Compact` before `Expanded`.
- Chapters `2`, `3`, and `4` must always include `Expanded` depth.

## Section skeleton (0-7 mandatory; 6 conditional)

```md
0. Cover / TOC

1. Task Brief (Compact default)
   - Client objective, target geography, success metric, timeline, constraints.

2. Market Insight (Compact + Expanded required)
   2.1 Product Value
   2.2 Market Environment
   2.3 Competitor Landscape
   2.4 Competitor Deep Dive (5 dimensions)
   2.5 Audience Segmentation
   2.6 Audience Regional Depth
   2.7 SWOT

3. Strategy Plan (Compact + Expanded required)
   3.1 Three-Layer Value System
   3.2 Slogan Derivation Chain
   3.3 Core Theme + Three Stage Sub-Themes
   3.4 Integrated Map (rhythm x audience x channel)

4. Action Plan (Compact + Expanded required)
   4.1 Stage Overview + Budget Allocation Table
   4.2 Phase 1 Pre-Heat
   4.3 Phase 2 Launch Burst
   4.4 Phase 3 Sustain
   4.5 Alternative Cards

5. Operations Assurance (Compact default)

6. Service Team (bid-only)
   - If non-bid: `skipped_non_bid` marker only.

7. Closing / Thanks
```

## Optional sections

```md
14. Post-Campaign Review & Uplift
    Trigger: tender technical requirements request post-campaign review, data loop,
    or secondary optimization recommendations.

15. Rubric Mapping
    Trigger: `evaluation_rubric` is non-empty.
```

## Hard inclusion rules

- Action chapter must include `Budget Allocation Table` with stage-level online/offline split and total.
- Action chapter must include `Alternative Cards` with one backup card per pillar.
- If rubric is non-empty, include section `15. Rubric Mapping` with one row per rubric item.
- If section `14` is triggered, keep it as a separate section and do not merge into section `7`.
