# Hotspot Source Map

Use this file as the source-priority contract for `Phase: Hotspot Harvest` in launch campaign briefs. This file is **distinct from** `./pre-brief-source-map.md`:

- `pre-brief-source-map.md` serves the **Pre-brief Search** stage — sharpening intake questions before the brief is locked.
- `hotspot-source-map.md` serves the **Hotspot Harvest** stage — collecting **public attention beats** (`HS-*` atoms) that will drive the divergent Activity Card Draw.

Industry trend signals (`TR-*`) and city signals (`CS-*`) keep living in the Insight phase. **Hotspot atoms are the burning fire of the public sphere right now**, not category trend reports.

## Variable substitution

The query examples below use `{target_city}`, `{brand}`, `{product}`, `{category}`, `{launch_window}`, `{competitor_set}` placeholders that resolve from `./brief-intake-template.md`. Concrete city names (e.g. 北京, 成都, 上海) and concrete dates that appear below are **EXAMPLES**, not defaults — replace with intake values before running queries.

## Usage Rules

- Hotspot Harvest is for **what is burning in public**, not strategy or final narrative claims.
- Prefer **multi-bucket coverage** over deep single-bucket dive (≥4 buckets per harvest).
- Every captured signal must carry a `lifecycle_phase` (预热 / 爆发 / 衰退 / 长尾) and an `expiry_window` — a hotspot without a clock is a label, not a beat.
- Cross-check buzz with `./source-trust-policy.md`: low-trust meme atoms can ignite leads but cannot solo-support core proposal claims; pair them with at least one medium/high atom (HS-/TR-/CS-).
- If two signals contradict each other, keep both as parallel atoms — Activity Card Draw can fuel different cards from each.

## Source Buckets

### 1. Calendar Nodes (节庆节点)

- priority: first when launch window has hard date dependency
- best_for: any holiday / shopping festival / seasonal node / industry calendar window inside `{launch_window}` ± 8 weeks
- trust_level: high (官方日历) / medium (品类化节日)
- refresh_window: 季度更新 + 临节前 30 天加密扫
- example_platforms: 新华社/人民日报节令日历, 灯塔专业版档期表, 微博节日热搜, 各大电商节奏
- anti-pattern: 拿节日名当 hook 而无 fold-in 机制
- EXAMPLE nodes (substitute via `{launch_window}`): 618 / 端午 / 高考 / 七一 / 七夕 / 暑期档 / 中秋 / 国庆 / 双 11 / 春节 / 二十四节气

### 2. Public Emotion (公共情绪)

- priority: first when brief targets life-stage audiences (家庭/通勤/中年/育儿)
- best_for: 中年焦虑 / 二孩成本 / 通勤倦怠 / 亲情和解 / 失业再就业 / 婚育悬念 / 父母婚姻 / 独生子女赡养 / 县城回流
- trust_level: medium (高赞讨论与长尾沉淀) / low (单条爆帖)
- refresh_window: 双周扫一次知乎高赞 / 小红书高互动话题 / 豆瓣小组帖
- example_platforms: 知乎话题与高赞回答, 小红书 emo / 共鸣话题, 豆瓣小组（中年/家庭/育儿）, 微博树洞类账号, B 站观察 vlog
- anti-pattern: 把"全社会都焦虑"当 hook 而不指向具体人群与具体场景；purpose-wash 而无产品真实关联

### 3. Entertainment Heat (文娱热点)

- priority: first when audience overlap with 影视 / 综艺 / 音乐 / 演唱会 / 短剧 圈层
- best_for: 热播剧（年代剧/家庭剧/悬疑/古偶）, 综艺（脱口秀/慢综/团综）, 院线档期, 演唱会, 音乐节, 短剧, 体育大事件（奥运/全运/欧冠/中超）, 游戏新作
- trust_level: high (官方播映/票房/灯塔数据) / medium (社交舆情)
- refresh_window: 周扫 + 节目首播/上映前后 7 天加密
- example_platforms: 灯塔, 猫眼, 云合, 微博影视榜, 抖音影视热搜, 哔哩哔哩番剧/综艺, 大麦演出日历, 摩天轮票务
- anti-pattern: IP 联名仅做 logo 拼贴；签代言人却不做内容延展；"庆祝某剧爆了"无 fold-in

### 4. City Events (城市事件)

