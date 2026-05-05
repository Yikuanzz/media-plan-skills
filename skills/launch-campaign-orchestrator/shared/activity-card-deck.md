# Activity Card Deck

This file is the **divergence card deck** used in `Phase: Activity Card Draw`. Cards are not strategy. Cards are **prompts that force divergent thinking** — each card pairs a hotspot direction with a value-category lens and a `local_hook_pattern` (a derivation rule, not a hardcoded place-name). Concrete city / brand / product hooks resolve at runtime by reading `intake` (target_city, brand, product, audience, launch_window) and the `## City Pack` appended to `{artifact_root}/01h-hotspot-harvest.md`.

> **Conceptual sibling for human reading:** `skills/media-plan/shared/inspiration-directions.md` provides full case libraries per direction. This file is the runtime contract — the actual deck the workflow draws from.

> **Reusability discipline (rule 14 in `SKILL.md`):** Cards must not bake in any specific city / brand / product / calendar. The 24 cards below are **city-agnostic**. EXAMPLE blocks at the end show how an agent expands the abstract patterns into concrete hooks once intake is known.

## Card Schema

```yaml
DivergenceCard:
  card_id: D-{direction-code}-{n}      # e.g. D-CC-3 = Cross-Category #3
  direction: time_anchors | regional_local_ip | cross_category | major_events |
             culture_meme | tech_proof | social_resonance | co_creation
  value_category_anchors: [够新鲜, 够亮眼, 够爆, 够热]   # one card may anchor multiple
  prompt_questions:                    # at least 3 prompts; each MUST contain at least
    - "..."                            # one of {target_city} / {brand} / {product} /
                                       # {target_audience} / {launch_window} / {HS-id}
                                       # so the prompt re-targets per intake.
  reference_cases: [...]               # 2-4 frontier examples to spark by analogy
  local_hook_pattern: |                # derivation rule, NOT a hardcoded list
    一段说明：用 City Pack 的哪个 G-cat / 哪个 local_signature
    + 哪类 audience / 哪类 channel，派生出 2-4 个具体 hook。
    具体 hook 在 Activity Card Draw 阶段写入 `01a-activity-card-draw.md`，
    本文件不存放。
  anti_pattern: "..."                  # one-line guard against the common failure
```

## Direction Codes

| Code | Direction | Cards |
|---|---|---|
| TA | time_anchors | D-TA-1 ~ D-TA-3 |
| RL | regional_local_ip | D-RL-1 ~ D-RL-3 |
| CC | cross_category | D-CC-1 ~ D-CC-3 |
| ME | major_events | D-ME-1 ~ D-ME-3 |
| CM | culture_meme | D-CM-1 ~ D-CM-3 |
| TP | tech_proof | D-TP-1 ~ D-TP-3 |
| SR | social_resonance | D-SR-1 ~ D-SR-3 |
| CR | co_creation | D-CR-1 ~ D-CR-3 |

24 base cards total. Workflow may extend by appending `D-{code}-{n+1}` cards but never reduce.

## The Deck

### Time Anchors (D-TA-*)

#### D-TA-1 · Calendar Countdown Ritual

```yaml
direction: time_anchors
value_category_anchors: [够热, 够新鲜]
prompt_questions:
  - "如果把 {launch_window} 那天倒推 30 天做成一种「仪式」，每天发生一件什么事，能让 {target_audience} 觉得「值得等」？"
  - "{HS-id}（节日/节点）的本地仪式里，哪一个动作可以被 {brand} {product} 「替代」或「升级」？"
  - "如果这次上市必须借同一个节点的传统语义重写一个反义词，会是什么？"
reference_cases:
  - "肯德基「圣诞电烤盘」反向营销——用'买电烤盘送套餐'的错觉颠覆节日剧本"
  - "伊利「万物皆可搭」节点策略——不争 C 位做配角"
local_hook_pattern: |
  从 City Pack `local_signatures.annual_events` 中拣出 `{launch_window}` ±8 周内
  跌进的节日 / 节点；为每个节点写一个「fold-in 机制」——节点的传统语义如何被
  {product} 的某个真实功能替换/升级，而不是单纯贴节日 logo。
anti_pattern: "把节日名当 hook 而无 fold-in 机制"
```

#### D-TA-2 · Solar Term & Seasonal Insight

