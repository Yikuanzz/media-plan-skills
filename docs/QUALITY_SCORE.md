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
| Skill 架构与分层 | B | 已收敛为单包 `skills/media-plan/`：顶层 master skill 管总 workflow，`phases/` 管阶段逻辑，`shared/` 管唯一 contract，运行时链路比多 skill 更稳定。 | 在实际演练中继续收敛顶层 gate 与 phase 读取边界，避免 master 过薄或 phase 职责重新发散。 |
| 共享约束与写作契约 | B | intake、research、idea、proposal、灵感母题、亮点机制画布和预搜索 source map 已统一收口到 `skills/media-plan/shared/`，shared 现在既约束防套路，也开始约束提案型 handoff。 | 根据真实案例补充亮点机制字段的易错项，尤其是 theme 空泛、主事件孤立和转化链路断裂的判定细则。 |
| 验证与压力测试 | B | pressure test 已覆盖 intake 前预搜索、灵感过拟合、低可信信号误用，以及“只有创意名词没有主机制”的新失败场景；仓库也新增了亮点机制检查脚本。 | 补充至少 3 轮可复跑的真实 brief 演练，重点验证亮点机制画布是否真的提升成案质量，而不是只让输出变长。 |
| 仓库文档同步 | B | 设计文档、execution plan、product spec、history 已基本成链，当前架构与质量文档也开始映射真实状态。 | 后续每次 skill 行为变化时，同步更新 `docs/ARCHITECTURE.md`、`docs/QUALITY_SCORE.md` 和对应 history。 |
| 运行可靠性 | B | 运行时已收敛到单包 skill，shared 断链风险显著下降；新增亮点机制检查脚本后，关键 contract 和 phase/template 引用开始具备机械守护。 | 继续补充针对 shared 引用、phase gate 和示例输出的检查，减少 prompt 行为和文档描述之间的漂移。 |
