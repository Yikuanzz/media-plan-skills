## [2026-05-03 09:00] | Task: 强化区域上市skill约束层

### 🤖 Execution Context
* **Agent ID**: `OpenCode`
* **Base Model**: `opencode/gpt-5.3-codex`
* **Runtime**: `OpenCode CLI`

### 📥 User Query
> 参考对比整改意见，完善 `regional-auto-launch-plan` skill：补齐双轴主题叙事、双巨头信任价值、城市作战地图、超预算感事件、家庭情感仪式、大众热点借势、视觉锚点与品牌KPI等机制约束。

### 🛠 Changes Overview
**Scope:** `skills/regional-auto-launch-plan/*`（phase contracts + shared contracts + gate checks）

**Key Actions:**
- **[策略叙事升级]**: 在 `core-theme-derivation` 与 `phase strategy` 中加入双轴平衡强校验（技术/性能 + 家庭/情感），并新增缺失自动修正规则。
- **[产品价值补全]**: 在 `product-value` 模块新增独立 `Trust value` 层，要求品牌信任资产单独成段、可追溯到 slogan derivation 与 SWOT。
- **[城市与热点精度]**: 在 `city-signal` 增加 `City Battlefield Map` 表格（3极+实名锚点），在 `market-environment` 增加上市窗口 +/-15 天的大众文化热点扫描与零成本借势硬要求。
- **[动作模块事件化]**: 在 `action-playbook-template` 与 `phase action` 增加每阶段 `budget-busting event` 强制项、Phase 2 `Family Emotional Ritual` 强制项、以及 source-id trace 选主卡门槛。
- **[提案与运营补强]**: 在 `proposal-template`/`phase proposal` 增加 `Visual Anchor List`（三张概念图文字描述），在 `operations` 模块将 Node Checkpoints 升级为销售KPI+品牌KPI双维度并强制数据来源。
- **[统一验收口径]**: 在 `quality-self-check` 增加 C9-C11 与对应标准项，覆盖视觉锚点、双维KPI、预算硬约束、家庭仪式与事件杠杆检查。

### 🧠 Design Intent (Why)
将 skill 从“技术上自洽的区域上市方案生成器”升级为“兼顾家庭情感、品牌信任、空间坐标、事件声量与品牌资产沉淀的整合营销生成器”，减少输出偏技术冷叙事、区域落点不精确、以及低预算方案缺事件感的问题。

### 📁 Files Modified
- `skills/regional-auto-launch-plan/SKILL.md`
- `skills/regional-auto-launch-plan/phases/insight.md`
- `skills/regional-auto-launch-plan/phases/strategy.md`
- `skills/regional-auto-launch-plan/phases/action.md`
- `skills/regional-auto-launch-plan/phases/operations.md`
- `skills/regional-auto-launch-plan/phases/proposal.md`
- `skills/regional-auto-launch-plan/shared/core-theme-derivation.md`
- `skills/regional-auto-launch-plan/shared/action-playbook-template.md`
- `skills/regional-auto-launch-plan/shared/operations-assurance-template.md`
- `skills/regional-auto-launch-plan/shared/proposal-template.md`
- `skills/regional-auto-launch-plan/shared/quality-self-check.md`
- `skills/regional-auto-launch-plan/shared/insight-modules/product-value.md`
- `skills/regional-auto-launch-plan/shared/insight-modules/city-signal.md`
- `skills/regional-auto-launch-plan/shared/insight-modules/market-environment.md`