```yaml
direction: time_anchors
value_category_anchors: [够新鲜, 够亮眼]
prompt_questions:
  - "{launch_window} 所跨的节气，给 {target_audience} 在 {target_city} 带来的最具体的烦恼是什么？这辆 {product} 解决哪个？"
  - "二十四节气里和 {target_audience} 「最强语义关联」的是哪一个？"
  - "若把 24 节气倒过来理解（不是节气来安排生活，而是生活倒推节气）会发生什么？"
reference_cases:
  - "知味观 琉璃珐琅月饼 + AI 智能点胶——用新技术激活老节气"
  - "快手 × 人民日报「诗月夜」——传统文化 × 现代直播"
local_hook_pattern: |
  从 City Pack `local_signatures.regional_symbols` + `G8_suburban_belt` /
  `G9_signature_route` 中找节气意象的本地落点（避暑/赏花/秋收/冬储等）；
  每个节气需对应一条 {target_city} 居民「真的会做」的事，而非节气词装饰。
anti_pattern: "节气词当装饰，与产品/场景无内在关联"
```

#### D-TA-3 · Reverse Time Editing

```yaml
direction: time_anchors
value_category_anchors: [够爆, 够新鲜]
prompt_questions:
  - "如果让这辆 {product} 「过去 10 年」每年挑一天回去，它会去哪一天？"
  - "把 5 年后 {target_audience} 的出行场景剪成 30 秒预告，今天能拍到第几秒？"
  - "如果只有一个时间窗口可以让 {target_audience} 「先体验后买」，那应该是哪 24 小时？"
reference_cases:
  - "蔚来 NIO Day 用户主导品牌节"
  - "三顿半「返航计划」咖啡罐回收"
local_hook_pattern: |
  以 {launch_window} 为锚，向前/向后构造一个限定时间窗（24h / 100h / 30 天等），
  套用 {target_city} 的 `local_signatures` 与 G-cat（典型为 G2 / G4 / G7）形成
  「事件 + 场所 + 时刻」三元组；事件不靠节奏卡点撑，要有内容承接。
anti_pattern: "倒计时但没有内容承接，纯节奏卡点"
```

### Regional / Local IP (D-RL-*)

#### D-RL-1 · City Symbol Reframing

```yaml
direction: regional_local_ip
value_category_anchors: [够亮眼, 够热]
prompt_questions:
  - "如果给 {target_city} 一个「不再被符号化」的入口，{product} 站在哪个 G4 / G2 / G3 的具体地点下面？"
  - "{HS-id}（城市事件）里最被忽略但最具体的一帧画面是什么？{product} 如何成为那一帧？"
  - "把 {target_city} 最堵 / 最难走 / 最具争议的那段路变成最舒适的那段路，需要发生什么？"
reference_cases:
  - "北京稻香村零号店「一店一策」——传统糕点店升级为文化体验馆"
  - "成都熊猫 IP 3D 裸眼大屏——城市符号数字化升级"
  - "上海首发经济 LV「非凡之旅」——巨轮形态刷新空间想象"
local_hook_pattern: |
  从 City Pack 中选 G3 (CBD) / G4 (heritage core) / G2 (lifestyle scene) 各 1
  个具体地点；每个地点配一个「城市符号 × 产品真相」反差点（不是在地标拍照，
  而是改写地标的功能含义）。
anti_pattern: "在地标拍照而无在地真相；'某城限定'但全国都有"
```

#### D-RL-2 · Local Truth & Pain

```yaml
direction: regional_local_ip
value_category_anchors: [够爆, 够新鲜]
prompt_questions:
  - "{target_audience} 在「选 {category} 这件事」上最不能告诉外人的一个尴尬是什么？"
  - "{target_city} 的本地痛点（限号 / 学区 / 通勤 / 摇号 / 房价 / 户籍 等）里，最具体的一个家庭对话发生在哪个时刻？"
  - "如果让一个 {target_city} 本地老居民和一个外来定居者同时讲「为什么选这辆 {product}」，他们会说出哪两句完全不同的话？"
reference_cases:
  - "泉州蟳埔村 簪花围非遗体验——明星 + 非遗 + 体验经济"
  - "甘肃博物馆「麻辣烫 Jellycat」——地域饮食文化转化为可收藏物件"
local_hook_pattern: |
  从 City Pack `local_signatures.dialect_markers` + `local_memes` 取本地话语；
  从 G5_residential_decision 取真实生活场景；产出两个对话样本（本地 vs 外来），
  避免地标刻板印象。
anti_pattern: "刻板印象（如 北京=烤鸭、成都=熊猫、上海=外滩），缺真实生活样本"
```

