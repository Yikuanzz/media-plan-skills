## [2026-05-03 12:30] | Task: 对齐3md落地型输出

### 🤖 Execution Context
* **Agent ID**: `OpenCode`
* **Base Model**: `opencode/gpt-5.3-codex`
* **Runtime**: `OpenCode CLI`

### 📥 User Query
> 按 `3.md` 的需求把 `regional-auto-launch-plan` 调成可落地输出：弱化行业借势主轴，强化上市主事件执行包（选址、现场布置、流程、转化），并统一提案风格。

### 🛠 Changes Overview
**Scope:** `skills/regional-auto-launch-plan/*`（global rules + phase gates + shared templates + quality checks）

**Key Actions:**
- **[全局规则]**: `SKILL.md` 增加 `DELIVERY-FIRST LAUNCH DESIGN`，明确行业展会不得作为主事件主轴。
- **[洞察阶段]**: `insight.md` 新增 `Task Thesis` 输出要求，并将热点借势从硬门槛改为可选项；若使用需符合 buyer identity。
- **[动作阶段]**: `action.md` 新增 `Owned Launch Event Gate`，强制至少一个主事件输出选址+布置+流程+留资促单全包；热点借势改为可选 gate。
- **[模板补强]**: `action-playbook-template.md` 对线下/混合活动补充执行附录（选址备选、空间布局、run sheet、留资交接）。
- **[提案结构与风格]**: `proposal-template.md` 与 `proposal.md` 增加任务课题与执行包要求，加入提案体风格检查与 style route。
- **[质量门禁]**: `quality-self-check.md` 增加落地执行包检查、KPI集中检查、竞品应对动作句检查、行业事件主轴禁止检查。

### 🧠 Design Intent (Why)
让 skill 输出从“借势型传播框架”转为“区域上市执行方案”：在 20-30 万预算约束下，优先给出可直接执行的现场方案与转化链路，而非依赖大型行业活动叙事。

### 📁 Files Modified
- `skills/regional-auto-launch-plan/SKILL.md`
- `skills/regional-auto-launch-plan/phases/insight.md`
- `skills/regional-auto-launch-plan/phases/strategy.md`
- `skills/regional-auto-launch-plan/phases/action.md`
- `skills/regional-auto-launch-plan/phases/proposal.md`
- `skills/regional-auto-launch-plan/shared/action-playbook-template.md`
- `skills/regional-auto-launch-plan/shared/activity-form-constraints.md`
- `skills/regional-auto-launch-plan/shared/proposal-template.md`
- `skills/regional-auto-launch-plan/shared/quality-self-check.md`
- `skills/regional-auto-launch-plan/shared/insight-modules/market-environment.md`
