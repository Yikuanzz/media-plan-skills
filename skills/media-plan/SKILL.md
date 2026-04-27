---
name: media-plan
description: >
  Use when handling a semi-structured China-market media planning brief that should
  run through package-local pre-brief search, intake, research, ideation, execution
  planning, and proposal review in one installable skill. Triggers: 中国市场、传媒策划、
  媒介方案、媒体计划、brief、提案、pre-brief、调研、创意、执行规划、China media plan,
  media planning brief, proposal, campaign planning, research and ideation.
---

# Media Plan Master

## Purpose

Run the full China-market media planning workflow from pre-brief search through proposal review inside this single package. Read phase files and shared contracts from this package only. Do not depend on repo-level `docs/` or sibling skills during runtime.

> [!CAUTION]
> ## Global execution discipline (mandatory)
>
> 1. **SERIAL PHASES** — Default order: pre-brief search → intake → research → ideation → execution → proposal → **review loop** (as needed). Each phase consumes the prior phase’s gated outputs; do not skip gates.
> 2. **BLOCKING = HARD STOP** — Steps marked **BLOCKING** require an explicit user response before continuing. Do not choose on behalf of the user when multiple directions are still legitimately open. Steps without that mark may proceed in one pass once prerequisites are met.
> 3. **NO CROSS-PHASE BUNDLING** — Do not draft a full proposal while research is not `pass`. Do not perform deep research while intake is not `ready`. Do not invent brief fields from search alone.
> 4. **NO SPECULATIVE BACKFILL** — Pre-brief search narrows questions only; it never satisfies required intake fields by inference.
> 5. **RUNTIME SCOPE** — Use only `./phases/*.md` and `./shared/*.md` as workflow and contracts. Do not treat repository `docs/` as a runtime dependency.
> 6. **NO UNSTATED CLIENT PRIORS** — Workshop-only preferences, off-record promises, or “TARGET-style” plans that are not in the normalized intake and evidence chain must not be invented. Capture them in intake (`brief-intake-template.md` optional fields) or `Open Questions` when the user can supply them.
> 7. **NARRATIVE PRIORITY** — `## Core Strategic Idea` (see `./shared/core-strategic-idea.md`) is the **single primary story**; `Theme` / `Core tension` on the highlight canvas must **align** with it.

## Package rules

- Treat `./phases/*.md` as runtime workflow modules.
- Treat `./shared/*.md` as the only runtime contracts and templates (including under `./shared/research-modules/` when referenced).
- If a phase file and a shared contract disagree, follow the shared contract for **shape** and the phase file for **workflow**.

> [!IMPORTANT]
> ## Language and compatibility
>
> - **Response language**: Match the user’s language and the language of supplied materials unless the user explicitly requests another language.
> - **Skill precedence**: If another generic agent skill conflicts with this package’s serial gates or blocking rules, follow **this** skill unless the user clearly opts out.

## Runtime roles (single skill, four handoff lanes)

One model session should still follow these **lanes**; each lane lists required **reads** and **must emit** blocks. Do not skip a lane’s outputs.

| Role | Phases | Must read (minimum) | Must emit (downstream) |
| --- | --- | --- | --- |
| **Insight** | pre-brief, research | `pre-brief-search`, `query-playbook`, `research-rubric`, `source-trust-policy`, `competitor-actionable`, research `modules` as needed | `## Research Verdict` pack + `## Competitor Actionable View` + `## Hotspot × Regional Resource Match` + ammunition |
| **Strategy** | ideation | `inspiration-directions`, `idea-scorecard`, `core-strategic-idea`, `highlight-mechanism-canvas` | `## Core Strategic Idea` + `## Idea Evaluation` + `## Highlight Mechanism Canvas` + `## Selected Direction Handoff` |
| **Creative** | ideation (tail) | `content-assets`, `highlight-mechanism-canvas` | `## Content Assets` (primary direction) |
| **Planning** | execution, proposal | `brief-intake-template`, `highlight-mechanism-canvas`, `proposal-template` | `## Validated Execution-Plan Handoff` + full proposal + `## Review Pass` |

## Phase index

