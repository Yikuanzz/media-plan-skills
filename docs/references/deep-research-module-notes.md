# 深度检索模块（与 Deep-Research-skills 对齐的可选说明）

本仓库的 **runtime 真源**仍是 [`skills/media-plan/SKILL.md`](../../skills/media-plan/SKILL.md) 与 `phases/` + `shared/`。为借鉴 [Weizhena/Deep-Research-skills](https://github.com/Weizhena/Deep-Research-skills) 的「先读策略模块再检索」行为，在包内提供：

- [`skills/media-plan/shared/research-modules/competitor-deep.md`](../../skills/media-plan/shared/research-modules/competitor-deep.md)
- [`skills/media-plan/shared/research-modules/city-signal.md`](../../skills/media-plan/shared/research-modules/city-signal.md)

## 与多 Agent 宿主的关系

- **Cursor / Claude Code**：可在一次会话中先 `Read` 上述模块，再执行 Tavily 等工具；不依赖安装额外子 skill。
- **Codex multi_agent**：若将「仅做联网检索」拆成子 Agent，输出应**合并**为单一 `## Research Verdict` 与 `## Competitor Actionable View`，避免 workflow 与主 skill 分裂。
- **不要**在仓库中复制 Deep-Research-skills 的整包命令（`/research-deep` 等）；需要时用户自行安装该仓库，**不在**本 skill 的 runtime 路径里硬依赖它。

## Review loop

当 `## Review Pass` 失败且路由为 `research` 时，按缺口类型在重搜前**再次**加载相应 `research-modules` 文件（见 `query-playbook.md` 路由表）。