#### D-RL-3 · Outbound Signature Route

```yaml
direction: regional_local_ip
value_category_anchors: [够亮眼, 够热]
prompt_questions:
  - "{target_city} 周边 300 km 内（City Pack G8），哪条路线是 {target_audience} 「不愿承认但每个周末都在走」的？"
  - "{HS-id}（小红书 #自驾/出城话题）里那张「父母搬安全座椅上车」的照片，{product} 能不能让它变成 60 秒短片？"
  - "City Pack `G9_signature_route` 里哪条路线被 {product} 走完后会被重新定义？"
reference_cases:
  - "霸王茶姬 AI 脚本生成器 for KOC"
  - "蒙牛 奥运资格赛上海潮流运动街区——观赛者变参与者"
local_hook_pattern: |
  从 G8（周末belt）+ G9（signature route）各选 1-2 条；每条路线必须 fold-in
  {product} 的某个具体功能（NVH / 续航 / 智驾 / 储物 / 露营接口等），不能只是
  旅行记录。
anti_pattern: "路线漂亮但与车辆无功能 fold-in；只是旅行不是产品故事"
```

### Cross-Category (D-CC-*)

#### D-CC-1 · Unlikely Pairing

```yaml
direction: cross_category
value_category_anchors: [够爆, 够亮眼]
prompt_questions:
  - "{brand} {product} 和谁联名最让人「啊？」但又「啊！原来如此」？"
  - "{HS-id}（最近的爆款联名/反差）能不能拆出一个机制供 {product} 复用？"
  - "如果只能联一个非 {category} 品牌做「{intake.brand_tonality_anchors 中的关键词}」的事，会是哪家？为什么？"
reference_cases:
  - "瑞幸 × 茅台「酱香拿铁」——白酒 × 咖啡的反差联名"
  - "LOEWE × 哈啰单车「金色骑旅」——奢牌 × 共享单车"
  - "瑞幸 × 多邻国「结婚」——人格化 IP 互动"
local_hook_pattern: |
  3 个跨界候选：(a) 与 {target_city} 强相关的本地老字号（City Pack
  `local_signatures.regional_symbols`）；(b) 与 {brand} 调性反差的全国 IP；
  (c) 与 {target_audience} 决策场景互补的服务品牌。每个候选要写出
  「产品真相」绑定，而非 logo 互换。
anti_pattern: "logo 互换无产品真相；联名方调性冲突；联名后无持续运营"
```

#### D-CC-2 · IP × Daily Object Folding

```yaml
direction: cross_category
value_category_anchors: [够亮眼, 够新鲜]
prompt_questions:
  - "把 {product} 的某个零件（座椅/方向盘/HUD/...）变成一个非 {category} 类爆款单品，会是什么？"
  - "{HS-id}（热播剧/综艺/IP）里哪个角色的「日常物品」可以被 {product} 的某个细节替代？"
  - "如果做一只「{brand} {target_audience} 同款毛绒/徽章/盲盒」，长什么样？"
reference_cases:
  - "蒙牛 × 哪吒 2 要强贺岁团——广告即电影番外篇"
  - "Jellycat × 樊振东「快乐大使」"
  - "甘肃博物馆「麻辣烫 Jellycat」"
local_hook_pattern: |
  从 {product} 的 1-2 个有故事感的零件出发，叠 City Pack `regional_symbols`
  里的本地视觉元素，产出 2-3 个可周边化的物件方案；每件需绑定「机械/技术
  对应物」，避免纯卖萌。
anti_pattern: "周边可爱但与车无机械相关；纯卖萌"
```

#### D-CC-3 · Service-tier Crossover

```yaml
direction: cross_category
value_category_anchors: [够新鲜, 够爆]
prompt_questions:
  - "{product} 和哪类「高端服务」联名能突破 {category} 圈？私厨？保险？医美？私塾？"
  - "如果把 {product} 的服务体系借给一个完全不相关的服务行业，谁最受益？"
  - "用一种非 {category} 的服务来定义 {product} 的售后，会是什么？"
reference_cases:
  - "vivo × 上海迪士尼——科技 × 文旅深度融合"
  - "美的楼宇科技日 #绿碳行动·代号 ZERO#——年度递进 ESG 品牌日"
local_hook_pattern: |
  在 {target_city} 找 3 类「高单价、高决策、高信任」服务（如私立教育、
  私立医疗、家政协会、保险/财富、私厨/会籍等）；每类配 1 个「服务 × 产品」
  共同体验日，必须落到 {product} 的真实使用场景，不是公关姿态。
anti_pattern: "服务方与产品体验无真实绑定；公关姿态而无落地"
```

