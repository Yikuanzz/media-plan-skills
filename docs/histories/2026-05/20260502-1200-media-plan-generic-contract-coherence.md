# media-plan generic contract coherence fixes

## 诉求（压缩）

完成 Task 7 收尾：把 `media-plan` 的 research 与 strategy 共享契约去 auto 特化，保留到 `regional-auto-launch-plan` 的路由提示，并修复 `core-strategic-idea` 对旧章节号的硬绑定。

## 主要改动

- 更新 `skills/media-plan/phases/research.md`：移除 auto 专用数据源示例与 auto 决策习惯表述，改为通用品类语言。
- 更新 `skills/media-plan/shared/research-rubric.md`：去掉 auto/城市样例绑定与 family-SUV 限定描述，保留通用城市/区域 evidence 门槛。
- 更新 `skills/media-plan/shared/core-strategic-idea.md`：将 proposal 绑定从 `3.1/3.2/3.3` 改为语义锚点（`Core Strategic Idea` / `Strategic Direction` / `Phased Execution Plan` / `Phased Event Menu`）。

## 动机

在 runtime 分拆后，`media-plan` 需要保持跨行业可复用；汽车区域上市细化要求由独立 skill 承接，generic 合约只保留路由入口与通用证据规则，避免继续被旧编号和垂类措辞锁死。

## 关键文件

- `skills/media-plan/phases/research.md`
- `skills/media-plan/shared/research-rubric.md`
- `skills/media-plan/shared/core-strategic-idea.md`
