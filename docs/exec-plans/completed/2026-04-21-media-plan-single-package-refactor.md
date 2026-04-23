# Media Plan 单包 Skill 重构计划

## 目标

把当前“1 个 orchestrator + 4 个阶段 skill + 根级 shared”重构为一个可 install 的 `skills/media-plan/` 单包 skill，让运行时只依赖包内 `phases/` 与 `shared/` 文件，从而保证 shared 内容只维护一份且路径稳定可读。

## 范围

- 包含：
  - 新建 `skills/media-plan/`，包含 `SKILL.md`、`phases/`、`shared/`
  - 迁移现有 orchestrator、research、ideation、execution、proposal 规则
  - 迁移现有 shared contract、灵感母题库、预搜索 source map
  - 更新 README、ARCHITECTURE、QUALITY_SCORE、设计文档与 history
  - 退役旧 runtime skill 入口，避免继续被自动路由
- 不包含：
  - 新增真实脚本化 loader 或运行时程序
  - 接入 Tavily 设计里尚未实现的 provider runtime
  - 新增自动化测试框架

## 背景

- 相关文档：
  - `README.md`
  - `docs/ARCHITECTURE.md`
  - `docs/design-docs/2026-04-21-media-plan-skill-design.md`
  - `docs/product-specs/2026-04-21-media-plan-skill-pressure-tests.md`
  - `docs/DIRECT.md`
- 相关代码路径：
  - `skills/media-plan-orchestrator/`
  - `skills/industry-insight-research/`
  - `skills/strategy-ideation/`
  - `skills/execution-planning/`
  - `skills/proposal-writing-review/`
  - `skills/shared/`
- 已知约束：
  - 目标宿主会带上单个 skill 包的整个目录，因此包内 `phases/` 与 `shared/` 可读。
  - 顶层 `SKILL.md` 仍需保留最小 gate，避免 phase 文件未读时完全失控。
  - 仓库内文档与 runtime 结构变更必须同步。

## 风险

- 风险：主 skill 过薄，模型不稳定读取 phase 文件。
  - 缓解方式：在顶层 `SKILL.md` 保留 workflow、阶段切换规则与最小 gate，并明确每阶段必读的包内文件。
- 风险：旧 skill 入口继续被路由，造成双轨行为。
  - 缓解方式：删除旧 runtime skill 目录，统一只保留 `skills/media-plan/`。
- 风险：shared 迁移后文档路径失真。
  - 缓解方式：同步更新 README、ARCHITECTURE、设计文档、history。

## 里程碑

1. 收敛单包目录结构与迁移计划。
2. 完成 `skills/media-plan/` 创建与内容迁移。
3. 清理旧入口、更新文档并验证路径闭环。

## 验证方式

- 命令：
  - `git diff --stat -- skills/media-plan docs/README.md docs/ARCHITECTURE.md`
  - `git status --short`
  - 检查 `skills/media-plan/**/*.md` 内不存在包外路径依赖
- 手工检查：
  - `skills/media-plan/SKILL.md` 是否明确按阶段读取 `phases/` 与 `shared/`
  - `shared` 是否只保留在单包目录下的一份 canonical source
  - README / ARCHITECTURE 是否反映“单包 skill + 包内 phases/shared”
- 观测检查：
  - 旧 skill 目录不再作为 runtime 入口存在
  - 关键 gate 仍能在顶层 `SKILL.md` 中看见

## 进度记录

- [x] 里程碑 1
- [x] 里程碑 2
- [x] 里程碑 3

## 决策记录

- 2026-04-21：决定从多 skill + 根级 shared 重构为单包 `skills/media-plan/`。原因是目标优先级是 shared 只维护一份且运行时稳定可读，而不是保留阶段级独立路由。影响是 runtime 入口将收敛为一个 master skill，阶段规则转入包内 `phases/` 文件按需读取。
- 2026-04-21：实现时保留顶层 `SKILL.md` 的最小 gate，同时把详细阶段规则下沉到 `phases/`，把 contract 与模板收敛到包内 `shared/`。影响是运行时共享文件只维护一份，且不会再次依赖仓库根级 `skills/shared/`。
