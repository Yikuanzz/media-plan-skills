# Local Grounding Pattern

This file defines how to **derive a city pack** from intake — the set of geography categories, channel matrix, and local-hook patterns used by Hotspot Harvest, Activity Card Draw, and Strategy Plan. It exists so the workflow remains city-agnostic: change `intake.target_city`, the entire local grounding re-derives without touching skill files.

## Why this file exists

Earlier versions hardcoded specific Beijing landmarks (国贸 / SKP / 三里屯 / 阿那亚) into the deck and Strategy Plan. That broke reusability — a Chengdu / Shanghai / Wuhan brief inherited Beijing's geography by accident. The fix: skill files reference **categories**, not place names; the city pack maps each category to concrete place names per `intake.target_city`.

## Geography Category Schema (city-agnostic)

Every launch city has roughly the same nine functional zones. The names differ; the function is stable.

| Cat | Function | Generic description |
|---|---|---|
| G1 | Premium retail / luxury hub | The city's flagship luxury shopping district / high-end mall |
| G2 | Lifestyle scene zone | Trendy lifestyle + nightlife + young-creative cluster |
| G3 | Business / CBD | Office tower core, white-collar daytime gathering |
| G4 | Cultural / heritage core | Old-town / heritage / state-symbol district |
| G5 | Residential decision-maker zone | Concentrated middle-class residential clusters |
| G6 | Tech / innovation hub | Tech park, R&D cluster, startup district |
| G7 | Sports / event venue | Stadium, performance venue, marathon route |
| G8 | Suburban weekend belt | The 1-2h drive belt for weekend trips |
| G9 | Out-of-city signature route | The 2-4h drive signature destinations the city's residents claim |

The deck and Strategy Plan **always reference `G1–G9`** in their machinery. Concrete place names appear only in the city pack and in proposal copy.

## Channel Category Schema (also city-agnostic)

| Ch | Channel type |
|---|---|
| C1 | Brand-owned offline (showroom / pop-up) |
| C2 | Partner offline retail (mall / partner brand stores) |
| C3 | Short-video same-city traffic (e.g. 抖音同城) |
| C4 | Lifestyle community platforms (e.g. 小红书) |
| C5 | Discussion / weibo-style platforms |
| C6 | Long-form video / B-station / podcast |
| C7 | Programmatic indoor OOH (e.g. 分众 / 楼宇) |
| C8 | Transit OOH (subway / bus / airport) |
| C9 | Outdoor signature OOH (landmark / billboard) |
| C10 | KOL / KOC seeding |
| C11 | Private domain (WeChat / app / community) |
| C12 | E-commerce / live commerce |

Strategy Plan's grounding matrix lays Leads × G-cat × C-cat. The channel mix per Lead must fit `intake.channel_constraints`.

## City Pack Derivation Procedure

When entering Hotspot Harvest, Activity Card Draw, or Strategy Plan, derive the city pack once per session:

1. Read `intake.target_city`.
2. Map each `G1–G9` to **2–4 concrete place names** in that city. Prefer well-known, traceable, currently-active places.
3. Map each `C1–C12` to **specific platforms / venues / brand partners** appropriate to that city's market.
4. Capture city-specific signature moments (recurring annual events, local memes, dialect markers, regional symbols) under `local_signatures`.

### City Pack output template

```yaml
CityPack:
  city: "{target_city}"
  geo_pattern_insight: "..."        # 必填，≤30 字，方位短语概括客群空间格局
  G1_premium_retail: ["...", "..."]
  G2_lifestyle_scene: ["...", "..."]
  G3_cbd: ["...", "..."]
  G4_heritage_core: ["...", "..."]
  G5_residential_decision: ["...", "..."]
  G6_tech_hub: ["...", "..."]
  G7_event_venue: ["...", "..."]
  G8_suburban_belt: ["...", "..."]
  G9_signature_route: ["...", "..."]
  channels_C1_to_C12:
    C1: [...]
    # ... up to C12
  local_signatures:
    annual_events: [...]            # 城市年度大事件
    local_memes: [...]              # 本地圈层暗语 / meme
    dialect_markers: [...]          # 方言/称谓
    regional_symbols: [...]         # 城市符号
  cultural_hooks:                   # 必填 ≥3 个，每个梗附"在哪个 lead 中可被使用"
    - hook: "..."
      usable_in_lead: "L-XXX 或 RI-XXX"
      angle: "..."
```

#### 新增必填项说明

**`geo_pattern_insight`（地理格局洞察，≤30 字）**：
不允许只列地点不给格局。必须用一个**记得住的方位短语**概括目标客群在城市内的空间分布——让读者能在一句话里抓到这座城的客群"长相"。

