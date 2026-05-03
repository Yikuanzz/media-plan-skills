# Launch Campaign Orchestrator — Design Spec

**Date**: 2026-05-03
**Status**: Draft, pending review
**Scope**: New independent skill package for launch campaign proposal generation
**Base**: Evolved from media-plan + regional-auto-launch-plan patterns, not replacing them

---

## 1. Purpose

Build a new skill (`launch-campaign-orchestrator`) that generates launch communication proposals through a **three-layer atomic architecture**:

- **Layer 1 — Insight Engine**: Produces atomic insight resources (product, market, region, audience, trends).
- **Layer 2 — Lead Engine**: Produces a pool of creative leads classified by **Value Category × Execution Tier × Narrative Role**, with optional **Idea Fusion**.
- **Layer 3 — Campaign Composer**: Assembles a **Strategy Plan** (narrative arc + structure) and a **full proposal** with variable depth per execution tier.

Key principles:
- Atomic artifacts are file-persisted and conversation-adjustable at any time.
- Big-stage gates prevent skipping, but **within each stage users can freely expand/adjust** without auto-advancing.
- **Creative heat and highlight value are prioritized over budget precision** — when an idea is hot enough, budget can be fuzzed, downplayed, or allowed to overflow.
- Proposal depth is **not uniform** — S-tier gets full plans, A-tier gets execution summaries, B-tier gets packaging notes.

---

## 2. Three-Layer Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│ Layer 1: Insight Engine                                         │
│   Inputs:  brief, pre-brief search, user conversation           │
│   Outputs: Atomic Resources (PV-xxx, ME-xxx, CL-xxx, AU-xxx,    │
│            CS-xxx, TR-xxx) in 01-insight/                       │
│   Rules:   Each module ≥2 sources, trust-tagged                 │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│ Layer 2: Lead Engine                                            │
│   Inputs:  Insight Atomic Resources, trend search, user prompts │
│   Outputs: Lead Pool (02-leads/02-lead-pool.md) + Scorecard     │
│   Rules:   Value Category × Execution Tier × Narrative Role     │
│            Idea Fusion for compression                          │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│ Layer 3: Campaign Composer                                      │
│   Inputs:  Lead Pool + Strategy Plan (user-confirmed)           │
│   Outputs: 04-proposal.md (variable depth, narrative-consistent)│
│   Rules:   S/A/B tier depth rules, insight-linked claims,       │
│            budget fuzz/overflow allowed for hot ideas           │
└─────────────────────────────────────────────────────────────────┘
```

---

## 3. Big-Stage Flow

```
Intake ──► Insight ──► Lead Pool ──► Strategy Plan ──► Proposal Assembly
  │           │            │               │                  │
  │           ▲            ▲               ▲                  │
  │           │            │               │                  │
  └───────────┴────────────┴───────────────┘                  │
         Within-stage free expansion (no auto-advance)        │
                                                              ▼
                                                        Review Pass
