# Tavily Research Upgrade 设计

## 状态

- 状态：planned
- 日期：2026-04-21
- 优先级：high
- 实施状态：暂不实现，作为后续 TODO 保留

## 背景

当前 media-plan skill 系统已经具备较完整的 research gate、evidence diversity 和 pressure-test 约束，但 research 阶段仍主要依赖当前 Agent 环境自带的检索能力。对“近 30/90 天热点”“中国市场行业案例”“平台信号”“公开数据”这类任务来说，现有检索层在时间范围控制、域名控制、提取一致性和结果可审计性上还不够强。

这次升级的目标不是重写整个 skill 系统，而是优先提升 `skills/media-plan/phases/research.md` 所在 research 阶段的质量，使其能稳定地产出更可追溯、更容易进入 proposal review 的 evidence pack。

## 目标

- 提升 research 对近期热点、行业案例、平台信号和公开数据的命中率。
- 让检索结果更容易转成统一 evidence contract，而不是停留在零散搜索结果。
- 强化 freshness、source trust、evidence diversity 和 extraction success 的判定。
- 在 Tavily 结果不足、提取失败或配额异常时，明确回退和降级路径。
- 保持当前 orchestrator、ideation、execution、proposal 主流程稳定，只增强 research stage。

## 非目标

- 不在本次设计里重写 `skills/media-plan/SKILL.md` 的整体 workflow。
- 不一次性实现完整 provider runtime 或独立服务层。
- 不在本次阶段接入 UI、dashboard 或后台监控界面。
- 不把 ideation、execution、proposal 阶段改成直接依赖 Tavily。

## 当前问题

- research 阶段只有“用近期公开来源”的原则，没有显式 query planning 结构。
- 来源可信度目前只有弱约束，没有独立 source policy。
- extract 成功与否没有单独 contract，导致“搜到了标题”与“提取到了可引用内容”容易混在一起。
- fallback 逻辑没有正式版本化，遇到 Tavily 无结果或 timeout 时的行为不可审计。
- proposal review 能要求 evidence-backed claims，但 research trace 还不够清晰。

## 设计原则

- Tavily 只先服务 `skills/media-plan/phases/research.md`，不要过早扩散到全链路。
- 先提升 evidence quality，再考虑 provider abstraction 的完整实现。
- 所有检索结果都必须进入 shared contract，不能只停留在 provider 原始返回。
- 搜不到、提不出、来源弱或证据单一时，必须回退，不允许硬写方案。
- 保留当前 Agent 环境的原生检索能力作为 fallback，而不是一次性完全替换。

## 接入范围

### 直接接入

- `skills/media-plan/phases/research.md`
- `skills/media-plan/shared/research-rubric.md`
- `docs/product-specs/2026-04-21-media-plan-skill-pressure-tests.md`

### 间接同步

- `skills/media-plan/SKILL.md`
- `docs/design-docs/2026-04-21-media-plan-skill-design.md`
- `docs/ARCHITECTURE.md`
- `docs/QUALITY_SCORE.md`

### 暂不接入

- `skills/media-plan/phases/ideation.md`
- `skills/media-plan/phases/execution.md`
- `skills/media-plan/phases/proposal.md`

这些阶段只消费 research pack，不直接调用 Tavily。

## 目标架构

首版采用 `Tavily-first + native fallback` 的 research workflow。

### Tavily-first

用于：

- 实时搜索近期来源
- 控制时间范围
- 控制 include/exclude domains
- 批量提取正文或摘要内容

### Native fallback

用于：

- Tavily timeout
- Tavily quota/credit 不足
- Tavily 提取失败
- Tavily 返回结果过少或明显偏题

### Standardized research contract

无论底层来源是 Tavily 还是 fallback，都统一落成同一份 evidence pack，供 orchestrator 和 proposal review 使用。

## Research Workflow

建议把 research stage 拆成 5 步。

### 1. Query Planning

输入：

- 当前 brief
- 当前 research gap
- 需要补的 evidence class

输出：

- research intent
- query list
- time range
- include domains
- exclude domains
- target evidence classes

### 2. Source Retrieval

优先使用 Tavily Search。

输出：

- provider
- query
- time range
- raw results
- preliminary source metadata

### 3. Content Extraction

优先使用 Tavily Extract，对已经命中的 URL 做正文提取。

输出：

- url
- title
- publish date
- extracted content summary
- extraction status

### 4. Evidence Normalization

把 provider 返回结构转成仓库内统一 evidence 表达：

- fact
- inference
- why it matters
- source
- evidence class
- source trust level

### 5. Gap Detection And Loopback

如果不满足 research rubric：

- 改 query 再搜
- 收紧 domains / time range
- 降级到 native search
- 必要时回问用户补充约束

