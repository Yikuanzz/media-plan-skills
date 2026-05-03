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
