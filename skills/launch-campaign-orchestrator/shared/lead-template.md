# Lead Template

## Lead Entry Schema

```yaml
Lead:
  id: L042
  hook: "传播钩子/话题"
  concept: "核心概念"

  # Provenance from the divergent generation phase (Activity Card Draw).
  # ≥60% of active leads in the final pool must have at least one HS-* in hotspot_lineage.
  hotspot_lineage: [HS-007, HS-009]      # Hotspot atoms (from `{artifact_root}/01h-hotspot-harvest.md`) that fueled this lead
  divergence_card: D-CC-3                # The card from activity-card-deck.md that drew this idea
  source_raw_ideas: [RI-018, RI-025]     # Raw ideas (from `{artifact_root}/02a-activity-cards.md`) clustered into this lead

  # Hotspot packaging (anti–1+1). See `./shared/hotspot-angle-playbook.md`.
  # When value_category is 够热 OR hotspot_lineage non-empty OR insight_links contains any TR-* / CS-* ID:
  #   all four fields below must be substantive (no placeholder slogans).
  # Else: public_heat_signal / angle_of_entry / shallow_stack_check may be "n/a — <one-line reason>";
  #   spine_bridge stays mandatory and must still match narrative_alignment.
  public_heat_signal: "公域在讨论什么；引 HS-xxx / TR-xxx / CS-xxx；或非借势类的 n/a+理由"
  angle_of_entry: "一句话切入机制（结构关系，不是「热点+卖点」并排）；非公域驱动时写 n/a+单一主轴"
  spine_bridge: "本条如何兑现 narrative_alignment（与 serves_transition / trigger_mechanism 一致）"
  shallow_stack_check: "为何不是浅层堆砌；或非借势线索如何自证叙事单一主轴"

  value_category: 够新鲜 | 够亮眼 | 够爆 | 够热
  execution_tier: S级 | A级 | B级

  # Spine reconciliation (from Lead Pool Packaging Step 3).
  packaging_pass: direct | reworked | n/a
  rework_note: |
    # Required only when packaging_pass: reworked
    # Format:
    # 原始 crazy_dose: "..."
    # Spine 摩擦点: "..."
    # 采用策略: tone_shift | audience_widen | mechanism_reanchor | symbol_reuse | dose_flip
    # 保留: "..."
    # 改写: "..."

  # Dual-dose preservation (from Activity Card Draw).
  # Strategy Plan picks one dose per stage based on energy curve.
  crazy_dose: |
    最敢/最反应/最病毒的版本——可放飞 budget / 调性 / 央企谨慎
  safe_dose: |
    最稳/最可签合同/最有证据的版本——同一机制的可落地变体

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

  insight_links: [PV-003, CS-001, AU-002, HS-007]   # HS-* 也允许出现，与 hotspot_lineage 可重叠
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

**Note:** 4 大范畴在 Activity Card Draw 阶段是**叠加发散的角度卡而非互斥分类**——一条 raw idea 可同时被 够新鲜 + 够爆 切；进入 Lead Pool Packaging 后，每条 lead 应取**主导的一个** `value_category`（多向标记请挪到 scorecard 的多维度评分中），便于 Strategy Plan 做 stage 分配。

**Invalid “够热” lead:** Missing any of `public_heat_signal`, `angle_of_entry`, `spine_bridge`, or `shallow_stack_check` with substantive (non-placeholder) content—**or** any of these contradict `narrative_alignment`. Generic lines like「结合时下热点」without a mechanism count as invalid.

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

## Packaging Pass Reference

| `packaging_pass` | When to use | Required fields |
|---|---|---|
| `direct` | Source raw idea has `spine_friction: low`, lead serves a Spine transition without rework | `narrative_alignment`, `spine_bridge` |
| `reworked` | Source raw idea had `spine_friction: medium\|high`; lead was modified to fit Spine while preserving the original mechanism | `narrative_alignment`, `spine_bridge`, **`rework_note`** (mandatory, non-placeholder) |
| `n/a` | Lead originated outside Activity Card Draw (e.g. legacy upstream Spine-driven lead, must be marked) | `narrative_alignment`, `spine_bridge`; flag for review |

A pool with **zero `reworked`** leads signals that distinctive ideas were filtered out — return to Activity Card Draw or revisit Lead Pool Step 3b.
