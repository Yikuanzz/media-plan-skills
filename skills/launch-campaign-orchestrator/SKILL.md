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
| `./phases/strategy-plan.md` | Strategy Plan | Build narrative arc + Energy Curve + structure |
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
