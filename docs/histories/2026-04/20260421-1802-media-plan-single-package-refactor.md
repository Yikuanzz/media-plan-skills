## [2026-04-21 18:02] | Task: 重构为单包 media-plan skill

### 🤖 Execution Context
* **Agent ID**: `OpenCode`
* **Base Model**: `opencode/gpt-5.4`
* **Runtime**: `OpenCode API on win32`

### 📥 User Query
> shared 内容只维护一份，运行时稳定可读。按照单包 skill 的思路输出一份可执行重构 plan，然后再实施。

### 🛠 Changes Overview
**Scope:** `skills/media-plan`, `CLAUDE.md`, `README.md`, `docs/ARCHITECTURE.md`, `docs/QUALITY_SCORE.md`, `docs/design-docs`, `docs/exec-plans/active`, `docs/histories`

**Key Actions:**
- **建立单包入口**: 新增 `skills/media-plan/`，把 runtime 入口收敛到一个 master skill，并在包内用 `phases/` 管阶段、`shared/` 管 contract。
- **迁移共享资产**: 把 intake、research、idea、proposal、灵感母题、source map、source trust 与 query playbook 收敛到 `skills/media-plan/shared/`，shared 只维护一份。
- **退役旧 runtime 结构**: 删除旧的 5 个 runtime skill 文件和根级 `skills/shared/` 文件，避免宿主继续命中双轨结构。
- **同步仓库文档**: 更新 README、架构文档、质量评分、设计文档和 active execution plan，使仓库当前结构与运行方式一致。

### 🧠 Design Intent (Why)
多 skill + 根级 shared 的结构在某些宿主下容易出现 shared 断链，因此之前只能靠在多个 `SKILL.md` 中镜像最小 contract 兜底。改成单包 `skills/media-plan/` 后，运行时只需依赖同一个 skill 包内的 `phases/` 和 `shared/`，既满足 shared 只维护一份，也保留了按阶段分文件管理的可维护性。

### 📁 Files Modified
- `CLAUDE.md`
- `skills/media-plan/SKILL.md`
- `skills/media-plan/phases/pre-brief-search.md`
- `skills/media-plan/phases/intake.md`
- `skills/media-plan/phases/research.md`
- `skills/media-plan/phases/ideation.md`
- `skills/media-plan/phases/execution.md`
- `skills/media-plan/phases/proposal.md`
- `skills/media-plan/shared/brief-intake-template.md`
- `skills/media-plan/shared/research-rubric.md`
- `skills/media-plan/shared/idea-scorecard.md`
- `skills/media-plan/shared/proposal-template.md`
- `skills/media-plan/shared/inspiration-directions.md`
- `skills/media-plan/shared/pre-brief-source-map.md`
- `skills/media-plan/shared/source-trust-policy.md`
- `skills/media-plan/shared/query-playbook.md`
- `docs/exec-plans/active/2026-04-21-media-plan-single-package-refactor.md`
- `README.md`
- `docs/ARCHITECTURE.md`
- `docs/QUALITY_SCORE.md`
- `docs/design-docs/2026-04-21-media-plan-skill-design.md`
- `docs/design-docs/2026-04-21-tavily-research-upgrade.md`
- `docs/histories/2026-04/20260421-1802-media-plan-single-package-refactor.md`
