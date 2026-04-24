# Proposal Phase

## Goal

Assemble the final proposal and review it against the shared template and upstream evidence chain before delivery. Run a **Review Pass** after the first full draft and after each **Review loop** revision (see `../SKILL.md`).

## Required Read

- `../shared/highlight-mechanism-canvas.md`
- `../shared/proposal-template.md`
- `../shared/core-strategic-idea.md`
- `../shared/brief-intake-template.md` (for `evaluation_rubric` / bid flags)

## Rules

- Start only when all proposal entry conditions pass in `../shared/proposal-template.md`.
- Pull inputs from the approved intake summary, research pack (including `## Competitor Actionable View`, `## Hotspot × Regional Resource Match`), scored idea evaluation, `## Core Strategic Idea`, `## Content Assets`, and validated execution-plan handoff.
- Pull the selected direction's `## Highlight Mechanism Canvas` forward explicitly; `## Mechanism Design` in the proposal must mirror the three mechanisms without new logic.
- Include all numbered sections per `../shared/proposal-template.md`, including **11. Phased Event Menu** with **Cognitive focus** column and **12. Content Assets**.
- When `../shared/proposal-template.md` routes to `auto_regional_launch`, use the dedicated single-output structure and require a complete `## City Evidence Pack` from research before drafting.
- If `bid_or_tender` is true and `evaluation_rubric` is non-empty, `## 15. Rubric Mapping` is mandatory. If `tender_technical_requirements` or bid context requires, `## 14. Post-Campaign Review & Uplift` is mandatory.
- If evidence, idea quality, or execution fit is unresolved, stop and route back upstream rather than patching with filler.

## Review Pass (mandatory before completion)

After assembling the full markdown against the template, output:

```md
## Review Pass
- Verdict: pass | fail
- Intake / bid context: (note `bid_or_tender`, `evaluation_rubric` present or not)
- Checklist: 
  - [ ] traceability brief → research → idea → core idea → execution
  - [ ] research competitor table reflected in section 4
  - [ ] Core Strategic Idea + canvas + Mechanism Design consistent
  - [ ] Event Menu: cognitive column + time + pillar + content asset link where applicable
  - [ ] Content Assets long / mid / short
  - [ ] if auto regional launch: all six chapters present (1-任务课题, 2-市场洞察, 3-营销策略, 4-行动规划, 5-运营检核, 6-服务团队)
  - [ ] if auto regional launch: bid-gated chapters (5, 6) are present when `bid_or_tender=true`, collapsed when false
  - [ ] if auto regional launch: Chapter 4 includes at least 1 Program Blueprint Card per phase
  - [ ] if auto regional launch: each Program Blueprint Card has mechanism + step flow + owner + lead capture + KPI link
  - [ ] if auto regional launch: Chapter 4 phase tables use 时间/动作/产出物/关键节点 columns
  - [ ] if auto regional launch: Chapter 3 echoes Core value, Marketing主线, and Strategy pillars from Core Strategic Idea
  - [ ] if auto regional launch: Chapter 2 includes audience persona, city localization insight, and market trend
  - [ ] no framework-only language: abstract claims are mapped to named executable actions
  - [ ] if rubric: each scoring dimension mapped in section 15
- If **fail**: `## Review Gap` with:
  - `route`: research | ideation | execution | proposal_enrich
  - `Why` (1–3 bullets)
  - `Re-enter`: which phase to re-run (single route only; see SKILL)
```

- Do not declare the workflow complete while `## Review Pass` is `fail`, except when **max review loops** in `../SKILL.md` is reached — then emit `## Open Issues` and stop.
- For `auto_regional_launch`, Review Pass must also verify all nine dedicated sections are present and presentation-ready (named actions, schedule windows, channels or venues, and expected output).

- **Routing (exclusive):** evidence/ competitor → `research`; idea/core idea/canvas mismatch → `ideation` (re-confirm with user if direction changes per SKILL BLOCKING); plan/event/calendar break → `execution`; wording/rubric/mapping only → `proposal_enrich` (re-run Review Pass on revised draft only).

## Proposal draft loop

- Version drafts as needed: `## Proposal Draft` with an incrementing `Revision` note when re-entering from upstream phases.
