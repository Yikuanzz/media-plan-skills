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
  - [ ] structure follows the active template route in `proposal-template.md`
  - [ ] Program Blueprint Cards (if used) include mechanism + step flow + owner + lead capture + KPI link
  - [ ] chapter-level strategic claims remain traceable to Core Strategic Idea fields (Core value, Marketing主线, Strategy pillars, stage sub-themes)
  - [ ] no framework-only language: abstract claims are mapped to named executable actions
  - [ ] if rubric: each scoring dimension mapped in section 15
- If **fail**: `## Review Gap` with:
  - `route`: research | ideation | execution | proposal_enrich
  - `Why` (1–3 bullets)
  - `Re-enter`: which phase to re-run (single route only; see SKILL)
```

- Do not declare the workflow complete while `## Review Pass` is `fail`, except when **max review loops** in `../SKILL.md` is reached — then emit `## Open Issues` and stop.
- **Routing (exclusive):** evidence/ competitor → `research`; idea/core idea/canvas mismatch → `ideation` (re-confirm with user if direction changes per SKILL BLOCKING); plan/event/calendar break → `execution`; wording/rubric/mapping only → `proposal_enrich` (re-run Review Pass on revised draft only).

## Proposal draft loop

- Version drafts as needed: `## Proposal Draft` with an incrementing `Revision` note when re-entering from upstream phases.
