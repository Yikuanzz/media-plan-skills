## [2026-04-23 15:27] | Task: 升级汽车区域上市单产物提案结构

### 🤖 Execution Context
* **Agent ID**: `OpenCode`
* **Base Model**: `opencode/gpt-5.3-codex`
* **Runtime**: `OpenCode API on win32`

### 📥 User Query
> 确认按单产物方向改造：只要一份可直接转 PPT 的策划方案，重点改 proposal template、research 必收城市证据和 ideation 传播主题维度。

### 🛠 Changes Overview
**Scope:** `skills/media-plan`, `scripts`, `docs`

**Key Actions:**
- **单产物模板路由**: 在 proposal contract 中新增 `auto_regional_launch` 模式，定义汽车区域上市 9 段式单产物结构（含 Execution Action Playbook，PPT-ready）。
- **城市证据强门槛**: research rubric 与 phase 同步增加 `City Evidence Pack` 必收项，缺项即 research fail。
- **主题传播维度**: ideation 与 idea scorecard 增加 `Propagation Theme Clarity` 及城市/区域额外输出字段。
- **流程门禁同步**: 更新 `SKILL.md`、proposal phase 与检查脚本，保证路由和关键字段可被机械校验。
- **执行颗粒强化**: 增加 Program Blueprint 执行动作卡与“拒绝框架化空话”评审门禁，确保方案含赛道/流程/步骤级细节。

### 🧠 Design Intent (Why)
用户目标是输出接近目标策划案风格、可直接转 PPT 的单份文案。为避免仅靠提示词导致输出漂移，本次将“汽车区域上市”场景落为可执行路由和硬门槛，让 proposal 结构、research 证据和 ideation 主题表达在同一链路内一致收口。

### 📁 Files Modified
- `skills/media-plan/shared/proposal-template.md`
- `skills/media-plan/shared/research-rubric.md`
- `skills/media-plan/phases/research.md`
- `skills/media-plan/phases/ideation.md`
- `skills/media-plan/shared/idea-scorecard.md`
- `skills/media-plan/phases/proposal.md`
- `skills/media-plan/SKILL.md`
- `scripts/check-media-plan-highlight-mechanism.sh`
- `docs/ARCHITECTURE.md`
- `README.md`
- `docs/product-specs/2026-04-21-media-plan-skill-pressure-tests.md`
- `docs/histories/2026-04/20260423-1527-auto-regional-launch-template.md`