- priority: first when launch is region-locked (any `{target_city}`)
- best_for: city marathons / heritage-district renewal / performance market / seasonal tourism / auto shows / fashion weeks / commute mega-events / traffic policies / new metro lines / mall openings / first-store-economy
- trust_level: high (市政官方/商圈方) / medium (本地媒体/小红书攻略)
- refresh_window: 月扫 + 实时关注本地热搜
- example_platforms: `{target_city}` 主流日报与广播电视台, 大众点评热门商圈, 小红书 `{target_city}` 标签, 抖音同城热榜, 摩天轮/大麦演出日历, 文旅局公告
- anti-pattern: 在地标拍照而无在地真相；蹭城市符号但无落地路径
- EXAMPLE city events (北京 case): 北京马拉松 / 胡同更新 / 草莓 / 麦田音乐节 / 世园会延期、(成都 case): 成都国际车展 / 双年展, (上海 case): 进博会 / 时装周

### 5. Viral Memes (病毒模因)

- priority: first when goal is youth/social burst & UGC
- best_for: 微博热搜话题, 抖音热榜, 小红书话题与笔记, B 站热门, 知乎热榜, 短视频爆款格式, AI 玩梗, "多儿去世"式抽象品牌人格化, 表情包与暗语
- trust_level: medium (持续 72h 以上的话题) / low (单贴单梗)
- refresh_window: 日扫 + 爆点 12h 内决策
- example_platforms: 微博热搜榜, 抖音热榜, 小红书发现页, B 站热门, 知乎热榜, 即刻, X(海外参考)
- anti-pattern: 强行套梗导致调性错位；蹭已过气梗（lifecycle 已 衰退）

### 6. Cross-category Crossover (跨界破圈)

- priority: second (常配合其他 bucket 使用)
- best_for: 联名（瑞幸×茅台/LOEWE×哈啰/蒙牛×哪吒2）, 反差搭配, 老字号新解, 奢牌×日常, 科技×非遗, 文旅×消费品, 运动员×非体育品牌, 影视 IP×日用品
- trust_level: medium (公开案例) / high (本品牌已签约/已拍板)
- refresh_window: 月扫成功案例 + 季度复盘失败案例
- example_platforms: SocialBeta, 数英 Digitaling, 营销案例库, 案例 SHOWCASE, 各大代理公司案例集
- anti-pattern: 仅 logo 互换无产品真相；联名方调性冲突；联名后无持续运营

## Selection Heuristics

- **Time-locked launch** (when `{launch_window}` is hard-dated): 先扫 Calendar Nodes 锁定 `{launch_window}` ± 8 周可借节点，再补 City Events / Entertainment Heat / Public Emotion 平衡情绪深度与社交热度，最后补 Memes / Crossover 提供破圈选项。
- **Audience contains family / mid-age decision-maker signals** (read from `intake.target_audience`): Public Emotion 优先级抬高一档；Entertainment Heat 偏家庭剧/慢综；City Events 偏周边游 / 文旅 / 通勤。
- **Product carries strong technology / ecosystem / AI signals** (read from `intake.product` + Insight `PV-*`): Memes 与 Crossover 优先级抬高，与已有 TR-* 行业趋势对照而非替代。
- **Single-source low-trust signal**：标记 trust=low，仅做 raw_signal 留存，不能单独承担 lead 的 evidence。

## Cross-brief discipline

| Symptom | Why it fails |
|---|---|
| Atom set looks suspiciously like the previous brief's atoms | Sloppy reuse — re-derive from current `{target_city}` and `{launch_window}` |
| Examples in this file are treated as defaults | They are EXAMPLES, not defaults — substitute intake values |
| `{target_city}` resolves to a city without one of the 6 buckets reachable | Document the gap in the harvest output's "bucket coverage" notes |

## Anti-pattern Quick Filter

| Symptom | Why it fails | Fix |
|---|---|---|
| 用节日名当 hook | 缺 fold-in 机制 | 改为 ritual / countdown / 时间编码 |
| 用"全民情绪"当 hook | 人群不具体 | 收敛到具体 audience_cluster |
| 用"某剧火了"当 hook | 无内容延展 | 增加内容 / 角色 / 场景 fold-in |
| 用过气梗 | lifecycle=衰退 | 标 lifecycle 后弃用或重写 |
| 用单帖热搜 | trust=low 单源 | 配 medium 信号或重写 |
