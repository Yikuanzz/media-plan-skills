# Regional Auto Launch Plan Skill Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create `skills/regional-auto-launch-plan/` as an independent skill package for China-market automotive regional launch campaigns (20–30万 budget tier), extracting auto-specific logic from `skills/media-plan/`.

**Architecture:** New skill package with 8 phases (pre-brief through proposal), 16 shared contracts in `./shared/` (including 5 insight-modules), and strict quality gates. Media-plan is cleaned of auto-specific routing. Files follow the established media-plan pattern: frontmatter + sections + code blocks for output shapes.

**Tech Stack:** Markdown skill files (no code runtime). "Tests" are grep validations for required sections/fields. "Implementation" is file creation/editing.

---

## File Structure

```
skills/regional-auto-launch-plan/
├── SKILL.md                                    # Main entry: phases, gates, workflow, roles
├── phases/
│   ├── pre-brief-search.md                     # Lightweight public signals
│   ├── intake.md                               # Normalize brief; gate to research
│   ├── insight.md                              # 5 insight-modules orchestration
│   ├── strategy.md                             # Core theme + slogan derivation
│   ├── action.md                               # 3-phase activity playbook (sub-agent dispatch)
│   ├── operations.md                           # 5 Blocks ops assurance
│   ├── service-team.md                         # Bid-only 4+1 role cards
│   └── proposal.md                             # Assembly + Review Pass
└── shared/
    ├── pre-brief-source-map.md                 # Source priority (region-enhanced)
    ├── brief-intake-template.md                # Intake fields, output shape, gates
    ├── source-trust-policy.md                  # Trust tiers for evidence
    ├── query-playbook.md                       # Query patterns + auto KOL/region routing
    ├── insight-modules/
    │   ├── product-value.md                    # 3.md §2.1 — product info + highlights
    │   ├── market-environment.md               # 3.md §2.2 — market data + regional split
    │   ├── competitor-deep.md                  # 3.md §2.3+2.4 — 5-dim + recent campaigns
    │   ├── customer-segmentation.md            # 3.md §2.5+2.6 — persona + regional depth
    │   └── city-signal.md                      # 3.md §2.6 — consumption/media/spatial/culture
    ├── core-theme-derivation.md                # Replaces core-strategic-idea
    ├── highlight-mechanism-canvas.md           # Core theme + stage pillars + local map
    ├── action-playbook-template.md             # 13-field Activity Card + sub-agent prompt
    ├── budget-allocation-rule.md               # 3-phase cost bands + hard constraints
    ├── operations-assurance-template.md        # 5 Blocks ops structure
    ├── service-team-template.md                # Bid-only role cards
    ├── rubric-coverage-template.md             # Coverage map + rubric §15 mapping
    ├── quality-self-check.md                   # 4 standards + rubric 5th dimension
    ├── idea-scorecard.md                       # 4-dimension sub-agent review scoring
    ├── content-assets.md                       # 5-platform differentiated content lines
    └── proposal-template.md                    # Compact/Expanded 7-chapter structure
```

**Files to modify (2):**
- `skills/media-plan/SKILL.md` — Add routing notice; remove auto_regional_launch gates/symptoms
- `skills/media-plan/shared/proposal-template.md` — Remove auto_regional_launch template section

---

## Task 1: Scaffold Directory Structure

**Files:**
- Create: `skills/regional-auto-launch-plan/` (directory)
- Create: `skills/regional-auto-launch-plan/phases/` (directory)
- Create: `skills/regional-auto-launch-plan/shared/` (directory)
- Create: `skills/regional-auto-launch-plan/shared/insight-modules/` (directory)

- [ ] **Step 1: Verify directories do not exist**

Run: `ls skills/regional-auto-launch-plan/ 2>/dev/null || echo "DIR_MISSING"`
Expected: `DIR_MISSING`

- [ ] **Step 2: Create directories**

Run:
```bash
mkdir -p skills/regional-auto-launch-plan/phases
mkdir -p skills/regional-auto-launch-plan/shared/insight-modules
```

- [ ] **Step 3: Verify directories exist**

Run: `ls -la skills/regional-auto-launch-plan/shared/insight-modules/`
Expected: Shows empty directory listing

- [ ] **Step 4: Commit**

```bash
git add skills/regional-auto-launch-plan/
git commit -m "feat(regional-auto-launch-plan): scaffold directory structure

Create skill package skeleton with phases/, shared/, and insight-modules/ subdirectories.

Co-Authored-By: Claude <noreply@anthropic.com>"
```

---

## Task 2: Main SKILL.md Entry Point

**Files:**
- Create: `skills/regional-auto-launch-plan/SKILL.md`

**Dependencies:** Task 1 complete.

This is the runtime entry point. It must define all 8 phases, 4 BLOCKING points, global gates, workflow steps 1–8, completion gate, and symptom→route map. Content is drawn from spec §3, §5, §10, §11.

- [ ] **Step 1: Verify SKILL.md does not exist**

Run: `test -f skills/regional-auto-launch-plan/SKILL.md && echo "EXISTS" || echo "MISSING"`
Expected: `MISSING`

- [ ] **Step 2: Write SKILL.md**

