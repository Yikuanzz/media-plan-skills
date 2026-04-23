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
> 1. **SERIAL PHASES** — Default order: pre-brief search → intake → research → ideation → execution → proposal. Each phase consumes the prior phase’s gated outputs; do not skip gates.
> 2. **BLOCKING = HARD STOP** — Steps marked **BLOCKING** require an explicit user response before continuing. Do not choose on behalf of the user when multiple directions are still legitimately open. Steps without that mark may proceed in one pass once prerequisites are met.
> 3. **NO CROSS-PHASE BUNDLING** — Do not draft a full proposal while research is not `pass`. Do not perform deep research while intake is not `ready`. Do not invent brief fields from search alone.
> 4. **NO SPECULATIVE BACKFILL** — Pre-brief search narrows questions only; it never satisfies required intake fields by inference.
> 5. **RUNTIME SCOPE** — Use only `./phases/*.md` and `./shared/*.md` as workflow and contracts. Do not treat repository `docs/` as a runtime dependency.
> 6. **NO UNSTATED CLIENT PRIORS** — Workshop-only preferences, off-record promises, or “TARGET-style” plans that are not in the normalized intake and evidence chain must not be invented. Capture them in intake (`brief-intake-template.md` optional fields) or `Open Questions` when the user can supply them.

## Package rules

- Treat `./phases/*.md` as runtime workflow modules.
- Treat `./shared/*.md` as the only runtime contracts and templates.
- If a phase file and a shared contract disagree, follow the shared contract for **shape** and the phase file for **workflow**.

> [!IMPORTANT]
> ## Language and compatibility
>
> - **Response language**: Match the user’s language and the language of supplied materials unless the user explicitly requests another language.
> - **Skill precedence**: If another generic agent skill conflicts with this package’s serial gates or blocking rules, follow **this** skill unless the user clearly opts out.

## Phase index

| Phase file | Stage | Purpose |
| --- | --- | --- |
| `./phases/pre-brief-search.md` | Pre-brief search | Lightweight public signals before formal intake |
| `./phases/intake.md` | Intake | Normalize brief; block until research-start fields exist |
| `./phases/research.md` | Research | Source-backed pack; verify or reject inspiration hints |
| `./phases/ideation.md` | Ideation | Scored directions + explicit selected-direction handoff |
| `./phases/execution.md` | Execution | Validated execution-plan handoff under constraints |
| `./phases/proposal.md` | Proposal | Assemble and review final markdown proposal |

## Shared contract index

| Shared file | Role |
| --- | --- |
| `./shared/pre-brief-source-map.md` | Source priority for pre-brief search |
| `./shared/brief-intake-template.md` | Intake fields, output shape, later-stage gates |
| `./shared/research-rubric.md` | Research quality bar |
| `./shared/source-trust-policy.md` | Trust tiers for evidence |
| `./shared/query-playbook.md` | Query patterns for research |
| `./shared/inspiration-directions.md` | Inspiration library |
| `./shared/idea-scorecard.md` | Scoring table + `## Selected Direction Handoff` shape |
| `./shared/highlight-mechanism-canvas.md` | Canonical highlight mechanism handoff shape |
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

These apply across steps; each step repeats only what is entry-specific.

- Do not start **research** until `business_goal`, `target_audience`, `timeline`, `budget_or_resource_level`, `geography_or_region`, and `channel_constraints` are present and not placeholder-only.
- Do not start **execution** or **proposal** until `deliverables_needed`, `constraints`, and `success_metric` are present and specific.
- Do not pass **research** without at least two evidence classes and at least one concrete source per important claim.
- Do not pass **ideation** unless at least three distinct directions were considered and at least one wildcard direction was preserved.
- Do not start **execution** until the chosen direction includes a complete `## Highlight Mechanism Canvas` with `Stage pillars`, `Local life map`, and `Calendar alignment` populated per `./shared/highlight-mechanism-canvas.md`.
- Do not enter **proposal** without `## Selected Direction Handoff`, `## Highlight Mechanism Canvas`, and `## Validated Execution-Plan Handoff` with `Validation status: validated`.
- Do not declare **completion** until the final proposal is complete, decision-useful, and traceable from brief → research → ideas → recommendation.

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

**Action**: Normalize into `## Intake Summary` and related sections; set `## Intake Status` to `ready` or `blocked`. If pre-search ran, include `## Pre-Brief Search Context` and `## Inspiration Hints` before `## Intake Summary`.

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

