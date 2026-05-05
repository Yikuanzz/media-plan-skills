# Hotspot Atom Template

`HS-*` is the atomic resource produced by `Phase: Hotspot Harvest`. It captures **one burning public-attention beat** in a way Activity Card Draw can directly fuel divergent ideas from. `HS-*` is **distinct from**：

- `TR-*` (Trend Signal) = industry / category trend report. Long horizon, often year-scale.
- `CS-*` (City Signal) = baseline city stat / lifestyle trait. Stable, less time-bound.
- `HS-*` (Hotspot Atom) = **what is burning right now in public**. Has a clock. Has a clear emotion. Has an audience cluster.

Industry trend `TR-*` and city baseline `CS-*` are kept and fed into Insight as before. Hotspot atoms are a **separate harvest** with their own source map (`./hotspot-source-map.md`).

## Schema

```yaml
HotspotAtom:
  id: HS-006                    # HS- prefix, three-digit zero-padded
  burning_topic: |
    一句话点出"公域到底在烧什么"——具体到平台/话题/具体动作。
    例："小红书 #遛娃式自驾 话题（5月起涨，3 万 + 笔记，主流玩法是父母带娃自驾去阿那亚/北戴河）"

  bucket: 节庆 | 公共情绪 | 文娱 | 城市 | 模因 | 跨界
  # 必须从 hotspot-source-map.md 的 6 个 bucket 中取一个；跨 bucket 的拆成两条 atom

  lifecycle_phase: 预热 | 爆发 | 衰退 | 长尾
  # 预热——尚未到峰值，可早期布局
  # 爆发——正在高热，72h 内决策
  # 衰退——离峰值已过，慎用，仅做长尾承接
  # 长尾——稳定持续讨论的话题，适合长线绑定

  audience_cluster: |
    具体到「谁在讨论」。包含人口学 + 平台 + 行为标签。
    EXAMPLE："北京 30-40 岁中产父母 / 主战场小红书 + 抖音同城 / 周末出京自驾"
    （EXAMPLE 中的「北京」「30-40 岁中产父母」对应 `intake.target_city`、`intake.target_audience`，
      新案应替换。）

  emotional_charge: 焦虑 | 治愈 | 反讽 | 共鸣 | 宣泄 | 攀比 | 戏谑 | 怀旧 | 自嘲
  # 单一情绪极性。混合情绪请拆成两条 atom 或选一个主导极性

  regional_relevance: |
    与本案上市城市（`{target_city}`，从 intake 读取）的关联程度。
    格式：`{target_city}` 含金量 high|medium|low + 一句话支撑
    EXAMPLE：
      - target_city=北京 ⇒ "北京含金量 high — 38% 笔记发自北京/河北周边，京郊路线占主流"
      - target_city=成都 ⇒ "成都含金量 medium — 川西小环线主话题，成都本地占 22%"
      - target_city=上海 ⇒ "上海含金量 high — 安福路 / 武康路打卡占主流配图"

  expiry_window: |
    什么时候过期？YYYY-MM-DD 格式或描述性窗口。
    必须在 `{launch_window}`（intake.launch_window）所在窗口前后 ±8 周内才有承接价值；
    超出此范围的 atom 仅做长尾承接。
    EXAMPLE："2026-06-30 前" / "暑期档结束（约 2026-08-31）"

  source: |
    一条或多条具体来源，注明平台 + 标题 + 抓取时间
    例："小红书话题 #遛娃式自驾 / 抖音同城 #北京周末去哪 / 抓取于 2026-05-01"

  trust: low | medium | high
  # 参见 ./source-trust-policy.md
  # low：单帖、未交叉验证 — 可用作 inspiration 不能 solo 支撑核心 claim
  # medium：多源/平台官方榜/持续 72h+ — 可作为 lead 的 evidence base
  # high：官方数据/审计报告/品牌官方动作 — 可直接支撑 proposal core claim

  raw_signal_quote: |
    原话/原图截要——不是改写，是直接引用，便于反查。
    例："# 遛娃式自驾 # 我把孩子的安全座椅从家里搬上车的那一刻，才真正觉得自己当上了爸爸"

  cross_links:                  # optional
    related_TR: [TR-001]        # 关联的行业趋势
    related_CS: [CS-003]        # 关联的城市信号
    related_HS: [HS-002]        # 关联的其他 hotspot atom（可叠加同一 audience_cluster）
```

## Quality Gate

- [ ] `id` 形如 `HS-XXX`，三位数字
- [ ] `bucket` 是六选一，无中文别名，无新增类
- [ ] `lifecycle_phase` 与本案 `{launch_window}` 兼容（一般取 launch_window ±8 周）；衰退期 atom 必须注明仅作长尾承接用
- [ ] `audience_cluster` 同时含 人口学 + 平台 + 行为，三者缺一即废卡
- [ ] `emotional_charge` 单一极性；混合情绪需拆条
- [ ] `regional_relevance` 含「`{target_city}` 含金量」量化打分（high|medium|low）+ 一句话支撑
- [ ] `expiry_window` 给出具体日期或档期描述，不是「近期」「今年」泛词
- [ ] `trust` 与 source-trust-policy.md 一致；low-trust 必须配至少一条 medium 同主题 atom 才能进入 lead

## Two-question audit

Before adding an atom to `{artifact_root}/01h-hotspot-harvest.md`, answer one line each:

1. **What's burning?** ——若答不出"具体平台 + 话题 + 时间窗"，就还不是 atom，是模糊概念。
2. **Why this audience?** ——若答不出"在哪个平台 + 在什么场景 + 谁的情绪被点燃"，audience_cluster 不达标。

如其中任何一问答不上，**重写或废弃**这个 atom。

## Example (illustrative — substitute via intake)

The following example assumes `intake.target_city = 北京`, `intake.target_audience = 北京 30-40 岁中产父母`, `intake.launch_window = 2026-06`. Re-derive each field per actual intake.

```yaml
HotspotAtom:
  id: HS-007
  burning_topic: |
    "小红书 #遛娃式自驾 话题——父母带娃自驾去阿那亚/北戴河/张家口的攻略文，
    从 5 月初起涨，到 5 月下旬累计 3.2 万笔记 / 1.4 亿浏览，
    主流配图是「孩子在后排安全座椅 + 沿途风景 + 露营 / 草坪」三件套"

  bucket: 公共情绪
  lifecycle_phase: 爆发
  audience_cluster: |
    北京 30-40 岁中产父母 / 主战场小红书 + 抖音同城 #北京周末去哪 / 
    周末或小长假短途自驾 / 持有家庭 SUV 或正在选购 SUV

  emotional_charge: 共鸣
  regional_relevance: |
    北京含金量 high —— 38% 的话题笔记发自北京/河北周边，
    京郊→张家口/阿那亚/草原天路 三条线路占主流配图

  expiry_window: 2026-08-31 前（暑期档同步衰退）
  source: |
    小红书话题 #遛娃式自驾（3.2 万笔记 / 1.4 亿浏览，2026-05-25 抓取）
    + 抖音同城 #北京周末去哪（2026-05-25 当周 #1 同城热搜）

  trust: medium
  raw_signal_quote: |
    "# 遛娃式自驾 # 我把孩子的安全座椅从家里搬上车的那一刻，
     才真正觉得自己当上了爸爸"

  cross_links:
    related_CS: [CS-003]
    related_TR: [TR-005]
```
