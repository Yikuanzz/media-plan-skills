# Proposal Template

Use this skeleton to assemble the final regional auto launch proposal.

## Assembly mode (mandatory)

- `proposal.md` is a mechanical assembly artifact from persisted chapter files.
- Chapter source-of-truth files are `00`-`09`; assembly layer must not summarize or rewrite.
- Fixed order is defined in `../shared/persistence-rules.md` and cannot be reordered.

## Depth model (mandatory)

- `Compact`: decision-first summary for fast review.
- `Expanded`: evidence, derivation logic, and implementation details.
- Every chapter that has both depths must place `Compact` before `Expanded`.
- Chapters `2`, `3`, and `4` must always include `Expanded` depth.

## Section skeleton (0-8 order fixed; section 6 is conditional)

```md
0. Cover / TOC

1. Task Thesis (Compact + Expanded required)
   - 核心营销命题
   - 三大核心课题（定位/覆盖/转化）
   - 核心任务宣言

2. Market Insight (Compact + Expanded required)
   2.1 Product Value
   2.2 Market Environment
   2.3 Competitor Landscape
   2.4 Competitor Deep Dive (5 dimensions)
   2.5 Audience Segmentation
   2.6 Audience Regional Depth
   2.7 SWOT

3. Strategy Plan (Compact + Expanded required)
   3.1 Differentiated Value Presentation (品牌基础层 → 痛点解决层 → 产品目标层)
   3.2 Slogan Derivation Chain
   3.3 Core Impact Strategy + Three Stage Sub-Themes
   3.4 Integrated Map + Marketing MAP (rhythm x audience x channel)

4. Action Plan (Compact + Expanded required)
    4.1 Stage Overview + Budget Allocation Table
    4.2 Phase 1 Pre-Heat
    4.3 Phase 2 Launch Burst
    4.4 Phase 3 Sustain
    4.5 Alternative Cards
    4.X Launch Execution Pack (mandatory in Phase 2/3)
        - site recommendation
        - on-site layout
        - core run sheet
        - on-site lead-capture path
        - N-7/N/N+3 communication map + platform-differentiated content matrix

5. Operations Assurance (Compact default)

6. Service Team (bid-only)
   - If non-bid: output exactly `## 6. Service Team (skipped - non-bid)`.

7. Closing / Thanks

8. Visual Anchor List (mandatory)
   8.1 Concept Image 1: Launch/Event Space
   8.2 Concept Image 2: City Battlefield Map
   8.3 Concept Image 3: Slogan Typography + Brand Symbol Fusion
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
- Market Insight chapter must include at least one `Insight Data Table` with metric, value, year/window, and source columns.
- Action chapter must include `Alternative Cards` with one backup card per pillar.
- Action chapter must include at least one complete launch execution pack with site/layout/flow/capture details.
- Launch execution pack must include platform-differentiated communication map and layered KOL/KOC plan.
- Industry trade shows cannot be used as primary launch storyline event.
- Final proposal must include `Visual Anchor List` with three text-described concept images.
- Each concept image line must include status tag (`[CONCEPT IMAGE: pending design]` or `[AI GENERATED]`) and suggested design budget.
- If rubric is non-empty, include section `15. Rubric Mapping` with one row per rubric item.
- If section `14` is triggered, keep it as a separate section and do not merge into section `7`.
