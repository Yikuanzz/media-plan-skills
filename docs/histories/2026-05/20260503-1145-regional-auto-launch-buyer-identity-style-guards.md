## [2026-05-03 11:45] | Task: buyer identity 与提案风格约束升级

### 🤖 Execution Context
* **Agent ID**: `OpenCode`
* **Base Model**: `opencode/gpt-5.3-codex`
* **Runtime**: `OpenCode CLI`

### 📥 User Query
> 按给定文本替换规则完善 `regional-auto-launch-plan`：移除 family 硬编码，改为 buyer-identity-first；补圈层渗透/大众文化热点/非传统发布仪式推导；并增加 proposal 输出风格约束与竞品应对写法约束。

### 🛠 Changes Overview
**Scope:** `skills/regional-auto-launch-plan/*`（global gates + phase contracts + shared constraints + style checks）

**Key Actions:**
- **[全局规则升级]**: `SKILL.md` 新增第 11 条 `BUYER-IDENTITY-FIRST THEMING`，并将 Strategy gate 从 `technology + family` 改为 `technology + <primary-buyer-identity>`。
- **[Insight/Strategy 串联]**: `insight.md` 强制在 2.5 推导 `primary_buyer_identity` 并写入 handoff；`strategy.md` 明确双轴必须引用该 identity 与证据来源。
- **[Action 推导机制替换]**: `action.md` 将 Phase 2 ritual 从固定 family 形式替换为非传统发布仪式四步推导，并新增 `Circle Infiltration Gate` 与 `Hot-Spot Leverage Gate`。
- **[Proposal 风格收口]**: `proposal.md` 新增 assembly 风格约束（中文冲击标题、竞品动作句、活动现场感、KPI 集中于 Operations、引用标注仅保留 Insight），并新增 style violation 路由。
- **[Shared 约束同步]**: 更新 `activity-form-constraints.md`（圈层渗透/文化时刻/自传播测试偏好）、`quality-self-check.md`（OUTPUT STYLE 条款）、`core-theme-derivation.md`（Axis B 改 identity）、`competitor-deep.md`（竞品应对必须是营销动作）。

### 🧠 Design Intent (Why)
让策略与活动从“默认家庭叙事”升级为“由客群身份驱动的可变叙事”，并通过风格门禁把最终输出固定在“创意提案”体，而非参数化分析报告体。

### 📁 Files Modified
- `skills/regional-auto-launch-plan/SKILL.md`
- `skills/regional-auto-launch-plan/phases/insight.md`
- `skills/regional-auto-launch-plan/phases/strategy.md`
- `skills/regional-auto-launch-plan/phases/action.md`
- `skills/regional-auto-launch-plan/phases/proposal.md`
- `skills/regional-auto-launch-plan/shared/activity-form-constraints.md`
- `skills/regional-auto-launch-plan/shared/quality-self-check.md`
- `skills/regional-auto-launch-plan/shared/core-theme-derivation.md`
- `skills/regional-auto-launch-plan/shared/insight-modules/customer-segmentation.md`
- `skills/regional-auto-launch-plan/shared/insight-modules/market-environment.md`
- `skills/regional-auto-launch-plan/shared/insight-modules/competitor-deep.md`
- `skills/regional-auto-launch-plan/shared/action-playbook-template.md`
