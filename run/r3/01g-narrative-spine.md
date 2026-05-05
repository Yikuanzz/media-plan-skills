## Module: Narrative Spine

```yaml
NarrativeSpine:
  core_tension: |
    我们用半生追求事业成功与家庭幸福，
    却在每天3小时的通勤中，丢失了本该留给家人的精力与耐心。

  emotional_arc:
    - 通勤倦怠：每天在拥堵的环路上，脚踩刹车踩到抽筋，智驾是"解放双手"的工具期待
    - 安全觉醒：当智驾在关键时刻避险时，突然明白——这不是解放双手，而是守护家人的第二双眼睛
    - 技术自豪：开着东风×华为联手打造的"华系车天花板"，在北京的科技地标前，感受到国产技术崛起的骄傲
    - 生活掌控：通勤不再是消耗，智驾帮我把时间还给家人，周末开着大六座带全家去京郊，真正成为家庭出行的"首席安全官"

  narrative_transitions:
    - from: 通勤倦怠
      to: 安全觉醒
      trigger_types:
        - 智驾实际体验（城区NCA/自动泊车）
        - 真实用户避险故事分享
        - 家人安全场景共情
      failure_modes:
        - 只讲参数不讲真实场景
        - 体验流程复杂导致放弃
        - 没有引发家庭场景共鸣
      lead_requirements:
        - 必须提供"零门槛"智驾体验
        - 必须绑定家庭安全具体场景
        - 必须有真实用户故事背书

    - from: 安全觉醒
      to: 技术自豪
      trigger_types:
        - "满血华为"技术背书曝光
        - 与竞品的差异化技术对比
        - 华系车崛起民族情绪共鸣
        - 北京科技地标场景植入
      failure_modes:
        - 过度吹嘘引发反感
        - 攻击竞品拉低格局
        - 情绪渲染过度不真实
      lead_requirements:
        - 必须有华为官方技术背书
        - 必须突出"东风制造品质+华为智能"双优势
        - 必须与北京科创之城调性结合

    - from: 技术自豪
      to: 生活掌控
      trigger_types:
        - 周末家庭出行场景展示
        - 用户真实生活方式分享
        - 社区归属感建立
      failure_modes:
        - 停留在技术层面不落地生活
        - 场景过于理想化不接地气
        - 没有真实用户证言
      lead_requirements:
        - 必须展示真实北京家庭生活场景
        - 必须有真实车主生活方式分享
        - 必须提供车主社区归属感

  symbolic_objects:
    - "方向盘上松开的双手" — 智驾解放的标志性画面
    - "后排安全座椅上安睡的孩子" — 家庭安全的核心符号
    - "华为鸿蒙座舱的星空顶" — 科技与浪漫的结合
    - "京郊山路的晚霞与大六座车身" — 家庭出行的理想画面
    - "国贸霓虹下的奕境车标" — 北京科技地标与华系车崛起
    - "高考考点外守护的奕境车队" — 人生重要时刻的陪伴

  narrative_keywords:
    - 满血华为
    - 首席安全官
    - 华系车技术天花板
    - 把时间还给家人
    - 北京科技奶爸
    - 第二双眼睛

  story_world: "满血华为智驾宇宙：北京科技奶爸的家庭出行新范式"
  protagonist: "东风×华为联合打造的技术旗舰 —— 不止是一台车，更是每位父亲的'首席安全官'"
  audience_role: "不只是买车，而是成为'华系车技术崛起'的首批见证者与'首席安全官'身份的持有者"

  memory_anchor:
    anchor: |
      "高考考点外，一排奕境DH1打着双闪守护，
      车内是开着空调安睡的考生家长，
      车身上写着：'奕境，做你人生每一个重要时刻的首席安全官'"
    type: visual + slogan + ritual
    memorability_test: |
      一年后，用户还能清晰描述：
      "就是高考那天在北京考点外，一排打着双闪的华为智驾车，
      让家长在车里开着空调休息，车身上写着首席安全官。
      这个画面太有温度了，我当时就决定换车就换奕境"
```

---

## Narrative Spine Quality Gate Audit

### Checklist
- [x] Core tension: 单句核心冲突，有明确情绪极性（追求成功幸福 vs 通勤消耗精力）
- [x] Emotional arc: 4个明确状态（通勤倦怠 → 安全觉醒 → 技术自豪 → 生活掌控）
- [x] Transitions: 每个转换都有 trigger_types + failure_modes + lead_requirements（3个转换全覆盖）
- [x] Symbolic objects: 6个具体、可视觉化的符号（松开的双手/后排孩子/星空顶/京郊晚霞/国贸霓虹/高考守护车队）
- [x] Story world: 已命名 — "满血华为智驾宇宙：北京科技奶爸的家庭出行新范式"
- [x] Audience role: 主动角色 — "华系车技术崛起首批见证者与首席安全官身份持有者"（不是被动消费者）
- [x] Memory anchor: 通过"一年测试" — 高考考点外的守护车队画面有强烈视觉冲击与情绪记忆点

### Hotspot Atom Alignment Check
所有12个HS-*原子都能在Spine中找到落点：
- HS-001高考 → 记忆锚点画面 + 人生重要时刻
- HS-002 618 → 线下体验触发"安全觉醒"
- HS-003父亲节 → "首席安全官"身份
- HS-004通勤倦怠 → Arc起点
- HS-005华系车崛起 → "技术自豪"状态
- HS-006不鸡娃鸡安全 → "安全觉醒"核心
- HS-007端午家庭电影 → "生活掌控"场景
- HS-008草莓音乐节 → 年轻科技用户场景
- HS-009 CES Asia → "技术自豪"背书
- HS-010京郊自驾 → "生活掌控"核心场景
- HS-011华为六边形战士 → "满血华为"关键词
- HS-012通勤特种兵 → Arc起点 + 车是第二个家

---

## Narrative Spine complete
- [x] All 7 quality gates passed
- [x] Output written to `{artifact_root}/01g-narrative-spine.md`
- [x] All 12 HS-* atoms aligned to Spine
- [ ] Next: Activity Card Draw