```bash
cat > skills/regional-auto-launch-plan/SKILL.md << 'SKILL_EOF'
---
name: regional-auto-launch-plan
description: >
  Use when the user requests a China-market automotive regional launch campaign plan
  (汽车区域上市传播方案), typically for a city or regional market with 20–30万 budget.
  Triggers: 汽车区域上市, 区域传播方案, 区域上市计划, 汽车上市传播, 区域营销方案,
  auto launch, regional car launch, city-level auto campaign.
---

# Regional Auto Launch Plan Master

## Purpose

Run the full China-market automotive regional launch workflow from pre-brief search through proposal review. Output is a single PPT-ready planning document (markdown) aligned to the six-module structure: 任务课题 / 市场洞察 / 策略规划 / 营销动作 / 运营保障 / 服务团队.

> [!CAUTION]
> ## Global execution discipline (mandatory)
>
> 1. **SERIAL PHASES** — Default order: pre-brief search → intake → insight → strategy → action → operations → service team (bid-only) → proposal → review loop. Each phase consumes the prior phase's gated outputs; do not skip gates.
> 2. **BLOCKING = HARD STOP** — Steps marked **BLOCKING** require an explicit user response before continuing. Do not choose on behalf of the user when multiple directions are still legitimately open.
> 3. **NO CROSS-PHASE BUNDLING** — Do not draft proposal content while insight is not `pass`. Do not perform deep insight while intake is not `ready`.
> 4. **NO SPECULATIVE BACKFILL** — Pre-brief search narrows questions only; it never satisfies required intake fields by inference.
> 5. **RUNTIME SCOPE** — Use only `./phases/*.md` and `./shared/*.md` as workflow and contracts. Do not treat repository `docs/` as a runtime dependency.
> 6. **NO UNSTATED CLIENT PRIORS** — Workshop-only preferences, off-record promises, or unstated plans must not be invented. Capture them in intake optional fields or `Open Questions`.
> 7. **BUDGET REALITY** — Default budget tier is 20–30万 (online + offline + venue). Flag as "regional flagship" if user confirms above this band.
> 8. **DESIGN PRINCIPLES (hard constraints)** — Every activity must satisfy: 低成本 / 快见效 / 好落地 / 真实吸引.
> 9. **CORE THEME (not IP)** — Derive `Core Theme` from market + product + audience insight. Do not invent a standalone "exclusive IP."

## Package rules

- Treat `./phases/*.md` as runtime workflow modules.
- Treat `./shared/*.md` as the only runtime contracts and templates.
- If a phase file and a shared contract disagree, follow the shared contract for **shape** and the phase file for **workflow**.

> [!IMPORTANT]
> ## Language and compatibility
>
> - **Response language**: Chinese (Simplified) for all proposal outputs; technical fields may use English.
> - **Skill precedence**: If another generic agent skill conflicts with this package's serial gates or blocking rules, follow **this** skill unless the user clearly opts out.

## Runtime roles (single skill, four handoff lanes)

| Role | Phases | Must read (minimum) | Must emit (downstream) |
| --- | --- | --- | --- |
| **Insight** | pre-brief, insight | `pre-brief-source-map`, `query-playbook`, `source-trust-policy`, `idea-scorecard`, insight `modules` as needed | `## Insight Verdict` pack + `## Competitor Actionable View` + `## Hotspot × Regional Resource Match` + `## City Evidence Pack` |
| **Strategy** | strategy | `core-theme-derivation`, `highlight-mechanism-canvas`, `content-assets` | `## Core Theme Derivation` + `## Stage Sub-Themes` + `## Selected Theme Handoff` |
| **Creative** | action (tail) | `action-playbook-template`, `content-assets`, `highlight-mechanism-canvas` | `## Action Playbook` (primary direction) |
| **Planning** | operations, service-team, proposal | `brief-intake-template`, `highlight-mechanism-canvas`, `proposal-template`, `budget-allocation-rule`, `operations-assurance-template` | `## Validated Execution-Plan Handoff` + full proposal + `## Review Pass` |

## Phase index

| Phase file | Stage | Purpose |
| --- | --- | --- |
| `./phases/pre-brief-search.md` | Pre-brief search | Lightweight public signals before formal intake |
| `./phases/intake.md` | Intake | Normalize brief; block until insight-start fields exist |
| `./phases/insight.md` | Insight | Source-backed pack; 5 insight-modules mandatory |
| `./phases/strategy.md` | Strategy | Core Theme derivation + slogan chain + stage sub-themes |
| `./phases/action.md` | Action | 3-phase activity playbook with sub-agent dispatch |
| `./phases/operations.md` | Operations | 5 Blocks ops assurance |
| `./phases/service-team.md` | Service Team | Bid-only 4+1 role cards |
| `./phases/proposal.md` | Proposal | Assemble, template review, **Review Pass** |

## Shared contract index

| Shared file | Role |
| --- | --- |
| `./shared/pre-brief-source-map.md` | Source priority for pre-brief search |
| `./shared/brief-intake-template.md` | Intake fields, output shape, later-stage gates, optional bid/rubric |
| `./shared/source-trust-policy.md` | Trust tiers for evidence |
| `./shared/query-playbook.md` | Query patterns + insight-module routing |
| `./shared/insight-modules/product-value.md` | Module: product info + value highlights |
| `./shared/insight-modules/market-environment.md` | Module: market data + regional split |
| `./shared/insight-modules/competitor-deep.md` | Module: 5-dimension competitor + recent campaigns |
| `./shared/insight-modules/customer-segmentation.md` | Module: persona + regional depth |
| `./shared/insight-modules/city-signal.md` | Module: consumption/media/spatial/culture |
| `./shared/core-theme-derivation.md` | Core Theme + slogan derivation logic |
| `./shared/highlight-mechanism-canvas.md` | Stage pillars + local life map + calendar alignment |
| `./shared/content-assets.md` | 5-platform differentiated content lines |
| `./shared/action-playbook-template.md` | 13-field Activity Card + sub-agent dispatch prompt |
| `./shared/budget-allocation-rule.md` | 3-phase cost bands + hard constraints |
| `./shared/operations-assurance-template.md` | 5 Blocks ops structure |
| `./shared/service-team-template.md` | Bid-only role cards |
| `./shared/idea-scorecard.md` | 4-dimension sub-agent review scoring |
| `./shared/rubric-coverage-template.md` | Coverage map + rubric §15 mapping |
| `./shared/quality-self-check.md` | 4 standards + rubric 5th dimension |
| `./shared/proposal-template.md` | Compact/Expanded 7-chapter structure |

## Phase switch protocol

Before entering a phase, read its phase file and every shared file listed for that step below. Emit:

```markdown
## [Phase: <StageName>]
📖 Read: <phase path> + <shared paths>
📋 Task: <one-line intent for this phase>
```

Skipping required reads is not allowed.

## Global gates (summary)

- Do not start **insight** until `business_goal`, `target_audience`, `timeline`, `budget_or_resource_level`, `geography_or_region`, and `channel_constraints` are present and not placeholder-only.
- Do not start **action** or **proposal** until `deliverables_needed`, `constraints`, and `success_metric` are present and specific.
- Do not pass **insight** without all 5 insight-modules output, at least two evidence classes per module, `## Competitor Actionable View` when competitive context exists, `## City Evidence Pack` with consumption trends / media habits / spatial distribution / cultural anchors, and explicit source attribution for all market data claims.
  - Competitor analysis must cover 5 dimensions per core/key competitor (定位 / 营销打法 / 渠道策略 / 信任路径 / 应对策略) with 2–3 recent campaigns each; generic praise → do not pass.
- Do not pass **strategy** unless `Core Theme` has traceable source explanation, `Slogan derivation chain` has 3 dimensions (brand + audience + product), stage sub-themes are distinct and consistent with Core Theme, and `## Marketing MAP` is complete.
- Do not start **action** until the user **explicitly confirms** `## Selected Theme Handoff` (BLOCKING-A) and the chosen theme includes a complete `## Highlight Mechanism Canvas` with `Stage pillars`, `Local life map`, and `Calendar alignment`.
  - Action planning is blocked unless `## Content Assets` includes platform-specific content lines (抖音/小红书/懂车帝/视频号/微博) and Activity Cards include platform content angles and hashtag examples.
- Do not enter **proposal** without `## Selected Theme Handoff`, `## Core Theme Derivation`, `## Content Assets`, `## Highlight Mechanism Canvas`, and `## Validated Execution-Plan Handoff` with `Validation status: validated`.
  - Do not enter proposal unless every chapter has a Compact View and chapters 2–4 have Expanded Views.
  - Do not pass proposal review without platform differentiation table in Chapter 4 and derivation logic traceability in Chapter 3.
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
- [ ] Next: If `ready`, Insight (Step 3); if `blocked`, ask only for missing insight-start fields
```

---

### Step 3: Insight

**GATE**: `## Intake Status` is `ready`.

**Required reads**: `./phases/insight.md`, `./shared/source-trust-policy.md`, `./shared/query-playbook.md`, plus all `./shared/insight-modules/*.md` as routed.

**Action**: Build a research pack through all 5 insight-modules. Include `## Competitor Actionable View`, `## Hotspot × Regional Resource Match`, and `## City Evidence Pack`.

**Checkpoint**

```markdown
## Insight complete
- [x] Verdict is explicit (`pass` or fail state per rubric)
- [x] All 5 insight-modules present with evidence classes and sourcing
- [x] `## City Evidence Pack` has consumption trends, media habits, spatial distribution, cultural anchors
- [ ] Next: Strategy (Step 4)
```

---

### Step 4: Strategy

**GATE**: Insight verdict is `pass`.

**Required reads**: `./phases/strategy.md`, `./shared/core-theme-derivation.md`, `./shared/highlight-mechanism-canvas.md`, `./shared/content-assets.md`

**Action**: Produce `## Core Theme Derivation`, `## Stage Sub-Themes`, `## Highlight Mechanism Canvas`, and `## Selected Theme Handoff`.

**Checkpoint**

```markdown
## Strategy complete
- [x] `Core Theme` has traceable source explanation
- [x] `Slogan derivation chain` has 3 dimensions (brand + audience + product)
- [x] Stage sub-themes are distinct and consistent with Core Theme
- [x] `## Highlight Mechanism Canvas` has Stage pillars, Local life map, Calendar alignment
- [x] `## Selected Theme Handoff` filled with primary direction
- [ ] Next: **BLOCKING-A** — user confirmation (Step 5 entry)
```

---

### Step 5: Action

**GATE**: Strategy outputs exist, `## Highlight Mechanism Canvas` is complete for the chosen theme, **and** global later-stage fields (`deliverables_needed`, `constraints`, `success_metric`) are specific.

**BLOCKING-A**: Do not start this step until the user **explicitly confirms** the `## Selected Theme Handoff` (e.g., approves Core Theme + Slogan + stage sub-themes).

**BLOCKING-B/C/D**: After each phase's pillar cards are complete (Phase 1 / Phase 2 / Phase 3), user must confirm before proceeding to the next phase's sub-agent dispatch.

**Required reads**: `./phases/action.md`, `./shared/brief-intake-template.md`, `./shared/highlight-mechanism-canvas.md`, `./shared/proposal-template.md`, `./shared/content-assets.md`, `./shared/action-playbook-template.md`, `./shared/budget-allocation-rule.md`, `./shared/idea-scorecard.md`

**Action**: Dispatch sub-agents per pillar (N=2–3), review with 4-dimension scorecard, select primary + alternative cards, validate against budget bands, produce `## Validated Execution-Plan Handoff`.

**Checkpoint**

```markdown
## Action complete
- [x] User confirmed selected theme before planning began (BLOCKING-A)
- [x] User confirmed Phase 1 pillar cards (BLOCKING-B)
- [x] User confirmed Phase 2 pillar cards (BLOCKING-C)
- [x] User confirmed Phase 3 pillar cards (BLOCKING-D)
- [x] Selected theme's `## Highlight Mechanism Canvas` used as planning input
- [x] `## Validated Execution-Plan Handoff` present with `Pillar roster by phase` and `Calendar anchors`
- [x] `## Validated Execution-Plan Handoff` present with validation status
- [ ] Next: Operations (Step 6) when status is `validated`
```

---

### Step 6: Operations

**GATE**: `## Validated Execution-Plan Handoff` has `Validation status: validated`.

**Required reads**: `./phases/operations.md`, `./shared/operations-assurance-template.md`, `./shared/brief-intake-template.md`

**Action**: Produce 5 Blocks: group matrix, content distribution flow, feedback loop, reporting matrix, checkpoint schedule.

**Checkpoint**

```markdown
## Operations complete
- [x] All 5 Blocks present
- [x] Checkpoint schedule aligns to Phase 4 three-stage rhythm
- [ ] Next: Service Team (Step 7, bid-only) or Proposal (Step 8)
```

---

### Step 7: Service Team (bid-only)

**GATE**: `bid_or_tender` is `true`.

**Required reads**: `./phases/service-team.md`, `./shared/service-team-template.md`

**Action**: Produce 4+1 role cards with background / responsibilities / commitment level.

**Checkpoint**

```markdown
## Service Team complete
- [x] 4+1 role cards present
- [x] Tender technical requirements reflected (if any)
- [ ] Next: Proposal (Step 8)
```

---

### Step 8: Proposal (draft)

**GATE**: `## Selected Theme Handoff` present; `## Core Theme Derivation` + `## Content Assets` + `## Highlight Mechanism Canvas` for selected theme; `## Validated Execution-Plan Handoff` has `Validation status: validated`.

**Required reads**: `./phases/proposal.md`, `./shared/highlight-mechanism-canvas.md`, `./shared/proposal-template.md`, `./shared/core-theme-derivation.md`, `./shared/brief-intake-template.md`, `./shared/quality-self-check.md`

**Action**: Assemble the full markdown proposal per `proposal-template.md`; then run `## Review Pass` in the same pass.

**Checkpoint**

```markdown
## Proposal draft complete
- [x] All template sections present and decision-useful
- [x] Every chapter has Compact View; chapters 2–4 have Expanded View
- [x] Chapter 4 has per-activity hashtag examples and platform differentiation table
- [x] `## Review Pass` emitted
- [ ] Next: If Review Pass = pass → Completion; if fail → Review loop (Step 9)
```

---

### Step 9: Review loop (conditional)

**Constants**: `MAX_REVIEW_LOOPS` = **3** (inclusive of the first Review Pass; count **fail → fix** cycles only once per re-draft).

**When** `## Review Pass` = `fail` and `review_loops_used < MAX_REVIEW_LOOPS`:

1. Set `## Review Gap` `route` to exactly one of: `research` | `ideation` | `execution` | `proposal_enrich` | `intake` (per `./phases/proposal.md`).
2. **ideation** route that changes the primary **theme** re-triggers **Step 4 BLOCKING-A** (user re-confirms) before **Step 5** again.
3. Re-run the minimum upstream work, then rebuild proposal draft, emit a new `## Review Pass`.
4. Stop with `## Open Issues` if still failing at max loops; **do not** claim completion.

**Symptom → route**

| Symptom | Route |
| --- | --- |
| Weak or missing evidence, competitor/city facts | `insight` (re-run as `research` in route naming) |
| Core theme, canvas, or mechanism incoherent | `ideation` (re-run as strategy re-derivation) |
| Plan vs calendar, pillars, or assets misaligned | `execution` |
| Wording, rubric mapping, section completeness only | `proposal_enrich` |
| Missing intake fields | `intake` |

**Checkpoint (loop end)**

```markdown
## Review loop complete
- [x] `## Review Pass` = pass, OR `review_loops_used` reached with `## Open Issues`
- [ ] Next: Completion gate or user input for open issues
```

## Symptom → upstream return

| Symptom | Return to |
| --- | --- |
| Missing or placeholder insight-start fields | Intake — ask only for missing fields |
| Weak, missing, or untrusted evidence | Insight — name what to add or re-check; load `insight-modules` |
| Generic competitor praise only | Insight — require `## Competitor Actionable View` |
| Generic, cliché, or unsupported ideas | Strategy — refine signals / insight first |
| Strategy vs. execution mismatch | Action or Strategy — name the mismatch |
| Thin or filler proposal sections | Earliest stage that should supply the substance |
| Review Pass fail (rubric / mapping) | proposal_enrich or upstream per Step 9 |
| Missing slogan derivation or stage sub-themes | `strategy` |
| Generic stage pillar names (no creative naming) | `strategy` |
| Missing serialized theme evolution or weak phase logic | `strategy` |
| Competitor analysis lacks 5 dimensions or recent campaigns | `insight` |
| City evidence lacks regional consumption/media/spatial data | `insight` |
| Missing platform differentiation or hashtag examples | `action` |
| Compact/Expanded view mismatch or missing | `proposal_enrich` |
| Phase cost over band / venue share >60% phase 2 | `action` |
| Activity Card missing fields 1–7 (required) | `action` |
| Activity KPI not quantifiable | `action` |
| Missing 老带新 / 三人成团 structure | `action` |
| Rubric entry not verbatim / missing item numbering | `intake` |
| Coverage Map has missing chapters | `proposal_enrich` |
| High-weight item not Expanded | `proposal_enrich` |
| Rubric "must-have data/case" missing source | `insight` |
| Rubric "must-have scale/qualification" missing | `intake` or `proposal_enrich` |

## Completion gate

Do not declare the work complete until all of the following are true:

- Intake status is `ready`.
- Insight verdict is `pass`.
- `Core Theme` has traceable source explanation.
- `Slogan derivation chain` has 3 dimensions and is not invented.
- Stage sub-themes are distinct and consistent with Core Theme.
- At least one viable theme direction remains after scoring.
- `## Core Theme Derivation` and `## Content Assets` exist for the primary path.
- A single selected theme is handed off explicitly for action planning **and** user-confirmed before action (BLOCKING-A).
- All BLOCKING points (B/C/D) for action phases are resolved.
- The execution-plan handoff is validated.
- Every proposal section is present and decision-useful per `proposal-template.md`, including Compact View for all chapters and Expanded View for chapters 2–4.
- `## Review Pass` = **pass**, **or** max review loops reached with documented `## Open Issues`.
- Final state has no false claim of "complete" while Review Pass is still `fail` without the Open Issues exit.
SKILL_EOF
```

- [ ] **Step 3: Verify key sections exist**

Run:
```bash
grep -c "BLOCKING-A" skills/regional-auto-launch-plan/SKILL.md && \
grep -c "低成本" skills/regional-auto-launch-plan/SKILL.md && \
grep -c "20–30万" skills/regional-auto-launch-plan/SKILL.md
```
Expected: Three lines, each showing count >= 1.

- [ ] **Step 4: Commit**

```bash
git add skills/regional-auto-launch-plan/SKILL.md
git commit -m "feat(regional-auto-launch-plan): add main SKILL.md entry point

Define 8 phases, 4 BLOCKING points, global gates, workflow steps 1-9,
symptom→route map, and completion gate. Budget tier 20-30万,
design principles (低成本/快见效/好落地/真实吸引), Core Theme (not IP).

Co-Authored-By: Claude <noreply@anthropic.com>"
```

---

## Task 3: Intake Shared Contracts (4 files)

**Files:**
- Create: `skills/regional-auto-launch-plan/shared/brief-intake-template.md`
- Create: `skills/regional-auto-launch-plan/shared/pre-brief-source-map.md`
- Create: `skills/regional-auto-launch-plan/shared/source-trust-policy.md`
- Create: `skills/regional-auto-launch-plan/shared/query-playbook.md`

**Dependencies:** Task 1 complete.

These four files form the intake and pre-brief foundation. `brief-intake-template` is derived from media-plan's version with auto-specific fields. `pre-brief-source-map` and `source-trust-policy` are copies with region-auto enhancements. `query-playbook` adds automotive KOL and regional market routing.

- [ ] **Step 1: Verify files do not exist**

Run:
```bash
for f in brief-intake-template.md pre-brief-source-map.md source-trust-policy.md query-playbook.md; do
  test -f "skills/regional-auto-launch-plan/shared/$f" && echo "EXISTS: $f" || echo "MISSING: $f"
done
```
Expected: Four `MISSING:` lines.

- [ ] **Step 2: Write brief-intake-template.md**

Content based on spec §5.2. Key additions over media-plan: `geography_or_region` is mandatory city-level; `budget_or_resource_level` defaults to 20–30万 prompt; `evaluation_rubric` is verbatim entry with item numbering; `tender_technical_requirements` for post-campaign / qualification clauses.

```bash
cat > skills/regional-auto-launch-plan/shared/brief-intake-template.md << 'EOF'
# Brief Intake Template

## Reproducibility note

Outputs from client workshops, oral commitments, or internal references are **not** available to the skill at runtime. Only what appears in the normalized intake, insight, and public evidence can be reflected in the proposal. When those inputs are missing, use `Open Questions` instead of backfilling.

## Required Fields To Start Insight

- `business_goal`
- `target_audience`
- `timeline`
- `budget_or_resource_level` — **Default prompt**: "区域小成本营销典型预算 20–30 万（含线上+线下+场地）。如超出，标记为「区域旗舰」需用户确认。"
- `geography_or_region` — **Mandatory city-level** (e.g., 武汉, 成都, 杭州)
- `channel_constraints`

## Optional Or Later-Stage Fields

- `project_background`
- `project_name`
- `primary_offer` — Vehicle model name and variant
- `channels_in_scope`
- `deliverables_needed`
- `constraints`
- `success_metric`
- `key_message`
- `campaign_line_or_master_proposition` — optional; client-fixed one-line campaign theme
- `must_include_activations` — optional; activity types the proposal must feature
- `references_and_taboos` — optional; reference cases to echo, topics or tones to avoid
- `bid_or_tender` — optional; `true` if bid / tender response
- `evaluation_rubric` — optional; **verbatim paste with item numbering** (e.g., "1. 创意性 20分...")
- `tender_technical_requirements` — optional; explicit tender clauses (e.g., "must include post-campaign review", "service team must have 5+ years auto experience")
- `client_master_calendar` — optional; national launch cadence or timing constraints

## Required Before Action Or Proposal

- `deliverables_needed`
- `constraints`
- `success_metric`

## Intake Output Format

```md
## Intake Summary
- Project background:
- Project:
- Goal:
- Audience:
- Geography / region: [city-level mandatory]
- Channel constraints:
- Offer: [vehicle model]
- Message:
- Campaign line / master proposition (if any):
- Must-include activations (if any):
- References and taboos (if any):
- Channels:
- Deliverables:
- Timeline:
- Budget / resources: [with default 20-30万 prompt response]
- Success metric:
- Bid / tender (yes/no):
- Evaluation rubric (if any, verbatim summary with item numbers):
- Tender technical requirements (if any):
- Client master calendar / marketing rhythm (if any):

## Constraints
-

## Missing Fields
-

## Open Questions
-

## Intake Status
- ready | blocked
```

## Rules

- Treat every field under `Required Fields To Start Insight` as mandatory before insight starts.
- `geography_or_region` must be at city level or finer. Province-only is insufficient.
- `budget_or_resource_level` default prompt is 20–30万. If user confirms above, flag as "regional flagship" and note in `## Constraints`.
- Allow optional fields to remain open during intake if not yet needed to start insight.
- Treat `deliverables_needed`, `constraints`, and `success_metric` as later-stage gates.
- Do not invent missing details.
- Do not treat `unknown`, `tbd`, or similar placeholders as satisfying a required field.
- Collapse verbose user input into concise, decision-useful language.
- Keep open questions specific and answerable.
- Mark intake as `blocked` if any insight-start field is missing or unknown.
- When `bid_or_tender` is false and `evaluation_rubric` is empty, do **not** require bid-only artifacts unless `tender_technical_requirements` demands them.
- When `bid_or_tender` is true and `evaluation_rubric` is non-empty, treat bid scoring dimensions as review checklist in addition to default proposal review.
- `evaluation_rubric` must be preserved **verbatim** with original item numbering; do not paraphrase or restructure.
EOF
```

- [ ] **Step 3: Write pre-brief-source-map.md**

```bash
cat > skills/regional-auto-launch-plan/shared/pre-brief-source-map.md << 'EOF'
# Pre-Brief Source Map

## Source priority (highest to lowest)

1. **Regional auto market data** — 乘联会 regional reports, 中国汽车流通协会 city-level data, dealer association releases
2. **Auto platform signals** — 懂车帝, 汽车之家 model pages, regional dealer listings, user review volume
3. **Competitor public campaigns** — Official Weibo/WeChat/Douyin accounts, press releases, event recaps
4. **City-level consumer trends** — Local commerce bureau statistics, regional media (e.g., 楚天都市报 for 武汉), lifestyle platform geotags
5. **Social hotspot discovery** — Xiaohongshu geotagged posts, Douyin local trending, regional KOL activity
6. **General web** — News, forums, industry blogs (lowest priority for claims)

## Region-specific query templates

When `geography_or_region` is known, append these to pre-brief queries:

- "{region} 汽车销量 {year}"
- "{region} {brand} 经销商"
- "{region} 车展 / 汽车活动 {year}"
- "{region} 新能源车 渗透率"
- "{region} 消费力 / 汽车消费趋势"
EOF
```

- [ ] **Step 4: Write source-trust-policy.md**

```bash
cat > skills/regional-auto-launch-plan/shared/source-trust-policy.md << 'EOF'
# Source Trust Policy

## Tier 1 (Highest trust)

- Government statistics bureaus and official industry associations (乘联会, 中国汽车流通协会)
- Official brand / OEM press releases and annual reports
- Established auto platforms with editorial oversight (懂车帝研究院, 汽车之家研究院)

## Tier 2 (High trust)

- Major media with auto desks (第一财经, 36氪 auto vertical, 界面新闻)
- Top-tier consulting with public auto practice (McKinsey, Deloitte public reports)
- Verified dealer association or chamber of commerce data

## Tier 3 (Moderate trust — signal only)

- Platform user reviews and sentiment aggregates (懂车帝车主口碑, 汽车之家论坛)
- Social platform trending data (Douyin trending, Xiaohongshu topic volume)
- Regional media with known auto coverage

## Tier 4 (Low trust — annotate as indicative)

- Anonymous forum posts, unverified social claims
- Self-published blogs without editorial process
- Aggregator sites without source attribution

## Rules

- Tier 1 claims can be stated without hedging.
- Tier 2 claims should note the source explicitly.
- Tier 3 claims should be framed as "signal" or "indicative" and cross-checked with Tier 1/2 when stakes are high.
- Tier 4 claims must be marked `TBC` or `unverified` and added to `## Gaps`.
- Unsourced market data (sales, share, growth) is not allowed in insight outputs.
EOF
```

- [ ] **Step 5: Write query-playbook.md**

```bash
cat > skills/regional-auto-launch-plan/shared/query-playbook.md << 'EOF'
# Query Playbook

## Module routing

| User signal | Primary module | Secondary module |
| --- | --- | --- |
| New model / variant launch | `product-value` | `competitor-deep` |
| Competitive intensity high | `competitor-deep` | `market-environment` |
| Unknown regional market | `city-signal` | `market-environment` |
| Audience unclear / shifting | `customer-segmentation` | `city-signal` |
| Seasonal or event window | `city-signal` | `market-environment` |

## Auto-specific query patterns

### Product queries
- "{model} 参数 对比 {competitor}"
- "{model} 核心技术 亮点"
- "{brand} {model} 卖点"

### Market queries
- "{region} {segment} 销量 {year}"
- "{region} 新能源车 渗透率 {year}"
- "{segment} 全国 销量 趋势 3年"
- "{region} 汽车 经销商 数量"

### Competitor queries
- "{competitor_model} 营销 活动 {year}"
- "{competitor_brand} {region} 推广"
- "{competitor_model} 口碑 问题"
- "{competitor_model} 渠道 策略"

### City signal queries
- "{region} 消费者 汽车 偏好"
- "{region} 媒体 习惯 汽车"
- "{region} 商圈 / 社区 分布"
- "{region} 文化 特色 活动"
- "{region} KOL 汽车 垂类"

### KOL / influencer queries
- "{region} 汽车 KOL 抖音"
- "{region} 小红书 汽车 博主"
- "{region} 懂车帝 车友会"
EOF
```

- [ ] **Step 6: Verify all four files have required markers**

Run:
```bash
grep -l "Intake Status" skills/regional-auto-launch-plan/shared/brief-intake-template.md && \
grep -l "Regional auto market data" skills/regional-auto-launch-plan/shared/pre-brief-source-map.md && \
grep -l "Tier 1" skills/regional-auto-launch-plan/shared/source-trust-policy.md && \
grep -l "Module routing" skills/regional-auto-launch-plan/shared/query-playbook.md
```
Expected: Four file paths printed (one per line).

- [ ] **Step 7: Commit**

```bash
git add skills/regional-auto-launch-plan/shared/*.md
git commit -m "feat(regional-auto-launch-plan): add intake shared contracts

Add brief-intake-template (auto-specific fields), pre-brief-source-map
(region-enhanced), source-trust-policy, and query-playbook (auto KOL routing).

Co-Authored-By: Claude <noreply@anthropic.com>"
```

---

## Task 4: Insight Modules Batch 1 (product-value + market-environment)

**Files:**
- Create: `skills/regional-auto-launch-plan/shared/insight-modules/product-value.md`
- Create: `skills/regional-auto-launch-plan/shared/insight-modules/market-environment.md`

**Dependencies:** Task 1 complete.

These are the first two insight-modules, aligned to 3.md §2.1 and §2.2.

- [ ] **Step 1: Verify files do not exist**

Run:
```bash
for f in product-value.md market-environment.md; do
  test -f "skills/regional-auto-launch-plan/shared/insight-modules/$f" && echo "EXISTS" || echo "MISSING"
done
```
Expected: Two `MISSING` lines.

- [ ] **Step 2: Write product-value.md**

```bash
cat > skills/regional-auto-launch-plan/shared/insight-modules/product-value.md << 'EOF'
# Insight Module: Product Value

## Goal

Produce a structured product info table with 传播感 highlights, not a parameter dump.

## Required output

```md
## Product Value Pack

### Core Parameters Table
| Parameter | Value | vs Segment Average | Note |
| --- | --- | --- | --- |
| 尺寸 (mm) | ... | ... | ... |
| 动力 | ... | ... | ... |
| 续航 (km) | ... | ... | ... |
| 智能配置 | ... | ... | ... |
| 安全等级 | ... | ... | ... |

### Technology Highlights
1. [Highlight 1]: [why it matters, with传播感 language]
2. [Highlight 2]: [why it matters]
3. [Highlight 3]: [why it matters]

### Brand Backing
- [Parent company / partnership / tech source]
- [What this backing means for trust and positioning]

### Value Proposition Seeds
- Functional: [what the car does better]
- Emotional: [how it makes the owner feel]
- Identity: [what owning it says about the owner]
```

## Rules

- Prioritize differentiated points vs competitors.
- Language must have传播感 (传播可读性), not engineering specs.
- Include at least one "vs segment average" comparison where data exists.
EOF
```

- [ ] **Step 3: Write market-environment.md**

```bash
cat > skills/regional-auto-launch-plan/shared/insight-modules/market-environment.md << 'EOF'
# Insight Module: Market Environment

## Goal

Produce regional market data with explicit sources, power-type splits, and structural opportunity points.

## Required output

```md
## Market Environment Pack

### National Category Trend (last 3 years)
- Total segment sales: [volume] ([YoY%]) — Source: [explicit source]
- vs overall passenger vehicle growth: [comparison]
- Power type split:
  | Type | Share | Growth | Trend |
  | --- | --- | --- | --- |
  | 燃油 | ... | ... | ... |
  | 混动 | ... | ... | ... |
  | 纯电 | ... | ... | ... |

### Per Power Type Profile
- Core audience: [who buys this type]
- Main price range: [...]
- Future trend: [...]

### Regional Level ({region})
- Local segment share vs national average: [...] — Source: [...]
- Reason for variance: [...]
- Channel trends: [直营/授权/联营]
- Structural opportunity: [what makes this region special]

### Seasonal / Policy Window
- Current policy: [subsidy, restriction, incentive]
- Seasonal factor: [e.g., 车展 season, year-end push]
```

## Rules

- All market data claims must cite explicit sources (乘联会, 懂车帝, 汽车之家, etc.).
- Unsourced data must be marked `TBC` and added to `## Gaps`.
- Regional vs national variance must have a reasoned explanation.
EOF
```

- [ ] **Step 4: Verify files have required sections**

Run:
```bash
grep -l "Product Value Pack" skills/regional-auto-launch-plan/shared/insight-modules/product-value.md && \
grep -l "Market Environment Pack" skills/regional-auto-launch-plan/shared/insight-modules/market-environment.md
```
Expected: Two file paths printed.

- [ ] **Step 5: Commit**

```bash
git add skills/regional-auto-launch-plan/shared/insight-modules/*.md
git commit -m "feat(regional-auto-launch-plan): add insight modules product-value and market-environment

Product-value: 3-layer value system with传播感 highlights.
Market-environment: 3-year trend, power-type split, regional variance.

Co-Authored-By: Claude <noreply@anthropic.com>"
```

---

## Task 5: Insight Modules Batch 2 (competitor-deep + customer-segmentation + city-signal)

**Files:**
- Create: `skills/regional-auto-launch-plan/shared/insight-modules/competitor-deep.md`
- Create: `skills/regional-auto-launch-plan/shared/insight-modules/customer-segmentation.md`
- Create: `skills/regional-auto-launch-plan/shared/insight-modules/city-signal.md`

**Dependencies:** Task 1 complete.

Aligned to 3.md §2.3+2.4, §2.5+2.6, and §2.6 regional depth.

- [ ] **Step 1: Verify files do not exist**

Run:
```bash
for f in competitor-deep.md customer-segmentation.md city-signal.md; do
  test -f "skills/regional-auto-launch-plan/shared/insight-modules/$f" && echo "EXISTS" || echo "MISSING"
done
```
Expected: Three `MISSING` lines.

- [ ] **Step 2: Write competitor-deep.md**

```bash
cat > skills/regional-auto-launch-plan/shared/insight-modules/competitor-deep.md << 'EOF'
# Insight Module: Competitor Deep Dive

## Goal

Produce 5-dimension competitor analysis with recent campaigns for each core/key competitor.

## Required output

```md
## Competitor Actionable View

### Competitor Classification
| 分类 | 定义 | 应对策略方向 |
| --- | --- | --- |
| 核心竞品 | 价格带重叠、目标客群高度相似 | 贴身肉搏，正面硬刚 |
| 重点竞品 | 有交叉客群，存在明显分流威胁 | 凸显差异价值，抢声量 |
| 延展竞品 | 客群有潜在迁移可能 | 错位竞争，潜在拦截 |

### 形象对标
- [Traditional luxury brand used for upward positioning]
- [How the vehicle positions against it]

### Per-Competitor Deep Dive (separate subsection per core/key competitor)

#### [Competitor Name]
1. **核心定位**: [one-sentence brand tag]
2. **营销打法**: [topic / content / endorser / price strategy]
3. **渠道策略**: [offline layout / user operation / community]
4. **用户信任路径**: [know → order key touchpoints]
5. **应对策略**: [impactful multi-sentence strategy paragraph, not generic]

**近期重要营销动作**:
- [Campaign 1]: [timing + core mechanic]
- [Campaign 2]: [timing + core mechanic]
- [Campaign 3 (if applicable)]: [timing + core mechanic]

### Competitor Coordinate Map
- Price / Intelligence / Brand potential axes description
```

## Rules

- Each core/key competitor must have all 5 dimensions with evidence-backed content.
- "应对策略" must be a multi-sentence paragraph with brand-specific posture, not generic.
- Recent campaigns: 2–3 within last 12 months, with timing and mechanic.
- Generic praise only → mark as `fail` and route back for rewrite.
EOF
```

- [ ] **Step 3: Write customer-segmentation.md**

```bash
cat > skills/regional-auto-launch-plan/shared/insight-modules/customer-segmentation.md << 'EOF'
# Insight Module: Customer Segmentation

## Goal

Produce 2–4 persona types with full profile and regional depth.

## Required output

```md
## Customer Segmentation Pack

### Persona Types
- [Type 1]: [e.g., 核心客群 — 高净值家庭]
- [Type 2]: [e.g., 转化客群 — BBA增换购]
- [Type 3]: [e.g., 潜力客群 — 科技新贵]

### Per-Persona Profile

#### [Type Name]
- **基本画像**: 年龄 / 职业 / 收入 / 家庭结构
- **用车场景**: 日常通勤 / 家庭出行 / 商务 / 长途自驾
- **核心痛点**: [unmet needs]
- **关注要点**: [top 3–5 decision dimensions]
- **情感诉求**: [emotional motivation and identity]

### Regional Deep Dive (per persona)
- **消费趋势**: [rationalization / quality / scene-driven]
- **触媒习惯**: [platforms used for auto decisions]
- **空间分布**: [where they live/gather in the region]
- **心态分析**: [consumption mindset, anxieties, aspirations]
- **消费习惯**: [decision cycle, info path, brand loyalty]
- **出行习惯**: [weekday / weekend / holiday differences]
- **文化与情感归因**: [regional cultural anchors]
```

## Rules

- Minimum 2 persona types, maximum 4.
- Each persona must have both base profile and regional deep dive.
- Regional data must be specific to `geography_or_region`, not generic China trends.
EOF
```

- [ ] **Step 4: Write city-signal.md**

```bash
cat > skills/regional-auto-launch-plan/shared/insight-modules/city-signal.md << 'EOF'
# Insight Module: City Signal

## Goal

Produce regional consumption, media, spatial, and cultural anchors.

## Required output

```md
## City Evidence Pack

### Regional Consumption Trends
- [Category-specific local habits, e.g., 混动渗透率高于全国平均]
- [Price sensitivity or premium willingness]
- [Purchase decision drivers in this region]

### Media Habits
- [Platforms used for auto decision-making in this region]
- [Key opinion leaders / channels trusted locally]
- [Content format preferences]

### Spatial Distribution
- [Where target audiences live: e.g., "一江两湖三极"]
- [Where they gather: malls, clubs, business districts]
- [Venue candidates for events]

### Cultural Anchors
- [Emotional/cultural touchstones: e.g., 过早文化, 江城情怀]
- [Regional pride points that can tie to brand narrative]
- [Local event calendar relevant to launch window]

### Hotspot × Regional Resource Match
| Hotspot or calendar hook | Regional resource (named) | How it pairs with launch | Source |
| --- | --- | --- | --- |
| ... | ... | ... | ... |
```

## Rules

- All four categories (consumption / media / spatial / culture) are mandatory.
- If any category is missing, mark `fail` and route back.
- Sources: Tier 1/2 preferred; Tier 3 acceptable with annotation.
EOF
```

- [ ] **Step 5: Verify files have required sections**

Run:
```bash
grep -l "5-dimension" skills/regional-auto-launch-plan/shared/insight-modules/competitor-deep.md && \
grep -l "Persona Types" skills/regional-auto-launch-plan/shared/insight-modules/customer-segmentation.md && \
grep -l "City Evidence Pack" skills/regional-auto-launch-plan/shared/insight-modules/city-signal.md
```
Expected: Three file paths printed.

- [ ] **Step 6: Commit**

```bash
git add skills/regional-auto-launch-plan/shared/insight-modules/*.md
git commit -m "feat(regional-auto-launch-plan): add insight modules batch 2

competitor-deep: 5-dim + recent campaigns.
customer-segmentation: 2-4 personas + regional depth.
city-signal: consumption/media/spatial/culture anchors.

Co-Authored-By: Claude <noreply@anthropic.com>"
```

---