### Major Events (D-ME-*)

#### D-ME-1 · Sports & Race Wave

```yaml
direction: major_events
value_category_anchors: [够热, 够爆]
prompt_questions:
  - "{launch_window} ±8 周里，{target_city} / 全国有哪些体育赛事？{product} 能借的是节奏，还是身份，还是物理空间？"
  - "{HS-id}（赛事/比赛）里最被忽略的群体是谁？{product} 如何为他们说话？"
  - "如果不做赞助也能让人觉得「他们好像和这事有关」，要做什么？"
reference_cases:
  - "伊利《致敬中国体育先行者》——挖掘奠基者叙事"
  - "蒙牛 奥运资格赛上海潮流运动街区"
  - "亨氏 全运会地铁番茄广告"
local_hook_pattern: |
  从 City Pack `G7_event_venue` + `local_signatures.annual_events` 找
  {launch_window} 内的赛事；产出 2-3 个「不靠 logo 而靠服务/物理空间/
  叙事身份」介入赛事的方案。
anti_pattern: "logo 贴赛事；late me-too 复盘；无 live beat"
```

#### D-ME-2 · Industry / Policy Window

```yaml
direction: major_events
value_category_anchors: [够热, 够新鲜]
prompt_questions:
  - "{launch_window} 内有哪些行业大会 / 政策发布会？{brand} 能蹭的是「国家叙事」还是「产业叙事」？"
  - "{HS-id}（政策窗口）下，{intake.brand_tonality_anchors} 是负担还是资产？怎么转？"
  - "如果上一个行业 wave 是 N 月，{launch_window} 应该叫什么 wave？"
reference_cases:
  - "海信 欧洲杯解说系列播客——音频深度本地渗透"
local_hook_pattern: |
  扫 {launch_window} ±4 周的行业大会 / 政策节点；为 {brand} 选 1 个产业
  叙事 + 1 个国家叙事各产出一个落点。注意 brand_tonality 与政策节点匹配
  （央企/民营/合资 各有不同火候）。
anti_pattern: "纯 PR 通稿无消费者触点"
```

#### D-ME-3 · Concert / Festival Embed

```yaml
direction: major_events
value_category_anchors: [够亮眼, 够爆]
prompt_questions:
  - "{launch_window} 内 {target_city} + 周边有哪些演唱会 / 音乐节？{product} 是赞助车，还是接送车，还是主舞台？"
  - "{HS-id}（演出/音乐节）现场最缺什么？{product} 能给出什么？"
  - "如果让一个 Livehouse 把 {product} 开进场子，会发生什么？"
reference_cases:
  - "vivo × 上海迪士尼——线上声量 + 线下体验立体矩阵"
local_hook_pattern: |
  从 City Pack `G7_event_venue` + 周边 G8 belt 中的演出/音乐节抽 2-3 个；
  每个产出一个「现场最缺的服务」承接，不是 logo 露出。
anti_pattern: "纯赞助 logo；无现场参与机制"
```

### Culture / Meme (D-CM-*)

#### D-CM-1 · Native Meme Adoption

```yaml
direction: culture_meme
value_category_anchors: [够爆, 够热]
prompt_questions:
  - "{HS-id}（最近的 meme/抽象人格）里哪一个「主角」可以官方化为 {product} 的某个零件人格？"
  - "如果让 {brand} 「不正经」一回，最该模仿哪个抽象品牌（多邻国/老乡鸡/外星人/...）？"
  - "{intake.brand_tonality_anchors} + 抽象人格 = 哪种反差最让 {target_audience} 破防？"
reference_cases:
  - "多邻国「多儿去世」抽象营销"
  - "外星人电解质水 × 陈建斌《外外外星人》"
  - "RIO × 闫妮「微醺女王」"
local_hook_pattern: |
  从 {target_city} `local_signatures.local_memes` 抽 1-2 个本地黑话；
  产出「{product} 某零件 × 本地 meme」的人格化语录方案；先做反差测试再
  正式投。
anti_pattern: "强行套梗；调性反差 backlash；过气梗"
```

