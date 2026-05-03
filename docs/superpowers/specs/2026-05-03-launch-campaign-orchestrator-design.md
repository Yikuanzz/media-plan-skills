# Launch Campaign Orchestrator — Design Spec

**Date**: 2026-05-03
**Status**: Draft, pending review
**Scope**: New independent skill package for launch campaign proposal generation
**Base**: Evolved from media-plan + regional-auto-launch-plan patterns, not replacing them

---

## 1. Purpose

Build a new skill (`launch-campaign-orchestrator`) that generates launch communication proposals through a **three-layer atomic architecture** governed by a **Narrative Spine** with **state-machine-driven emotional transitions**:

- **Narrative Spine**: The worldview, emotional arc, and symbolic system that all leads and stages must align with. Includes **Narrative State Transitions** — the triggers that move audience from one emotional state to the next.
- **Layer 1 — Insight Engine**: Produces atomic insight resources (product, market, region, audience, trends).
- **Layer 2 — Lead Engine**: Produces a pool of creative leads classified by **Value Category × Execution Tier × Narrative Roles (multi-role with weights)**, with **Memory Anchors**, **Lead Lifecycle** management, and optional **Idea Fusion**.
- **Layer 3 — Campaign Composer**: Assembles a **Strategy Plan** (narrative arc + structure + **Energy Curve**) and a **full proposal** with variable depth per execution tier.

Key principles:
- Atomic artifacts are file-persisted and conversation-adjustable at any time.
- Big-stage gates prevent skipping, but **within each stage users can freely expand/adjust** without auto-advancing.
- **Creative heat, memorability, and highlight value are prioritized over budget precision** — when an idea is hot enough, budget can be fuzzed, downplayed, or allowed to overflow.
- Proposal depth is **not uniform** — S-tier gets full plans, A-tier gets execution summaries, B-tier gets packaging notes.
- **Narrative Spine is the single source of truth for coherence** — every lead, every stage, every activity must hang from the Spine.
- **Narrative is a state machine, not a list** — emotions transition via specific triggers; leads must serve those transitions.

---

## 2. Narrative Spine System

### 2.1 Position in the Flow

Narrative Spine is built **immediately after Insight completes** and **before Lead Pool generation begins**. It serves as the "creative north star" for all downstream work.

```
Insight ──► Narrative Spine ──► Lead Pool ──► Strategy Plan ──► Proposal Assembly
                ↑
                │ All leads MUST narrative-align AND serve a state transition
```

### 2.2 Spine Schema

```yaml
NarrativeSpine:
  core_tension: "城市太熟悉，但其实你从未真正探索"

  emotional_arc:
    - curiosity
    - participation
    - discovery
    - belonging

  narrative_transitions:           # NEW: State machine, not just a list
    - from: curiosity
      to: participation
      trigger_types:
        - ugc_invite
        - social_proof
        - reward_unlock
      failure_modes:
        - passive_viewing
        - high_participation_cost
      lead_requirements:
        - must_lower_participation_barrier
        - must_provide_immediate_feedback

    - from: participation
      to: discovery
      trigger_types:
        - personalized_result
        - unexpected_reveal
        - peer_comparison
      failure_modes:
        - generic_experience
        - no_surprise_moment

    - from: discovery
      to: belonging
      trigger_types:
        - shared_identity
        - collective_moment
        - exclusive_access
      failure_modes:
        - isolated_experience
        - no_community_bridge

  symbolic_objects:
    - AI地图
    - 城市彩蛋
    - 夜间光点

  narrative_keywords:
    - 探索
    - 解锁
    - 城市隐藏面

  story_world: "AI城市探索宇宙"
  protagonist: "..."
  audience_role: "城市探索玩家"

  memory_anchor:                    # NEW: What users will remember
    anchor: "城市隐藏光点"
    type: visual                    # visual | slogan | interaction | ritual | collectible
    memorability_test: "用户一年后还能不能描述这个画面？"
```

### 2.3 Spine Quality Gates

