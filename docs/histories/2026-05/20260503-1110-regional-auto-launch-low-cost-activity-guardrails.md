## [2026-05-03 11:10] | Task: 强化低成本活动护栏

### 🤖 Execution Context
* **Agent ID**: `OpenCode`
* **Base Model**: `opencode/gpt-5.3-codex`
* **Runtime**: `OpenCode CLI`

### 📥 User Query
> 参考补充内容优化 `regional-auto-launch-plan`：明确避免高成本高难度活动，强化低成本、易执行、征集共创与可追踪转化路径。

### 🛠 Changes Overview
**Scope:** `skills/regional-auto-launch-plan/*`（activity form constraints + action contracts + conversion guidance）

**Key Actions:**
- **[排除清单细化]**: 在 `activity-form-constraints.md` 新增 3D 高成本内容、复杂设备重搭建、传统高投入车展、高门槛线下活动为硬 veto。
- **[偏好清单强化]**: 增补 UGC 征集、话题挑战、轻量地标联动、48 小时深度试驾、车主联盟裂变等低成本高传播形态。
- **[组织者导向]**: 新增 `Activity Design Orientation`，要求优先借势现有资源并强制可量化归因链路。
- **[Action 门禁联动]**: 在 `phases/action.md` 增加 `Activity Form Gate`，并显式读取 `activity-form-constraints.md`。
- **[模板约束升级]**: 在 `action-playbook-template.md` 增加 `Organizer mode first` 与 `Heavy-production veto` 约束，并在阶段规则中强化 UGC 与深度试驾偏好。
- **[促单模块补充]**: 在 `conversion-mechanics-playbook.md` 增加低成本促单活动优先形式。

### 🧠 Design Intent (Why)
把活动设计从“重制作执行”收敛为“低成本组织协同”，提高区域项目可执行性与可复制性，同时保留可追踪的线索-试驾-下定转化闭环。

### 📁 Files Modified
- `skills/regional-auto-launch-plan/shared/activity-form-constraints.md`
- `skills/regional-auto-launch-plan/shared/action-playbook-template.md`
- `skills/regional-auto-launch-plan/phases/action.md`
- `skills/regional-auto-launch-plan/shared/conversion-mechanics-playbook.md`
- `skills/regional-auto-launch-plan/SKILL.md`
