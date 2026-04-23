# 架构总览

这个仓库当前不是通用应用模板，而是一个面向传媒策划方案生成的 Agent skill 系统。顶层结构围绕“文档即规范、skill 即执行”组织。

## 当前仓库结构

- `skills/`：核心运行资产。当前以 `skills/media-plan/` 作为唯一 runtime package，在包内用 `phases/` 拆分 workflow，用 `shared/` 维护 contract、模板、灵感母题、亮点机制画布与 research reference。这里承载实际工作流、阶段约束、评分规则和输出模板。
- `docs/`：仓库知识源。设计文档、execution plan、product spec、history、质量评分等都在这里沉淀，负责定义目标、边界和验收口径。
- `scripts/`：仓库级辅助脚本与检查入口，供人和 Agent 直接调用。
- `.github/`：仓库自动化与协作配置。

## 关键分层

- `skills/media-plan/SKILL.md`：唯一入口，负责全局 workflow、阶段切换、回退规则与 completion gate。
- `skills/media-plan/phases/`：按 `pre-brief search`、`intake`、`research`、`ideation`、`execution`、`proposal` 拆分阶段职责，供入口 skill 按需读取。
- `skills/media-plan/shared/`：包内 canonical contract，沉淀输入字段、研究判定、创意评分、灵感母题、亮点机制画布、预搜索 source priority、query playbook 与 proposal 结构。
- `scripts/check-media-plan-highlight-mechanism.sh`：仓库级轻量守护，检查亮点机制 contract 是否存在，关键 phase/template 是否仍显式引用。
- `docs/product-specs/`：记录压力测试和失败场景，约束 skill 在缺信息、弱证据、老套创意、执行失配时必须回退。
- `docs/exec-plans/` 与 `docs/design-docs/`：分别沉淀实施步骤和设计依据，保证 skill 演进不只依赖聊天上下文。

## 边界约束

- `docs/` 定义规则与预期行为，`skills/` 负责把这些规则转成可执行 workflow；两者变更应同步。
- 总控里的 intake 前预搜索只用于缩小补问范围和保留后续 research 线索，不能替代用户确认的 brief 字段。
- 预搜索默认优先使用中国平台与社媒信号发现近期热点，再用更高可信来源做校准；不能把单一热点直接升级为策略结论。
- ideation 产出的可保留方向必须显式形成 `Highlight Mechanism Canvas`，execution 与 proposal 只消费已成型的机制，不应重新猜主题或主事件。
- 运行时依赖应收敛在 `skills/media-plan/` 包内，不要再让 workflow 依赖包外 sibling skills 或根级 shared。
- 压力测试、设计意图和历史留痕保留在 `docs/`，不要混入运行时 skill 文件。
- 只要 skill 结构、共享契约或关键流程发生变化，就同步更新这份文档。