#### D-CM-2 · Hit-Drama / Variety Embed

```yaml
direction: culture_meme
value_category_anchors: [够亮眼, 够热]
prompt_questions:
  - "{launch_window} 内正在播或将播的 {target_audience} 关注的剧 / 综里，哪个角色最适合「开 {product} 回家」？"
  - "{HS-id}（热播 IP）的某句台词能不能被 {product} 的某个功能点 fold-in？"
  - "综艺里哪个慢综艺的家庭样本可以「移植」到 {product} 的真实试驾？"
reference_cases:
  - "蒙牛 × 哪吒 2 要强贺岁团——电影番外篇广告"
  - "甘肃博物馆「麻辣烫 Jellycat」"
local_hook_pattern: |
  扫 {launch_window} ±8 周的剧综档期，按 {target_audience} 命中度过滤
  3 个候选；每个 IP 产出一个「角色 × {product} 功能」绑定方案，避免单纯
  logo 露出。
anti_pattern: "IP 仅做 logo 露出；签代言人不做内容"
```

#### D-CM-3 · Subculture Code

```yaml
direction: culture_meme
value_category_anchors: [够新鲜, 够爆]
prompt_questions:
  - "{target_audience} 在小红书 / B 站 / 即刻上有没有形成「圈内黑话」？哪一句最适合 {product} 收编？"
  - "{HS-id}（小众圈层暗语）能不能在 {product} 的车机 / UI / 服务里露出？"
  - "如果 {category} 圈层有一种「身份徽章」，长什么样？"
reference_cases:
  - "RIO × 闫妮「微醺女王」"
  - "Jellycat × 樊振东「快乐大使」"
local_hook_pattern: |
  在 {target_audience} 主战场平台抽 3 句已成熟的圈内黑话（最好已被本人群
  自发使用 ≥3 个月）；产出「黑话 × 产品功能」的徽章 / 同款 / OTA 文案方案。
anti_pattern: "圈外人造圈内话；伪造亚文化"
```

### Tech Proof (D-TP-*)

#### D-TP-1 · Scenario-First Demo

```yaml
direction: tech_proof
value_category_anchors: [够亮眼, 够新鲜]
prompt_questions:
  - "{product} 的 N 件「技术资产」里，哪一件最缺一个「在 {target_city} 真实拍得到」的场景？"
  - "{HS-id}（科技梗 / AI 应用爆款）能不能成为 {product} 的演示舞台？"
  - "把 {product} 的某个技术指标「翻译成 {target_audience} 的日常场景」，最反直觉的版本是什么？"
reference_cases:
  - "王老吉 AI 实验室 吉文化营销——AI 数字人 + AI 音乐 + AI 出图"
  - "百度品牌百看 AI 搜索营销"
  - "知味观 AI 智能点胶月饼"
local_hook_pattern: |
  从 City Pack G3 / G4 / G7 / G8 中各取 1 条「真实日常路径」，把 {product} 的
  3 个核心技术点各对一条路径做现场可拍 demo；不允许 spec dump，必须有真实
  场景视频脚本。
anti_pattern: "spec dump；'我们用 AI'但无 demo"
```

#### D-TP-2 · Builder Credibility

```yaml
direction: tech_proof
value_category_anchors: [够热, 够新鲜]
prompt_questions:
  - "{brand} 的 N 个「builder 资产」（创始人 / 总师 / 工程师 / 产业链合作方）里，哪个最容易被 {target_audience} 「看见」？"
  - "如果让两个反差 builder 对谈（如老 vs 新、传统 vs 互联网、央企 vs 民营），会撞出什么火花？"
  - "{HS-id}（创始人 IP / 工程师网红）能不能复用为 {product} 的人格？"
reference_cases:
  - "雷军串门送 T 恤 / 李斌骑共享单车 / 王传福坐地铁"
  - "百度品牌百看 AI 搜索营销"
local_hook_pattern: |
  在 {brand} 内部找 2-3 位 builder（不限职级），叠 {target_city} 的真实城市
  场景做对谈 / 直播 / 纪录片；不允许工程师讲参数无场景翻译。
anti_pattern: "工程师讲参数无场景翻译"
```

