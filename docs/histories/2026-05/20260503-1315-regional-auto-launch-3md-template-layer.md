## [2026-05-03 13:15] | Task: 增加3md落地模板层

### 🤖 Execution Context
* **Agent ID**: `OpenCode`
* **Base Model**: `opencode/gpt-5.3-codex`
* **Runtime**: `OpenCode CLI`

### 📥 User Query
> 增加一层模板，并对照 `3.md` 确保 skill 执行时能落实“可落地上市方案”要求（选址、现场布置、流程、转化闭环等）。

### 🛠 Changes Overview
**Scope:** `skills/regional-auto-launch-plan/*`（action execution template + proposal alignment checklist + gate wiring）

**Key Actions:**
- **[新增模板层]**: 新增 `shared/launch-execution-template.md`，提供 Phase 2 主会场执行包模板（选址双方案、空间部署、分钟级流程、现场集客留资、N-7/N/N+3传播图表、平台差异矩阵、KOL/KOC分层）。
- **[新增对照清单]**: 新增 `shared/3md-alignment-checklist.md`，将 3.md 的模块目标转为 proposal 阶段可执行核查项。
- **[流程接线]**: 在 `SKILL.md`、`phases/action.md`、`phases/proposal.md` 中加入新文件 required reads，并新增对应 gate/check 规则。
- **[结构与质量约束]**: `proposal-template.md` 与 `quality-self-check.md` 增加落地执行包、传播矩阵、创意命名与闭环要求。

### 🧠 Design Intent (Why)
把“框架能讲通”升级为“团队能照着执行”：在输出层提供固定模板，在流程层提供强制门禁，在最终提案层提供 3.md 对照检查，减少泛化叙述导致的落地失败。

### 📁 Files Modified
- `skills/regional-auto-launch-plan/shared/launch-execution-template.md`
- `skills/regional-auto-launch-plan/shared/3md-alignment-checklist.md`
- `skills/regional-auto-launch-plan/SKILL.md`
- `skills/regional-auto-launch-plan/phases/action.md`
- `skills/regional-auto-launch-plan/phases/proposal.md`
- `skills/regional-auto-launch-plan/shared/proposal-template.md`
- `skills/regional-auto-launch-plan/shared/quality-self-check.md`