## Shared Contract 设计

建议新增 `skills/shared/research-provider-contract.md`。

建议结构：

```md
# Research Provider Contract

## Retrieval Context
- provider: tavily | native
- query:
- research_intent:
- time_range:
- include_domains:
- exclude_domains:
- retrieval_status: success | partial | fail

## Source Results
- title:
  - url:
  - published_at:
  - source_type:
  - evidence_class:
  - source_trust:
  - extraction_status:
  - content_summary:

## Retrieval Verdict
- status: pass | fail
- gaps:
```

这个文件首版只作为 shared design contract，不要求本轮立即加脚本实现。

## Source Trust Policy

建议新增 `skills/shared/source-trust-policy.md`。

建议分级：

- 高可信：政府机构、平台官方、品牌官方、权威研究机构、权威行业报告
- 中可信：主流媒体、行业媒体、成熟商业数据库摘要页
- 低可信：营销稿、软文、转载聚合、自媒体观点页
- 禁用：来源不明、无日期、明显洗稿、无法验证作者或出处

规则：

- 关键结论优先使用高可信与中高可信来源支撑。
- 低可信来源不能单独通过关键结论门槛。
- 禁用来源不能进入最终 evidence pack。

## Query Playbook

建议新增 `skills/shared/query-playbook.md`。

至少覆盖 4 类查询模板：

- 热点查询
- 行业趋势查询
- 竞品/案例查询
- 平台信号查询

每类模板建议包含：

- intent
- query pattern
- time range
- preferred domains
- expected evidence class

## Tavily 失败与降级策略

### 场景 1：无结果

- 调整 query
- 缩小或扩大时间范围
- 替换关键词后重搜

### 场景 2：结果过旧

- 收紧 freshness window
- 优先高频更新时间源

### 场景 3：只有单一证据类型

- 定向补搜缺失 evidence class
- 不允许直接宣布 research pass

### 场景 4：extract 失败

- 降级到摘要级来源
- 如果关键结论只能依赖未提取成功页面，则 research fail

### 场景 5：timeout / quota fail

- 降级 native search
- 若仍不足，则回问用户缩小范围或补充约束

## Rubric 升级点

建议修改 `skills/shared/research-rubric.md`，新增以下检查项：

- freshness window
- evidence_classes_used
- source_trust mix
- extraction success rate
- decision relevance

新增后，research pass 的最低要求应包括：

- 至少两类证据
- 至少一个近期热点/平台信号或近时效来源
- 至少一个案例/数据类来源
- 每个关键结论有明确来源
- extract 失败的来源不能成为关键结论唯一支撑

## Pressure Test 升级点

建议修改 `docs/product-specs/2026-04-21-media-plan-skill-pressure-tests.md`，新增 Tavily 相关场景：

- Tavily 返回结果过旧
- Tavily 只有单一证据类型
- Tavily 命中低可信来源
- Tavily extract 失败
- Tavily timeout / quota fail 后 fallback 是否生效

## 具体文件变更清单

### 建议新增

- `docs/design-docs/2026-04-21-tavily-research-upgrade.md`
- `skills/media-plan/shared/research-provider-contract.md`
- `skills/media-plan/shared/source-trust-policy.md`
- `skills/media-plan/shared/query-playbook.md`

### 建议修改

- `skills/media-plan/phases/research.md`
- `skills/media-plan/shared/research-rubric.md`
- `skills/media-plan/SKILL.md`
- `docs/product-specs/2026-04-21-media-plan-skill-pressure-tests.md`
- `docs/design-docs/2026-04-21-media-plan-skill-design.md`
- `docs/ARCHITECTURE.md`
- `docs/QUALITY_SCORE.md`

## 分阶段实施建议

### Phase 1: Tavily-first Research Design

- 新增 provider contract
- 新增 source trust policy
- 新增 query playbook
- 修改 research skill 和 rubric

### Phase 2: Pressure Tests And Loop Hardening

- 增加 Tavily 相关 pressure tests
- 明确 fallback 和 loopback 规则

### Phase 3: Auditability Upgrade

- 增强 research trace
- 让 proposal review 更容易复核 evidence chain

## 验收标准

- 调研结果更稳定命中近 30/90 天内容
- 至少两类 evidence class 被显式记录
- 低可信来源不能单独通过关键结论门槛
- Tavily 失败时有清晰 fallback 或回问逻辑
- proposal review 能看到更明确的 research evidence chain

## TODO 说明

这份文档当前只定义后续 Tavily research upgrade 的设计方向和文件改动范围，不代表本轮已实现。

后续若要启动实现，应先补一份 execution plan，再进入 skill 与 shared contract 的实际修改。
