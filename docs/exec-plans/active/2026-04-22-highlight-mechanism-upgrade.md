# 亮点机制生成升级执行计划

## 目标

把通用型 `media-plan` skill 从“能避免低质量输出”升级到“能稳定生成可提案的亮点机制”，让 ideation、execution 和 proposal 之间通过统一的机制画布衔接。

## 范围

- 包含：shared contract、phase workflow、proposal 结构、pressure test、仓库文档和轻量检查脚本。
- 不包含：垂类上市 skill、新的 Office/PPT 输出链路、大规模 inspiration library 扩写。

## 背景

- 相关文档：`docs/TARGET.md`、`docs/design-docs/2026-04-22-highlight-mechanism-upgrade.md`
- 相关代码路径：`skills/media-plan/phases/`、`skills/media-plan/shared/`、`scripts/`
- 已知约束：必须保持 `media-plan` 为通用型 skill；运行时依赖仍收敛在 `skills/media-plan/` 包内。

## 风险

- 风险：新约束增加后，skill 可能变长但不一定更强。
- 缓解方式：把新增内容压缩为可执行 contract 和 gate，而不是堆叠描述性文案。

- 风险：没有自动检查，后续修改可能让引用断链。
- 缓解方式：增加仓库脚本，检查关键文件和关键标题是否存在。

## 里程碑

1. 明确 `Highlight Mechanism Canvas` contract 与 phase 接入点。
2. 完成 runtime skill、proposal 模板和 pressure test 修改。
3. 补齐仓库文档、脚本校验和验证结果。

## 验证方式

- 命令：`bash scripts/check-media-plan-highlight-mechanism.sh`
- 命令：`bash scripts/ci.sh`
- 手工检查：确认 `research -> ideation -> execution -> proposal` 都能看到亮点机制相关结构。
- 观测检查：确认 pressure test 与质量文档已反映新拦截标准。

## 进度记录

- [x] 里程碑 1
- [x] 里程碑 2
- [x] 里程碑 3

## 决策记录

- 2026-04-22：优先为通用型 `media-plan` skill 增加亮点机制生成层，而不是直接分叉出区域上市专用 skill；先把“机制”做成共享 contract，再让后续垂类在其上扩展。
- 2026-04-22：仓库级验证先采用轻量脚本检查关键 contract 和 phase/template 引用是否存在，再接入 `scripts/ci.sh`；先守住断链风险，再决定是否做更重的示例回放验证。