- Core tension must be a **single sentence** with clear emotional polarity.
- Emotional arc must have **≥3 distinct emotional states** with progression.
- **Narrative transitions must define trigger_types and failure_modes** for each step.
- Symbolic objects must be **concrete and visualizable** (not abstract concepts).
- Story world must be **named** (gives the campaign a universe feel).
- Audience role must be **active** (user does something, not just "target audience").
- Memory anchor must pass the **"one year test"** — can users still describe it a year later?

### 2.4 Lead Alignment Requirement

Every lead in the pool must include:

```yaml
narrative_alignment:
  serves_transition: "curiosity → participation"   # Which transition it drives
  emotional_target: participation                  # Which emotional state it targets
  trigger_mechanism: "ugc_invite"                  # Which trigger type it activates

story_function: "让用户第一次进入世界观"           # Its function within the story world
```

Leads without narrative alignment or without serving a defined transition are **rejected at generation time**.

---

## 3. Three-Layer Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│ Narrative Spine (governs all layers)                            │
│   core_tension / emotional_arc / symbolic_objects / story_world │
│   narrative_transitions (state machine)                         │
│   memory_anchor                                                 │
└─────────────────────────────────────────────────────────────────┘
                              ↓
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
│   Inputs:  Insight + Narrative Spine + trend search + user      │
│   Outputs: Lead Pool (02-leads/02-lead-pool.md) + Scorecard     │
│   Rules:   Value Category × Execution Tier × Narrative Roles    │
│            Memory Anchors per lead                              │
│            Lead Lifecycle (active/archived/fused/deprecated)    │
│            Idea Fusion (emotional/symbolic/narrative basis)     │
│            Auto Compression when pool exceeds thresholds        │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│ Layer 3: Campaign Composer                                      │
│   Inputs:  Lead Pool + Strategy Plan (user-confirmed)           │
│   Outputs: 04-proposal.md (variable depth, narrative-consistent)│
│   Rules:   S/A/B tier depth rules, insight-linked claims,       │
│            Energy Curve design, budget fuzz/overflow allowed    │
└─────────────────────────────────────────────────────────────────┘
```

---

## 4. Big-Stage Flow

```
Intake ──► Insight ──► Narrative Spine ──► Lead Pool ──► Strategy Plan ──► Proposal Assembly
  │           │             │                  │               │                  │
  │           ▲             ▲                  ▲               ▲                  │
  │           │             │                  │               │                  │
  └───────────┴─────────────┴──────────────────┴───────────────┘                  │
              Within-stage free expansion (no auto-advance)                       │
                                                                                  ▼
                                                                            Review Pass
