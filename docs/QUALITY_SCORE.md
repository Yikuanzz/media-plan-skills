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
| 产品定义与范围 | B | 主包 `skills/media-plan/` 与专项包 `skills/regional-auto-launch-plan/` 的分工已明确：前者做通用传媒策划总控与分流，后者承载汽车区域上市全流程与阻断门槛。 | 用真实区域上市 brief 做端到端演练，确认分流触发语义与非汽车场景不串线。 |
| Skill 架构与分层 | B | 架构已从单包升级为双 runtime 包；两个包都采用 `SKILL + phases + shared` 结构，边界更清楚，但跨包演进还在磨合期。 | 继续约束“跨包仅入口路由、不做 runtime 依赖”，并在评审中重点检查边界漂移。 |
| 共享约束与写作契约 | B | `media-plan` 的 shared 契约保持稳定；`regional-auto-launch-plan` 关键 shared 文件已从占位迁移为最小可运行 contract（pre-brief source map、trust policy、highlight mechanism、content assets）。 | 在后续真实案例中补充 regional 专项的失败样例，细化“可执行颗粒”与“低成本真实牵引力”判定。 |
| 阶段合同完整度（regional-auto-launch-plan） | B | `insight/strategy/action/operations/proposal` 已具备强 gate；原先 `pre-brief-search/intake` 与部分 shared stub 已补齐为可执行文本合同。 | 增加 1 到 2 轮专项 dry-run，验证 pre-brief 到 intake 的阻断与字段追问是否足够稳定。 |
| 验证与压力测试 | B | 现有仓库检查覆盖文档骨架、仓库卫生、action pinning、亮点机制锚点；新增 runtime 占位检查可机械拦截 `Purpose: Placeholder` 残留。 | 把新检查纳入后续 release 前固定清单，并逐步补充 scenario 级回放验证。 |
| 仓库文档同步 | B | 架构文档、history 与质量文档已开始反映双包现状，但 README 等对外说明仍有单包历史表述。 | 按发布节奏补齐对外文档中的双包描述，避免运行边界与读者认知偏差。 |
| 运行可靠性 | B | 多包运行下的核心门槛、BLOCKING 节点和 proposal review loop 已明确；机械检查覆盖面提升后，stub 漏网风险下降。 | 继续强化 phase gate 与 shared contract 的一致性检查，降低文档变化导致的行为漂移。 |
