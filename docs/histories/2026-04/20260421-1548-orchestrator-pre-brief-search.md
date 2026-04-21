## [2026-04-21 15:48] | Task: 完善 media plan skill 预搜索与运行时契约

### 🤖 Execution Context
* **Agent ID**: `OpenCode`
* **Base Model**: `opencode/gpt-5.4`
* **Runtime**: `OpenCode API on win32`

### 📥 User Query
> 在开始 brief 询问用户之前，先能够进行一轮搜索来获取必要知道的信息；另外，skills 在某些环境下读不到 shared，需要让运行时不依赖这些外部路径。先实现 1，再继续完成 2。

### 🛠 Changes Overview
**Scope:** `skills/media-plan-orchestrator`, `docs/product-specs`, `docs/design-docs`, `docs/ARCHITECTURE.md`, `docs/QUALITY_SCORE.md`, `README.md`, `docs/histories`

**Key Actions:**
- **前置预搜索入流**: 在 `media-plan-orchestrator` 中新增 intake 前轻量预搜索步骤，要求在有可识别信号时先搜一轮再补问。
- **明确输出口径**: 为预搜索补充统一的 `## Pre-Brief Search Context` 摘要结构，限制它只能服务补问和后续 research 线索。
- **运行时自包含 contract**: 把 shared template、scorecard、proposal 结构和关键 review checklist 的最小运行契约镜像进各阶段 `SKILL.md`，避免宿主只复制单个 skill 时断链。
- **同步验证与仓库文档**: 更新 pressure test、设计文档、架构说明、质量评分和 README，使仓库口径与实际 skill 行为一致。

### 🧠 Design Intent (Why)
先做一轮轻量预搜索可以减少机械式补问，让总控在进入 intake 时已经带着最基本的市场与类别上下文；同时把预搜索明确限定为“待确认上下文”，可以避免外部搜索结果反客为主，破坏 brief 门禁。对于只复制单个 skill 的宿主，把最小 contract 直接镜像进运行时 `SKILL.md` 可以消除对 sibling `shared/`、相邻 skill 和 `docs/` 的硬依赖，同时保留仓库内的 canonical source 供维护时同步。

### 📁 Files Modified
- `skills/media-plan-orchestrator/SKILL.md`
- `docs/product-specs/2026-04-21-media-plan-skill-pressure-tests.md`
- `docs/design-docs/2026-04-21-media-plan-skill-design.md`
- `docs/ARCHITECTURE.md`
- `docs/QUALITY_SCORE.md`
- `README.md`
- `skills/industry-insight-research/SKILL.md`
- `skills/strategy-ideation/SKILL.md`
- `skills/execution-planning/SKILL.md`
- `skills/proposal-writing-review/SKILL.md`
- `docs/histories/2026-04/20260421-1548-orchestrator-pre-brief-search.md`
