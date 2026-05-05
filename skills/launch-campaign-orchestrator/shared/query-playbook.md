# Query Playbook

## Variable substitution

All queries in this file use `{...}` placeholders that resolve from `./brief-intake-template.md`:

- `{target_city}` — primary launch city (e.g. 北京 / 成都 / 上海 / 武汉 / ...)
- `{brand}`, `{product}`, `{category}` — brand / model / product category
- `{launch_window}` — concrete launch month or window (e.g. 2026-06)
- `{target_audience}` — audience descriptor (e.g. 30-40 岁中产父母)
- `{competitor_set}` — competitor brand list
- `{audience}` — short alias for `{target_audience}` in query patterns
- `{city}` — short alias for `{target_city}`
- `{month}` — month within `{launch_window}` ±8 weeks
- `{年}`, `{季度}` — year / quarter

Concrete city / brand / festival names that appear in tables below (e.g. 北京马拉松, 618, 端午, 高考, 阿那亚) are **EXAMPLES** — substitute with `{target_city}` / `{launch_window}` / `intake.target_audience` resolved values. **Never copy the previous brief's resolved query strings into a new run.**

## Pre-Brief / Trend Search Queries

Primary source buckets and prioritization for this workflow: `./shared/pre-brief-source-map.md`.

| Target | Query Patterns | Platforms |
|---|---|---|
| Hot trends | "{category} 最新趋势 2026", "{category} 热门话题" | 小红书, 抖音, 微博 |
| Competitor campaigns | "{brand} 最新 campaign", "{brand} 营销活动" | 百度, 微信搜一搜 |
| City signals | "{city} 消费趋势", "{city} 网红打卡" | 小红书, 本地生活平台 |
| Audience behavior | "{audience} 消费习惯", "{audience} 社交媒体使用" | 艾瑞,  QuestMobile |

## Hotspot Harvest Queries

Source map: `./shared/hotspot-source-map.md`. These queries fuel `Phase: Hotspot Harvest` (`HS-*` atoms). They are **distinct from** Pre-Brief queries: Pre-Brief sharpens intake; Hotspot Harvest captures live public-attention beats.

### Bucket 1: Calendar Nodes (节庆节点)

| Target | Query Patterns | Platforms |
|---|---|---|
| 节日热度 | "{节日 — 落入 launch_window ±8 周} {month} 营销", "{节日} 消费者讨论 {年}"。EXAMPLE 节日：618 / 端午 / 七一 / 七夕 / 中秋 / 国庆 / 双 11 / 春节 / 高考结束等 | 灯塔档期表, 微博节日热搜, 各电商节奏页 |
| 行业固定档期 | "{品类} 行业大会 {month}", "{城市} {month} 展会日历" | 36Kr, 数英 Digitaling |
| 节令日历 | "二十四节气 {季节} 营销案例", "节气 {产品场景} 创意" | 新华社/人民日报节令版 |

### Bucket 2: Public Emotion (公共情绪)

| Target | Query Patterns | Platforms |
|---|---|---|
| 中年焦虑 | "中年危机 知乎 高赞", "35 岁 焦虑 小红书 emo" | 知乎话题, 小红书 |
| 育儿成本 | "二孩 经济压力 讨论", "育儿成本 小红书 emo", "幼儿园 焦虑 知乎" | 小红书, 知乎, 豆瓣小组 |
| 通勤倦怠 | "通勤 倦怠 小红书", "{city} 通勤 时长 抱怨" | 小红书 emo, 微博树洞类 |
| 亲情和解 | "父母婚姻 知乎", "中年子女 父母 和解 小红书" | 知乎, 小红书, 豆瓣小组 |
| 婚育悬念 | "不结婚 不生育 知乎讨论", "丁克 高赞 回答" | 知乎话题, B 站观察 vlog |

### Bucket 3: Entertainment Heat (文娱热点)

| Target | Query Patterns | Platforms |
|---|---|---|
| 热播剧 | "{月份} 热播剧 排行", "家庭剧 {季度} 豆瓣评分" | 灯塔, 云合, 微博影视榜 |
| 综艺节目 | "{月份} 慢综艺 排名", "脱口秀 {季度} 名场面" | 微博综艺榜, 抖音综艺热搜 |
| 院线档期 | "{月份} 上映 票房 预测", "{档期 e.g. 暑期档} 预热 营销" | 灯塔专业版, 猫眼研究院 |
| 演唱会音乐节 | "{city} {month} 演唱会 演出", "音乐节 {月份} 阵容" | 大麦演出日历, 摩天轮票务 |
| 体育大事件 | "{年} {体育赛事 e.g. 全运/欧冠} 营销借势", "奥运 {项目} 关注度" | 微博体育榜, 抖音体育热搜 |

