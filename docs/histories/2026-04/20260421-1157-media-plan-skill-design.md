## [2026-04-21 11:57] | Task: 设计 media plan skill

### 🤖 Execution Context
* **Agent ID**: `OpenCode`
* **Base Model**: `opencode/gpt-5.4`
* **Runtime**: `OpenCode API on win32`

### 📥 User Query
> 规划一个适合传媒策划方案的 skills，围绕深度行业洞察、战略策划、执行落地、方案写作四个维度，支持自动调研、热点获取、创意发散、方案创作、评审与回退 loop，并说明该如何执行完成这个 skill 的制作。

### 🛠 Changes Overview
**Scope:** `docs/design-docs`, `docs/exec-plans`, `docs/product-specs`, `docs/histories`, `docs/ARCHITECTURE.md`, `docs/QUALITY_SCORE.md`, `skills/`

**Key Actions:**
- **沉淀设计与实施约束**: 新增设计文档和 execution plan，明确 skill 目标范围、阶段拆分、共享资产、回退 loop 与任务落地顺序。
- **补齐 product spec**: 新增 pressure test spec，把 brief 缺口、弱证据、老套创意、执行失配等失败模式写成显式验收场景。
- **实现 skill 体系首版**: 落地 `media-plan-orchestrator`、4 个阶段子 skill，以及 intake template、research rubric、idea scorecard、proposal template 等共享文件。
- **同步仓库文档**: 更新 architecture、quality score 与 history，使仓库级文档反映当前 media-plan-skill 系统而不是通用模板状态。

### 🧠 Design Intent (Why)
先把设计、execution plan 和 pressure-test 口径写清楚，再按阶段实现 skill 与共享约束，可以避免一开始就把大量 prompt 和规则堆进单体 skill，也能让后续的扩展、验证和文档同步都围绕同一套契约推进。

### 📁 Files Modified
- `docs/design-docs/2026-04-21-media-plan-skill-design.md`
- `docs/exec-plans/completed/2026-04-21-media-plan-skill-implementation.md`
- `docs/product-specs/2026-04-21-media-plan-skill-pressure-tests.md`
- `docs/ARCHITECTURE.md`
- `docs/QUALITY_SCORE.md`
- `README.md`
- `docs/releases/feature-release-notes.md`
- `skills/media-plan-orchestrator/SKILL.md`
- `skills/industry-insight-research/SKILL.md`
- `skills/strategy-ideation/SKILL.md`
- `skills/execution-planning/SKILL.md`
- `skills/proposal-writing-review/SKILL.md`
- `skills/shared/brief-intake-template.md`
- `skills/shared/research-rubric.md`
- `skills/shared/idea-scorecard.md`
- `skills/shared/proposal-template.md`
- `docs/histories/2026-04/20260421-1157-media-plan-skill-design.md`
