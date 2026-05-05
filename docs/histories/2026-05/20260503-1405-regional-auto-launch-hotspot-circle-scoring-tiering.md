## [2026-05-03 14:05] | Task: 热点圈层与评分预算分级补强

### 🤖 Execution Context
* **Agent ID**: `OpenCode`
* **Base Model**: `opencode/gpt-5.3-codex`
* **Runtime**: `OpenCode CLI`

### 📥 User Query
> 按整改意见补强 skill：增加大众文化热点与 AI 偏好、补高净值家庭圈层渗透、在创意评分增加情感裂变维度、预算规则改为分级机制。

### 🛠 Changes Overview
**Scope:** `skills/regional-auto-launch-plan/shared/*` + phase/root consistency wiring

**Key Actions:**
- **[偏好层升级]**: `activity-form-constraints.md` 新增 `大众文化热点借势` 与 `AI/科技热点共创` 偏好类别，并加入 +1 加分说明。
- **[圈层规则补强]**: family-oriented 圈层中加入高净值家庭私享场景（私享会/艺术慈善/高端俱乐部），并在 `action.md` 增加 premium family 场景覆盖要求。
- **[评分模型升级]**: `idea-scorecard.md` 从四维改为五维，新增 `Emotional resonance / propagation potential`（15%），并更新 tie-break 逻辑与评分模板。
- **[预算分级机制]**: `budget-allocation-rule.md` 新增 conservative/standard/flagship 三档及阈值差异，并将场地占比/单卡占比改为 tier-dependent。
- **[检索补强]**: `query-playbook.md` 新增大众文化和 AI 热点检索 query family。
- **[执行一致性]**: 更新 `action.md` 与 `SKILL.md` 中评分维度描述，避免与新版 scorecard 冲突。

### 🧠 Design Intent (Why)
避免方案被技术验证和保守预算双重锁死，给出可控升级路径：在预算可提升时允许更强视觉与体验，同时通过情感传播评分抬高“可分享、可裂变”内容的优先级。

### 📁 Files Modified
- `skills/regional-auto-launch-plan/shared/activity-form-constraints.md`
- `skills/regional-auto-launch-plan/shared/idea-scorecard.md`
- `skills/regional-auto-launch-plan/shared/budget-allocation-rule.md`
- `skills/regional-auto-launch-plan/shared/query-playbook.md`
- `skills/regional-auto-launch-plan/phases/action.md`
- `skills/regional-auto-launch-plan/SKILL.md`
