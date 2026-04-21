# media-plan-skills

## 简介

这是一个面向传媒策划方案场景的 Agent skill 仓库，当前首版聚焦中国市场、提案级输出和 Markdown 正文交付。

仓库内已经包含：

- `media-plan-orchestrator`：总控入口，负责 brief 补问、阶段流转、回退判断和完成门禁
- `industry-insight-research`：实时调研、热点/案例/公开数据收集与证据判定
- `strategy-ideation`：多方向创意发散、评分筛选与反老套回退
- `execution-planning`：把策略翻译成执行路径、节奏、KPI 和风险控制
- `proposal-writing-review`：按模板成案，并在缺证据、创意老套或执行失配时打回上游
- `skills/shared/`：共享 intake 模板、research rubric、idea scorecard 和 proposal template

## 当前能力边界

- 适用市场：中国市场
- 输出颗粒度：提案级
- 默认交付：Markdown 方案正文
- 默认流程：brief intake -> research -> ideation -> execution -> proposal review
- 默认约束：缺关键字段不启动、弱证据不放行、老套创意要回炉、执行与策略失配要回退

## 关键文档

- 设计文档：`docs/design-docs/2026-04-21-media-plan-skill-design.md`
- 压力测试：`docs/product-specs/2026-04-21-media-plan-skill-pressure-tests.md`
- 已完成执行计划：`docs/exec-plans/completed/2026-04-21-media-plan-skill-implementation.md`
- 发布记录：`docs/releases/feature-release-notes.md`

## 快速查看

- 从 `AGENTS.md` 开始了解仓库规则入口
- 查看 `skills/` 了解实际运行 skill
- 查看 `docs/` 了解设计、验证、history 与发布记录

## 许可证

[MIT](./LICENSE)