### Bucket 4: City Events (城市事件)

| Target | Query Patterns | Platforms |
|---|---|---|
| 城市赛事 | "{target_city} 马拉松 {年} 报名", "{target_city} {季度} 体育赛事" | `{target_city}` 主流日报, 抖音同城 |
| 城市更新 | "{target_city} 历史街区 {更新/改造} {年}", "{target_city} 商圈 首店经济" | `{target_city}` 广播电视台, 大众点评 |
| 演出市场 | "{target_city} {month} 演唱会 票务", "{target_city} 大剧院 {季度} 演出" | 大麦演出日历, 摩天轮 |
| 季节文旅 | "{target_city} {季节} 周边游 攻略", "{target_city} 郊区 自驾 路线 小红书" | 小红书 #{target_city} 标签, 抖音同城 |
| 城市政策 | "{target_city} 限行 {月份} 安排", "{target_city} 摇号 {年} 政策" | `{target_city}` 交管/政府公告 |

> **EXAMPLE resolutions (reference only — re-derive from intake):**
> - target_city=北京 ⇒ "北京马拉松 2026 报名" / "京郊 自驾 路线 小红书"
> - target_city=成都 ⇒ "成都马拉松 2026 报名" / "川西小环线 自驾 路线 小红书"
> - target_city=上海 ⇒ "上海半程马拉松 2026 报名" / "千岛湖 自驾 路线 小红书"

### Bucket 5: Viral Memes (病毒模因)

| Target | Query Patterns | Platforms |
|---|---|---|
| 微博热搜 | "微博热搜 {month} 排行", "{话题} 热搜 时间线" | 微博热搜榜 |
| 抖音热榜 | "抖音 热榜 {date}", "{话题} 抖音 播放量" | 抖音热榜 |
| 小红书话题 | "小红书 {city} {audience} 热门话题", "#{话题} 笔记数 浏览量" | 小红书话题页, 发现页 |
| B 站热门 | "B 站 {季度} 热门 排行", "{up 主} 热门视频" | B 站热门 |
| AI 玩梗 | "AI {场景} meme", "{品牌} AI 抽象 营销" | 即刻, 小红书 AI 话题 |
| 抽象品牌人格 | "{品牌} 抽象 人格化 营销", "多邻国 / 老乡鸡 抽象 案例" | 数英, SocialBeta |

### Bucket 6: Cross-category Crossover (跨界破圈)

| Target | Query Patterns | Platforms |
|---|---|---|
| 现象级联名 | "{品类} 联名 反差 2026", "瑞幸 / LOEWE 联名 复盘" | SocialBeta, 数英 Digitaling |
| 老字号新解 | "老字号 新国潮 案例", "{老字号} 跨界 营销" | 数英, 36Kr |
| 文化 IP × 日用 | "{IP e.g. 哪吒/三体/原神} 联名 案例", "博物馆 IP 周边 爆款" | 小红书话题, 数英 |
| 运动员非体育代言 | "运动员 跨界 代言 2026", "Jellycat / 樊振东 案例" | 微博, 数英 |
| 影视 IP 跨界 | "{热播剧/电影} 品牌 联动 案例", "电影 番外篇 广告" | 数英, SocialBeta |

## Lead Generation Search

| Value Category | Query Focus |
|---|---|
| 够新鲜 | "首次", "首创", "首发", "第一次" + category |
| 够亮眼 | "视觉", "打卡", "高颜值", "装置艺术" + category |
| 够爆 | "裂变", " viral", "争议", "福利" + category |
| 够热 | "{trend}", "{event}", "{festival}" + marketing + category |

## Rules

- Pre-brief search narrows questions only. Never auto-fill intake fields.
- **Hotspot Harvest queries** must produce `HS-*` atoms with `lifecycle_phase` + `expiry_window` + `audience_cluster` + `emotional_charge`. Queries that yield only headlines without these dimensions need follow-up.
- Trend search feeds Lead Pool generation, not Strategy conclusions.
- Cross-check hot signals with High or Medium tier sources before using as evidence.
- Low-trust hotspot atoms (single-thread / unverified meme) can inspire raw ideas in Activity Card Draw, but cannot single-handedly support Lead Pool's hotspot-density gate — pair with a medium+ atom on the same `audience_cluster`.
