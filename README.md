# media-plan-skills

## 简介

这是一个面向传媒策划方案场景的 Agent skill 仓库，当前首版聚焦中国市场、提案级输出和 Markdown 正文交付。

仓库内已经包含：

- `skills/media-plan/SKILL.md`：唯一的可 install master skill，负责 pre-brief search、intake、research、ideation、execution 和 proposal review 的完整阶段流转
- `skills/media-plan/phases/`：按阶段拆分的 workflow 模块，供 master skill 按需读取
- `skills/media-plan/shared/`：包内唯一的 canonical contract，包含 intake template、research rubric、idea scorecard、highlight mechanism canvas、proposal template、灵感母题库、预搜索 source map 与 research reference 文件

## 设计要点

本仓库采用 **1 个单包 master skill + 包内 phases/shared 模块** 的架构（详见 `docs/design-docs/2026-04-21-media-plan-skill-design.md`）。运行时统一从 `skills/media-plan/` 目录读取 phase 文件与 shared contract，避免多 skill 场景下 shared 断链。

| 层级 | 职责概要 |
| --- | --- |
| **入口** `skills/media-plan/SKILL.md` | 作为唯一运行入口，负责阶段切换、全局 gate、回退规则与 completion gate |
| **阶段模块** `skills/media-plan/phases/` | 按 `pre-brief search / intake / research / ideation / execution / proposal` 拆分 workflow，避免顶层 skill 过度膨胀 |
| **包内 shared** `skills/media-plan/shared/` | 维护唯一的 contract 与 reference 文件，供 master skill 在各阶段按需读取，包括亮点机制画布等提案型 handoff |

**输入与门禁（摘要）**

- 进入补问前：如果 brief 已包含可识别的品牌、品类、议题、平台或地域信号，总控会先做一轮轻量预搜索，用于缩小提问范围；预搜索不能替代用户确认。
- 预搜索默认优先看中国平台与社媒信号，再用媒体、咨询和官方来源做校准；热点只能作为信号发现，不能直接替代策略判断。
- 进入调研前：须补齐「启动调研」所需字段（见 `skills/media-plan/shared/brief-intake-template.md` 中 *Required Fields To Start Research*）；占位符如 `unknown` / `tbd` 不算通过。
- ideation 放行前：保留方向除了评分通过，还要补齐 `Highlight Mechanism Canvas`，明确主题、主事件、参与/传播/转化机制。
- 进入执行规划与成案前：还须明确 `deliverables_needed`、`constraints`、`success_metric`，且须具体可用。
- 城市/区域 brief 在 research 阶段必须产出完整 `City Evidence Pack`（圈层地图、事件窗口、竞品本地动作、KOL/KOC、高端场地池），缺项会被打回。
- 各阶段之间通过 **显式 handoff**（如 Selected Direction、Validated Execution-Plan Handoff）衔接，避免口头承接导致断层。
- 汽车区域上市场景默认切到 `auto_regional_launch` 单产物结构，输出直接可转 PPT 的策划正文（无双版本拆分）。
- 汽车区域上市场景要求 `Execution Action Playbook`：每阶段至少 1 个 Program Blueprint（项目机制、执行流程、负责人、留资路径、KPI 绑定），禁止只给框架和 KPI 空表。

**主流程与回退**

- 主路径：`pre-brief search → brief intake → research → ideation → execution → proposal → review`。
- 弱证据、创意不达标、策略与执行失配、章节空泛等，应 **回退到最早失败环节** 补料，而非在成案阶段用套话填补。

**质量门槛（摘要）**

- 调研：至少两类证据（热点/案例/公开数据/平台信号等），重要论断需可溯源。
- 创意：至少三个可区分方向并评分筛选，其中至少保留一个 wildcard；`keep` 方向必须形成亮点机制画布，而不是只给 slogan 和动作列表。
- 成案：需要显式展示亮点机制总览、阶段打法、核心事件与转化链路，KPI/风险/预案不可缺省。
- 成案（汽车区域上市）：除结构完整外，必须达到“可执行颗粒”，至少覆盖赛道/流程/执行步骤等项目级细节。

**运行环境假设**：依赖 Agent 的澄清与检索能力；设计文档中约定可结合 `websearch` / `webfetch` 等与实时信源协作（见设计文档「工具绑定」小节）。

**运行时兼容性**：当前默认宿主会携带单个 skill 包的整个目录，因此运行时统一依赖 `skills/media-plan/` 包内的 `phases/` 与 `shared/` 文件，而不是依赖仓库根级 `docs/` 或 sibling skills。

## 当前能力边界

- 适用市场：中国市场
- 输出颗粒度：提案级
- 默认交付：Markdown 方案正文
- 默认流程：pre-brief search -> brief intake -> research -> ideation -> execution -> proposal review
- 默认约束：缺关键字段不启动、弱证据不放行、老套创意要回炉、执行与策略失配要回退

## 如何触发 Skill

在 **Cursor** 等支持 Agent Skills 的环境中，每个 `skills/<name>/SKILL.md` 顶部的 YAML 里有一条 **`description`** 字段；该字段描述「何时应选用本 skill」，供 **模型/路由根据用户意图自动匹配**。因此：

1. **自然语言**：用与 master skill 的 `description` 语义相近的说法描述任务，例如「中国市场传媒策划 brief，需要预搜索、补问、调研、创意、执行和成案评审」。
2. **显式引用**：在对话中 **@** 指向 `@skills/media-plan/SKILL.md`，强制以 master skill 的 workflow 为准。
3. **阶段执行**：即使只是在做调研或创意，也建议仍从 `media-plan` 入口进入，由 master skill 按阶段读取对应 `phases/*.md` 与 `shared/*.md`。

各 skill 当前 `description` 要点（便于检索措辞）：

| Skill | 典型触发语义 |
| --- | --- |
| `media-plan` | 中国市场、半结构化传媒策划 brief；需先做预搜索、补全字段、调研、灵感引导、执行规划与成案质量门禁 |

将本仓库加入 Cursor 的 **Skills 搜索路径**（或按产品文档将 `skills/` 安装到用户级 skills 目录）后，上述两种方式均可生效；具体以当前 Cursor 版本的 Skills 配置为准。

## 关键文档

- 设计文档：`docs/design-docs/2026-04-21-media-plan-skill-design.md`
- 压力测试：`docs/product-specs/2026-04-21-media-plan-skill-pressure-tests.md`
- 已完成执行计划：`docs/exec-plans/completed/2026-04-21-media-plan-single-package-refactor.md`
- 亮点机制升级设计：`docs/design-docs/2026-04-22-highlight-mechanism-upgrade.md`
- 亮点机制升级执行计划：`docs/exec-plans/active/2026-04-22-highlight-mechanism-upgrade.md`
- 发布记录：`docs/releases/feature-release-notes.md`

## 快速查看

- 本文「设计要点」「如何触发 Skill」：架构、门禁与触发方式速览
- 从 `AGENTS.md` 开始了解仓库规则入口
- 查看 `skills/` 了解实际运行 skill
- 查看 `docs/` 了解设计、验证、history 与发布记录

## 许可证

[MIT](./LICENSE)
