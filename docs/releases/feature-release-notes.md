# 功能发布记录

## 2026-04

| 日期 | 功能域 | 用户价值 | 变更摘要 |
| --- | --- | --- | --- |
| 2026-04-08 | 模板仓库 | 提供了一套可直接用于新项目启动的 Agent-first 基础模板。 | 补齐了 AGENTS 入口、execution plan、history、release note、CI/CD 和供应链安全骨架。 |
| 2026-04-21 | 传媒策划 skill | 用户现在可以基于半结构化 brief 触发一套带调研、创意筛选、执行规划和成案评审回退的传媒策划 workflow。 | 新增 media-plan orchestrator、4 个阶段子 skill、共享模板/rubric、pressure test spec，并同步更新架构、质量评分与仓库入口文档。 |
| 2026-04-22 | 传媒策划 skill | 用户现在更容易拿到带核心主题、主事件、阶段节奏和转化链路的提案型方案，而不只是结构正确的策略文档。 | 新增 `Highlight Mechanism Canvas` 共享契约，升级 research/ideation/execution/proposal handoff、proposal 模板、pressure test 和仓库级检查脚本，并把检查接入 `scripts/ci.sh`。 |
