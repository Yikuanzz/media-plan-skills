# Ideation 创新度保障机制设计文档

## 背景与问题

当前 media-plan skill 的 ideation 阶段输出偏保守、老套，即使提供了 8 大方向库，AI 仍倾向于使用"行业常识"和"经典套路"生成方案，而非基于前沿信号的创新思考。用户明确需要：更前沿、更创新、更贴合网络内容、不陈词滥调的策划方案。

## 设计目标

1. **强制前沿信号注入**：ideation 前必须检索近 3-6 个月的前沿案例和趋势
2. **多角度方案生成**：每个方向生成 2-3 个差异化方案，充分挖掘 8 大方向的潜力
3. **双轨 wildcard 突破**：2 个必选的突破方向（前沿信号驱动 + 反常识假设）
4. **创新度评分约束**：评分机制收紧，保守方案直接降级
5. **方向库刷新**：每个方向增加前沿示例、反面教材、痛点锚定示例
6. **支持多选与分阶段**：用户可选择多个方案，方案覆盖前中后期和线上线下

---

## 改动范围

涉及 3 个文件的协同修改：

| 文件 | 角色 | 改动类型 |
| --- | --- | --- |
| `phases/ideation.md` | 流程层 | 新增前沿信号检索、双轨 wildcard、多角度生成、多选输出 |
| `shared/idea-scorecard.md` | 评估层 | distinctiveness 拆分、反陈词滥调检查清单、多选 handoff |
| `shared/inspiration-directions.md` | 素材层 | 每个方向增加前沿示例、反面教材、痛点锚定示例 |

---

## 模块一：phases/ideation.md 改动

### 新增：前沿信号检索（强制前置步骤）

在生成任何 idea 之前，必须执行一次针对性的前沿信号搜索。

**搜索要求**：
- 使用 tavily_search 检索该品类/行业最近 3-6 个月的前沿案例
- 搜索关键词应包含：品类名 + "campaign" / "营销" / "新玩法" / "出圈" / "趋势"
- 同时检索目标平台（抖音/小红书/微信等）的最新算法变化或内容形态创新
- 搜索范围：至少 2 组不同关键词，每组至少 3 个结果

**输出格式**：
```markdown
## 前沿信号扫描
| 信号来源 | 时间 | 平台/渠道 | 核心创新点 | 与本 brief 的相关性 |
| --- | --- | --- | --- | --- |
| [来源名称] | [时间] | [平台] | [一句话概括] | [高/中/低] |
```

**规则**：
- 如果搜索未发现任何近 6 个月内的前沿信号，必须明确标注"前沿信号薄弱"，并在后续 ideation 中优先选择 wildcard 方向
- 禁止仅用 AI 内建知识生成 idea，每个 idea 必须有明确的前沿信号或反常识假设作为支撑

### 新增：多角度方案生成

**规则**：
- 从 inspiration library 筛选出的每个方向，必须生成 **2-3 个不同角度的具体方案**
- 角度差异化要求：同一方向的多个方案必须在以下至少一个维度上有显著差异：
  - 目标受众细分（如：Z世代 vs. 新中产 vs. 银发族）
  - 内容形态（如：短视频 vs. 互动H5 vs. 线下体验）
  - 平台策略（如：抖音全域 vs. 小红书种草 vs. 微信私域）
  - 情绪切入点（如：搞笑玩梗 vs. 情感共鸣 vs. 价值认同）
  - 执行规模（如：小规模试水 vs. 全国铺开 vs. 城市限定）

**输出要求**：
- `## Idea Evaluation` 中每个方案独立成一行
- 禁止同一方向的多个方案在核心机制上高度相似（相似度>70%视为无效）

### 新增：Wildcard 双轨制

在从 inspiration library 生成方向后，必须额外生成 **2 个 wildcard 方向**：

**Wildcard A — 前沿信号驱动**：
- 直接基于"前沿信号扫描"中的某个高相关性信号进行延展
- 问：如果这个信号再往前推一步，品牌可以怎么做？
- 必须标注支撑的前沿信号来源

**Wildcard B — 反常识假设**：
- 刻意打破品类中的 1-2 个"默认共识"
- 模板："所有人都认为 [品类惯例 X]，但如果反过来 [反常识假设 Y]，会怎样？"
- 必须标注被打破的品类惯例是什么
- 即使这个方向最终不可行，也必须生成并记录，作为思维突破的记录