#### D-TP-3 · Public Lab / Open Test

```yaml
direction: tech_proof
value_category_anchors: [够爆, 够亮眼]
prompt_questions:
  - "如果把 {product} 的实验室「搬到 {target_city} 的 G2 / G7」，最先做哪 1 个公开测试？"
  - "{HS-id}（公众安全焦虑 / {category} 事故话题）下，公开实测能不能转危为机？"
  - "用一种「不正经的实验」证明一个「正经的安全 / 性能数据」，会是什么？"
reference_cases:
  - "麦当劳 麦麦农场年历——溯源转日常美学"
  - "三顿半「返航计划」"
local_hook_pattern: |
  从 City Pack G1 / G2 / G6 中选 1 个高人流场所，做「一日限定公开实验」；
  实验必须可数据化、可现场验证，不是纯展示。
anti_pattern: "实验室搬出来但没有数据可验证；纯展示无互动"
```

### Social Resonance (D-SR-*)

#### D-SR-1 · Family / Identity Emotion Wave

```yaml
direction: social_resonance
value_category_anchors: [够爆, 够热]
prompt_questions:
  - "{HS-id}（与 {target_audience} 强相关的公共情绪）里，哪一句最能被 {product} 「真诚回答」而不是绕开？"
  - "{target_audience} 最近在主战场平台 emo 什么？{product} 敢承接哪一种焦虑？"
  - "如果让一个真实的 {target_city} {target_audience} 说一句话给 {brand} 听，最不愿意听的会是什么？"
reference_cases:
  - "珀莱雅「性别不是边界线，偏见才是」——年度递进社会议题"
  - "中国银联《低头捡星光》——环保转艺术事件"
  - "臻浓女篮奥运营销「要强」——商业 × 社会价值"
local_hook_pattern: |
  从 City Pack `G5_residential_decision` 取真实家庭样本，叠 1 个 {target_audience}
  的 公共情绪 HS；产出「真实样本 × 真诚答复」的 60-90 秒短片脚本，避免
  purpose-wash。
anti_pattern: "purpose-wash；一次性符号；伪共情"
```

#### D-SR-2 · Generation / Workplace Conflict

```yaml
direction: social_resonance
value_category_anchors: [够爆, 够新鲜]
prompt_questions:
  - "{target_audience} 周围的代际冲突 / 中年觉醒 / 城市迁徙 — 哪一个最适合 {product} 「不端着」地参与？"
  - "{HS-id}（代际 / 阶层冲突话题）下，{product} 要站在哪一代人那一边？"
  - "如果让两代人各说一句气对方的话，{product} 出现在哪一句里？"
reference_cases:
  - "麦当劳 麦麦农场年历"
  - "美的楼宇科技日 #绿碳行动"
local_hook_pattern: |
  锁 1 个代际话题（如 35 岁危机 / 县城回流 / 中年觉醒等），在 {target_city}
  找 2 个真实样本对谈；产出「代际共车」叙事，不假装共鸣。
anti_pattern: "假装共鸣的中年标签；过度悲情"
```

#### D-SR-3 · Quiet Pride

```yaml
direction: social_resonance
value_category_anchors: [够新鲜, 够亮眼]
prompt_questions:
  - "{intake.brand_tonality_anchors} 这件事，最让 {target_audience} 「悄悄骄傲但说不出口」的点是什么？"
  - "{HS-id}（民族 / 国货 / 工业自豪情绪）下，{product} 是高调还是低调？"
  - "「{brand} 调性」如何不掉书袋地变成一种生活方式骄傲？"
reference_cases:
  - "伊利《致敬中国体育先行者》"
  - "美的楼宇科技日"
local_hook_pattern: |
  从 {brand} 历史 / 产业链 / 用户身份中找 1 条「悄悄骄傲」的事实；用
  {target_city} 真实家庭 / 三代人 / 老员工后代视角说出来，不爱国绑架。
anti_pattern: "硬上民族叙事；爱国绑架"
```

### Co-Creation (D-CR-*)

#### D-CR-1 · Low-friction Challenge