- 正例：「武汉一江两湖三极」（汉口二七滨江 / 武昌水果湖 + 东湖 / 光谷中心城三极）→ 立即能想象 80% 客群空间分布
- 正例：「北京内三环外五环」（中产决策者集中在内三环老社区 + 外五环新中产社区）
- 正例：「成都两江夹一城」（沿锦江 / 沿府河 + 高新南天府新区）
- 反例（fail）：仅列"国贸 / 三里屯 / 望京"等地点，无格局概括

**`cultural_hooks`（本地文化梗 ≥3 个）**：
可被植入活动 / slogan / 标题 / hero 命名的**本地文化符号 / 段子 / 共识梗**。每个梗必填 3 个字段：

- `hook`：梗本身（如"户部巷的小龙虾"、"东湖樱花季"、"光谷码农早高峰"、"重庆山城棒棒"、"上海弄堂咖啡"）；
- `usable_in_lead`：哪个 lead 或 raw idea 可以用上（建议至少能挂到 1 个 lead）；
- `angle`：怎么用——是植入 slogan、做活动场景、还是当传播标题钩子。

> **质量底线**：cultural_hooks 不得只是"地名 + 名词"罗列（如"户部巷"≠ 一个梗，而"户部巷的小龙虾陪考"才是一个梗）。一个合格的梗能直接当 hero event 的标题或 slogan 钩子。

The city pack is appended to the harvest output (`{artifact_root}/01h-hotspot-harvest.md`) as a `## City Pack` section, so all downstream phases can read it.

### Hero Expansion 模块 A 的 City Pack 引用约束

每个 S 级 lead 在 `04-proposal.md` 中按 `proposal-template.md` 的 `## Hero Event Expansion Pattern` 模块 A 展开时，**必须**：

- **cite ≥2 个 G 类具体地点**（直接引用 City Pack 中的具体地名，不允许只写"北京核心商圈"这种泛指）；
- **cite ≥1 个 cultural_hook**（直接引用 City Pack 中的本地文化梗作为活动场景 / slogan 钩子 / 传播标题钩子之一）；
- **cite ≥1 处 geo_pattern_insight 的格局意象**（如方案中讨论"为何选择海淀 / 西城两考点"时引用"内三环教育资源最密"的格局判断）。

不满足以上引用要求 = 视为"地点堆砌但本地感缺位"，触发 Q37 升级版 fail（本地饱和度不足），回 Step 4.5 把模块 A 改写到包含格局 + 地名 + 文化梗三件齐。

## Examples (illustrative — substitute with `intake.target_city`)

These are **examples**, not defaults. Workflow generates the pack fresh per intake.

### EXAMPLE — Beijing pack

```yaml
CityPack:
  city: 北京
  geo_pattern_insight: "内三环老中产 / 五环新中产 / 京郊周末三层叠加"
  G1_premium_retail: [SKP, 国贸商城, 王府井 SKP-S, 西单大悦城]
  G2_lifestyle_scene: [三里屯太古里, 798 艺术区, 朝阳大悦城, 工体周边]
  G3_cbd: [国贸 CBD, 望京 SOHO, 中关村, 金融街]
  G4_heritage_core: [前门大街, 南锣鼓巷, 什刹海, 雍和宫胡同]
  G5_residential_decision: [望京中产社区, 亚运村, 中关村学区, 金融街学区]
  G6_tech_hub: [中关村, 海淀创业大街, 望京科技园, 亦庄]
  G7_event_venue: [鸟巢, 工体, 国家大剧院, 五棵松]
  G8_suburban_belt: [密云, 怀柔, 延庆, 平谷]
  G9_signature_route: [阿那亚 / 北戴河, 草原天路, 张家口崇礼, 古北水镇]
  local_signatures:
    annual_events: [北京马拉松, 北京车展, 北京国际电影节, 草莓 / 麦田音乐节]
    local_memes: ["我家那位首席安全官", "北漂中年觉醒"]
    dialect_markers: ["您", "盘他", "倍儿"]
    regional_symbols: [胡同, 天坛, 故宫, 长城, 国贸]
  cultural_hooks:
    - hook: "西二旗早高峰程序员通勤痛"
      usable_in_lead: "L-002 通勤体验类 lead"
      angle: "把活动设在西二旗地铁口或大厂园区门口，主打'解放右脚'"
    - hook: "海淀黄庄家长陪考夏天"
      usable_in_lead: "L-001 高考休息站类 lead"
      angle: "高考考点外做家长公益休息站，植入'内三环教育密集'的格局"
    - hook: "京郊周末自驾古北 / 阿那亚"
      usable_in_lead: "L-006 智驾专线类 lead"
      angle: "用 G9 signature route 做家庭自驾体验路线"
```

### EXAMPLE — Chengdu pack

