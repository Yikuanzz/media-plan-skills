# Idea Scorecard

## Dimensions

- `brief_fit`: matches the stated goal, audience, and offer
- `topic_freshness`: uses a trend, emotion, or topic from the last 6 months instead of generic evergreen framing
- `form_breakthrough`: uses a new content format, interaction mechanic, or platform play instead of standard formats
- `research_support`: uses validated insight instead of guesswork
- `channel_fit`: works for the selected channels and formats
- `mechanism_strength`: forms a clear participation, spread, and conversion logic instead of disconnected actions
- `execution_feasibility`: fits timeline, budget, and team reality
- `propagation_theme_clarity` (required for city/regional briefs): whether the idea has a one-line emotional theme, city/regional binding, product-sellpoint mapping, and expandable hashtag logic

## Scoring Rules

- Score each dimension from `1` to `5`.
- `1` means weak or unsupported.
- `3` means acceptable but not strong.
- `5` means clear, specific, and execution-ready.
- Reject the idea if any dimension scores below `3`.
- **Innovation floor**: `topic_freshness` + `form_breakthrough` must be `6` or higher (no idea can score 3 on both).
- **Conservative downgrade**: if `topic_freshness` <= `2` AND `form_breakthrough` <= `2`, reject regardless of other dimensions.
- Prefer ideas with a total score of `26` or higher out of `35`.

## Output Shape

```md
## Idea Evaluation
| Idea | Brief Fit | Topic Freshness | Form Breakthrough | Research Support | Channel Fit | Mechanism Strength | Execution Feasibility | Propagation Theme Clarity* | Total | Verdict |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Idea name | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | keep / revise / reject |

*For non-city briefs this column may be marked `n/a`.

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

For city or regional briefs, also include:

- `One-line propagation theme` (with emotional hook)
- `City or regional emotional binding`
- `Product-sellpoint mapping`
- `Hashtag extensibility` (example tags such as `#...#`)

## Core Strategic Idea

Fill per [core-strategic-idea.md](core-strategic-idea.md) for the **primary** direction and any co-direction with a distinct narrative. **Do not** write `## Highlight Mechanism Canvas` for the primary until this block exists (core claim first, then canvas alignment).

## Highlight Mechanism Canvas

Use `highlight-mechanism-canvas.md` for every `keep` direction.

## Content Assets

Echo [content-assets.md](content-assets.md) for the primary `keep` direction after the primary direction’s canvas is complete.

## Selected Direction Handoff

### Recommended Direction Set

| Role | Direction Name | Pain Point Solved | Phase Coverage | Channel Mix | Combination Logic |
| --- | --- | --- | --- | --- | --- |
| Primary | [name] | [pain point] | [phases] | [channels] | [why this leads] |
| Co-direction 1 | [name] | [pain point] | [phases] | [channels] | [relationship to primary] |
| Co-direction 2 | [name] | [pain point] | [phases] | [channels] | [relationship to primary] |

### Canvas Reference
- Primary direction canvas: complete / incomplete
- Co-direction 1 canvas: complete / incomplete
- Co-direction 2 canvas: complete / incomplete

### Independent Feasibility
- [Direction name]: yes / no — reason
- [Direction name]: yes / no — reason

### Phased Execution Recommendations
- Early (0-30d): [direction + action]
- Mid (30-60d): [direction + action]
- Late (60-90d): [direction + action]

### Must Preserve
- [creative element 1]
- [creative element 2]

### Needs Execution Validation
- [risk 1]
- [risk 2]
```

## Rules

- Score evidence, not enthusiasm.
- Penalize ideas that could be reused for any brand with minor copy edits.
- Do not mark an idea as `keep` if `mechanism_strength` is below `3`.
- Do not mark an idea as `keep` if execution feasibility is weak.
- For city or regional briefs, do not mark an idea as `keep` if `propagation_theme_clarity` is below `3`.
- If one direction is recommended for downstream planning, fill `## Selected Direction Handoff` explicitly so execution planning does not need to infer the winner.

## Anti-Cliché Checklist

Run this before scoring each idea. If any checkbox is `yes`, mark the idea `⚠️ cliché risk`.

- [ ] The core mechanism is highly similar to 3+ well-known campaigns in this category from the last 3 years.
- [ ] The idea could be reused for any competitor by swapping the brand name and product.
- [ ] The example angle appears in the direction's "classic but watch out" list.
- [ ] The idea uses a platform play that "everyone uses" (e.g., standard KOL seeding + hashtag) with no new twist.

**Handling:**
- Ideas marked `⚠️ cliché risk` can score at most `2` on `topic_freshness` and `form_breakthrough`.
- If the user explicitly asks for "safe and conservative", ignore the mark.
- Otherwise, surface the risk to the user before final scoring.
