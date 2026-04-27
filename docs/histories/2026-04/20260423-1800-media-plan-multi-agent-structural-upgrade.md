# media-plan 多 Agent 与结构强化改造

## 诉求（压缩）

在单包 `skills/media-plan` 内落实：四角色手递物、可选投标/评分表、Core Strategic Idea、Mechanism Design 与画布一致、竞品可执行表、内容资产长中短、认知+时间双轴、热点×区域资源、复盘与 Rubric 可选节、Review loop（最大 3 次）与 research 模块路由；同步 ARCHITECTURE 与检查脚本；另附 deep-research 借鉴说明。

## 主要改动

- **Intake**：`brief-intake-template.md` 增加投标、评分表、甲方节奏、技术课题等可选字段与规则。
- **新增 shared 契约**：`core-strategic-idea.md`、`competitor-actionable.md`、`content-assets.md`；`shared/research-modules/{competitor-deep,city-signal}.md`。
- **Research**：必填竞品表与热点×资源表；rubric 禁止空泛竞品夸赞；`query-playbook` 增加模块路由。
- **Highlight 画布**：Mechanism Design 镜像说明、认知三阶段绑定 Early/Mid/Late。
- **Proposal 模板**：章节扩至 17（含 Mechanism Design、Content Assets、认知列 Event Menu、复盘、Rubric）。
- **Ideation / scorecard / execution / proposal phase**：接入 Core Idea、Content Assets、Review Pass。
- **SKILL.md**：四角色表、新门闸、Step 6–7 评审循环、shared 索引。
- **文档**：`docs/ARCHITECTURE.md`、`docs/references/deep-research-module-notes.md`；`scripts/check-media-plan-highlight-mechanism.sh` 扩展检查项。

## 动机

在保持单包 runtime、串行闸门的前提下，用显式契约与评审闭环提升投标与全案的可追溯性与可执行性，并与可选多 Agent 宿主对齐（模块分片、合并输出）。
