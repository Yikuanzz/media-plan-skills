# media-plan-skills

## 简介

这是一个面向传媒策划方案场景的 Agent skill 仓库，当前首版聚焦中国市场、提案级输出和 Markdown 正文交付。

仓库内已经包含：

- `media-plan-orchestrator`：总控入口，负责 intake 前预搜索、brief 补问、阶段流转、回退判断和完成门禁
- `industry-insight-research`：实时调研、热点/案例/公开数据收集与证据判定
- `strategy-ideation`：多方向创意发散、评分筛选与反老套回退
- `execution-planning`：把策略翻译成执行路径、节奏、KPI 和风险控制
- `proposal-writing-review`：按模板成案，并在缺证据、创意老套或执行失配时打回上游
- `skills/shared/`：共享 intake 模板、research rubric、idea scorecard、proposal template、灵感母题库和预搜索 source map，作为仓库内的规范源

## 设计要点

本仓库采用 **1 个总控 skill + 4 个阶段子 skill + 共享模板/rubric** 的架构（详见 `docs/design-docs/2026-04-21-media-plan-skill-design.md`）。为适配某些宿主只复制单个 skill 到临时目录的运行方式，每个运行时 `SKILL.md` 也会内嵌最小 contract；`skills/shared/` 仍作为仓库维护时的 canonical source。

| 层级 | 职责概要 |
| --- | --- |
| **总控** `media-plan-orchestrator` | intake 前先做一轮轻量预搜索，默认优先看中国平台与社媒信号，给出 inspiration hints，再归一化 brief、按模板做 intake 门禁、驱动阶段前进/回退、在「可宣称完成」前统一把关 |
| **调研** `industry-insight-research` | 在 brief 已就绪后做近期公开证据采集，并验证 inspiration hints 是否有真实支持，按 `research-rubric` 输出事实包与判定 |
| **创意** `strategy-ideation` | 在调研通过后基于母题库和近期信号做多方向发散、保留 wildcard，并用 scorecard 评分筛选，显式产出选中方向的 handoff |
| **执行** `execution-planning` | 将选定方向译为可提案的执行路径、节奏、KPI、风险，并产出经校验的 execution-plan handoff |
| **成案** `proposal-writing-review` | 按 `proposal-template` 组装 Markdown 全文，并对照压力测试 spec 做评审，不合格则打回上游 |

**输入与门禁（摘要）**

- 进入补问前：如果 brief 已包含可识别的品牌、品类、议题、平台或地域信号，总控会先做一轮轻量预搜索，用于缩小提问范围；预搜索不能替代用户确认。
- 预搜索默认优先看中国平台与社媒信号，再用媒体、咨询和官方来源做校准；热点只能作为信号发现，不能直接替代策略判断。
- 进入调研前：须补齐「启动调研」所需字段（见 `skills/shared/brief-intake-template.md` 中 *Required Fields To Start Research*）；占位符如 `unknown` / `tbd` 不算通过。
- 进入执行规划与成案前：还须明确 `deliverables_needed`、`constraints`、`success_metric`，且须具体可用。
- 各阶段之间通过 **显式 handoff**（如 Selected Direction、Validated Execution-Plan Handoff）衔接，避免口头承接导致断层。

**主流程与回退**

- 主路径：`pre-brief search → brief intake → research → ideation → execution → proposal → review`。
- 弱证据、创意不达标、策略与执行失配、章节空泛等，应 **回退到最早失败环节** 补料，而非在成案阶段用套话填补。

**质量门槛（摘要）**

- 调研：至少两类证据（热点/案例/公开数据/平台信号等），重要论断需可溯源。
- 创意：至少三个可区分方向并评分筛选，其中至少保留一个 wildcard；明显套路化或强行蹭热点须回炉。
- 成案：九章结构齐全，结论可决策，KPI/风险/预案不可缺省。

**运行环境假设**：依赖 Agent 的澄清与检索能力；设计文档中约定可结合 `websearch` / `webfetch` 等与实时信源协作（见设计文档「工具绑定」小节）。

**运行时兼容性**：不要假设宿主一定会把整个 `skills/` 目录连同 `shared/`、相邻 skill 或 `docs/` 一起复制到临时工作区。因此，运行时所需的关键门禁、输出 shape 和 review checklist 已镜像进各自的 `SKILL.md`。

## 当前能力边界

- 适用市场：中国市场
- 输出颗粒度：提案级
- 默认交付：Markdown 方案正文
- 默认流程：pre-brief search -> brief intake -> research -> ideation -> execution -> proposal review
- 默认约束：缺关键字段不启动、弱证据不放行、老套创意要回炉、执行与策略失配要回退

## 如何触发 Skill

在 **Cursor** 等支持 Agent Skills 的环境中，每个 `skills/<name>/SKILL.md` 顶部的 YAML 里有一条 **`description`** 字段；该字段描述「何时应选用本 skill」，供 **模型/路由根据用户意图自动匹配**。因此：

1. **自然语言**：用与设计文档、各 skill 的 `description` 语义相近的说法描述任务（例如「中国市场传媒策划 brief、要门禁和完整提案流程」→ 易匹配 `media-plan-orchestrator`；「brief 已齐，先做近期公开调研」→ `industry-insight-research`）。
2. **显式引用**：在对话中 **@** 指向某个 skill 文件或目录，例如 `@skills/media-plan-orchestrator/SKILL.md`，强制以该 skill 的 workflow 为准。
3. **端到端 vs 单阶段**：从半结构化 brief 走到成案，优先使用 **`media-plan-orchestrator`**；若上下文已明确处于某一阶段（仅调研 / 仅创意 / 仅执行 / 仅成案评审），可只 @ 对应子 skill，但仍须满足各 `SKILL.md` 中的 **Entry Gate**，否则会按文档要求暂停并回问或回退。

各 skill 当前 `description` 要点（便于检索措辞）：

| Skill | 典型触发语义 |
| --- | --- |
| `media-plan-orchestrator` | 中国市场、半结构化传媒策划 brief；需先做预搜索、补全字段、分阶段推进、证据与成案质量门禁 |
| `industry-insight-research` | brief 已 intake-ready；需要近期公开证据、热点与品类案例再进入策略 |
| `strategy-ideation` | 已通过 intake 与调研；需要多方向策略并打分筛选再写推荐 |
| `execution-planning` | 方向已定；需要可提案级的动作、阶段、资源逻辑、KPI、风控且对齐约束 |
| `proposal-writing-review` | 上游材料已齐；需要组装最终 Markdown 提案并评审，问题需打回上游 |

将本仓库加入 Cursor 的 **Skills 搜索路径**（或按产品文档将 `skills/` 安装到用户级 skills 目录）后，上述两种方式均可生效；具体以当前 Cursor 版本的 Skills 配置为准。

## 关键文档

- 设计文档：`docs/design-docs/2026-04-21-media-plan-skill-design.md`
- 压力测试：`docs/product-specs/2026-04-21-media-plan-skill-pressure-tests.md`
- 已完成执行计划：`docs/exec-plans/completed/2026-04-21-media-plan-skill-implementation.md`
- 发布记录：`docs/releases/feature-release-notes.md`

## 快速查看

- 本文「设计要点」「如何触发 Skill」：架构、门禁与触发方式速览
- 从 `AGENTS.md` 开始了解仓库规则入口
- 查看 `skills/` 了解实际运行 skill
- 查看 `docs/` 了解设计、验证、history 与发布记录

## 许可证

[MIT](./LICENSE)
