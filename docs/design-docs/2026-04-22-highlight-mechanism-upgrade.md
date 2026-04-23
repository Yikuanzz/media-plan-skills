# 亮点机制生成升级设计

## 状态

- 状态：implemented
- 日期：2026-04-22
- 适用范围：通用型 media-plan skill 的创意到成案链路

## 背景

当前 `media-plan` skill 已经具备较完整的阶段 gate、research 质量门槛、wildcard 创意保留和 proposal 回退机制，但最终成案仍更接近“结构正确的策略文档”，而不是“有主题、有主机制、有阶段爆点的提案级方案正文”。

在真实提案里，用户并不只需要多个创意方向，还需要能被复述、能被记住、能支撑阶段编排和转化动作的亮点机制。现有 skill 在 `research -> ideation -> execution -> proposal` 之间缺少这一层显式 handoff。

## 目标

- 保持 `media-plan` 作为通用型 skill，不提前收敛为新品上市或区域上市专用模板。
- 在 ideation 之后、execution 之前增加一套明确的“亮点机制画布”约束。
- 让 `keep` 级方向不只停留在方向名和评分，而是沉淀为可提案的机制资产。
- 让 execution 和 proposal 可以沿着同一套机制资产组织阶段节奏、核心事件和转化链路。
- 用压力测试和轻量自动检查降低“看上去有创意，实际没有主机制”的假通过风险。

## 非目标

- 本轮不新增上市整合营销专用 skill。
- 本轮不直接扩展到 PPT、Word 或视觉排版输出。
- 本轮不以增加更多 inspiration directions 作为主方案。

## 设计判断

### 为什么不是只改 scorecard

只增强 `idea-scorecard.md` 可以继续筛掉陈词滥调，但无法稳定要求模型产出“核心主题 + 主事件 + 阶段机制 + 转化链路”的组合。问题不在评分不够严格，而在运行时没有要求把方向长成机制。

### 为什么不直接做垂类 skill

`docs/TARGET.md` 对应的是更强的区域上市整合营销提案，但当前仓库明确仍以通用型 media-plan 为主。若直接做上市专用 skill，会过早牺牲通用性。先把“亮点机制生成”抽象成通用层，后续再向上市、活动、政企等垂类复用，性价比更高。

## 核心方案

### 1. 新增 `Highlight Mechanism Canvas`

新增 `skills/media-plan/shared/highlight-mechanism-canvas.md` 作为 ideation、execution、proposal 共享的 canonical contract。

每个保留方向至少要沉淀以下要素：

- `Theme`：一句话核心主题
- `Core tension`：产品真相 × 人群矛盾 × 区域/场景语境
- `Mechanism`：参与、传播、转化三类机制
- `Hero event`：最能承接声量的主事件或爆点动作
- `Stage choreography`：预热 / 引爆 / 延续的角色分工
- `Channel choreography`：线上、线下、私域、门店等如何接力
- `Conversion path`：从参与到留资/试驾/到店/成交的承接逻辑
- `Defensibility`：为什么不是套模板、为什么竞争对手难以直接平移
- `Execution red lines`：不能跨越的资源、时序、审批或品牌边界

### 2. 升级 research，让它输出“提案弹药”

`research` 不只要告诉 ideation 什么有证据，还要给出哪些内容值得被转化为亮点机制。新增一组用于后续 ideation 的输出：

- `Audience tension`：可被放大的真实痛点或欲望
- `Scene and regional hooks`：可落到场景或城市语境的锚点
- `Category cliche to avoid`：竞品已做烂的常规打法
- `Mechanic-worthy signals`：可被进一步转译为参与机制或主事件的近期信号
- `Proof assets`：适合在 proposal 中直接引用的案例、数据或平台变化

### 3. 升级 ideation，让方向必须长成机制

保留现有 frontier signal、wildcard、anti-cliche 体系，但新增两个放行门槛：

- `Mechanism floor`：每个 `keep` 方向必须明确参与机制、传播机制、转化机制。
- `Asset floor`：每个 `keep` 方向必须在以下四类资产里至少形成三类：
  - 核心主题
  - 主事件
  - 用户参与机制
  - 线上线下联动路径

同时，`## Selected Direction Handoff` 不再只给方向名和 phase coverage，还要引用完整的 `Highlight Mechanism Canvas`，这样 execution 不需要二次猜测主机制是什么。

### 4. 升级 execution，让它验证机制是否能落地

execution 的验证对象不再只是 timeline、budget、deliverables，也要检查：

- 主机制是否与目标、受众、渠道限制一致
- 主事件是否真正承接核心主题
- 阶段动作是否递进，而不是平铺罗列
- 转化抓手是否在阶段内被显式承接

如果这些条件不成立，必须回退到 ideation，而不是在 execution 阶段用套话兜底。

### 5. 升级 proposal，让最终正文显式展示亮点机制

proposal 结构在保留可决策性的前提下，增加对“亮点机制总览”“阶段编排”“核心事件与转化链路”的要求，让最终正文更接近成熟策划提案，而不是通用咨询汇报。

## 受影响文件

- `skills/media-plan/shared/highlight-mechanism-canvas.md`
- `skills/media-plan/shared/idea-scorecard.md`
- `skills/media-plan/shared/proposal-template.md`
- `skills/media-plan/shared/research-rubric.md`
- `skills/media-plan/phases/research.md`
- `skills/media-plan/phases/ideation.md`
- `skills/media-plan/phases/execution.md`
- `skills/media-plan/phases/proposal.md`
- `docs/product-specs/2026-04-21-media-plan-skill-pressure-tests.md`
- `docs/ARCHITECTURE.md`
- `docs/QUALITY_SCORE.md`
- `README.md`

## 风险与缓解

- 风险：新增结构过重，导致通用 brief 下输出变僵硬。
  - 缓解：保持画布字段为提案资产，不要求所有 brief 都强行本地化或大型事件化。
- 风险：只新增章节名，没有形成运行时 gate。
  - 缓解：在 `idea-scorecard`、`execution` 和 pressure tests 中同步加入硬门槛。
- 风险：行为只依赖 prompt，没有机械守护。
  - 缓解：新增仓库级轻量检查脚本，验证关键 contract 和 phase 依赖是否存在。

## 验收标准

- 仓库内存在可复用的 `Highlight Mechanism Canvas` shared contract。
- `research`、`ideation`、`execution`、`proposal` 都显式引用该 contract 或其要求。
- `keep` 级创意方向必须写清参与、传播、转化三类机制。
- proposal 模板显式要求呈现亮点机制总览、阶段打法、核心事件与转化链路。
- pressure tests 覆盖“有创意名词但没有主机制”的失败场景。
- 仓库级检查可以发现关键 contract 或引用缺失。
