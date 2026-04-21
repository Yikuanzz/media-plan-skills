# 架构总览

这个仓库当前不是通用应用模板，而是一个面向传媒策划方案生成的 Agent skill 系统。顶层结构围绕“文档即规范、skill 即执行”组织。

## 当前仓库结构

- `skills/`：核心运行资产。按阶段拆分 orchestrator 与子 skill，并在共享目录中维护 intake 模板、调研 rubric、创意评分卡、灵感母题库、预搜索 source map 和方案模板。这里承载实际工作流、阶段约束、评分规则和输出模板；对运行时必需的最小 contract，允许镜像进对应 `SKILL.md` 以适配单-skill 临时目录。
- `docs/`：仓库知识源。设计文档、execution plan、product spec、history、质量评分等都在这里沉淀，负责定义目标、边界和验收口径。
- `scripts/`：仓库级辅助脚本与检查入口，供人和 Agent 直接调用。
- `.github/`：仓库自动化与协作配置。

## 关键分层

- `skills/media-plan-orchestrator/`：总控入口，负责 intake 前轻量预搜索、brief intake、阶段流转、回退判断和完成门禁。
- `skills/industry-insight-research/`、`skills/strategy-ideation/`、`skills/execution-planning/`、`skills/proposal-writing-review/`：按研究、创意、执行、成案评审拆分阶段职责，避免把所有规则堆进单一 skill。
- `skills/shared/`：共享约束文件，沉淀输入字段、研究判定、创意评分、灵感母题、预搜索 source priority 与 proposal 结构，作为仓库维护时的 canonical contract。
- `docs/product-specs/`：记录压力测试和失败场景，约束 skill 在缺信息、弱证据、老套创意、执行失配时必须回退。
- `docs/exec-plans/` 与 `docs/design-docs/`：分别沉淀实施步骤和设计依据，保证 skill 演进不只依赖聊天上下文。

## 边界约束

- `docs/` 定义规则与预期行为，`skills/` 负责把这些规则转成可执行 workflow；两者变更应同步。
- 总控里的 intake 前预搜索只用于缩小补问范围和保留后续 research 线索，不能替代用户确认的 brief 字段。
- 预搜索默认优先使用中国平台与社媒信号发现近期热点，再用更高可信来源做校准；不能把单一热点直接升级为策略结论。
- 共享模板和 rubric 优先收敛到 `skills/shared/`，但当宿主运行时只复制单个 skill 目录时，允许把运行所需的最小 contract 镜像进对应 `SKILL.md`；这类镜像改动必须与 canonical source 同步维护。
- 压力测试、设计意图和历史留痕保留在 `docs/`，不要混入运行时 skill 文件。
- 只要 skill 结构、共享契约或关键流程发生变化，就同步更新这份文档。