**规则**：
- Wildcard A 和 B 都必须出现在最终的 `## Idea Evaluation` 中
- 如果 Wildcard A 因为前沿信号薄弱而无法生成，则用"激进前沿假设"替代（基于品类趋势进行 12 个月前瞻性预测）
- Wildcard B 不得与 inspiration library 中的任何方向结构相似度超过 50%

### 方案总量要求

- Inspiration library 方向：2-3 个方向 x 2-3 个角度 = 4-9 个方案
- Wildcard A（前沿信号驱动）：1-2 个方案
- Wildcard B（反常识假设）：1-2 个方案
- **总计：至少 8 个方案**，其中至少 3 个来自 wildcard 或前沿信号驱动
- 如果总量不足 8 个，必须返回重新生成，不能降低标准

### 新增：创新来源标注

每个 idea 在 `## Notes` 中必须新增字段：

```markdown
- Innovation source:
  - 类型: frontier_signal / classic_framework / anti_convention / hybrid
  - 具体来源: [前沿信号名称 / 被打破的惯例 / hybrid 的组成]
  - 时效性: [如果是 frontier_signal，标注信号时间；如果是 classic，标注该框架近 3 年内被使用的频率]
```

### 新增：痛点锚定 + 阶段/渠道覆盖

每个方案在 `## Notes` 中新增：

```markdown
- 痛点锚定: [该方案解决的核心痛点]
- 阶段覆盖: [前期/中期/后期/全周期]
- 渠道组合: [线上/线下/线上线下联动]
- 可组合性: [可与哪些其他方案组合，组合逻辑是什么]
```

### 新增：多选规则

```markdown
## 多选规则

- 用户可以选择 1 个主方案 + 0-2 个协同方案
- 如果用户选择多个方案，必须提供：
  1. 方案间的组合逻辑（互补/接力/分层覆盖）
  2. 分阶段执行建议（避免方案在同一时间冲突）
  3. 资源分配建议（预算/人力如何在多个方案间分配）
- 协同方案必须与主方案在"阶段"或"渠道"上有差异化，避免重复
```

### 更新后的 ideation 流程

```
前沿信号检索 → 从 inspiration library 筛选方向 → 多角度方案生成 → Wildcard 双轨生成 → 评分 → 多选推荐
```

### 更新后的 `## Notes` 格式

```markdown
## Notes
- 方案名称：[名称]
  - Strength:
  - Weakness:
  - Revision note:
  - Inspiration anchor:
  - Recent signal used:
  - Why this is not generic:
  - Innovation source:
    - 类型: frontier_signal / classic_framework / anti_convention / hybrid
    - 具体来源:
    - 时效性:
  - 痛点锚定: [核心痛点]
  - 阶段覆盖: [前期/中期/后期/全周期]
  - 渠道组合: [线上/线下/线上线下联动]
  - 可组合性: [组合逻辑]
```

### 更新后的 `## Selected Direction Handoff` 格式

```markdown
## Selected Direction Handoff

### 推荐方案组合
| 角色 | 方案名称 | 解决痛点 | 覆盖阶段 | 渠道 | 与其他方案的组合逻辑 |
| --- | --- | --- | --- | --- | --- |
| 主方案 | [名称] | [痛点] | [阶段] | [渠道] | [组合逻辑] |
| 协同方案 1 | [名称] | [痛点] | [阶段] | [渠道] | [与主方案的关系] |
| 协同方案 2 | [名称] | [痛点] | [阶段] | [渠道] | [与主方案的关系] |

### 独立执行可行性
- [方案名]: 是/否 — 理由
- [方案名]: 是/否 — 理由

### 分阶段执行建议
- 前期（0-30天）：[方案 + 动作]
- 中期（30-60天）：[方案 + 动作]
- 后期（60-90天）：[方案 + 动作]

### 必须保留的核心创意元素
- [元素1]
- [元素2]

### 需要执行验证
- [风险1]
- [风险2]
```

---

## 模块二：shared/idea-scorecard.md 改动

### 1. 维度拆分

原 `distinctiveness` 拆分为：
- `topic_freshness`: 话题/内容是否使用了近 6 个月内的前沿趋势、新情绪、新议题
- `form_breakthrough`: 形式/载体是否采用了新的内容形态、互动机制或平台玩法

更新后的维度列表：
- `brief_fit`: 与 brief 目标、受众和 offer 的匹配度
- `topic_freshness`: 话题新鲜度
- `form_breakthrough`: 形式突破性
- `research_support`: 研究支撑
- `channel_fit`: 渠道匹配度
- `execution_feasibility`: 执行可行性

