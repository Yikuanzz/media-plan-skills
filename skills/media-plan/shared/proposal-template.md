# Proposal Template

## Entry Conditions

- Intake status is `ready`.
- Research verdict is `pass`.
- `## Selected Direction Handoff` is present for the chosen direction set (primary + any co-directions).
- `## Core Strategic Idea` is present for the primary direction (and co-directions if they have distinct stories) per [core-strategic-idea.md](core-strategic-idea.md).
- `## Highlight Mechanism Canvas` is present for the selected direction and is complete enough to carry into execution, including `Stage pillars`, `Local life map`, and `Calendar alignment`.
- `## Content Assets` is present for the primary direction (ideation output echoed in the proposal) per [content-assets.md](content-assets.md).
- `## Validated Execution-Plan Handoff` is present for the recommended execution plan and has `Validation status: validated`.
- At least one idea is scored as `keep` or otherwise confirmed viable.
- `deliverables_needed`, `constraints`, and `success_metric` are all present in the brief and are not `unknown`, `tbd`, or similar placeholders.
- **Bid / tender (optional)**: if `bid_or_tender` is true and `evaluation_rubric` is non-empty in intake, include `## Rubric Mapping`. If `tender_technical_requirements` or `bid_or_tender` demands post-campaign detail, include `## Post-Campaign Review & Uplift`.
- If any entry condition fails, stop proposal writing and return the blocking gap instead.

## Output Mode Routing

- Default mode: `general_proposal`.
- For automotive city or regional launch briefs, route to `regional-auto-launch-plan` (`skills/regional-auto-launch-plan/SKILL.md`) instead of drafting in this template.

## Structure

The final proposal must show a visible decision trail in this order: brief → research → idea → **Core Strategic Idea** → execution assets.

### A) General Proposal Structure (`general_proposal`)

1. `Brief Snapshot`
2. `Objective And Success Metric`
3. `Audience And Context`
4. `Research-Based Insights` (must reflect `## Competitor Actionable View` and `## Hotspot × Regional Resource Match` from research)
5. `Core Strategic Idea`
6. `Strategic Direction`
7. `Highlight Mechanism Overview`
8. `Mechanism Design` (must match [highlight-mechanism-canvas.md](highlight-mechanism-canvas.md) participation / spread / conversion)
9. `Core Idea Options`
10. `Phased Execution Plan`
11. `Phased Event Menu` (cognitive + time columns; align with [highlight-mechanism-canvas.md](highlight-mechanism-canvas.md) `Stage pillars` and execution handoff)
12. `Content Assets`
13. `Core Events, Channels, And Conversion Path`
14. `Post-Campaign Review & Uplift` (required when `bid_or_tender` + `tender_technical_requirements` or user demands; otherwise `n/a` with one-line justification is acceptable for general proposals)
15. `Rubric Mapping` (only when `evaluation_rubric` is provided; else omit or mark `n/a`)
16. `Risks And Open Questions`
17. `Decision Request And Next Step`

## Template

```md
# Proposal Title

## 1. Brief Snapshot

## 2. Objective And Success Metric

## 3. Audience And Context

## 4. Research-Based Insights
(Summarize; reference competitor trust paths and regional hotspot rows explicitly.)

## 5. Core Strategic Idea
(Shape per [core-strategic-idea.md](core-strategic-idea.md) — one-line claim, contradiction, resolution path.)

## 6. Strategic Direction

## 7. Highlight Mechanism Overview
(Theme, hero, pillars summary — must align with Core Strategic Idea and canvas.)

## 8. Mechanism Design
1. **Participation** — (expand from canvas `Participation mechanism`; who joins, what they do)
2. **Spread** — (from `Spread mechanism`; why share / discuss / UGC)
3. **Conversion** — (from `Conversion mechanism`; handoff to leads, trial, store, purchase)

## 9. Core Idea Options

## 10. Phased Execution Plan
(Map Early / Mid / Late to time and to cognitive goals: 建立期待 / 验证价值 / 口碑与转化。)

## 11. Phased Event Menu

| Macro stage (Early / Mid / Late) | Cognitive focus (期待 / 信任 / 裂变) | Time (month / week / T±) | Activity name | Pillar type (声量 / 圈层 / 转化) | Format and venue or touchpoint | Link to main idea / Hero / Content asset |
| --- | --- | --- | --- | --- | --- | --- |

(Include at least three named rows per macro campaign stage, matching `Stage pillars` and `Pillar roster by phase` naming.)

## 12. Content Assets
(Long / mid / short per [content-assets.md](content-assets.md).)

## 13. Core Events, Channels, And Conversion Path

## 14. Post-Campaign Review & Uplift
(Metrics, review cadence, optimization moves; tie to `success_metric` and budget. Use `n/a` only for non-bid or when explicitly not required.)

## 15. Rubric Mapping
| Scoring item (from RFP) | Where addressed in this proposal (section + one-line) | Proof or artifact |
| --- | --- | --- |
| … | … | … |

(Include only if `evaluation_rubric` is present; otherwise `n/a` or omit.)

## 16. Risks And Open Questions

## 17. Decision Request And Next Step
```

## Writing Rules

- Keep the recommendation traceable to the brief and research.
- Make the brief → research → idea → **Core Strategic Idea** → execution trail explicit.
- Write in direct business language, not workshop jargon.
- Use `Highlight Mechanism Overview` and `Mechanism Design` to show the core theme, hero event, and mechanism logic explicitly; **no contradiction** with the canvas.
- Prefer concrete tradeoffs over broad possibility lists.
- Show what should happen next, who needs to decide, and what is still uncertain.
- Do not include execution recommendations that the stated constraints cannot support.
- **`Phased Event Menu` must use schedulable, name-level activity lines**; the **Cognitive focus** column must not be empty — tie each row to 期待 / 信任 / 裂变 (or a brief equivalent) consistent with the canvas.
- No invented **client master marketing rhythm**; if `client_master_calendar` was not provided, list as `Open Question`.
