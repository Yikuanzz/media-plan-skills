# Ideation Phase

## Goal

Use the inspiration library plus the validated research pack to generate multiple brief-specific strategy directions, preserve one wildcard option, and score them consistently.

## Required Reads

- `../shared/inspiration-directions.md`
- `../shared/idea-scorecard.md`

## Rules

- After filling `## Selected Direction Handoff`, downstream execution must not start until the user explicitly confirms that selection; see **Step 5 BLOCKING** in `../SKILL.md`.
- Screen 2-3 inspiration directions from the library.
- For each surviving direction, generate **2-3 angle-specific proposals** that differ in at least one of:
  - Target audience segment (e.g., Gen-Z vs. new middle class vs. silver generation)
  - Content format (e.g., short video vs. interactive H5 vs. offline experience)
  - Platform strategy (e.g., Douyin full-funnel vs. Xiaohongshu seeding vs. WeChat private domain)
  - Emotional hook (e.g., humor/meme vs. emotional resonance vs. value identification)
  - Execution scale (e.g., small pilot vs. national rollout vs. city-limited)
- Keep **two wildcard directions** (see Step 2 below).
- Produce **at least 8 distinct proposals** before scoring. At least 3 must come from wildcards or frontier signals.
- Name directions to avoid when brief, research, or recent signals make them weak.
- Reject cliché, interchangeable, trend-chasing, or poorly supported proposals before final selection.
- Proposals within the same direction must not exceed 70% structural similarity.

## Step 0: Frontier Signal Retrieval (mandatory)

Before generating any idea, run one targeted frontier signal search.

**Search requirements:**
- Use `tavily_search` to search for frontier cases in this category/industry from the last 3-6 months.
- Keyword patterns: category name + "campaign" / "营销" / "新玩法" / "出圈" / "趋势"
- Also search target platforms (Douyin / Xiaohongshu / WeChat) for recent algorithm or format innovations.
- Scope: at least 2 keyword groups, at least 3 results per group.

**Output format:**
```markdown
## Frontier Signal Scan
| Source | Date | Platform/Channel | Core Innovation | Relevance to Brief |
| --- | --- | --- | --- | --- |
| [source name] | [date] | [platform] | [one-sentence summary] | [high / medium / low] |
```

**Rules:**
- If no frontier signals from the last 6 months are found, explicitly label "frontier signal weak" and prioritize wildcard directions in subsequent ideation.
- Do not generate ideas from AI internal knowledge alone. Every idea must be anchored to a frontier signal or an anti-convention assumption.

## Step 2: Wildcard Dual-Track

After generating proposals from the inspiration library, generate **two mandatory wildcard directions**:

**Wildcard A — Frontier Signal Driven**
- Extend directly from one high-relevance signal in the `## Frontier Signal Scan`.
- Ask: "If this signal is pushed one step further, what could the brand do?"
- Must cite the supporting frontier signal source.

**Wildcard B — Anti-Convention Assumption**
- Deliberately break 1-2 "default consensus" rules in the category.
- Template: "Everyone assumes [category convention X], but what if the opposite [anti-convention Y]?"
- Must name the broken convention.
- Even if the direction is ultimately unworkable, it must be generated and recorded as a thinking breakthrough.

**Rules:**
- Both Wildcard A and B must appear in the final `## Idea Evaluation`.
- If Wildcard A cannot be generated due to weak frontier signals, substitute with a "radical frontier hypothesis" (a 12-month forward projection based on category trends).
- Wildcard B must not exceed 50% structural similarity with any direction in the inspiration library.

## Notes Requirements

For each idea in `## Notes`, include:

- `Strength`
- `Weakness`
- `Revision note`
- `Inspiration anchor`
- `Recent signal used`
- `Why this is not generic`
- `Innovation source`:
  - type: `frontier_signal` / `classic_framework` / `anti_convention` / `hybrid`
  - specific_source: [signal name / broken convention / hybrid composition]
  - freshness: [signal date if frontier_signal; usage frequency in last 3 years if classic]
- `Pain point anchored`: [core pain point this idea addresses]
- `Phase coverage`: [early / mid / late / full-cycle]
- `Channel mix`: [online / offline / online-offline blend]
- `Combinability`: [which other ideas this can combine with, and the logic]

## Multi-Selection Rules

- The user may select 1 primary direction + 0-2 co-directions.
- When multiple directions are selected, provide:
  1. **Combination logic**: how the directions complement, relay, or layer-cover each other.
  2. **Phased execution recommendations**: avoid temporal conflicts between directions.
  3. **Resource allocation guidance**: how budget and headcount are split across directions.
- Co-directions must differentiate from the primary direction in phase coverage or channel mix to avoid redundancy.