```

| Stage | Core Action | Artifact Files | Exit Condition |
|---|---|---|---|
| 1. Intake | Normalize brief, validate required fields | `00-intake.md` | All research-start fields non-placeholder |
| 2. Insight | Run insight modules, produce atomic resources | `01-insight/*.md` | User says "insight is enough, start leads" |
| 3. Lead Pool | Generate leads by Value Category, score, link to insight | `02-leads/02-lead-pool.md`, `02-scorecard.md` | User says "lead pool is enough, start Strategy Plan" |
| 4. Strategy Plan | Build narrative arc + proposal structure + lead utilization map | `03-strategy-plan.md` | User says "Strategy Plan OK, start assembly" |
| 5. Proposal Assembly | Deep processing: lead deformation, execution detail fill-in, assembly | `04-proposal.md` | Review Pass = pass |

**Within-stage free expansion rules**:
- While in a stage, user requests to add/modify/delete current-stage artifacts are handled inline without advancing.
- User can also request temporary upstream lookups/modifications (e.g., "add a competitor insight" while in Lead Pool stage) — Agent writes the upstream file but **does not change the current stage**.
- Stage advance only triggered by explicit user confirmation ("next", "proceed", "start X").

---

## 4. File Persistence Structure

```
<project-dir>/
├── 00-intake.md
├── 01-insight/
│   ├── 01a-product-value.md
│   ├── 01b-market-environment.md
│   ├── 01c-competitor-landscape.md
│   ├── 01d-customer-segmentation.md
│   ├── 01e-city-signal.md
│   └── 01f-trend-signal.md
├── 02-leads/
│   ├── 02-lead-pool.md
│   └── 02-scorecard.md
├── 03-strategy-plan.md
└── 04-proposal.md
```

---

## 5. Insight Atomic Resources (Layer 1)

Each module file contains:

```markdown
## Module: Product Value

### Key Findings
- Finding 1: ...
- Finding 2: ...

### Atomic Resources
| ID | Type | Content | Source | Trust |
|---|---|---|---|---|
| PV-001 | product_feature | ... | ... | high |
| PV-002 | pricing_window | ... | ... | medium |
```

**ID prefix rules**:
- `PV-xxx` — Product Value
- `ME-xxx` — Market Environment
- `CL-xxx` — Competitor Landscape
- `AU-xxx` — Audience / Customer
- `CS-xxx` — City / Region Signal
- `TR-xxx` — Trend Signal

Downstream leads reference these IDs explicitly. Claims without insight IDs are not allowed in the final proposal.

---

## 6. Lead Pool Schema (Layer 2)

### 6.1 Lead Entry Structure

```yaml
Lead:
  id: L042
  hook: "传播钩子/话题"
  concept: "核心概念"

  # Classification
  value_category: 够新鲜 | 够亮眼 | 够爆 | 够热
  execution_tier: S级 | A级 | B级
  narrative_role: Ignition | Amplifier | Converter | Retainer | Proof | Social Currency | Participation

  # Context
  lifecycle_stage: 悬念期 | 揭秘期 | 上市期 | 延续期 | ...
  target_audience: "具体人群标签"
  budget_level: "预算区间"

  # Linkage
  insight_links: [PV-003, CS-001, AU-002]
  channels: [抖音, 小红书, 微信, 线下, ...]
  kpi_targets: "曝光/互动/留资/转化目标"

  # Fusion (populated during compression)
  fusion_candidates: [L001, L007]
  fusion_strategy: shared_audience | shared_scene | shared_topic
```

### 6.2 Value Categories

| Category | Core Goal |
|---|---|
| **够新鲜** | Create "first-ever" topics, trigger curiosity and UGC |
| **够亮眼** | Produce high-visual-impact assets, suitable for sharing and secondary spread |
| **够爆** | Create controversy /裂变 /福利 events, explode discussion and forwarding |
| **够热** | Ride current hot trends / nodes (AI, World Cup, summer vacation, Huawei, etc.) |

### 6.3 Execution Tiers

| Tier | Definition | Proposal Write Style |
|---|---|---|
| **S级 — 核心引爆事件** | The 1-2 most important activities of the entire campaign, carrying maximum volume or leads | Full plan: site selection, spatial deployment, core process, lead capture + conversion path, budget, KPI |
| **A级 — 圈层渗透/体验触点** | Medium-sized activities precisely reaching target audience, focused on deep communication and experience | Execution summary: format + channel + content + budget + KPI, with brief process |
| **B级 — 借势/包装型线索** | Lightweight, trend-riding or "looks big" packaging actions | Packaging notes: hook + highlight + suggested direction + budget range + supplier type |

### 6.4 Narrative Roles

| Role | Campaign Function | Typical Characteristics |
|---|---|---|
| **Ignition** | Ignite awareness | First-ever / debut /首创, creates "what is this?" curiosity |
| **Amplifier** | Amplify discussion | Fission mechanism, controversy point,福利 hook, drives forwarding |
| **Converter** | Convert to transaction | Test drive, group purchase, pre-sale, leads to deposit or order |
| **Retainer** | Sustain heat | Long-term content, UGC re-creation, community operation |
| **Proof** | Build credibility | Real owner testimony, media review, data endorsement |
| **Social Currency** | Provide shareable identity | High颜值, check-in worthy, boast-worthy social currency |
| **Participation** | Drive UGC participation | Low-barrier participation, users become content producers |

**Quality control rule**: Each stage in the Strategy Plan must cover **≥2 different Narrative Roles**. Prohibited: "all Ignition" or "all Amplifier".

### 6.5 Lead Generation Mode

Leads are generated **by Value Category in batches**, not randomly rolled:

| User Prompt Example | Agent Behavior |
|---|---|
| "给我 5 条够爆的 + 3 条够亮的" | Generate 5 in 够爆 (covering S/A/B) + 3 in 够亮眼 |
| "再来一些够热的，要蹭暑假节点" | Generate in 够热, limit to summer vacation /亲子 / travel trends |
| "把够新鲜的线索都升级到 S 级" | Review existing 够新鲜 leads, judge which warrant S-tier expansion |

Every lead is classified with Value Category, Execution Tier, and Narrative Role **at generation time**, not post-classified.

### 6.6 Scorecard Dimensions

| Dimension | Description | Weight |
|---|---|---|
| Freshness | First-ever /首创 degree | **High** |
| Visual Impact | 颜值 /打卡 / secondary spread potential | **High** |
| Buzz Potential | Controversy /裂变 / discussion potential | **High** |
| Trend Heat | Current temperature of the trend being ridden | **High** |
| Insight Fit | Strength of connection to product / region / audience insights | **High** |
| Tier Appropriateness | Whether S/A/B assignment is reasonable (don't make a快闪 into S-tier) | Medium |
| Budget Feasibility | Rough fit within intake budget range | **Low** — not a veto dimension |

**Budget is secondary**: A lead that is "hot enough" should not be downvoted due to budget concerns. Budget handling uses fuzzing / downplaying / overflow strategies instead.

---

## 7. Lead Compression / Idea Fusion

Executed during the transition from Lead Pool to Strategy Plan (or on user request within Lead Pool stage).

```markdown
## Fusion Group #1: 「AI城市探索季」
- **Candidates**: L001 (AI短视频挑战), L007 (KOL城市打卡), L013 (暑假亲子路线)
- **Fusion Strategy**: shared_scene + shared_topic
- **Mother Event Concept**: 以 AI 为工具邀请用户探索城市隐藏地标，生成短视频打卡
- **Tier Upgrade**: B×3 → S（three lightweight actions fuse into one core引爆 event）
- **Narrative Role**: Ignition + Social Currency
- **Budget Impact**: Budget more concentrated, avoids fragmentation
```

**Compression rules**:
- Candidates sharing audience, scene, or topic are prioritized for fusion.
- Post-fusion mother events can upgrade Execution Tier (multiple B-tier packaging actions can support one S-tier core event).
- Unfused leads are kept as independent touchpoints or discarded.
- Fusion is **not mandatory** — it is a tool to use when the lead pool is too fragmented.

---

## 8. Budget Handling Strategy (Creative Priority)

**Core principle**: Creative heat and highlight value are prioritized. Budget is a constraint to manage, not a veto.

**Three tactics when an idea exceeds normal budget range**:

| Tactic | When to Use | Example |
|---|---|---|
| **Fuzzing** | Replace precise numbers with ranges | "约 8-12 万" instead of "112,500" |
| **Downplaying** | Place budget in appendix or non-prominent position | Budget table at end of section; creative concept occupies visual focus |
| **Overflow** | Explicitly flag high-creative items as budget-exceptions | "此为核心记忆点投入，预算超出常规档位，建议保留" |

**Proposal budget write rules by tier**:

| Tier | Budget Presentation |
|---|---|
| S级 | Budget range + creative value note; no need for penny-precision |
| A级 | Brief budget |
| B级 | Budget range only, or aggregate in total budget table without per-item listing |

---

## 9. Strategy Plan Structure (Layer 3 — Partial)

```markdown
# Strategy Plan

## Main Narrative（主线叙事）
One-sentence core story + three-paragraph expansion

## Proposal Structure（策划案结构）
- Stage count and naming derived from intake + insight + user intent
- NOT preset 3-phase; could be 2-phase, 4-phase, or custom naming
- Each stage: theme, objective, core actions, referenced lead IDs

## Lead Utilization Map（线索使用映射）
| Stage | Value Category | Execution Tier | Narrative Role | Lead ID | Write Style | Deformation Note |
|---|---|---|---|---|---|---|
| 悬念期 | 够新鲜 | S级 | Ignition | L001 | 完整方案 | AI大赛扩展为全网赛制 |
| 悬念期 | 够热 | B级 | Amplifier | L003 | 包装方式 | 蹭暑假做"家庭出行季"概念 |
| ... | ... | ... | ... | ... | ... | ... |

## Narrative Role Coverage Check
- [ ] 每个阶段覆盖 ≥2 种 Narrative Role
- [ ] S级事件总数 ≤ 2-3（budget and rhythm constraint）
- [ ] B级线索占比不过高（避免策划案"虚"）
```

---

## 10. Proposal Assembly Deep Processing Rules (Layer 3 — Full)

**Input**: `03-strategy-plan.md` structure + `02-leads/02-lead-pool.md` lead library + `01-insight/` atomic resources.

**Processing rules**:

1. **Tier-based depth**:
   - **S-tier**: Expand from micro-plan to full event plan (site, space, process, lead capture, conversion path, detailed budget, KPI).
   - **A-tier**: Expand to execution summary (format + channel + content + budget + KPI, with brief process).
   - **B-tier**: Clarify packaging approach (hook + highlight + direction + budget range + supplier type).

2. **Narrative consistency**: Every activity in every stage must open with one sentence explaining how it serves the Main Narrative. Isolated activities are prohibited.

3. **Insight citation**: Every claim involving product selling points, regional characteristics, or audience insights must cite the Atomic Resource ID (e.g., "来源于洞察 PV-003"). Claims without insight support are prohibited.

4. **Execution detail fill-in**: Timetable (milestones), budget allocation table (by stage / online-offline), KPI definitions (exposure / engagement / leads / conversion), team assignments — generated during assembly for areas not covered by leads.

5. **Budget flexibility**: Apply fuzzing / downplaying / overflow per Section 8 when creative value justifies it.

6. **Review Pass**: Post-assembly quality check covering structure completeness, narrative consistency, insight citation coverage, lead utilization coverage, and budget reasonableness.

---

## 11. Global Hard Gates

- Do not enter **Insight** until intake has all research-start fields.
- Do not enter **Lead Pool** until Insight has ≥3 modules with Key Findings and ≥2 Atomic Resources per module.
- Do not enter **Strategy Plan** until Lead Pool has ≥10 valid leads covering ≥2 Value Categories and ≥2 Execution Tiers.
- Do not enter **Proposal Assembly** until Strategy Plan is explicitly user-confirmed.
- Do not declare completion until `04-proposal.md` passes Review Pass.
- **Budget is not a hard veto**: A lead or plan may exceed intake budget range if its creative value is high enough, using fuzzing / downplaying / overflow strategies.

---

## 12. Review Pass Criteria

| Check Item | Description |
|---|---|
| Structure completeness | All stages defined in Strategy Plan have corresponding content |
| Narrative consistency | Every activity explicitly links to Main Narrative |
| Insight support | All core claims cite Atomic Resource IDs |
| Lead coverage | All Strategy Plan referenced leads appear in Proposal with appropriate deformation |
| Tier appropriateness | S/A/B depth rules followed; no over-elaboration on B-tier items |
| Budget reasonableness | Total within rough range OR high-creative overflow items explicitly flagged |
| Narrative role balance | Each stage covers ≥2 different Narrative Roles |

---

## 13. Relationship to Existing Skills

- `media-plan` and `regional-auto-launch-plan` remain unchanged.
- New skill can **reference** existing shared contracts (e.g., `source-trust-policy.md`, `query-playbook.md`) for inspiration, but **does not runtime-depend** on them.
- New skill maintains its own `shared/` directory with self-contained contracts.
- Routing: If a brief hits both new skill and `regional-auto-launch-plan`, the host decides based on scope — new skill focuses on **communication proposal generation**, old skill focuses on **full-case execution + operations**.

---

## 14. Phase Switch Protocol

Before entering each stage, read its phase file and required shared contracts, then emit:

```markdown
## [Phase: <StageName>]
Read: <phase path> + <shared paths>
Write path: <project-dir>/<target-file-or-files>
Task: <one-line objective for this phase>
```

Do not skip required reads.

---

## 15. Within-Stage Expansion Protocol

When user requests modifications within the current stage:
1. Identify the target artifact file.
2. Apply the modification (add / edit / delete).
3. Emit a brief change summary.
4. **Do not** emit "advancing to next stage" unless user explicitly requests it.

When user requests upstream modifications while in a downstream stage:
1. Allow writing to upstream files (e.g., modify `01-insight/` while in Lead Pool stage).
2. Emit: "已更新 upstream 文件 X，当前仍在 [Current Stage] 阶段。"
3. Continue awaiting stage-specific instructions.

---

## 16. Open Questions (to resolve during implementation planning)

1. Exact shared contract file list for the new skill's `shared/` directory.
2. Whether to include a pre-brief search phase (like existing skills) or start directly at intake.
3. Maximum lead pool size before compression is recommended.
4. Whether to persist Fusion Groups as separate files or inline in `02-lead-pool.md`.
5. Review Pass failure routing: which upstream stage to return to for each failure mode.