| Phase file | Stage | Purpose |
| --- | --- | --- |
| `./phases/pre-brief-search.md` | Pre-brief search | Lightweight public signals before formal intake |
| `./phases/intake.md` | Intake | Normalize brief; block until research-start fields exist |
| `./phases/research.md` | Research | Source-backed pack; verify or reject inspiration hints |
| `./phases/ideation.md` | Ideation | Scored directions + explicit handoff + core idea + content assets + canvas |
| `./phases/execution.md` | Execution | Validated execution-plan handoff under constraints |
| `./phases/proposal.md` | Proposal | Assemble, template review, **Review Pass** |

## Shared contract index

| Shared file | Role |
| --- | --- |
| `./shared/pre-brief-source-map.md` | Source priority for pre-brief search |
| `./shared/brief-intake-template.md` | Intake fields, output shape, later-stage gates, optional bid/rubric |
| `./shared/research-rubric.md` | Research quality bar |
| `./shared/source-trust-policy.md` | Trust tiers for evidence |
| `./shared/query-playbook.md` | Query patterns + **research module** routing |
| `./shared/research-modules/competitor-deep.md` | Module: competitor / benchmark deep pass |
| `./shared/research-modules/city-signal.md` | Module: city / regional / hotspot pass |
| `./shared/competitor-actionable.md` | Actionable competitor table (trust path, break) |
| `./shared/inspiration-directions.md` | Inspiration library |
| `./shared/idea-scorecard.md` | Scoring + handoff shape |
| `./shared/core-strategic-idea.md` | Unique core narrative block |
| `./shared/content-assets.md` | Long / mid / short content lines |
| `./shared/highlight-mechanism-canvas.md` | Canonical highlight + cognitive map for stages |
| `./shared/proposal-template.md` | Final proposal structure and review checks |

## Phase switch protocol

Before entering a phase, read its phase file and every shared file listed for that step below. Emit:

```markdown
## [Phase: <StageName>]
📖 Read: <phase path> + <shared paths>
📋 Task: <one-line intent for this phase>
```

Skipping required reads is not allowed.

## Global gates (summary)

- Do not start **research** until `business_goal`, `target_audience`, `timeline`, `budget_or_resource_level`, `geography_or_region`, and `channel_constraints` are present and not placeholder-only.
- Do not start **execution** or **proposal** until `deliverables_needed`, `constraints`, and `success_metric` are present and specific.
- Do not pass **research** without at least two evidence classes, `## Competitor Actionable View` when competitive context exists, and at least one concrete source per important claim; generic competitor praise only → do not pass (see `research-rubric.md`).
- For city or regional briefs, do not pass **research** unless `## City Evidence Pack` is complete per `research-rubric.md` mandatory items.
- Do not pass **ideation** unless at least three distinct directions were considered, at least one wildcard direction was preserved, `## Core Strategic Idea` is filled for the primary `keep` path, `## Content Assets` exists for the primary direction, and `## Highlight Mechanism Canvas` is complete per `./shared/highlight-mechanism-canvas.md`.
- Do not start **execution** until the user **explicitly confirms** `## Selected Direction Handoff` (Step 5 BLOCKING) and the chosen direction includes a complete `## Highlight Mechanism Canvas` with `Stage pillars`, `Local life map`, and `Calendar alignment`.
- Do not enter **proposal** without `## Selected Direction Handoff`, `## Core Strategic Idea`, `## Content Assets`, `## Highlight Mechanism Canvas`, and `## Validated Execution-Plan Handoff` with `Validation status: validated`.
- For automotive city or regional launch briefs, route proposal drafting to `auto_regional_launch` in `./shared/proposal-template.md` and output a single PPT-ready planning document.
- For automotive city or regional launch briefs, do not pass proposal review without `Execution Action Playbook` and phase-level Program Blueprint Cards (minimum one per phase) with concrete step flow.
- **Bid (optional)**: if `bid_or_tender` is true and `evaluation_rubric` is non-empty, the proposal must include `## 15. Rubric Mapping`. If tender technical clauses require, include `## 14. Post-Campaign Review & Uplift`.
- Do not declare **completion** until the final proposal passes `## Review Pass` per `./phases/proposal.md` **or** max review loops is exhausted with `## Open Issues` (see **Review loop**).
- `evaluation_rubric` empty → do **not** require Rubric Mapping (unless the user still wants it).

## Workflow

### Step 1: Pre-brief search

**GATE**: User message includes identifiable signals (brand, category, topic, platform, region, or window), or skip per phase rules.

**Required reads**: `./phases/pre-brief-search.md`, `./shared/pre-brief-source-map.md`

