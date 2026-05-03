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
