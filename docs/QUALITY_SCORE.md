# 质量评分

用这份文档按产品区域和架构层次记录当前质量水位，方便持续知道最薄弱的地方在哪。

## 建议的评分标准

- `A`：覆盖完整、行为稳定、文档清楚、运行风险低。
- `B`：整体可接受，但还有明确短板。
- `C`：能用，但需要针对性补强。
- `D`：脆弱、缺少规范，或很多行为尚未定义。

## 当前项目状态

| 区域 | 评分 | 原因 | 下一步 |
| --- | --- | --- | --- |
| 产品定义与范围 | B | 已有 media-plan skill 设计文档、pressure test spec 和明确的中国市场提案级范围，目标用户路径与失败场景基本清楚。 | 用 2 到 3 个真实 brief 演练，确认是否还缺垂类约束或交付边界。 |
| Skill 架构与分层 | B | 已落地含 intake 前预搜索的总控 skill、4 个阶段 skill 和共享模板/rubric，阶段边界与回退链路比较清晰；运行时关键 contract 也已镜像进各 `SKILL.md`，降低单-skill 宿主下的断链风险。 | 在实际演练中继续收敛预搜索摘要和阶段交接格式，避免上游输出过松导致下游失真。 |
| 共享约束与写作契约 | B | intake、research、idea、proposal 四类共享文件已形成统一 contract，并新增灵感母题库与预搜索 source map，能更明确约束补问、证据、评分和成案结构。 | 根据真实案例补充易错项，尤其是 inspiration direction 的误用门槛、热点校准和 execution fit 的判定细则。 |
| 验证与压力测试 | C | 已有 product spec 定义关键失败模式，并补入了 intake 前预搜索、灵感过拟合和低可信信号误用场景，但还缺少可复跑的演练记录、示例输入输出或自动化检查。 | 补充至少 3 轮 pressure test 样例，重点验证预搜索是否真正减少无效补问、平台热点是否被正确校准，并沉淀成仓库内可复用的验证步骤。 |
| 仓库文档同步 | B | 设计文档、execution plan、product spec、history 已基本成链，当前架构与质量文档也开始映射真实状态。 | 后续每次 skill 行为变化时，同步更新 `docs/ARCHITECTURE.md`、`docs/QUALITY_SCORE.md` 和对应 history。 |
| 运行可靠性 | C | skill 已定义阻断、回退和 completion gate，并补强了单-skill 临时目录下的自包含 contract，但这些约束目前主要依赖 prompt 执行，没有额外守护机制。 | 增加 review checklist 或轻量校验脚本，降低“带缺口继续输出”的风险，并补一个检查 runtime 外部路径依赖的仓库脚本。 |