```

| Stage | Core Action | Artifact Files | Exit Condition |
|---|---|---|---|
| 1. Intake | Normalize brief, validate required fields | `00-intake.md` | All research-start fields non-placeholder |
| 2. Insight | Run insight modules, produce atomic resources | `01-insight/*.md` | All modules complete with ≥2 Atomic Resources each |
| 3. Narrative Spine | Build worldview, emotional arc, state transitions, memory anchor | `01-insight/01g-narrative-spine.md` | Spine passes all quality gates |
| 4. Lead Pool | Generate leads aligned to Spine + transitions, score, manage lifecycle | `02-leads/02-lead-pool.md`, `02-scorecard.md` | User says "lead pool is enough, start Strategy Plan" |
| 5. Strategy Plan | Build narrative arc + energy curve + proposal structure + lead utilization map | `03-strategy-plan.md` | User says "Strategy Plan OK, start assembly" |
| 6. Proposal Assembly | Deep processing: lead deformation, execution detail fill-in, energy curve implementation | `04-proposal.md` | Review Pass = pass |

**Within-stage free expansion rules**:
- While in a stage, user requests to add/modify/delete current-stage artifacts are handled inline without advancing.
- User can also request temporary upstream lookups/modifications — Agent writes the upstream file but **does not change the current stage**.
- Stage advance only triggered by explicit user confirmation ("next", "proceed", "start X").

---

## 5. File Persistence Structure

```
<project-dir>/
├── 00-intake.md
├── 01-insight/
│   ├── 01a-product-value.md
│   ├── 01b-market-environment.md
│   ├── 01c-competitor-landscape.md
│   ├── 01d-customer-segmentation.md
│   ├── 01e-city-signal.md
│   ├── 01f-trend-signal.md
│   └── 01g-narrative-spine.md
├── 02-leads/
│   ├── 02-lead-pool.md
│   └── 02-scorecard.md
├── 03-strategy-plan.md
└── 04-proposal.md
```

---

## 6. Insight Atomic Resources (Layer 1)

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

## 7. Lead Pool Schema (Layer 2)

### 7.1 Lead Entry Structure

```yaml
Lead:
  id: L042
  hook: "传播钩子/话题"
  concept: "核心概念"

  # Classification
  value_category: 够新鲜 | 够亮眼 | 够爆 | 够热
  execution_tier: S级 | A级 | B级

  # Narrative Roles (multi-role with weights)
  narrative_roles:
    primary: Ignition
    secondary:
      - Participation
      - Social Currency
    role_weights:
      Ignition: 0.7
      Participation: 0.2
      Social Currency: 0.1

  # Narrative Spine Alignment (MANDATORY)
  narrative_alignment:
    serves_transition: "curiosity → participation"
    emotional_target: participation
    trigger_mechanism: "ugc_invite"
  story_function: "让用户第一次进入世界观"

  # Memory Anchor (NEW)
  memory_anchor:
    anchor: "深夜城市光点跑"
    type: visual                          # visual | slogan | interaction | ritual | collectible
    memorability_test: "一年后还能不能描述这个画面？"
    one_sentence_recall: "用AI地图解锁城市隐藏光点"

  # Context
  lifecycle_stage: 悬念期 | 揭秘期 | 上市期 | 延续期 | ...
  target_audience: "具体人群标签"
  budget_level: "预算区间"

  # Linkage
  insight_links: [PV-003, CS-001, AU-002]
  channels: [抖音, 小红书, 微信, 线下, ...]
  kpi_targets: "曝光/互动/留资/转化目标"

  # Lifecycle Management
  lead_status: active | archived | fused | deprecated | rejected
  lead_confidence: 85      # 0-100
  lead_uniqueness: 90      # 0-100
  lead_overlap_score: 15   # 0-100

  # Fusion (populated during compression)
  fusion_candidates: [L001, L007]
  fusion_strategy: emotional | symbolic | narrative | audience | scene | topic
```

### 7.2 Value Categories

| Category | Core Goal |
|---|---|
| **够新鲜** | Create "first-ever" topics, trigger curiosity and UGC |
| **够亮眼** | Produce high-visual-impact assets, suitable for sharing and secondary spread |
| **够爆** | Create controversy /裂变 /福利 events, explode discussion and forwarding |
| **够热** | Ride current hot trends / nodes (AI, World Cup, summer vacation, Huawei, etc.) |

### 7.3 Execution Tiers

| Tier | Definition | Proposal Write Style |
|---|---|---|
| **S级 — 核心引爆事件** | The 1-2 most important activities of the entire campaign, carrying maximum volume or leads | Full plan: site selection, spatial deployment, core process, lead capture + conversion path, budget, KPI |
| **A级 — 圈层渗透/体验触点** | Medium-sized activities precisely reaching target audience, focused on deep communication and experience | Execution summary: format + channel + content + budget + KPI, with brief process |
| **B级 — 借势/包装型线索** | Lightweight, trend-riding or "looks big" packaging actions | Packaging notes: hook + highlight + suggested direction + budget range + supplier type |

### 7.4 Narrative Roles

| Role | Campaign Function | Typical Characteristics |
|---|---|---|
| **Ignition** | Ignite awareness | First-ever / debut /首创, creates "what is this?" curiosity |
| **Amplifier** | Amplify discussion | Fission mechanism, controversy point,福利 hook, drives forwarding |
| **Converter** | Convert to transaction | Test drive, group purchase, pre-sale, leads to deposit or order |
| **Retainer** | Sustain heat | Long-term content, UGC re-creation, community operation |
| **Proof** | Build credibility | Real owner testimony, media review, data endorsement |
| **Social Currency** | Provide shareable identity | High颜值, check-in worthy, boast-worthy social currency |
| **Participation** | Drive UGC participation | Low-barrier participation, users become content producers |

**Quality control rule**: Each stage in the Strategy Plan must cover **≥2 different primary Narrative Roles**. Prohibited: "all Ignition" or "all Amplifier".

**Multi-role rule**: A single lead can serve multiple roles. Role weights must sum to 1.0. Primary role weight must be ≥0.5.

### 7.5 Memory Anchor System

Every lead, especially S-tier and A-tier, must define a memory anchor:

```yaml
memory_anchor:
  anchor: "一句话描述用户会记住什么"
  type: visual | slogan | interaction | ritual | collectible
  memorability_test: "一年后还能不能描述？"
  one_sentence_recall: "用AI地图解锁城市隐藏光点"
```

**Memory anchor types**:
- **visual**: A specific image or scene (e.g., "网易云乐评墙")
- **slogan**: A sticky phrase (e.g., "可口可乐名字瓶")
- **interaction**: A specific participatory moment (e.g., "宜家睡一晚")
- **ritual**: A repeatable behavioral pattern
- **collectible**: A physical or digital collectible item

**Quality gate**: S-tier leads MUST have a memory anchor that passes the "one year test".

### 7.6 Lead Generation Mode

Leads are generated **by Value Category in batches**, not randomly rolled:

| User Prompt Example | Agent Behavior |
|---|---|
| "给我 5 条够爆的 + 3 条够亮的" | Generate 5 in 够爆 (covering S/A/B) + 3 in 够亮眼 |
| "再来一些够热的，要蹭暑假节点" | Generate in 够热, limit to summer vacation /亲子 / travel trends |
| "把够新鲜的线索都升级到 S 级" | Review existing 够新鲜 leads, judge which warrant S-tier expansion |

Every lead is classified with Value Category, Execution Tier, and Narrative Roles **at generation time**, not post-classified.

### 7.7 Scorecard Dimensions

| Dimension | Description | Weight |
|---|---|---|
| **Freshness** | First-ever /首创 degree | High |
| **Visual Impact** | 颜值 /打卡 / secondary spread potential | High |
| **Buzz Potential** | Controversy /裂变 / discussion potential | High |
| **Trend Heat** | Current temperature of the trend being ridden | High |
| **Insight Fit** | Strength of connection to product / region / audience insights | High |
| **Memorability** | One-sentence memory anchor; passes "one year test" | **High** |
| **Transition Fit** | How well it serves a Narrative State Transition | **High** |
| Tier Appropriateness | Whether S/A/B assignment is reasonable | Medium |
| Budget Feasibility | Rough fit within intake budget range | **Low** — not a veto dimension |

**Budget is secondary**: A lead that is "hot enough" should not be downvoted due to budget concerns. Budget handling uses fuzzing / downplaying / overflow strategies instead.

---

## 8. Lead Lifecycle & Auto Compression System

### 8.1 Lead Status States

| Status | Meaning |
|---|---|
| **active** | Available for Strategy Plan selection |
| **archived** | Kept for reference but not actively considered |
| **fused** | Merged into a Fusion Group, original lead no longer standalone |
| **deprecated** | Outdated or superseded by newer leads |
| **rejected** | Explicitly removed from pool |

### 8.2 Quality Metrics

- **lead_confidence** (0-100): Agent's confidence that this lead is viable
- **lead_uniqueness** (0-100): How distinct this lead is from others in the pool
- **lead_overlap_score** (0-100): Similarity to other leads (high = likely redundant)

### 8.3 Auto Compression Trigger

```yaml
compression_trigger:
  max_active_leads: 40
  duplication_threshold: 0.7
  lifecycle_action:
    - When active leads > 40: Suggest fusion or archive lowest-confidence leads
    - When overlap_score > 70 for any pair: Suggest fusion for that pair
    - When new batch added: Auto-calculate overlap with existing pool
```

**Agent behavior on trigger**:
1. Identify high-overlap lead pairs.
2. Propose Fusion Groups with `fusion_basis` rationale.
3. If user approves, mark original leads as `fused`, create Fusion Group.
4. If user rejects, mark lower-confidence lead as `archived`.

---

## 9. Lead Compression / Idea Fusion

Executed during the transition from Lead Pool to Strategy Plan (or on user request / Auto Compression Trigger).

```markdown
## Fusion Group #1: 「AI城市探索季」
- **Candidates**: L001 (AI短视频挑战), L007 (KOL城市打卡), L013 (暑假亲子路线)
- **Fusion Basis**:
  - emotional: "城市夜晚重新被点亮" — all three evoke nighttime urban wonder
  - symbolic: "光点" as shared symbolic object from Narrative Spine
  - narrative: All serve the "discovery" node of emotional arc
- **Fusion Strategy**: emotional + symbolic + narrative
- **Mother Event Concept**: 以 AI 为工具邀请用户探索城市隐藏地标，生成短视频打卡
- **Tier Upgrade**: B×3 → S（three lightweight actions fuse into one core引爆 event）
- **Narrative Roles**: Ignition (0.6) + Social Currency (0.3) + Participation (0.1)
- **Memory Anchor**: "AI地图上的城市光点" — visual, passes one-year test
- **Budget Impact**: Budget more concentrated, avoids fragmentation
```

**Fusion basis priority**:
1. **emotional** (highest) — Leads share the same emotional beat
2. **symbolic** (highest) — Leads share symbolic objects from Narrative Spine
3. **narrative** — Leads serve the same story function
4. audience — Shared target audience
5. scene — Shared physical or digital space
6. topic — Shared topical theme

**Compression rules**:
- Candidates sharing emotional/symbolic basis are prioritized for fusion.
- Post-fusion mother events can upgrade Execution Tier (multiple B-tier packaging actions can support one S-tier core event).
- Unfused leads are kept as independent touchpoints or archived.
- Fusion is **not mandatory** — it is a tool to use when the lead pool is too fragmented.

---

## 10. Budget Handling Strategy (Creative Priority)

**Core principle**: Creative heat, memorability, and highlight value are prioritized. Budget is a constraint to manage, not a veto.

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

## 11. Strategy Plan Structure (Layer 3 — Partial)

```markdown
# Strategy Plan

## Main Narrative（主线叙事）
One-sentence core story + three-paragraph expansion

## Narrative Spine Reference
Explicit link to `01-insight/01g-narrative-spine.md` — how this plan realizes the Spine

## Narrative Transition Map（叙事迁移映射）
| From | To | Trigger | Serving Leads | Failure Guard |
|---|---|---|---|---|
| curiosity | participation | ugc_invite | L001, L003 | 必须降低参与门槛 |
| participation | discovery | unexpected_reveal | L012 | 必须制造惊喜时刻 |
| discovery | belonging | shared_identity | L015 | 必须有社群连接点 |

## Energy Curve（能量曲线）
| Stage | Emotion | Intensity | Narrative Role Mix | Rationale |
|---|---|---|---|---|
| 悬念期 | curiosity | 40 | Ignition + Participation | Low-intensity hook, invite entry |
| 揭秘期 | excitement | 80 | Amplifier + Social Currency | Build momentum, create shareable moments |
| 上市期 | explosion | 100 | Converter + Proof | Peak conversion, credibility lock |
| 延续期 | belonging | 60 | Retainer + Participation | Sustainable community, UGC loop |

**Energy Curve design principles**:
- Not every stage is at 100. Controlled peaks and valleys create rhythm.
- Intensity 100 should appear **only once** (the launch peak).
- Adjacent stages should have **≥20 intensity difference** to create contrast.
- White space (low-intensity breathing room) is intentional, not a gap.

**Future: Multi-axis Energy** (v2+):
```yaml
energy_curve:
  emotional:     # 情绪强度
  social:        # 社交讨论度
  commercial:    # 转化强度
```
Different activities can score high on one axis while low on another (e.g., music festival = high emotional, low commercial; flash sale = high commercial, low emotional).

## Proposal Structure（策划案结构）
- Stage count and naming derived from intake + insight + user intent + energy curve
- NOT preset 3-phase; could be 2-phase, 4-phase, or custom naming
- Each stage: theme, objective, core actions, referenced lead IDs, target intensity

## Lead Utilization Map（线索使用映射）
| Stage | Value Category | Execution Tier | Primary Role | Lead ID | Write Style | Deformation Note | Energy Target | Memory Anchor |
|---|---|---|---|---|---|---|---|---|
| 悬念期 | 够新鲜 | S级 | Ignition | L001 | 完整方案 | AI大赛扩展为全网赛制 | intensity: 40 | "AI地图光点" |
| 悬念期 | 够热 | B级 | Amplifier | L003 | 包装方式 | 蹭暑假做"家庭出行季"概念 | intensity: 40 | — |
| ... | ... | ... | ... | ... | ... | ... | ... | ... |

## Narrative Role Coverage Check
- [ ] 每个阶段覆盖 ≥2 种不同的 Primary Narrative Role
- [ ] S级事件总数 ≤ 2-3（budget and rhythm constraint）
- [ ] B级线索占比不过高（避免策划案"虚"）
- [ ] Energy Curve 有明确的峰值和留白
- [ ] 每个阶段有至少 1 个 Memory Anchor
```

---

## 12. Proposal Assembly Deep Processing Rules (Layer 3 — Full)

**Input**: `03-strategy-plan.md` structure + `02-leads/02-lead-pool.md` lead library + `01-insight/` atomic resources + `01-insight/01g-narrative-spine.md`.

**Processing rules**:

1. **Tier-based depth**:
   - **S-tier**: Expand from micro-plan to full event plan (site, space, process, lead capture, conversion path, detailed budget, KPI).
   - **A-tier**: Expand to execution summary (format + channel + content + budget + KPI, with brief process).
   - **B-tier**: Clarify packaging approach (hook + highlight + direction + budget range + supplier type).

2. **Narrative consistency**: Every activity in every stage must open with one sentence explaining how it serves the Main Narrative, the Narrative Spine, AND the target emotional transition. Isolated activities are prohibited.

3. **Energy curve implementation**: Each stage's activities must collectively deliver the target intensity from Strategy Plan. If a stage targets intensity 40, don't pack three S-tier events into it.

4. **Insight citation**: Every claim involving product selling points, regional characteristics, or audience insights must cite the Atomic Resource ID (e.g., "来源于洞察 PV-003"). Claims without insight support are prohibited.

5. **Execution detail fill-in**: Timetable (milestones), budget allocation table (by stage / online-offline), KPI definitions (exposure / engagement / leads / conversion), team assignments — generated during assembly for areas not covered by leads.

6. **Budget flexibility**: Apply fuzzing / downplaying / overflow per Section 10 when creative value justifies it.

7. **Review Pass**: Post-assembly quality check per Section 13.

---

## 13. Review Pass Criteria

| Check Item | Description |
|---|---|
| Structure completeness | All stages defined in Strategy Plan have corresponding content |
| Narrative consistency | Every activity explicitly links to Main Narrative AND Narrative Spine |
| Narrative drift | No activity deviates from the core_tension or emotional_arc |
| Narrative transition coverage | Each state transition has at least one lead serving it |
| Redundancy | No two activities express the same thing in different packaging |
| Peak collision | No two S-tier events compete for attention within the same stage |
| White space | Low-intensity stages are intentional breathing room, not gaps |
| Creative density | Per-stage concept count, new term count, symbol count, S-tier count are within healthy range; not "every page is explosive" |
| Insight support | All core claims cite Atomic Resource IDs |
| Lead coverage | All Strategy Plan referenced leads appear in Proposal with appropriate deformation |
| Tier appropriateness | S/A/B depth rules followed; no over-elaboration on B-tier items |
| Budget reasonableness | Total within rough range OR high-creative overflow items explicitly flagged |
| Narrative role balance | Each stage covers ≥2 different Primary Narrative Roles |
| Energy curve | Intensity progression follows Strategy Plan; peak appears once |
| Memory anchors | S-tier and A-tier activities have explicit memory anchors |

---

## 14. Global Hard Gates

- Do not enter **Insight** until intake has all research-start fields.
- Do not enter **Narrative Spine** until Insight has ≥3 modules with Key Findings and ≥2 Atomic Resources per module.
- Do not enter **Lead Pool** until Narrative Spine passes all quality gates.
- Do not enter **Strategy Plan** until Lead Pool has ≥10 valid leads covering ≥2 Value Categories and ≥2 Execution Tiers.
- Do not enter **Proposal Assembly** until Strategy Plan is explicitly user-confirmed.
- Do not declare completion until `04-proposal.md` passes Review Pass.
- **Budget is not a hard veto**: A lead or plan may exceed intake budget range if its creative value is high enough, using fuzzing / downplaying / overflow strategies.

---

## 15. Relationship to Existing Skills

- `media-plan` and `regional-auto-launch-plan` remain unchanged.
- New skill can **reference** existing shared contracts (e.g., `source-trust-policy.md`, `query-playbook.md`) for inspiration, but **does not runtime-depend** on them.
- New skill maintains its own `shared/` directory with self-contained contracts.
- Routing: If a brief hits both new skill and `regional-auto-launch-plan`, the host decides based on scope — new skill focuses on **communication proposal generation**, old skill focuses on **full-case execution + operations**.

---

## 16. Phase Switch Protocol

Before entering each stage, read its phase file and required shared contracts, then emit:

```markdown
## [Phase: <StageName>]
Read: <phase path> + <shared paths>
Write path: <project-dir>/<target-file-or-files>
Task: <one-line objective for this phase>
```

Do not skip required reads.

---

## 17. Within-Stage Expansion Protocol

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

## 18. Future Evolution: Narrative Graph Runtime

**Current state (V1)**: File-driven planning system. Markdown artifacts are human-readable, editable, and suitable for proposals.

**Future state (V2+)**: Evolve from tree-structured files to a **Narrative Knowledge Graph**:

```
Nodes:
  - leads
  - emotions (emotional_arc states)
  - symbols (symbolic_objects)
  - memories (memory_anchors)
  - roles (narrative_roles)
  - stages (lifecycle stages)
  - transitions (narrative_transitions)

Edges:
  - amplifies
  - transitions_to
  - reinforces
  - overlaps_with
  - resolves
  - serves
```

**Why a graph?**
- **Overlap analysis**: Computing `lead_overlap_score` via graph similarity is more accurate than keyword matching.
- **Role balance**: Checking stage coverage of narrative roles becomes a graph traversal problem.
- **Fusion quality**: Emotional/symbolic fusion is a graph edge weighting problem.
- **Energy routing**: Multi-axis energy curves are graph property propagation.
- **Narrative drift detection**: Detecting deviation from core_tension is a graph centrality problem.

**Implementation path**:
- V1: Markdown-only (current spec)
- V2: Markdown (presentation) + JSON (runtime) dual-track
- V3: Narrative Graph Runtime with autonomous Creative Director capabilities

**Candidate JSON runtime files**:
- `runtime/lead-pool.json` — Structured lead data for programmatic scoring and fusion
- `runtime/narrative-spine.json` — Machine-readable spine for alignment checks
- `runtime/strategy-graph.json` — Stage dependencies and energy curve data
- `runtime/fusion-registry.json` — Fusion group metadata
- `runtime/memory-anchors.json` — Memory anchor catalog for memorability scoring

---

## 19. Open Questions (to resolve during implementation planning)

1. Exact shared contract file list for the new skill's `shared/` directory.
2. Whether to include a pre-brief search phase (like existing skills) or start directly at intake.
3. Whether Fusion Groups should be persisted as separate files or inline in `02-lead-pool.md`.
4. Review Pass failure routing: which upstream stage to return to for each failure mode.
5. How to implement `lead_overlap_score` calculation (semantic similarity vs. keyword overlap).
6. Whether to auto-generate `lead_uniqueness` at creation time or on-demand during compression.
7. How to validate Narrative Transition trigger_types against actual lead designs.