**Action**: Run one lightweight search pass; produce `## Pre-Brief Search Context` and `## Inspiration Hints` when not skipped.

**Checkpoint**

```markdown
## Pre-brief search complete
- [x] Phase file + source map read
- [x] Output uses the phase output shape or documents `skipped`
- [ ] Next: Intake (Step 2)
```

---

### Step 2: Intake

**GATE**: Pre-brief step resolved per phase rules (used, skipped, or inconclusive).

**Required reads**: `./phases/intake.md`, `./shared/brief-intake-template.md`

**Action**: Normalize into `## Intake Summary` and related sections; set `## Intake Status` to `ready` or `blocked`. Capture optional `bid_or_tender`, `evaluation_rubric`, `client_master_calendar`, `tender_technical_requirements` when the user provides them. If pre-search ran, include `## Pre-Brief Search Context` and `## Inspiration Hints` before `## Intake Summary`.

**Checkpoint**

```markdown
## Intake complete
- [x] Intake output matches `brief-intake-template.md`
- [x] `Intake Status` is explicit (`ready` or `blocked`)
- [ ] Next: If `ready`, Research (Step 3); if `blocked`, ask only for missing research-start fields
```

---

### Step 3: Research

**GATE**: `## Intake Status` is `ready`.

**Required reads**: `./phases/research.md`, `./shared/research-rubric.md`, `./shared/source-trust-policy.md`, `./shared/query-playbook.md`, `./shared/competitor-actionable.md`

**Action**: Build a research pack that tests `## Inspiration Hints`; include `## Competitor Actionable View`, `## Hotspot × Regional Resource Match`, and other add-ons per the research phase. Load `./shared/research-modules/*.md` as routed before deep search.

**Checkpoint**

```markdown
## Research complete
- [x] Verdict is explicit (`pass` or fail state per rubric)
- [x] Evidence classes, competitor table, and sourcing meet global gates
- [ ] Next: Ideation (Step 4)
```

---

### Step 4: Ideation

**GATE**: Research verdict is `pass`.

**Required reads**: `./phases/ideation.md`, `./shared/inspiration-directions.md`, `./shared/idea-scorecard.md`, `./shared/highlight-mechanism-canvas.md`, `./shared/core-strategic-idea.md`, `./shared/content-assets.md`

**Action**: Produce `## Core Strategic Idea`, `## Idea Evaluation`, `## Content Assets`, `## Notes`, `## Highlight Mechanism Canvas`, and `## Selected Direction Handoff` per scorecard; meet direction-count and wildcard rules.

**Checkpoint**

```markdown
## Ideation complete
- [x] At least three directions + one wildcard preserved
- [x] `## Core Strategic Idea` present for primary (and co- as needed)
- [x] `## Content Assets` present for primary direction
- [x] `## Highlight Mechanism Canvas` present for viable directions, each including `Stage pillars`, `Local life map`, and `Calendar alignment` + cognitive map
- [x] `## Selected Direction Handoff` filled with primary direction + 0-2 co-directions per multi-selection rules
- [ ] Next: **BLOCKING** — user confirmation (Step 5 entry)
```

---

### Step 5: Execution

**GATE**: Ideation outputs exist, `## Highlight Mechanism Canvas` is complete for the chosen direction, **and** global later-stage fields (`deliverables_needed`, `constraints`, `success_metric`) are specific.

**BLOCKING**: Do not start this step until the user **explicitly confirms** the `## Selected Direction Handoff` (e.g., approves the primary direction and any co-directions, or states that the agent’s recommended direction set is accepted).

**Required reads**: `./phases/execution.md`, `./shared/brief-intake-template.md`, `./shared/highlight-mechanism-canvas.md`, `./shared/proposal-template.md`, `./shared/content-assets.md`

**Action**: Validate the selected highlight mechanism against constraints, then produce material for proposal execution sections and `## Validated Execution-Plan Handoff` with `Validation status: validated` or `blocked`.

**Checkpoint**

```markdown
## Execution complete
- [x] User confirmed selected direction before planning began
- [x] Selected direction's `## Highlight Mechanism Canvas` was used as the planning input (including pillars, local map, calendar, cognitive map)
- [x] `## Validated Execution-Plan Handoff` present with `Pillar roster by phase` and `Calendar anchors` aligned to the canvas
- [x] `## Validated Execution-Plan Handoff` present with validation status
- [ ] Next: Proposal (Step 6) when status is `validated`
```

---

### Step 6: Proposal (draft)

**GATE**: `## Selected Direction Handoff` present; `## Core Strategic Idea` + `## Content Assets` + `## Highlight Mechanism Canvas` for the selected direction; `## Validated Execution-Plan Handoff` has `Validation status: validated`.

