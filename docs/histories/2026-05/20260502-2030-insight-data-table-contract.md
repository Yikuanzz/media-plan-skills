## [2026-05-02 20:30] | Task: 补齐洞察数据表约束

### 🤖 Execution Context
* **Agent ID**: `OpenCode`
* **Base Model**: `opencode/gpt-5.3-codex`
* **Runtime**: `OpenCode CLI`

### 📥 User Query
> regional-auto-launch-plan insight 中，市场洞察部分缺少数据表

### 🛠 Changes Overview
**Scope:** `skills/regional-auto-launch-plan`

**Key Actions:**
- **[Template 强制项补齐]**: 在提案模板里新增 Market Insight 必须包含 `Insight Data Table` 的硬性规则。
- **[Insight 阶段合同补强]**: 在 `phases/insight.md` 增加数据表结构要求，并将缺失数据表视为 gate fail。
- **[模块模板落地]**: 在 `market-environment` 与 `customer-segmentation` 模块模板中新增可直接填写的数据表骨架。
- **[自检与路由同步]**: 在 `quality-self-check.md` 新增 C8 反压缩检查，并在 `SKILL.md` review route 加入 C8 失败回路。

### 🧠 Design Intent (Why)
让洞察章节不再只输出叙述性文本，而是稳定产出可比对、可追溯的结构化数据证据，减少“看起来有洞察但缺少量化承载”的交付风险。

### 📁 Files Modified
- `skills/regional-auto-launch-plan/shared/proposal-template.md`
- `skills/regional-auto-launch-plan/phases/insight.md`
- `skills/regional-auto-launch-plan/shared/insight-modules/market-environment.md`
- `skills/regional-auto-launch-plan/shared/insight-modules/customer-segmentation.md`
- `skills/regional-auto-launch-plan/shared/quality-self-check.md`
- `skills/regional-auto-launch-plan/SKILL.md`
