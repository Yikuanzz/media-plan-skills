## [2026-04-21 15:30] | Task: 设计 Tavily research upgrade

### 🤖 Execution Context
* **Agent ID**: `OpenCode`
* **Base Model**: `opencode/gpt-5.4`
* **Runtime**: `OpenCode API on win32`

### 📥 User Query
> 规划 Tavily 接入设计文档，先不实现，只作为后续 TODO 的任务，给出设计文档大纲和具体文件变更清单。

### 🛠 Changes Overview
**Scope:** `docs/design-docs`, `docs/exec-plans`, `docs/histories`

**Key Actions:**
- **新增设计文档**: 沉淀 Tavily-first research upgrade 的目标、非目标、workflow、contract、fallback 和文件改动范围。
- **登记后续 TODO**: 在技术债追踪中记录 Tavily research quality upgrade，明确当前不实现、后续按设计推进。
- **同步索引与留痕**: 更新设计文档索引，并新增对应 history 记录。

### 🧠 Design Intent (Why)
当前 media-plan skill 的主要短板在 research 质量和证据链稳定性，而不是 orchestrator 主流程本身。先把 Tavily 接入设计写清楚并记成 TODO，可以为后续提升调研质量预留明确边界，同时避免当前任务扩散到实现阶段。

### 📁 Files Modified
- `docs/design-docs/2026-04-21-tavily-research-upgrade.md`
- `docs/design-docs/index.md`
- `docs/exec-plans/tech-debt-tracker.md`
- `docs/histories/2026-04/20260421-1530-tavily-research-upgrade-design.md`