**Required reads**: `./phases/proposal.md`, `./shared/highlight-mechanism-canvas.md`, `./shared/proposal-template.md`, `./shared/core-strategic-idea.md`, `./shared/brief-intake-template.md`

**Action**: Assemble the full markdown proposal per `proposal-template.md`; then run `## Review Pass` in the same pass.

Before drafting, resolve output mode from `proposal-template.md` routing rules:
- `general_proposal` for normal briefs.
- `auto_regional_launch` when the brief is clearly automotive + city or regional launch.

**Checkpoint**

```markdown
## Proposal draft complete
- [x] All template sections present and decision-useful, including **11. Phased Event Menu** (with cognitive column) and **12. Content Assets** per `./shared/proposal-template.md`
- [x] If `auto_regional_launch`: all nine dedicated sections present, including `Execution Action Playbook` with Program Blueprint Cards
- [x] `## Review Pass` emitted
- [ ] Next: If Review Pass = pass → Completion; if fail → Review loop (Step 7)
```

---

### Step 7: Review loop (conditional)

**Constants**: `MAX_REVIEW_LOOPS` = **3** (inclusive of the first Review Pass; count **fail → fix** cycles only once per re-draft).

**When** `## Review Pass` = `fail` and `review_loops_used < MAX_REVIEW_LOOPS`:

1. Set `## Review Gap` `route` to exactly one of: `research` | `ideation` | `execution` | `proposal_enrich` (per `./phases/proposal.md`).
2. **ideation** route that changes the primary **direction** re-triggers **Step 4 BLOCKING** (user re-confirms) before **Step 5** again.
3. Re-run the minimum upstream work, then rebuild proposal draft, emit a new `## Review Pass`.
4. Stop with `## Open Issues` if still failing at max loops; **do not** claim completion.

**Symptom → route**

| Symptom | Route |
| --- | --- |
| Weak or missing evidence, competitor/city facts | `research` |
| Core idea, canvas, or mechanism incoherent | `ideation` |
| Plan vs calendar, pillars, or assets misaligned | `execution` |
| Wording, rubric mapping, section completeness only | `proposal_enrich` |

**Checkpoint (loop end)**

```markdown
## Review loop complete
- [x] `## Review Pass` = pass, OR `review_loops_used` reached with `## Open Issues`
- [ ] Next: Completion gate or user input for open issues
```

## Symptom → upstream return

| Symptom | Return to |
| --- | --- |
| Missing or placeholder research-start fields | Intake — ask only for missing fields |
| Weak, missing, or untrusted evidence | Research — name what to add or re-check; load `research-modules` |
| Generic competitor praise only | Research — require `## Competitor Actionable View` |
| Generic, cliché, or unsupported ideas | Ideation (or refine signals / research first) |
| Strategy vs. execution mismatch | Execution or Ideation — name the mismatch |
| Thin or filler proposal sections | Earliest stage that should supply the substance |
| Review Pass fail (rubric / mapping) | proposal_enrich or upstream per Step 7 |

## Completion gate

Do not declare the work complete until all of the following are true:

- Intake status is `ready`.
- Research verdict is `pass`.
- At least one idea remains viable after scoring.
- `## Core Strategic Idea` and `## Content Assets` exist for the primary path.
- A single selected direction is handed off explicitly for execution planning **and** user-confirmed before execution.
- The execution-plan handoff is validated.
- Every proposal section is present and decision-useful per `proposal-template.md`, including the Phased Event Menu with the **Cognitive focus** column and Content Assets.
- `## Review Pass` = **pass**, **or** max review loops reached with documented `## Open Issues`.
- Final state has no false claim of “complete” while Review Pass is still `fail` without the Open Issues exit.

Optional deep-parallel: if the host supports multiple agents, `competitor-actionable` rows or research questions may be searched in parallel; the merged pack must still be one research output. See [docs/references/deep-research-module-notes.md](../../docs/references/deep-research-module-notes.md) for optional host notes (paths relative to repository root; resolve from the repo when reading).
