## [2026-05-02 02:50] | Task: runtime contract hardening

### 🤖 Execution Context
* **Agent ID**: `implementer-subagent-post-review-task8`
* **Base Model**: `opencode/gpt-5.3-codex`
* **Runtime**: `OpenCode CLI`

### 📥 User Query
> 在 `regional-auto-launch-plan` 分包中补齐剩余 runtime 占位合同，更新质量评分，新增轻量检查以拦截占位 stub，并执行现有与新增验证后提交。

### 🛠 Changes Overview
**Scope:** `skills/regional-auto-launch-plan/`, `scripts/`, `docs/`

**Key Actions:**
- **[Contract Completion]**: 将 `regional-auto-launch-plan` 的 `pre-brief-search`、`intake` 和四个 shared 占位文件替换为最小可运行合同，补齐输入规则、输出形状与 gate 约束。
- **[Quality Sync]**: 更新 `docs/QUALITY_SCORE.md`，把质量状态从单包表述改为 `media-plan + regional-auto-launch-plan` 双包成熟度视图。
- **[Guardrail Add-on]**: 新增 `scripts/check-runtime-contract-placeholders.sh`，检查 `skills/*/phases/*.md` 与 `skills/*/shared/*.md` 中 `Purpose: Placeholder` stub，并接入 `scripts/ci.sh` 与 `scripts/check-repo-hygiene.sh`。
- **[Architecture Sync]**: 在 `docs/ARCHITECTURE.md` 补充新检查脚本职责，保持运行守护说明与实际一致。

### 🧠 Design Intent (Why)
本轮目标是把专项分包从“可路由但局部占位”推进到“合同可执行且可机械防回退”。通过补齐最小合同并接入占位检查，避免后续迭代再次把 runtime 文件退化成 stub。

### 📁 Files Modified
- `skills/regional-auto-launch-plan/phases/pre-brief-search.md`
- `skills/regional-auto-launch-plan/phases/intake.md`
- `skills/regional-auto-launch-plan/shared/pre-brief-source-map.md`
- `skills/regional-auto-launch-plan/shared/source-trust-policy.md`
- `skills/regional-auto-launch-plan/shared/highlight-mechanism-canvas.md`
- `skills/regional-auto-launch-plan/shared/content-assets.md`
- `docs/QUALITY_SCORE.md`
- `scripts/check-runtime-contract-placeholders.sh`
- `scripts/ci.sh`
- `scripts/check-repo-hygiene.sh`
- `docs/ARCHITECTURE.md`
- `docs/histories/2026-05/20260502-0250-runtime-contract-hardening.md`
