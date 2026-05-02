# 架构总览

这个仓库当前不是通用应用模板，而是一个面向传媒策划方案生成的 Agent skill 系统。顶层结构围绕“文档即规范、skill 即执行”组织。

## 当前仓库结构

- `skills/`：核心运行资产。当前运行时包含两个包：`skills/media-plan/`（通用传媒策划主流程）与 `skills/regional-auto-launch-plan/`（汽车区域上市专项流程）。两个包都在包内用 `phases/` 拆分 workflow、用 `shared/` 维护 contract 与模板，分别承载各自的阶段约束、评分规则和输出结构。
- `docs/`：仓库知识源。设计文档、execution plan、product spec、history、质量评分等都在这里沉淀，负责定义目标、边界和验收口径。
- `scripts/`：仓库级辅助脚本与检查入口，供人和 Agent 直接调用。
- `.github/`：仓库自动化与协作配置。

## 关键分层

- `skills/media-plan/SKILL.md`：通用入口，负责 media-plan 主 workflow、阶段切换、**四角色手递物**说明、**Review loop**（最大 3 次回退）、回退规则与 completion gate；当识别到汽车区域上市信号时，仅负责提示并路由到 `regional-auto-launch-plan`。
- `skills/regional-auto-launch-plan/SKILL.md`：汽车区域上市独立入口，负责六模块专项流程（洞察/策略/动作/运营/服务团队）与专项 Review Pass 门槛。
- `skills/media-plan/phases/`：按 `pre-brief search`、`intake`、`research`、`ideation`、`execution`、`proposal` 拆分阶段职责，供入口 skill 按需读取。
- `skills/media-plan/shared/`：包内 canonical contract，沉淀输入字段、研究判定、创意评分、灵感母题、亮点机制画布、预搜索 source priority、query playbook、**core strategic idea**、**competitor-actionable**、**content-assets**、proposal 全结构（含 Mechanism Design、认知双轴 Event Menu、可选 Rubric / 复盘节），以及 `research-modules/` 下的检索策略分片。
- `skills/media-plan/shared/` 保持通用 contract，不再承载汽车区域上市 `auto_regional_launch` 专项模板。
- `skills/regional-auto-launch-plan/shared/` 承载汽车区域上市专项 contract（如 `City Evidence Pack`、`Budget Allocation Table`、阶段化 Action Playbook），确保专项约束在独立包内闭环。
- regional runtime now uses persisted chapter files (`00`-`09`) as source-of-truth and assembles `proposal.md` mechanically.
- `shared/persistence-rules.md` is required by phase contracts and blocks downstream progression on write failure.
- `shared/quality-self-check.md` includes `Standard 6` anti-compression hard gates (C1-C7).
- `scripts/check-media-plan-highlight-mechanism.sh`：仓库级轻量守护，检查亮点机制 contract 是否存在，关键 phase/template 是否仍显式引用。
- `scripts/check-runtime-contract-placeholders.sh`：仓库级轻量守护，阻断 `phases/` 与 `shared/` 中遗留的 `Purpose: Placeholder` runtime stub。
- `docs/product-specs/`：记录压力测试和失败场景，约束 skill 在缺信息、弱证据、老套创意、执行失配时必须回退。
- `docs/exec-plans/` 与 `docs/design-docs/`：分别沉淀实施步骤和设计依据，保证 skill 演进不只依赖聊天上下文。

## 边界约束

- `docs/` 定义规则与预期行为，`skills/` 负责把这些规则转成可执行 workflow；两者变更应同步。
- 总控里的 intake 前预搜索只用于缩小补问范围和保留后续 research 线索，不能替代用户确认的 brief 字段。
- 预搜索默认优先使用中国平台与社媒信号发现近期热点，再用更高可信来源做校准；不能把单一热点直接升级为策略结论。
- ideation 产出的可保留方向必须显式形成 `Core Strategic Idea`、`Content Assets` 与 `Highlight Mechanism Canvas`；execution 与 proposal 只消费已成型的机制与主叙事，不应重新猜主题或主事件。
- proposal 组装后必须执行 `## Review Pass`；未通过则按各自 SKILL 路由回上游 phase 修补，直至通过或达到最大循环次数并输出 `Open Issues`。
- 对城市/区域类 brief，research 阶段新增 `## City Evidence Pack` 强门槛（圈层地图、城市事件、竞品本地动作、KOL/KOC 矩阵、场地池），缺项不得进入 proposal。
- 对汽车区域上市类 brief，media-plan 只做识别与分流，不在包内执行专项模板；专项提案由 `regional-auto-launch-plan` 独立产出，并强制包含 `Execution Action Playbook`（每阶段至少一个 Program Blueprint），避免输出仅停留在 KPI/框架层。
- 每个 runtime 包都应自洽：`media-plan` 不依赖 `regional-auto-launch-plan` 内部文件，`regional-auto-launch-plan` 也不依赖 `media-plan` 包内 shared；跨包只允许入口级路由提示，不做运行时文件耦合。
- 压力测试、设计意图和历史留痕保留在 `docs/`，不要混入运行时 skill 文件。
- 只要 skill 结构、共享契约或关键流程发生变化，就同步更新这份文档。
