## [2026-05-03 10:15] | Task: 补齐集客促单留客三维约束

### 🤖 Execution Context
* **Agent ID**: `OpenCode`
* **Base Model**: `opencode/gpt-5.3-codex`
* **Runtime**: `OpenCode CLI`

### 📥 User Query
> 按给定计划优化 `regional-auto-launch-plan` skill：新增集客/促单/留客三类 shared 模块，并在 `SKILL.md`、`phases/action.md`、`phases/operations.md`、`shared/action-playbook-template.md` 中接入完整引用链和门禁。

### 🛠 Changes Overview
**Scope:** `skills/regional-auto-launch-plan/*`（shared contracts + phase contracts + root workflow contract）

**Key Actions:**
- **[新增 shared 模块]**: 新增 `lead-capture-playbook.md`、`conversion-mechanics-playbook.md`、`private-domain-operations.md`，覆盖平台线索捕获、促单机制、私域留客三维能力。
- **[主工作流接入]**: 更新 `SKILL.md` shared index、Step 5/6 required reads 与 Global hard gates，新增 Action Phase 3 促单深度门禁与 Operations 私域完整性门禁。
- **[Action 阶段升级]**: 在 `phases/action.md` 增加三类输入引用、Lead/Conversion/Retention 三类 hard gates、Phase 3 summary 新字段，以及三份新增输出摘要。
- **[Operations 阶段升级]**: 在 `phases/operations.md` 扩展为六个必选 block，加入 Private-Domain Architecture 及 gate 约束。
- **[模板联动]**: 在 `shared/action-playbook-template.md` 的 sub-agent prompt 和 main-agent review 中补齐 lead capture、conversion mechanics、private-domain seeding 三段约束与校验。
- **[反压缩门禁一致性]**: 移除 `quality-self-check.md` 里的 C9-C11，保持 anti-compression 仍由 C1-C8 承载，符合本轮设计决策。

### 🧠 Design Intent (Why)
在不新增 phase、不新增 chapter 文件的前提下，把 Action 与 Operations 阶段从“有活动卡”升级为“有漏斗闭环”：前端能集客，中段能促单，后段能留客，且每一步都有可执行门禁和交接结构。

### 📁 Files Modified
- `skills/regional-auto-launch-plan/SKILL.md`
- `skills/regional-auto-launch-plan/phases/action.md`
- `skills/regional-auto-launch-plan/phases/operations.md`
- `skills/regional-auto-launch-plan/shared/action-playbook-template.md`
- `skills/regional-auto-launch-plan/shared/operations-assurance-template.md`
- `skills/regional-auto-launch-plan/shared/quality-self-check.md`
- `skills/regional-auto-launch-plan/shared/lead-capture-playbook.md`
- `skills/regional-auto-launch-plan/shared/conversion-mechanics-playbook.md`
- `skills/regional-auto-launch-plan/shared/private-domain-operations.md`