```yaml
CityPack:
  city: 成都
  geo_pattern_insight: "府南河两岸老成都 + 高新南天府新区新贵"
  G1_premium_retail: [太古里, IFS, SKP-S 成都]
  G2_lifestyle_scene: [玉林路, 镋钯街, 望平街]
  G3_cbd: [天府金融街, 高新南]
  G4_heritage_core: [宽窄巷子, 文殊院, 锦里]
  G5_residential_decision: [天府新区中产社区, 高新区学区]
  G6_tech_hub: [天府软件园, 高新区]
  G7_event_venue: [东安湖体育公园, 凤凰山体育场]
  G8_suburban_belt: [都江堰, 青城山, 龙泉驿]
  G9_signature_route: [稻城亚丁, 川西小环线, 西岭雪山, 九寨沟]
  local_signatures:
    annual_events: [成都国际车展, 成都双年展, 草莓音乐节成都站]
    local_memes: ["巴适", "雄起", "冒得", "慢生活"]
    dialect_markers: ["巴适", "要得", "莫得"]
    regional_symbols: [熊猫, 火锅, 太阳神鸟, 川剧变脸]
  cultural_hooks:
    - hook: "玉林路小酒馆里的慢生活"
      usable_in_lead: "圈层私享 / 试驾后聚类 lead"
      angle: "把私享会搬进玉林路小酒馆，主打'巴适'氛围"
    - hook: "周末川西小环线自驾"
      usable_in_lead: "智驾专线 lead"
      angle: "用 G9 川西路线做家庭自驾内容"
    - hook: "宽窄巷子的盖碗茶 + 智能座舱"
      usable_in_lead: "媒体试乘 / 文旅融合 lead"
      angle: "传统茶文化 + 科技座舱反差感作为标题钩子"
```

### EXAMPLE — Shanghai pack

```yaml
CityPack:
  city: 上海
  geo_pattern_insight: "黄浦江两岸三大圈：陆家嘴新贵 / 静安老钱 / 浦东新中产"
  G1_premium_retail: [恒隆广场, IAPM, 港汇, 兴业太古汇]
  G2_lifestyle_scene: [安福路, 武康路, TX 淮海, 张园]
  G3_cbd: [陆家嘴, 静安南京西路, 漕河泾]
  G4_heritage_core: [外滩, 田子坊, 1933 老场坊]
  G5_residential_decision: [古北, 联洋, 碧云国际社区]
  G6_tech_hub: [张江高科, 临港新片区]
  G7_event_venue: [东方体育中心, 梅赛德斯奔驰文化中心]
  G8_suburban_belt: [崇明, 朱家角, 佘山]
  G9_signature_route: [千岛湖, 莫干山, 周庄, 乌镇]
  local_signatures:
    annual_events: [上海车展 (双年), 上海时装周, 简单生活节, 进博会]
    local_memes: ["精致", "小马路咖啡馆", "侬好"]
    dialect_markers: ["侬", "啥", "灵"]
    regional_symbols: [外滩天际线, 弄堂, 法租界梧桐, 东方明珠]
  cultural_hooks:
    - hook: "武康路咖啡馆的周末家庭出行"
      usable_in_lead: "城市精致家庭 lead"
      angle: "把品鉴 / 试驾起点设在武康路一家有故事的咖啡馆"
    - hook: "外滩夜景 + 智能驾控大片"
      usable_in_lead: "城市地标传播 lead"
      angle: "外滩沿岸做夜间智驾大片拍摄，作为传播 KV"
    - hook: "莫干山周末逃离上海"
      usable_in_lead: "智驾自驾 lead"
      angle: "G9 信号路线，主打'两小时逃离精致生活'"
```

## Anti-pattern Quick Filter

| Symptom | Why it fails |
|---|---|
| Skill file mentions "北京 / 上海 / 成都" by name | Hardcoded — refactor to `{target_city}` and the city pack |
| City pack copies last brief's place names | Sloppy — re-derive from `intake.target_city` every session |
| G-cat mapped to 0 places | City may not have that zone — note explicitly so downstream knows to skip cards relying on it |
| local_signatures empty | Lost source of distinct hooks — re-do harvest |
| `geo_pattern_insight` 缺失或写成"北京客群分布广泛"等无格局短语 | 失去"一句话讲清城市格局"的能力 → 下游 hero 难以引用，回 City Pack 重写 |
| `cultural_hooks` 不足 3 个或只是地名罗列（如"户部巷"非梗） | 失去本地饱和度弹药 → S 级 hero 模块 A 无法引用，触发本地饱和 fail |
| S 级 hero 模块 A 引用的地名全是泛指（"北京核心商圈"）而无 City Pack 具体地名 | 本地感缺位 → Q37 升级版 fail，回 Step 4.5 |
