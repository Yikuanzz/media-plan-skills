## [2026-04-22 15:52] | Task: 升级亮点机制生成链路

### 🤖 Execution Context
* **Agent ID**: `OpenCode`
* **Base Model**: `opencode/gpt-5.4`
* **Runtime**: `OpenCode API on win32`

### 📥 User Query
> 分析一下目前的 skills 给出的策划方案，现在的 skills 规划怎么样？我感觉还是很缺少亮点和创新，你可以看看 `docs/TARGET.md` 的内容，我的目标生成的策划方案文字内容希望能达到目标的水平。后续用户确认优先做「亮点机制生成」。

### 🛠 Changes Overview
**Scope:** `skills/media-plan`, `scripts`, `docs/product-specs`, `docs/design-docs`, `docs/exec-plans`, `docs/histories`, `docs/releases`, `README.md`, `docs/ARCHITECTURE.md`, `docs/QUALITY_SCORE.md`

**Key Actions:**
- **新增亮点机制 canonical contract**: 新建 `highlight-mechanism-canvas.md`，把主题、主事件、参与/传播/转化机制和阶段编排收口成统一 handoff。
- **接入 runtime workflow**: 修改 `SKILL.md`、research、ideation、execution、proposal 和 shared rubric/template，让保留方向必须长成机制，再进入执行和成案。
- **补齐机械守护与失败场景**: 新增亮点机制检查脚本并接入 `scripts/ci.sh`，同时扩展 pressure tests、架构文档、质量评分和发布记录。

### 🧠 Design Intent (Why)
当前 media-plan skill 更擅长防止低质量输出，但还不够擅长稳定产出“有核心主题、有主事件、有阶段节奏”的提案型方案。问题不在 inspiration directions 数量，而在 ideation 到 proposal 之间缺少一层把方向长成机制的显式 contract。补上这层后，skill 仍保持通用型，但更容易接近 `docs/TARGET.md` 展示的成案质感。

### 📁 Files Modified
- `skills/media-plan/shared/highlight-mechanism-canvas.md`
- `skills/media-plan/SKILL.md`
- `skills/media-plan/phases/research.md`
- `skills/media-plan/phases/ideation.md`
- `skills/media-plan/phases/execution.md`
- `skills/media-plan/phases/proposal.md`
- `skills/media-plan/shared/research-rubric.md`
- `skills/media-plan/shared/idea-scorecard.md`
- `skills/media-plan/shared/proposal-template.md`
- `scripts/check-media-plan-highlight-mechanism.sh`
- `scripts/ci.sh`
- `scripts/check-repo-hygiene.sh`
- `docs/product-specs/2026-04-21-media-plan-skill-pressure-tests.md`
- `docs/design-docs/2026-04-22-highlight-mechanism-upgrade.md`
- `docs/design-docs/2026-04-21-media-plan-skill-design.md`
- `docs/design-docs/index.md`
- `docs/exec-plans/active/2026-04-22-highlight-mechanism-upgrade.md`
- `docs/histories/2026-04/20260422-1552-highlight-mechanism-upgrade.md`
- `docs/releases/feature-release-notes.md`
- `README.md`
- `docs/ARCHITECTURE.md`
- `docs/QUALITY_SCORE.md`
