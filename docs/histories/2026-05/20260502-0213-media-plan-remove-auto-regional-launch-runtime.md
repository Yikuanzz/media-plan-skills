## [2026-05-02 02:13] | Task: 清理 media-plan 残留模式约束

### 🤖 Execution Context
* **Agent ID**: `OpenCode (implementer subagent)`
* **Base Model**: `opencode/gpt-5.3-codex`
* **Runtime**: `OpenCode CLI`

### 📥 User Query
> 修复 Task 7 质量问题：media-plan 已将汽车区域上市 brief 路由到专用 skill，但 `auto_regional_launch` 在 phase/shared contract 仍有残留引用。要求移除或中和这些运行时约束，保持通用 media-plan 行为一致，并提交 commit。

### 🛠 Changes Overview
**Scope:** `skills/media-plan/**`, `docs/histories/**`

**Key Actions:**
- **移除残留模式依赖**: 清理 proposal/ideation/execution/research/shared 合同中 `auto_regional_launch` 触发的条件判断与 checklist。
- **保留通用质量门槛**: 将原本模式特定的校验改为通用规则或按场景条件触发，避免破坏 general proposal 流程。
- **新增变更留痕**: 按仓库 history 规范新增本次任务记录。

### 🧠 Design Intent (Why)
`auto_regional_launch` 已从 media-plan 运行时路由迁出，继续保留同名 contract 会导致阶段规则互相冲突。此次改动统一约束口径，确保 media-plan 仅依赖当前有效模板和通用执行 contract。

### 📁 Files Modified
- `skills/media-plan/phases/proposal.md`
- `skills/media-plan/phases/ideation.md`
- `skills/media-plan/phases/execution.md`
- `skills/media-plan/phases/research.md`
- `skills/media-plan/shared/content-assets.md`
- `skills/media-plan/shared/core-strategic-idea.md`
- `skills/media-plan/shared/highlight-mechanism-canvas.md`
- `docs/histories/2026-05/20260502-0213-media-plan-remove-auto-regional-launch-runtime.md`