**Required reads**: `./phases/research.md`, `./shared/research-rubric.md`, `./shared/source-trust-policy.md`, `./shared/query-playbook.md`

**Action**: Build a research pack that tests `## Inspiration Hints`; meet evidence rules; add `## Inspiration Signal Check` when required by the phase.

**Checkpoint**

```markdown
## Research complete
- [x] Verdict is explicit (`pass` or fail state per rubric)
- [x] Evidence classes and sourcing meet global gates
- [ ] Next: Ideation (Step 4)
```

---

### Step 4: Ideation

**GATE**: Research verdict is `pass`.

**Required reads**: `./phases/ideation.md`, `./shared/inspiration-directions.md`, `./shared/idea-scorecard.md`, `./shared/highlight-mechanism-canvas.md`

**Action**: Produce `## Idea Evaluation`, `## Notes`, `## Highlight Mechanism Canvas`, and `## Selected Direction Handoff` per scorecard; meet direction-count and wildcard rules.

**Checkpoint**

```markdown
## Ideation complete
- [x] At least three directions + one wildcard preserved
- [x] `## Highlight Mechanism Canvas` present for viable directions, each including `Stage pillars`, `Local life map`, and `Calendar alignment`
- [x] `## Selected Direction Handoff` filled with primary direction + 0-2 co-directions per multi-selection rules
- [ ] Next: **BLOCKING** — user confirmation (Step 5 entry)
```

---

### Step 5: Execution

**GATE**: Ideation outputs exist, `## Highlight Mechanism Canvas` is complete for the chosen direction, **and** global later-stage fields (`deliverables_needed`, `constraints`, `success_metric`) are specific.

**BLOCKING**: Do not start this step until the user **explicitly confirms** the `## Selected Direction Handoff` (e.g., approves the primary direction and any co-directions, or states that the agent’s recommended direction set is accepted).

**Required reads**: `./phases/execution.md`, `./shared/brief-intake-template.md`, `./shared/highlight-mechanism-canvas.md`, `./shared/proposal-template.md`

**Action**: Validate the selected highlight mechanism against constraints, then produce material for proposal execution sections and `## Validated Execution-Plan Handoff` with `Validation status: validated` or `blocked`.

**Checkpoint**

```markdown
## Execution complete
- [x] User confirmed selected direction before planning began
- [x] Selected direction's `## Highlight Mechanism Canvas` was used as the planning input (including pillars, local map, calendar)
- [x] `## Validated Execution-Plan Handoff` present with `Pillar roster by phase` and `Calendar anchors` aligned to the canvas
- [x] `## Validated Execution-Plan Handoff` present with validation status
- [ ] Next: Proposal (Step 6) when status is `validated`
```

---

### Step 6: Proposal

**GATE**: `## Selected Direction Handoff` present; `## Highlight Mechanism Canvas` present for the selected direction; `## Validated Execution-Plan Handoff` has `Validation status: validated`.

**Required reads**: `./phases/proposal.md`, `./shared/highlight-mechanism-canvas.md`, `./shared/proposal-template.md`

**Action**: Assemble the full markdown proposal; run template-aligned review; route upstream if any gate fails.

**Checkpoint**

```markdown
## Proposal pass
- [x] All template sections present and decision-useful, including `## 9. Phased Event Menu` per `./shared/proposal-template.md`
- [x] Event Menu row names align with `Pillar roster by phase` in `## Validated Execution-Plan Handoff` (note any intentional omissions)
- [x] Traceability brief → research → idea → execution is visible
- [x] No unresolved evidence, creativity, or execution gaps
- [ ] Next: Completion Gate
```

## Symptom → upstream return

| Symptom | Return to |
| --- | --- |
| Missing or placeholder research-start fields | Intake — ask only for missing fields |
| Weak, missing, or untrusted evidence | Research — name what to add or re-check |
| Generic, cliché, or unsupported ideas | Ideation (or refine signals / research first) |
| Strategy vs. execution mismatch | Execution or Ideation — name the mismatch |
| Thin or filler proposal sections | Earliest stage that should supply the substance |

## Completion gate

Do not declare the work complete until all of the following are true:

- Intake status is `ready`.
- Research verdict is `pass`.
- At least one idea remains viable after scoring.
- A single selected direction is handed off explicitly for execution planning **and** user-confirmed before execution.
- The execution-plan handoff is validated.
- Every proposal section is present and decision-useful, including the Phased Event Menu section.
- Final review finds no unresolved evidence, creativity, or execution gaps.