```yaml
direction: co_creation
value_category_anchors: [够爆, 够热]
prompt_questions:
  - "如果在 {target_audience} 主战场平台发起一个 challenge，门槛低到「3 秒就能拍」，会是什么？"
  - "{HS-id}（流行 challenge 模板）能不能复用一次给 {product}？"
  - "用一句话写出 challenge 的钩子，让用户「不参与就 FOMO」，会是什么？"
reference_cases:
  - "多邻国「爆文奖池」机制——破万赞 5000 元 + 流量"
  - "霸王茶姬 AI 脚本生成器——降低 KOC 门槛"
local_hook_pattern: |
  设计 1 个 3-5 秒 UGC 模板，绑定 {product} 的 1 个具体功能 / 物件；
  奖励透明、模板可复制；先在 {target_city} 真实用户做 50 例 dry-run。
anti_pattern: "无创意模板的空 hashtag；门槛过高；激励不透明"
```

#### D-CR-2 · User Becomes IP

```yaml
direction: co_creation
value_category_anchors: [够新鲜, 够爆]
prompt_questions:
  - "如果让 {target_city} 首批 100 位 {product} 车主每人贡献一个故事，最具传播性的「单一形式」是什么？"
  - "{HS-id}（用户共创平台 / 社群文化）能不能给 {product} 做一个 mini 复刻？"
  - "把车主社群变成「事件主办方」而非「品牌粉丝群」，需要让出哪些权力？"
reference_cases:
  - "蔚来 NIO Day 用户主导品牌节"
  - "Lidl「Lidlize」AI 共创平台 — 用户设计真实可售商品"
local_hook_pattern: |
  让出 1 个具体权力（交付仪式 / OTA 投票 / 限定外观投票 / 周边 SKU 设计），
  在 {target_city} 设 1 个用户主办活动；用户作为 IP 主体而非素材。
anti_pattern: "用户被邀请当广告素材而非真共创"
```

#### D-CR-3 · Real-world Closed Loop

```yaml
direction: co_creation
value_category_anchors: [够亮眼, 够新鲜]
prompt_questions:
  - "把用户的 UGC（路线 / 技巧 / 故事）变成实际可售 / 可用的产品，闭环是什么？"
  - "{HS-id}（创作者经济 / 共创案例）里哪个机制最值得 {product} 1:1 复制？"
  - "如果让 {target_audience} 「投票」决定 {product} 一年后的某个升级，会怎么设计？"
reference_cases:
  - "Lidl「Lidlize」AI 共创平台"
  - "三顿半「返航计划」"
local_hook_pattern: |
  锁 1 个真实可下发的闭环（OTA / 实体周边 / 用户路书出版 / 服务方案上线），
  产出 1-2 个完整链路设计；不允许「线上喊口号但产物无实体」。
anti_pattern: "共创口号但产物只在线上；无实体闭环"
```

## Drawing Rules

When in `Phase: Activity Card Draw`, the deck is drawn against `{artifact_root}/01h-hotspot-harvest.md` (which contains both the `HS-*` atom set and the `## City Pack`):

1. For each `HS-*` atom, **at least 2 cards are drawn** from different directions.
2. For each of the 4 value categories (够新鲜 / 够亮眼 / 够爆 / 够热), **at least 6 raw ideas** in total must be produced.
3. For each card drawn, **at least one prompt_question is answered concretely** with a hook resolved from the City Pack (G-cat / channel / local_signature) — not a hardcoded place name from this deck.
4. **No spine check at draw time**. Spine fit is decided in Lead Pool Packaging.
5. **No leakage from previous briefs**: if a hook resembles the last brief's city / brand / event, re-derive from the current intake.

## Extension

Workflow may add new cards as `D-{direction-code}-{n+1}` when an unlisted hotspot pattern repeatedly fails the existing 24. Do not delete cards — outdated cards stay archived with a `deprecated_reason`.

---

## EXAMPLE Appendix — Beijing × 央企 SUV launch hook expansion

> The following block is **EXAMPLE only**, demonstrating how an agent expands the abstract `local_hook_pattern` of each card into concrete hooks **once intake is set to `target_city = 北京`, `brand = 奕境`, `product = DH1`, `target_audience = 北京 30-40 岁中产父母`, `launch_window = 2026-06`**. Do **not** treat any string here as a default — different intake yields entirely different hooks.

