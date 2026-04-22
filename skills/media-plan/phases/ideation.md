# Ideation Phase

## Goal

Use the inspiration library plus the validated research pack to generate multiple brief-specific strategy directions, preserve one wildcard option, and score them consistently.

## Required Reads

- `../shared/inspiration-directions.md`
- `../shared/idea-scorecard.md`

## Rules

- After filling `## Selected Direction Handoff`, downstream execution must not start until the user explicitly confirms that selection; see **Step 5 BLOCKING** in `../SKILL.md`.
- Screen 2 to 4 plausible inspiration directions before drafting final options.
- Generate at least one brief-specific angle from each surviving inspiration direction.
- Keep at least one wildcard direction outside the inspiration library.
- Produce at least three distinct directions before choosing one.
- Name directions to avoid when the brief, research, or recent signals make them weak.
- Reject cliche, interchangeable, trend-chasing, or poorly supported directions before final selection.

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

## Notes Requirements

For each idea in `## Notes`, include:

- `Strength`
- `Weakness`
- `Revision note`
- `Inspiration anchor`
- `Recent signal used`
- `Why this is not generic`