### 2. 评分规则更新

- 每个维度 1-5 分
- 1 = 弱，3 = 可接受，5 = 强
- 任一维度低于 3 则 reject
- **创新度综合门槛**：`topic_freshness` + `form_breakthrough` 合计必须 >= 6
- **保守方案降级**：如果 `topic_freshness` <= 2 且 `form_breakthrough` <= 2，直接 reject，无论其他维度多高
- 总分 30 分，优先保留 >= 22 的方案

### 3. 新增：反陈词滥调检查清单

```markdown
## Anti-Cliché Checklist

每个方案评分前必须通过以下检查。任一检查项为"是"，标记"⚠️ 陈词滥调风险"：

- [ ] 该方案的 core_mechanism 是否与近 3 年内该品类的 3 个以上知名 campaign 高度相似？
- [ ] 该方案是否仅靠替换 brand name 和 product 就能套用到任何竞品上？
- [ ] 该方案的 example_angles 是否出现在"经典但需警惕的示例"列表中？
- [ ] 该方案是否使用了"所有人都在用"的平台玩法（如：普通 KOL 种草 + 话题标签）而没有新增创新点？

**处理方式**：
- 标记为"⚠️ 陈词滥调风险"的方案，`topic_freshness` 和 `form_breakthrough` 最高只能评 2 分
- 如果用户明确要求"安全保守"，该标记可忽略；否则必须向用户提示风险
```

### 4. 输出形状更新

`## Idea Evaluation` 表格更新为 7 个维度：

```markdown
## Idea Evaluation
| 方案 | Brief Fit | Topic Freshness | Form Breakthrough | Research Support | Channel Fit | Execution Feasibility | Total | Verdict |
```

`## Selected Direction Handoff` 更新为多选格式（见模块一）。

---

## 模块三：shared/inspiration-directions.md 改动

### 每个方向的新结构

每个方向增加三个新子项：

```markdown
### [Direction Name]
- core_mechanism:
- good_for:
- not_good_for:
- brief_signals:
- research_signals:
- example_angles:
- execution_moves:
- execution_risks:

**经典但需警惕的示例（反面教材）**：
| 示例 | 时间 | 问题 | 为什么现在不能再做 |

**前沿示例（2024-2025）**：
| 案例 | 时间 | 平台 | 品类 | 创新点 | 可借鉴角度 |

**痛点锚定示例**：
| 痛点 | 前期方案 | 中期方案 | 后期方案 | 线上线下结合 |
```

### 8 个方向全部按此结构刷新

每个方向都将获得：
1. **反面教材表**：近 3 年做烂的模式，标注"为什么现在不能再做"
2. **前沿示例表**：2024-2025 真实案例，标注时间、平台、品类、创新点
3. **痛点锚定示例表**：展示前中后期分阶段设计和线上线下联动

---

## 实施顺序

1. **Phase 1**：修改 `shared/idea-scorecard.md`（评估层，影响最小）
2. **Phase 2**：修改 `phases/ideation.md`（流程层，依赖评分标准）
3. **Phase 3**：刷新 `shared/inspiration-directions.md`（素材层，工作量最大，可分方向逐步完成）

---

## 风险与缓解

| 风险 | 缓解措施 |
| --- | --- |
| 前沿信号检索增加延迟 | 搜索可并行执行，且结果可缓存于 session 内 |
| 8 个方案总量要求导致质量稀释 | 评分门槛收紧（22/30 + 创新度 >= 6），自动过滤低质量方案 |
| 反常识假设可能过于激进不可行 | 明确标注为"实验性"，不强制推荐，但保留作为思维突破记录 |
| 方向库刷新工作量大 | 分方向逐步完成，先刷新 2-3 个高频方向 |

---

## 验收标准

- [ ] ideation 输出至少 8 个方案
- [ ] 至少 3 个方案来自 wildcard 或前沿信号驱动
- [ ] 每个方案都有 `Innovation source` 标注
- [ ] 每个方案都有 `痛点锚定`、`阶段覆盖`、`渠道组合`
- [ ] `## Selected Direction Handoff` 支持多选，包含分阶段执行建议
- [ ] 反陈词滥调检查清单自动标记风险方案
- [ ] 保守方案（topic_freshness + form_breakthrough 均 <= 2）自动 reject