| Card | Concrete Beijing hook (illustrative) |
|---|---|
| D-TA-1 | 618 → 不做家电节，做「家庭出行品质消费节」；端午 → 「全家出行的安全粽子（NVH 包裹感）」；高考结束（6/9）→ 「考完家长还在焦虑，谁来接你」 |
| D-TA-2 | 夏至（6/21）→ 「最长一天，全家最长的一次自驾」；小暑/大暑 → 北京人逃城避暑路线（草原天路 / 张家口） |
| D-TA-3 | 上市倒计时 100 小时 → 北京 100 个家庭故事 ；「2026 中国家庭旗舰之夜」 单日限定开放 |
| D-RL-1 | 二/三环堵点 → 「家庭旗舰穿越仪式」；胡同停一辆 DH1 → 老北京 vs 新中国家庭；首钢园 / 798 / 三里屯 → 工业感 × 家庭旗舰反差展 |
| D-RL-2 | 「选车的家庭会议」北京中产真实对话纪录片；「摇号 8 年终于摇到」；京津冀通勤族 → 一周 5 天的安全账 |
| D-RL-3 | 北京 → 阿那亚 家庭自驾 24h 直播；草原天路一日全家行 DH1 限定路书；「胡同到秘境」北京周末出京路线手绘地图 |
| D-CC-1 | DH1 × 故宫文创 / 同仁堂 / 老舍茶馆，"为家人开方"品质 metaphor |
| D-CC-2 | DH1 「安全骨架」白车身雕塑 → 北京当代艺术圈；安心首席官徽章 + Jellycat 风毛绒；鸿蒙座舱 × 北京文创周边 |
| D-CC-3 | DH1 × 北京顶级私立学校 / 协和医院 / 北京家政协会 |
| D-ME-1 | 北京马拉松 → 「跑完最后 1 km，有车送你回家」；中超联赛 → 「全家观赛交通」；京 A/B 业余赛事 → 选手家庭车队联动 |
| D-ME-2 | 北京车展（4 月）→ 6 月「央企智造旗舰节」；中关村论坛 → 鸿蒙 + DH1 科技背书；国资委央企品牌日 |
| D-ME-3 | 麦田音乐节亲子专区接送；阿那亚戏剧节「全家来看戏」；工体演唱会散场接送家庭专车 |
| D-CM-1 | 「鸿蒙座舱大屏成精」拟人化语录；安全座椅 vs 老父亲后座 PK；央企造车「老干部 meme」自嘲 |
| D-CM-2 | 热播家庭剧「同款车」中年觉醒角色座驾；《再见爱人》风格「家庭沟通舱」试驾综艺；「向往的生活」北京郊区版 |
| D-CM-3 | 「全家有车的爸」徽章；「我家那位首席安全官」妻子视角圈层语；小红书「带娃自驾流派」分类册 |
| D-TP-1 | 二环晚高峰 → 智驾真实通勤直播；京港澳高速雨夜 → ADS 紧急避让实测；胡同窄路掉头 → 鸿蒙智驾极限秀 |
| D-TP-2 | 「东风总师 × 华为终端老炮」北京对谈；鸿蒙工程师晚高峰直播教智驾；「央企造车的 75 个人」纪录短片 |
| D-TP-3 | 三里屯「公开碰撞实验室」一日限定；国贸 SKP「白车身透明展」；首钢园「鸿蒙智驾极限挑战」 |
| D-SR-1 | 北京双职工家庭一周通勤纪实；「孩子的安全座椅装好那一刻」短片征集；「我和我爸的车」中年父子对话 |
| D-SR-2 | 「我爸的桑塔纳 vs 我的 DH1」代际车主对谈；北漂 10 年 vs 老北京 10 年选车逻辑；「孩子终于愿意坐我开的车」中年父亲故事 |
| D-SR-3 | 「我爸说，央企的车我能信」父辈背书纪录片；「东风 56 年第一辆我会买的车」老工人后代自述；「我家三代人都开东风」北京家族故事 |
| D-CR-1 | 「我家的安全座椅故事」3 秒短视频 challenge；「带爸妈试驾的那一秒」北京家庭日；「孩子说出第一个『我想坐这辆车』」 |
| D-CR-2 | 北京首批 100 户首席安全官用户主导交付仪式；首批车主家庭故事纪录片众筹；车主社群联合出版《家庭出行白皮书》 |
| D-CR-3 | 用户路书 → 官方限定「北京家庭路书集」实体出版；用户车机皮肤投票 → OTA 真实下发；首批 100 户故事 → 实体周边礼盒 |

When intake changes to a different city / brand / product, regenerate this entire appendix — do **not** copy a row across briefs.
