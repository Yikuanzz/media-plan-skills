## [2026-04-21 17:00] | Task: 升级灵感引导与预搜索信号

### 🤖 Execution Context
* **Agent ID**: `OpenCode`
* **Base Model**: `opencode/gpt-5.4`
* **Runtime**: `OpenCode API on win32`

### 📥 User Query
> 我想完善灵感方面的内容，我有一些示例方向可以引导模型往这些方向去思考：`docs/DIRECT.md`。另外前期预搜索时可以添加一些常见的咨询源，可以获取近期热点、新闻、趋势，这样能方便判断来进行结合。默认优先中国平台与社媒信号。

### 🛠 Changes Overview
**Scope:** `skills/shared`, `skills/media-plan-orchestrator`, `skills/industry-insight-research`, `skills/strategy-ideation`, `docs/product-specs`, `README.md`, `docs/ARCHITECTURE.md`, `docs/QUALITY_SCORE.md`, `docs/design-docs`, `docs/histories`

**Key Actions:**
- **新增灵感 canonical source**: 从 `docs/DIRECT.md` 抽象出结构化的 `inspiration-directions.md`，把母题、适用边界、执行动作和风险显式化。
- **新增预搜索 source map**: 定义 `pre-brief-source-map.md`，把中国平台与社媒信号设为默认优先，并补充媒体、咨询和官方来源的校准职责。
- **接入运行时 workflow**: 修改 orchestrator、research 和 ideation，让预搜索输出 inspiration hints，research 验证方向支持度，ideation 生成带 inspiration anchor 与 wildcard 的方向。
- **补齐失败场景与仓库文档**: 扩展 pressure tests，覆盖灵感过拟合、热点强蹭和低可信信号误用，并同步 README、架构、质量文档。

### 🧠 Design Intent (Why)
`DIRECT.md` 适合作为“灵感母题库”，但如果没有近期信号层，很容易变成静态模板；反过来，如果只有热点没有母题边界，又容易强行蹭热点。把母题库和预搜索 source priority 分开沉淀，再在运行时用 inspiration hints 把两者接起来，能让 ideation 更有方向，同时降低模板化和信号误用风险。

### 📁 Files Modified
- `skills/shared/inspiration-directions.md`
- `skills/shared/pre-brief-source-map.md`
- `skills/media-plan-orchestrator/SKILL.md`
- `skills/industry-insight-research/SKILL.md`
- `skills/strategy-ideation/SKILL.md`
- `docs/product-specs/2026-04-21-media-plan-skill-pressure-tests.md`
- `README.md`
- `docs/ARCHITECTURE.md`
- `docs/QUALITY_SCORE.md`
- `docs/design-docs/2026-04-21-media-plan-skill-design.md`
- `docs/histories/2026-04/20260421-1700-inspiration-direction-upgrade.md`
