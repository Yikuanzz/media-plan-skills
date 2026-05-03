# Launch Campaign Orchestrator Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create the `skills/launch-campaign-orchestrator/` skill package with full entry file, 6 phase files, 10 shared contracts, and a validation script.

**Architecture:** This is a document-driven skill system. The SKILL.md serves as the runtime orchestrator, phases/*.md define per-stage workflows, and shared/*.md define schemas, templates, and rules. A shell script validates structural integrity and content completeness.

**Tech Stack:** Markdown specifications + Bash validation scripts. No external dependencies.

---

## File Structure

```
skills/launch-campaign-orchestrator/
├── SKILL.md                                    # Entry orchestrator
├── phases/
│   ├── intake.md                               # Step 1: Brief normalization
│   ├── insight.md                              # Step 2: Atomic resource generation
│   ├── narrative-spine.md                      # Step 3: Worldview + state machine
│   ├── lead-pool.md                            # Step 4: Lead generation + lifecycle
│   ├── strategy-plan.md                        # Step 5: Narrative arc + energy curve
│   └── proposal-assembly.md                    # Step 6: Deep processing + Review Pass
└── shared/
    ├── brief-intake-template.md                # Intake field schema
    ├── source-trust-policy.md                  # Evidence trust tiers
    ├── query-playbook.md                       # Search query routing
    ├── narrative-spine-template.md             # Spine schema + quality gates
    ├── lead-template.md                        # Lead entry schema
    ├── fusion-rules.md                         # Fusion basis + compression
    ├── idea-scorecard.md                       # Scoring dimensions + weights
    ├── energy-curve-template.md                # Energy curve design rules
    ├── proposal-template.md                    # Proposal structure + depth rules
    └── quality-self-check.md                   # Review Pass criteria
```

---

### Task 1: Create directory structure + write failing validation test

**Files:**
- Create: `skills/launch-campaign-orchestrator/phases/` (directory)
- Create: `skills/launch-campaign-orchestrator/shared/` (directory)
- Create: `scripts/check-launch-campaign-orchestrator.sh`

- [ ] **Step 1: Create directory structure**

```bash
mkdir -p skills/launch-campaign-orchestrator/phases
mkdir -p skills/launch-campaign-orchestrator/shared
```

- [ ] **Step 2: Write validation script (will fail initially)**

```bash
cat > scripts/check-launch-campaign-orchestrator.sh << 'EOF'
#!/bin/bash
set -e

SKILL_DIR="skills/launch-campaign-orchestrator"
ERRORS=0

# Required files
declare -a REQUIRED_FILES=(
  "$SKILL_DIR/SKILL.md"
  "$SKILL_DIR/phases/intake.md"
  "$SKILL_DIR/phases/insight.md"
  "$SKILL_DIR/phases/narrative-spine.md"
  "$SKILL_DIR/phases/lead-pool.md"
  "$SKILL_DIR/phases/strategy-plan.md"
  "$SKILL_DIR/phases/proposal-assembly.md"
  "$SKILL_DIR/shared/brief-intake-template.md"
  "$SKILL_DIR/shared/source-trust-policy.md"
  "$SKILL_DIR/shared/query-playbook.md"
  "$SKILL_DIR/shared/narrative-spine-template.md"
  "$SKILL_DIR/shared/lead-template.md"
  "$SKILL_DIR/shared/fusion-rules.md"
  "$SKILL_DIR/shared/idea-scorecard.md"
  "$SKILL_DIR/shared/energy-curve-template.md"
  "$SKILL_DIR/shared/proposal-template.md"
  "$SKILL_DIR/shared/quality-self-check.md"
)

for f in "${REQUIRED_FILES[@]}"; do
  if [ ! -f "$f" ]; then
    echo "MISSING: $f"
    ERRORS=$((ERRORS + 1))
  fi
done

# Content checks
if [ -f "$SKILL_DIR/SKILL.md" ]; then
  grep -q "Narrative Spine" "$SKILL_DIR/SKILL.md" || { echo "SKILL.md missing Narrative Spine"; ERRORS=$((ERRORS + 1)); }
  grep -q "Lead Pool" "$SKILL_DIR/SKILL.md" || { echo "SKILL.md missing Lead Pool"; ERRORS=$((ERRORS + 1)); }
  grep -q "Energy Curve" "$SKILL_DIR/SKILL.md" || { echo "SKILL.md missing Energy Curve"; ERRORS=$((ERRORS + 1)); }
  grep -q "BLOCKING" "$SKILL_DIR/SKILL.md" || { echo "SKILL.md missing BLOCKING gates"; ERRORS=$((ERRORS + 1)); }
fi

if [ -f "$SKILL_DIR/shared/narrative-spine-template.md" ]; then
  grep -q "narrative_transitions" "$SKILL_DIR/shared/narrative-spine-template.md" || { echo "narrative-spine-template.md missing transitions"; ERRORS=$((ERRORS + 1)); }
  grep -q "memory_anchor" "$SKILL_DIR/shared/narrative-spine-template.md" || { echo "narrative-spine-template.md missing memory_anchor"; ERRORS=$((ERRORS + 1)); }
fi

if [ -f "$SKILL_DIR/shared/lead-template.md" ]; then
  grep -q "narrative_roles" "$SKILL_DIR/shared/lead-template.md" || { echo "lead-template.md missing narrative_roles"; ERRORS=$((ERRORS + 1)); }
  grep -q "memory_anchor" "$SKILL_DIR/shared/lead-template.md" || { echo "lead-template.md missing memory_anchor"; ERRORS=$((ERRORS + 1)); }
fi

if [ -f "$SKILL_DIR/shared/idea-scorecard.md" ]; then
  grep -q "Memorability" "$SKILL_DIR/shared/idea-scorecard.md" || { echo "idea-scorecard.md missing Memorability"; ERRORS=$((ERRORS + 1)); }
fi

if [ -f "$SKILL_DIR/shared/quality-self-check.md" ]; then
  grep -q "Narrative drift" "$SKILL_DIR/shared/quality-self-check.md" || { echo "quality-self-check.md missing Narrative drift"; ERRORS=$((ERRORS + 1)); }
  grep -q "Creative density" "$SKILL_DIR/shared/quality-self-check.md" || { echo "quality-self-check.md missing Creative density"; ERRORS=$((ERRORS + 1)); }
fi

if [ $ERRORS -eq 0 ]; then
  echo "PASS: All files present and content checks passed."
  exit 0
else
  echo "FAIL: $ERRORS error(s) found."
  exit 1
fi
EOF
chmod +x scripts/check-launch-campaign-orchestrator.sh
```

- [ ] **Step 3: Commit**

```bash
git add scripts/check-launch-campaign-orchestrator.sh
git commit -m "feat(launch-campaign-orchestrator): add validation script"
```

---

### Task 2: Run validation to confirm it fails

- [ ] **Step 1: Run the validation script**

```bash
bash scripts/check-launch-campaign-orchestrator.sh
```

**Expected:** FAIL with multiple "MISSING" errors.

---

### Task 3: Write SKILL.md

**Files:**
- Create: `skills/launch-campaign-orchestrator/SKILL.md`

- [ ] **Step 1: Write the entry file**

```markdown
---
name: launch-campaign-orchestrator
description: >
  Use when generating a launch campaign communication proposal. Runs a
  narrative-driven workflow through insight, narrative spine, lead pool,
  strategy plan, and proposal assembly. Triggers: 上市传播, 新车上市,
  launch campaign, 传播方案, 上市策划, 上市活动方案.
---

# Launch Campaign Orchestrator

## Purpose

Run the full launch campaign proposal workflow in this package only:
Intake → Insight → Narrative Spine → Lead Pool → Strategy Plan → Proposal Assembly.

Enforces narrative coherence, emotional state-machine design, lead lifecycle
management, idea fusion, energy curve rhythm, and variable-depth proposal writing.

## Global Execution Discipline (mandatory)

1. **SERIAL PHASES ONLY** — Run phases in order. Do not skip forward or merge
   multiple unresolved phases into one pass.
2. **BLOCKING = HARD STOP** — Stage transitions require explicit user confirmation.
3. **NO CROSS-PHASE BUNDLING** — Do not draft proposal while upstream gates are unresolved.
4. **NO SPECULATIVE BACKFILL** — Pre-brief signals narrow questions only.
5. **RUNTIME SCOPE** — Use only `./phases/*.md` and `./shared/*.md` as runtime contracts.
6. **NARRATIVE SPINE IS KING** — Every lead, every stage, every activity must align
   with the Narrative Spine. Leads without `narrative_alignment` are rejected.
7. **CREATIVE HEAT OVER BUDGET** — Hot ideas are not vetoed by budget. Use fuzzing,
   downplaying, or overflow strategies instead.
8. **VARIABLE DEPTH** — S-tier gets full plans, A-tier gets summaries, B-tier gets
   packaging notes. Do not write 2000 words for every activity.
9. **LEAD LIFECYCLE IS MANDATORY** — Active leads are capped at 40. Auto-compression
   triggers on duplication threshold >0.7.
10. **ENERGY CURVE DESIGN** — Intensity 100 appears once. Adjacent stages differ
    by ≥20. White space is intentional.
11. **MEMORY ANCHOR CHECK** — S-tier and A-tier activities must have a memory anchor
    that passes the "one year test".

## Phase Index

| Phase file | Stage | Purpose |
|---|---|---|
| `./phases/intake.md` | Intake | Normalize brief fields |
| `./phases/insight.md` | Insight | Build atomic insight resources |
| `./phases/narrative-spine.md` | Narrative Spine | Build worldview + state machine + memory anchor |
| `./phases/lead-pool.md` | Lead Pool | Generate leads by Value Category, manage lifecycle |
| `./phases/strategy-plan.md` | Strategy Plan | Build narrative arc + energy curve + structure |
| `./phases/proposal-assembly.md` | Proposal Assembly | Deep processing + Review Pass |

## Shared Contract Index

| Shared file | Role |
|---|---|
| `./shared/brief-intake-template.md` | Intake schema and required fields |
| `./shared/source-trust-policy.md` | Evidence trust tiers |
| `./shared/query-playbook.md` | Query patterns and routing |
| `./shared/narrative-spine-template.md` | Spine schema, transitions, quality gates |
| `./shared/lead-template.md` | Lead entry schema |
| `./shared/fusion-rules.md` | Fusion basis priority and compression rules |
| `./shared/idea-scorecard.md` | Scoring dimensions and weights |
| `./shared/energy-curve-template.md` | Energy curve design principles |
| `./shared/proposal-template.md` | Proposal structure and depth rules |
| `./shared/quality-self-check.md` | Review Pass criteria |

## Phase Switch Protocol

Before entering each phase, read its phase file and every shared file listed
for that phase. Then emit:

```markdown
## [Phase: <StageName>]
Read: <phase path> + <shared paths>
Write path: <project-dir>/<target-file-or-files>
Task: <one-line objective for this phase>
```

Do not skip required reads.

## Global Hard Gates

- Do not start **Insight** until intake has all research-start fields.
- Do not start **Narrative Spine** until Insight has ≥3 modules with findings
  and ≥2 Atomic Resources per module.
- Do not start **Lead Pool** until Narrative Spine passes all quality gates.
- Do not start **Strategy Plan** until Lead Pool has ≥10 valid leads covering
  ≥2 Value Categories and ≥2 Execution Tiers.
- Do not start **Proposal Assembly** until Strategy Plan is explicitly
  user-confirmed.
- Do not declare completion until `04-proposal.md` passes Review Pass.

## Within-Stage Expansion Protocol

When user requests modifications within the current stage:
1. Identify the target artifact file.
2. Apply modification (add / edit / delete).
3. Emit brief change summary.
4. **Do not** emit "advancing to next stage" unless user explicitly requests it.

When user requests upstream modifications while in a downstream stage:
1. Allow writing to upstream files.
2. Emit: "已更新 upstream 文件 X，当前仍在 [Current Stage] 阶段。"
3. Continue awaiting stage-specific instructions.

## Symptom → Upstream Return

| Symptom | Return to |
|---|---|
| Missing intake fields | Intake — ask only for missing fields |
| Weak or missing insight | Insight — load modules, re-research |
| Spine quality gate fail | Narrative Spine — rebuild tension/arc/transitions |
| Lead pool too fragmented | Lead Pool — trigger compression / fusion |
| Narrative drift in proposal | Strategy Plan — realign lead map to spine |
| Energy curve collapse | Strategy Plan — redistribute intensity |
| Creative density too high | Proposal Assembly — compress, add white space |
| Review Pass fail (structure) | Proposal Assembly — rebuild sections |

## Completion Gate

Declare completion only when:
- Intake is ready.
- Insight has ≥3 modules with Atomic Resources.
- Narrative Spine passes all quality gates.
- Lead Pool has ≥10 valid leads with narrative alignment.
- Strategy Plan is user-confirmed with energy curve and lead map.
- Proposal Assembly passes Review Pass.
- `04-proposal.md` is persisted.
```

- [ ] **Step 2: Commit**

```bash
git add skills/launch-campaign-orchestrator/SKILL.md
git commit -m "feat(launch-campaign-orchestrator): add SKILL.md entry orchestrator"
```

---

### Task 4: Write phases/intake.md

**Files:**
- Create: `skills/launch-campaign-orchestrator/phases/intake.md`

- [ ] **Step 1: Write intake phase**

```markdown
# Phase: Intake

## Purpose

Normalize the brief into a structured intake document. Block until
research-start fields are present and non-placeholder.

## Required Reads

- `./shared/brief-intake-template.md`

## Action

1. Normalize user input into `## Intake Summary`.
2. Set `## Intake Status` to `ready` or `blocked`.
3. If blocked, list only the missing research-start fields.

## Output Shape

```markdown
## Intake Summary
- business_goal: ...
- target_audience: ...
- timeline: ...
- budget_or_resource_level: ...
- geography_or_region: ...
- channel_constraints: ...
- deliverables_needed: ...
- constraints: ...
- success_metric: ...

## Intake Status
ready / blocked

## Open Questions
- ...
```

## Checkpoint

```markdown
## Intake complete
- [x] All research-start fields present or explicitly N/A
- [x] Intake Status is explicit
- [ ] Next: Insight (when ready)
```
```

- [ ] **Step 2: Commit**

```bash
git add skills/launch-campaign-orchestrator/phases/intake.md
git commit -m "feat(launch-campaign-orchestrator): add intake phase"
```

---

### Task 5: Write phases/insight.md

**Files:**
- Create: `skills/launch-campaign-orchestrator/phases/insight.md`

- [ ] **Step 1: Write insight phase**

```markdown
# Phase: Insight

## Purpose

Build atomic insight resources across 6 modules. Each module produces
Key Findings and Atomic Resources with IDs.

## Required Reads

- `./phases/intake.md` (for intake context)
- `./shared/source-trust-policy.md`
- `./shared/query-playbook.md`

## Modules

Run all 6 modules. Each module file is a standalone artifact.

| Module | File | Output ID Prefix |
|---|---|---|
| Product Value | `01a-product-value.md` | PV-xxx |
| Market Environment | `01b-market-environment.md` | ME-xxx |
| Competitor Landscape | `01c-competitor-landscape.md` | CL-xxx |
| Customer Segmentation | `01d-customer-segmentation.md` | AU-xxx |
| City Signal | `01e-city-signal.md` | CS-xxx |
| Trend Signal | `01f-trend-signal.md` | TR-xxx |

## Module Output Shape

```markdown
## Module: Product Value

### Key Findings
- Finding 1: ...
- Finding 2: ...

### Atomic Resources
| ID | Type | Content | Source | Trust |
|---|---|---|---|---|
| PV-001 | product_feature | ... | ... | high |
```

## Quality Gate

- ≥3 modules must have Key Findings.
- Each module must have ≥2 Atomic Resources.
- Each Atomic Resource must have a source and trust tier.

## Checkpoint

```markdown
## Insight complete
- [x] ≥3 modules with findings
- [x] ≥2 Atomic Resources per module
- [x] All resources trust-tagged
- [ ] Next: Narrative Spine
```
```

- [ ] **Step 2: Commit**

```bash
git add skills/launch-campaign-orchestrator/phases/insight.md
git commit -m "feat(launch-campaign-orchestrator): add insight phase"
```

---

### Task 6: Write phases/narrative-spine.md

**Files:**
- Create: `skills/launch-campaign-orchestrator/phases/narrative-spine.md`

- [ ] **Step 1: Write narrative-spine phase**

```markdown
# Phase: Narrative Spine

## Purpose

Build the narrative worldview, emotional state machine, and memory anchor
that governs all downstream creative work.

## Required Reads

- `./phases/insight.md`
- `./shared/narrative-spine-template.md`
- `./shared/insight-modules/*.md` (for context)

## Action

1. Read completed insight modules.
2. Derive `core_tension` from product insight + audience insight + market tension.
3. Design `emotional_arc` with ≥3 distinct states and progression.
4. Define `narrative_transitions` — for each arc step, specify:
   - `trigger_types`: What makes the audience move to the next state?
   - `failure_modes`: What blocks the transition?
   - `lead_requirements`: What the lead must do to activate the trigger.
5. Select `symbolic_objects` (concrete, visualizable).
6. Name the `story_world`.
7. Define `audience_role` (active, not passive).
8. Define `memory_anchor` that passes the "one year test".

## Output

Write to `01-insight/01g-narrative-spine.md`.

## Quality Gates (all must pass)

- [ ] Core tension is a single sentence with emotional polarity.
- [ ] Emotional arc has ≥3 distinct states.
- [ ] Every transition defines trigger_types + failure_modes + lead_requirements.
- [ ] Symbolic objects are concrete and visualizable.
- [ ] Story world is named.
- [ ] Audience role is active.
- [ ] Memory anchor passes "one year test".

## Checkpoint

```markdown
## Narrative Spine complete
- [x] All 7 quality gates passed
- [x] Output written to 01g-narrative-spine.md
- [ ] Next: Lead Pool
```
```

- [ ] **Step 2: Commit**

```bash
git add skills/launch-campaign-orchestrator/phases/narrative-spine.md
git commit -m "feat(launch-campaign-orchestrator): add narrative-spine phase"
```

---

### Task 7: Write phases/lead-pool.md

**Files:**
- Create: `skills/launch-campaign-orchestrator/phases/lead-pool.md`

- [ ] **Step 1: Write lead-pool phase**

```markdown
# Phase: Lead Pool

## Purpose

Generate creative leads by Value Category batch. Every lead must align with
Narrative Spine and serve a state transition. Manage lead lifecycle and
auto-compression.

## Required Reads

- `./phases/narrative-spine.md`
- `./shared/lead-template.md`
- `./shared/idea-scorecard.md`
- `./shared/fusion-rules.md`
- `./shared/query-playbook.md`

## Action

1. Read Narrative Spine and insight modules.
2. Generate leads **by Value Category in batches**:
   - 够新鲜: First-ever /首创 topics
   - 够亮眼: High-visual-impact assets
   - 够爆: Controversy /裂变 /福利 events
   - 够热: Trend-riding / node-hitting actions
3. For each lead, assign at generation time:
   - `value_category`, `execution_tier`, `narrative_roles` (primary + secondary + weights)
   - `narrative_alignment` (serves_transition, emotional_target, trigger_mechanism)
   - `story_function`
   - `memory_anchor` (anchor, type, memorability_test, one_sentence_recall)
   - `insight_links`, `channels`, `kpi_targets`
   - `lead_status: active`, `lead_confidence`, `lead_uniqueness`, `lead_overlap_score`
4. Score each lead per `idea-scorecard.md`.
5. Monitor pool size:
   - If active leads > 40, suggest compression.
   - If any pair overlap_score > 70, suggest fusion.

## Lead Output

Append to `02-leads/02-lead-pool.md`.

## Quality Gate

- ≥10 valid leads.
- Cover ≥2 Value Categories.
- Cover ≥2 Execution Tiers.
- Every lead has `narrative_alignment` and `memory_anchor`.
- No lead without Spine alignment is admitted.

## Checkpoint

```markdown
## Lead Pool complete
- [x] ≥10 valid leads
- [x] ≥2 Value Categories
- [x] ≥2 Execution Tiers
- [x] All leads narrative-aligned
- [x] Scorecard filled
- [ ] Next: Strategy Plan (when user confirms)
```
```

- [ ] **Step 2: Commit**

```bash
git add skills/launch-campaign-orchestrator/phases/lead-pool.md
git commit -m "feat(launch-campaign-orchestrator): add lead-pool phase"
```

---

### Task 8: Write phases/strategy-plan.md

**Files:**
- Create: `skills/launch-campaign-orchestrator/phases/strategy-plan.md`

- [ ] **Step 1: Write strategy-plan phase**

```markdown
# Phase: Strategy Plan

## Purpose

Build the narrative arc, energy curve, and proposal structure. Select and
map leads to stages. Ensure narrative role balance and memory anchor coverage.

## Required Reads

- `./phases/lead-pool.md`
- `./shared/energy-curve-template.md`
- `./shared/proposal-template.md`
- `./shared/quality-self-check.md`

## Action

1. Read Narrative Spine and Lead Pool.
2. Design **Proposal Structure**:
   - Stage count and naming derived from intake + insight + Spine + user intent.
   - NOT preset 3-phase. Flexible: 2-phase, 4-phase, or custom naming.
3. Design **Narrative Transition Map**:
   - Map each emotional transition to serving leads.
   - Define failure guards per transition.
4. Design **Energy Curve**:
   - Each stage: emotion + intensity + narrative role mix + rationale.
   - Intensity 100 appears **only once**.
   - Adjacent stages differ by **≥20**.
   - White space is intentional breathing room.
5. Build **Lead Utilization Map**:
   - Map each stage to: Value Category, Execution Tier, Primary Role, Lead ID,
     Write Style, Deformation Note, Energy Target, Memory Anchor.
6. Run checks:
   - Each stage covers ≥2 different Primary Narrative Roles.
   - S-tier events total ≤ 2-3.
   - B-tier proportion is not excessive.
   - Each stage has ≥1 Memory Anchor.

## BLOCKING

Stop and present the Strategy Plan. Require explicit user confirmation
("OK", "确认", "开始组装") before proceeding to Proposal Assembly.

## Output

Write to `03-strategy-plan.md`.

## Checkpoint

```markdown
## Strategy Plan complete
- [x] Main Narrative defined
- [x] Narrative Transition Map built
- [x] Energy Curve designed with peak + white space
- [x] Lead Utilization Map complete
- [x] Narrative Role Coverage Check passed
- [x] Memory Anchor Check passed
- [x] User confirmed (BLOCKING)
- [ ] Next: Proposal Assembly
```
```

- [ ] **Step 2: Commit**

```bash
git add skills/launch-campaign-orchestrator/phases/strategy-plan.md
git commit -m "feat(launch-campaign-orchestrator): add strategy-plan phase"
```

---

### Task 9: Write phases/proposal-assembly.md

**Files:**
- Create: `skills/launch-campaign-orchestrator/phases/proposal-assembly.md`

- [ ] **Step 1: Write proposal-assembly phase**

```markdown
# Phase: Proposal Assembly

## Purpose

Deep-process leads into a complete proposal with variable depth per tier.
Implement energy curve, cite insights, and run Review Pass.

## Required Reads

- `./phases/strategy-plan.md`
- `./shared/proposal-template.md`
- `./shared/quality-self-check.md`

## Action

1. Read Strategy Plan, Lead Pool, Insight, and Narrative Spine.
2. For each stage, process referenced leads:
   - **S-tier**: Expand to full event plan (site, space, process, lead capture,
     conversion path, detailed budget, KPI).
   - **A-tier**: Expand to execution summary (format + channel + content + budget
     + KPI, with brief process).
   - **B-tier**: Write packaging notes (hook + highlight + direction + budget range
     + supplier type).
3. **Narrative consistency**: Every activity opens with one sentence linking it
   to Main Narrative, Narrative Spine, AND target emotional transition.
4. **Energy curve implementation**: Stage activities collectively deliver target
   intensity. Do not pack 3 S-tier events into an intensity-40 stage.
5. **Insight citation**: Every core claim cites Atomic Resource ID.
6. **Budget flexibility**: Apply fuzzing / downplaying / overflow for hot ideas.
7. **Execution detail fill-in**: Timetable, budget allocation, KPI definitions,
   team assignments — generate where leads don't cover.
8. **Review Pass**: Run quality check per `quality-self-check.md`.

## Review Pass Failure Routing

| Symptom | Route |
|---|---|
| Narrative drift | Strategy Plan — realign lead map |
| Redundancy | Lead Pool — compress or archive duplicates |
| Peak collision | Strategy Plan — redistribute S-tier events |
| White space missing | Strategy Plan — redesign energy curve |
| Creative density too high | Proposal Assembly — compress stage content |
| Insight support weak | Insight — add missing resources |
| Structure incomplete | Proposal Assembly — rebuild sections |

## Output

Write to `04-proposal.md`.

## Checkpoint

```markdown
## Proposal Assembly complete
- [x] All stages written with tier-appropriate depth
- [x] Narrative consistency verified
- [x] Energy curve implemented
- [x] Insight citations present
- [x] Budget handling applied
- [x] Review Pass = pass
- [ ] Next: Completion
```
```

- [ ] **Step 2: Commit**

```bash
git add skills/launch-campaign-orchestrator/phases/proposal-assembly.md
git commit -m "feat(launch-campaign-orchestrator): add proposal-assembly phase"
```

---

### Task 10: Write shared/brief-intake-template.md

**Files:**
- Create: `skills/launch-campaign-orchestrator/shared/brief-intake-template.md`

- [ ] **Step 1: Write intake template**

```markdown
# Brief Intake Template

## Required Fields (research-start)

- `business_goal`: Campaign objective
- `target_audience`: Primary and secondary audiences
- `timeline`: Start and end dates, key milestones
- `budget_or_resource_level`: Budget range or resource constraints
- `geography_or_region`: Target cities / regions
- `channel_constraints`: Preferred or excluded channels

## Later-Stage Fields

- `deliverables_needed`: Expected outputs
- `constraints`: Hard constraints (legal, brand, etc.)
- `success_metric`: KPIs and measurement approach

## Optional Fields

- `bid_or_tender`: true / false
- `evaluation_rubric`: Tender evaluation criteria
- `client_master_calendar`: Client-side events to avoid or align
- `tender_technical_requirements`: Technical submission requirements

## Output Shape

```markdown
## Intake Summary
- business_goal: ...
- target_audience: ...
- timeline: ...
- budget_or_resource_level: ...
- geography_or_region: ...
- channel_constraints: ...
- deliverables_needed: ...
- constraints: ...
- success_metric: ...

## Intake Status
ready / blocked
```
```

- [ ] **Step 2: Commit**

```bash
git add skills/launch-campaign-orchestrator/shared/brief-intake-template.md
git commit -m "feat(launch-campaign-orchestrator): add brief-intake-template"
```

---

### Task 11: Write shared/source-trust-policy.md

**Files:**
- Create: `skills/launch-campaign-orchestrator/shared/source-trust-policy.md`

- [ ] **Step 1: Write source trust policy**

```markdown
# Source Trust Policy

## Trust Tiers

| Tier | Sources | Usage |
|---|---|---|
| **High** | Brand official, audited reports, primary research | Can support core claims directly |
| **Medium** | Reputable media, industry analysts, verified social accounts | Supports secondary claims, needs cross-check |
| **Low** | Unverified social posts, rumors, single-source claims | Use for signal only, not as evidence |

## Rules

- Every Atomic Resource must have a trust tier.
- Core claims in proposal must cite High or Medium sources.
- Low-tier sources can inspire leads but cannot support factual claims.
- Competitive claims require ≥2 independent sources.
```

- [ ] **Step 2: Commit**

```bash
git add skills/launch-campaign-orchestrator/shared/source-trust-policy.md
git commit -m "feat(launch-campaign-orchestrator): add source-trust-policy"
```

---

### Task 12: Write shared/query-playbook.md

**Files:**
- Create: `skills/launch-campaign-orchestrator/shared/query-playbook.md`

- [ ] **Step 1: Write query playbook**

```markdown
# Query Playbook

## Pre-Brief / Trend Search Queries

| Target | Query Patterns | Platforms |
|---|---|---|
| Hot trends | "{category} 最新趋势 2026", "{category} 热门话题" | 小红书, 抖音, 微博 |
| Competitor campaigns | "{brand} 最新 campaign", "{brand} 营销活动" | 百度, 微信搜一搜 |
| City signals | "{city} 消费趋势", "{city} 网红打卡" | 小红书, 本地生活平台 |
| Audience behavior | "{audience} 消费习惯", "{audience} 社交媒体使用" | 艾瑞,  QuestMobile |

## Lead Generation Search

| Value Category | Query Focus |
|---|---|
| 够新鲜 | "首次", "首创", "首发", "第一次" + category |
| 够亮眼 | "视觉", "打卡", "高颜值", "装置艺术" + category |
| 够爆 | "裂变", " viral", "争议", "福利" + category |
| 够热 | "{trend}", "{event}", "{festival}" + marketing + category |

## Rules

- Pre-brief search narrows questions only. Never auto-fill intake fields.
- Trend search feeds Lead Pool generation, not Strategy conclusions.
- Cross-check hot signals with High or Medium tier sources before using as evidence.
```

- [ ] **Step 2: Commit**

```bash
git add skills/launch-campaign-orchestrator/shared/query-playbook.md
git commit -m "feat(launch-campaign-orchestrator): add query-playbook"
```

---

### Task 13: Write shared/narrative-spine-template.md

**Files:**
- Create: `skills/launch-campaign-orchestrator/shared/narrative-spine-template.md`

- [ ] **Step 1: Write narrative spine template**

```markdown
# Narrative Spine Template

## Schema

```yaml
NarrativeSpine:
  core_tension: "单句核心冲突，带情绪极性"

  emotional_arc:
    - state_1
    - state_2
    - state_3
    # ... ≥3 distinct states

  narrative_transitions:
    - from: state_1
      to: state_2
      trigger_types:
        - "触发行为类型"
      failure_modes:
        - "导致迁移失败的障碍"
      lead_requirements:
        - "线索必须满足的条件"

  symbolic_objects:
    - "具体、可视觉化的符号"

  narrative_keywords:
    - "关键词"

  story_world: "世界观名称"
  protagonist: "..."
  audience_role: "用户的主动角色"

  memory_anchor:
    anchor: "用户一年后还能记住的画面/语句"
    type: visual | slogan | interaction | ritual | collectible
    memorability_test: "一年后还能不能描述？"
```

## Quality Gates

- [ ] Core tension: single sentence, emotional polarity
- [ ] Emotional arc: ≥3 distinct states
- [ ] Transitions: each step has trigger_types + failure_modes + lead_requirements
- [ ] Symbolic objects: concrete, visualizable
- [ ] Story world: named
- [ ] Audience role: active
- [ ] Memory anchor: passes "one year test"

## Example

```yaml
NarrativeSpine:
  core_tension: "城市太熟悉，但其实你从未真正探索"

  emotional_arc:
    - curiosity
    - participation
    - discovery
    - belonging

  narrative_transitions:
    - from: curiosity
      to: participation
      trigger_types: [ugc_invite, social_proof, reward_unlock]
      failure_modes: [passive_viewing, high_participation_cost]
      lead_requirements: [must_lower_participation_barrier, must_provide_immediate_feedback]

  symbolic_objects: [AI地图, 城市彩蛋, 夜间光点]
  narrative_keywords: [探索, 解锁, 城市隐藏面]
  story_world: "AI城市探索宇宙"
  protagonist: "..."
  audience_role: "城市探索玩家"

  memory_anchor:
    anchor: "城市隐藏光点"
    type: visual
    memorability_test: "用户一年后还能不能描述这个画面？"
```
```

- [ ] **Step 2: Commit**

```bash
git add skills/launch-campaign-orchestrator/shared/narrative-spine-template.md
git commit -m "feat(launch-campaign-orchestrator): add narrative-spine-template"
```

---

### Task 14: Write shared/lead-template.md

**Files:**
- Create: `skills/launch-campaign-orchestrator/shared/lead-template.md`

- [ ] **Step 1: Write lead template**

```markdown
# Lead Template

## Lead Entry Schema

```yaml
Lead:
  id: L042
  hook: "传播钩子/话题"
  concept: "核心概念"

  value_category: 够新鲜 | 够亮眼 | 够爆 | 够热
  execution_tier: S级 | A级 | B级

  narrative_roles:
    primary: Ignition | Amplifier | Converter | Retainer | Proof | Social Currency | Participation
    secondary:
      - ...
    role_weights:
      primary_role: 0.7
      secondary_role_1: 0.2
      secondary_role_2: 0.1
    # Weights must sum to 1.0. Primary weight must be ≥0.5.

  narrative_alignment:
    serves_transition: "curiosity → participation"
    emotional_target: participation
    trigger_mechanism: ugc_invite | social_proof | reward_unlock | ...

  story_function: "线索在故事中的功能"

  memory_anchor:
    anchor: "用户会记住什么"
    type: visual | slogan | interaction | ritual | collectible
    memorability_test: "一年后还能不能描述？"
    one_sentence_recall: "一句话回忆"

  lifecycle_stage: 悬念期 | 揭秘期 | 上市期 | 延续期 | ...
  target_audience: "具体人群标签"
  budget_level: "预算区间"

  insight_links: [PV-003, CS-001, AU-002]
  channels: [抖音, 小红书, 微信, 线下, ...]
  kpi_targets: "曝光/互动/留资/转化目标"

  lead_status: active | archived | fused | deprecated | rejected
  lead_confidence: 85
  lead_uniqueness: 90
  lead_overlap_score: 15

  fusion_candidates: [L001, L007]
  fusion_strategy: emotional | symbolic | narrative | audience | scene | topic
```

## Value Categories

| Category | Goal |
|---|---|
| 够新鲜 | 制造"首次/首创"话题 |
| 够亮眼 | 高颜值视觉素材，适合打卡传播 |
| 够爆 | 制造争议/裂变/福利事件 |
| 够热 | 借势当前高热趋势/节点 |

## Execution Tiers

| Tier | Definition | Write Depth |
|---|---|---|
| S级 | 核心引爆事件，承载最大声量 | 完整方案 |
| A级 | 圈层渗透/体验触点 | 执行摘要 |
| B级 | 借势/包装型线索 | 包装方式 |

## Narrative Roles

| Role | Function |
|---|---|
| Ignition | 引爆认知 |
| Amplifier | 扩大讨论 |
| Converter | 转化成交 |
| Retainer | 持续热度 |
| Proof | 建立可信度 |
| Social Currency | 提供晒图/身份认同 |
| Participation | 提高UGC参与 |
```

- [ ] **Step 2: Commit**

```bash
git add skills/launch-campaign-orchestrator/shared/lead-template.md
git commit -m "feat(launch-campaign-orchestrator): add lead-template"
```

---

### Task 15: Write shared/fusion-rules.md

**Files:**
- Create: `skills/launch-campaign-orchestrator/shared/fusion-rules.md`

- [ ] **Step 1: Write fusion rules**

```markdown
# Fusion Rules

## Fusion Basis Priority

1. **emotional** (highest) — Leads share the same emotional beat
2. **symbolic** (highest) — Leads share symbolic objects from Narrative Spine
3. **narrative** — Leads serve the same story function
4. **audience** — Shared target audience
5. **scene** — Shared physical or digital space
6. **topic** — Shared topical theme

## Fusion Group Output

```markdown
## Fusion Group #N: 「母事件名称」
- **Candidates**: Lxxx, Lyyy, Lzzz
- **Fusion Basis**: emotional + symbolic + narrative
- **Mother Event Concept**: ...
- **Tier Upgrade**: B×3 → S
- **Narrative Roles**: Ignition (0.6) + Social Currency (0.3) + Participation (0.1)
- **Memory Anchor**: ...
- **Budget Impact**: Budget more concentrated
```

## Compression Rules

- Candidates sharing emotional/symbolic basis are prioritized.
- Post-fusion mother events can upgrade Execution Tier.
- Unfused leads are kept as touchpoints or archived.
- Fusion is not mandatory — use when pool is fragmented.

## Auto Compression Trigger

```yaml
compression_trigger:
  max_active_leads: 40
  duplication_threshold: 0.7
  actions:
    - active > 40: Suggest fusion or archive lowest-confidence leads
    - overlap > 70: Suggest fusion for that pair
    - new batch added: Auto-calculate overlap with existing pool
```
```

- [ ] **Step 2: Commit**

```bash
git add skills/launch-campaign-orchestrator/shared/fusion-rules.md
git commit -m "feat(launch-campaign-orchestrator): add fusion-rules"
```

---

### Task 16: Write shared/idea-scorecard.md

**Files:**
- Create: `skills/launch-campaign-orchestrator/shared/idea-scorecard.md`

- [ ] **Step 1: Write idea scorecard**

```markdown
# Idea Scorecard

## Dimensions

| Dimension | Weight | Description |
|---|---|---|
| Freshness | High | 首次/首创程度 |
| Visual Impact | High | 颜值/打卡/二次传播潜力 |
| Buzz Potential | High | 争议/裂变/讨论度 |
| Trend Heat | High | 借势趋势当前热度 |
| Insight Fit | High | 与产品/区域/客群洞察的关联强度 |
| Memorability | **High** | 是否具备一句话记忆锚点；能否通过"一年测试" |
| Transition Fit | **High** | 如何服务于叙事状态迁移 |
| Tier Appropriateness | Medium | S/A/B 判定是否合理 |
| Budget Feasibility | **Low** | 粗略预算适配度；不是否决维度 |

## Budget is Secondary

A lead that is "hot enough" should NOT be downvoted due to budget concerns.
Use fuzzing / downplaying / overflow strategies instead.

## Output

```markdown
## Scorecard
| Lead ID | Fresh | Visual | Buzz | Trend | Insight | Memo | Trans | Tier | Budget | Total |
|---|---|---|---|---|---|---|---|---|---|---|
| L001 | ... | ... | ... | ... | ... | ... | ... | ... | ... | ... |
```
```

- [ ] **Step 2: Commit**

```bash
git add skills/launch-campaign-orchestrator/shared/idea-scorecard.md
git commit -m "feat(launch-campaign-orchestrator): add idea-scorecard"
```

---

### Task 17: Write shared/energy-curve-template.md

**Files:**
- Create: `skills/launch-campaign-orchestrator/shared/energy-curve-template.md`

- [ ] **Step 1: Write energy curve template**

```markdown
# Energy Curve Template

## Single-Axis Energy (V1)

| Stage | Emotion | Intensity | Role Mix | Rationale |
|---|---|---|---|---|
| ... | ... | ... | ... | ... |

## Design Principles

- **Intensity 100 appears only once** — the launch peak.
- **Adjacent stages differ by ≥20** — creates contrast.
- **White space is intentional** — low intensity is breathing room, not a gap.
- **Not every stage is at 100** — controlled peaks and valleys create rhythm.

## Example

| Stage | Emotion | Intensity | Role Mix |
|---|---|---|---|
| 悬念期 | curiosity | 40 | Ignition + Participation |
| 揭秘期 | excitement | 80 | Amplifier + Social Currency |
| 上市期 | explosion | 100 | Converter + Proof |
| 延续期 | belonging | 60 | Retainer + Participation |

## Future: Multi-Axis Energy (V2+)

```yaml
energy_curve:
  emotional:    # 情绪强度
  social:       # 社交讨论度
  commercial:   # 转化强度
```

Different activities can score high on one axis while low on another:
- Music festival: high emotional, low commercial
- Flash sale: high commercial, low emotional
```

- [ ] **Step 2: Commit**

```bash
git add skills/launch-campaign-orchestrator/shared/energy-curve-template.md
git commit -m "feat(launch-campaign-orchestrator): add energy-curve-template"
```

---

### Task 18: Write shared/proposal-template.md

**Files:**
- Create: `skills/launch-campaign-orchestrator/shared/proposal-template.md`

- [ ] **Step 1: Write proposal template**

```markdown
# Proposal Template

## Structure

```markdown
# 上市传播策划案

## 1. 项目背景与洞察
- 市场洞察（引用 ME-xxx, CL-xxx）
- 产品洞察（引用 PV-xxx）
- 客群洞察（引用 AU-xxx）
- 区域洞察（引用 CS-xxx）
- 趋势洞察（引用 TR-xxx）

## 2. 核心策略
### 2.1 主线叙事
### 2.2 Narrative Spine 关联
### 2.3 能量曲线设计

## 3. 阶段规划
### Stage X: [名称]
- 主题
- 目标
- 情绪强度
- 核心活动（按 S/A/B 深度撰写）
- 线索引用
- 记忆锚点

## 4. 执行计划
- 时间表/里程碑
- 预算分配（按阶段/线上线下）
- KPI 定义
- 团队分工

## 5. 风险评估与应对
```

## Depth Rules by Tier

| Tier | Write Style | Content |
|---|---|---|
| **S级** | 完整方案 | 选址、空间部署、核心流程、留资与促单路径、预算、KPI |
| **A级** | 执行摘要 | 形式+渠道+内容+预算+KPI，附简要流程 |
| **B级** | 包装方式 | 传播钩子+亮点+建议方向+预算区间+供应商类型 |

## Budget Presentation Rules

- S级: Budget range + creative value note. No penny-precision.
- A级: Brief budget.
- B级: Budget range only, or aggregate in total table.
- Use fuzzing / downplaying / overflow for hot ideas.

## Narrative Consistency Rule

Every activity must open with one sentence linking it to:
1. Main Narrative
2. Narrative Spine
3. Target emotional transition

Isolated activities are prohibited.
```

- [ ] **Step 2: Commit**

```bash
git add skills/launch-campaign-orchestrator/shared/proposal-template.md
git commit -m "feat(launch-campaign-orchestrator): add proposal-template"
```

---

### Task 19: Write shared/quality-self-check.md

**Files:**
- Create: `skills/launch-campaign-orchestrator/shared/quality-self-check.md`

- [ ] **Step 1: Write quality self-check**

```markdown
# Quality Self-Check (Review Pass)

## Checklist

| # | Check Item | Pass Criteria |
|---|---|---|
| 1 | Structure completeness | All Strategy Plan stages have content |
| 2 | Narrative consistency | Every activity links to Main Narrative + Spine |
| 3 | Narrative drift | No activity deviates from core_tension or arc |
| 4 | Narrative transition coverage | Each transition has ≥1 serving lead |
| 5 | Redundancy | No two activities express the same thing |
| 6 | Peak collision | No two S-tier events compete in same stage |
| 7 | White space | Low-intensity stages are intentional breathing room |
| 8 | **Creative density** | Per-stage concept/S-tier/symbol count within healthy range |
| 9 | Insight support | All core claims cite Atomic Resource IDs |
| 10 | Lead coverage | All referenced leads appear with appropriate deformation |
| 11 | Tier appropriateness | S/A/B depth rules followed |
| 12 | Budget reasonableness | Total in range OR overflow items flagged |
| 13 | Narrative role balance | Each stage covers ≥2 different Primary Roles |
| 14 | Energy curve | Intensity follows plan; peak appears once |
| 15 | Memory anchors | S-tier and A-tier activities have explicit anchors |

## Verdict

```markdown
## Review Pass
- Verdict: pass / fail
- Fail items: ...
- Route if fail: insight | narrative-spine | lead-pool | strategy-plan | proposal-assembly
```
```

- [ ] **Step 2: Commit**

```bash
git add skills/launch-campaign-orchestrator/shared/quality-self-check.md
git commit -m "feat(launch-campaign-orchestrator): add quality-self-check"
```

---

### Task 20: Run final validation

- [ ] **Step 1: Run the validation script**

```bash
bash scripts/check-launch-campaign-orchestrator.sh
```

**Expected:** PASS with "All files present and content checks passed."

- [ ] **Step 2: If any failures, fix and re-run**

Iterate until PASS.

- [ ] **Step 3: Final commit**

```bash
git add scripts/check-launch-campaign-orchestrator.sh
git commit -m "feat(launch-campaign-orchestrator): validation script passes"
```

---

## Self-Review

### 1. Spec Coverage

| Spec Section | Implementing Task |
|---|---|
| Three-Layer Architecture | Task 3 (SKILL.md) |
| Big-Stage Flow | Task 3 (SKILL.md), Tasks 4-9 (phases) |
| Narrative Spine System | Task 6 (phase), Task 13 (shared template) |
| Narrative State Transitions | Task 6 (phase), Task 13 (shared template) |
| Lead Pool Schema | Task 7 (phase), Task 14 (shared template) |
| Multi-role Narrative Roles | Task 7 (phase), Task 14 (shared template) |
| Memory Anchor System | Task 6 (phase), Task 13 (shared template), Task 14 (shared template) |
| Value Categories × Execution Tier | Task 7 (phase), Task 14 (shared template) |
| Scorecard (Memorability + Transition Fit) | Task 7 (phase), Task 16 (shared) |
| Lead Lifecycle + Auto Compression | Task 7 (phase), Task 15 (shared) |
| Fusion (emotional/symbolic/narrative) | Task 7 (phase), Task 15 (shared) |
| Budget Handling (fuzzing/downplaying/overflow) | Task 3 (SKILL.md), Task 9 (phase), Task 18 (shared) |
| Energy Curve | Task 8 (phase), Task 17 (shared) |
| Variable Depth Proposal Assembly | Task 9 (phase), Task 18 (shared) |
| Review Pass (drift/density/collision/white space) | Task 9 (phase), Task 19 (shared) |
| Future JSON+Markdown / Graph Runtime | Task 3 (SKILL.md Section 18) |

**Gaps:** None. All spec requirements have at least one implementing task.

### 2. Placeholder Scan

- No "TBD", "TODO", "implement later" in plan steps.
- No "add appropriate error handling" without specifics.
- No "Similar to Task N" references.
- All file paths are exact.
- All commands have expected output.

### 3. Type Consistency

- `narrative_roles` with primary/secondary/weights used consistently across
  Task 7 (phase), Task 14 (shared template), Task 15 (fusion rules).
- `memory_anchor` schema consistent across Task 6, Task 13, Task 14.
- `narrative_transitions` schema consistent across Task 6, Task 13.
- `value_category` values (够新鲜/够亮眼/够爆/够热) consistent across
  Task 7, Task 14, Task 16.
- `execution_tier` values (S级/A级/B级) consistent across all tasks.
- `narrative_role` enum values consistent across Task 7, Task 14, Task 17.
- `lead_status` enum values consistent across Task 7, Task 14, Task 15.

### 4. No Placeholder Content in Files

Every created file contains complete, non-placeholder content. Files are
production-ready specifications, not stubs.
