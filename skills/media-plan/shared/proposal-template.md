# Proposal Template

## Entry Conditions

- Intake status is `ready`.
- Research verdict is `pass`.
- `## Selected Direction Handoff` is present for the chosen direction set (primary + any co-directions).
- `## Core Strategic Idea` is present for the primary direction (and co-directions if they have distinct stories) per [core-strategic-idea.md](core-strategic-idea.md).
- `## Highlight Mechanism Canvas` is present for the selected direction and is complete enough to carry into execution, including `Stage pillars`, `Local life map`, and `Calendar alignment`.
- `## Content Assets` is present for the primary direction (ideation output echoed in the proposal) per [content-assets.md](content-assets.md).
- `## Validated Execution-Plan Handoff` is present for the recommended execution plan and has `Validation status: validated`.
- At least one idea is scored as `keep` or otherwise confirmed viable.
- `deliverables_needed`, `constraints`, and `success_metric` are all present in the brief and are not `unknown`, `tbd`, or similar placeholders.
- **Bid / tender (optional)**: if `bid_or_tender` is true and `evaluation_rubric` is non-empty in intake, include `## Rubric Mapping`. If `tender_technical_requirements` or `bid_or_tender` demands post-campaign detail, include `## Post-Campaign Review & Uplift`.
- If any entry condition fails, stop proposal writing and return the blocking gap instead.

## Output Mode Routing

- Default mode: `general_proposal`.
- Switch to `auto_regional_launch` when the brief is clearly automotive + city or regional launch scope (for example: auto brand or model launch, city-level roll-out, and phased pre-heat/launch/sustain intent).
- In `auto_regional_launch` mode, output a **single PPT-ready planning document** using the dedicated structure below. Do not emit dual versions.
- In `auto_regional_launch` mode, proposal writing is blocked unless research includes a complete `## City Evidence Pack`.

## Structure

The final proposal must show a visible decision trail in this order: brief → research → idea → **Core Strategic Idea** → execution assets.

### A) General Proposal Structure (`general_proposal`)

1. `Brief Snapshot`
2. `Objective And Success Metric`
3. `Audience And Context`
4. `Research-Based Insights` (must reflect `## Competitor Actionable View` and `## Hotspot × Regional Resource Match` from research)
5. `Core Strategic Idea`
6. `Strategic Direction`
7. `Highlight Mechanism Overview`
8. `Mechanism Design` (must match [highlight-mechanism-canvas.md](highlight-mechanism-canvas.md) participation / spread / conversion)
9. `Core Idea Options`
10. `Phased Execution Plan`
11. `Phased Event Menu` (cognitive + time columns; align with [highlight-mechanism-canvas.md](highlight-mechanism-canvas.md) `Stage pillars` and execution handoff)
12. `Content Assets`
13. `Core Events, Channels, And Conversion Path`
14. `Post-Campaign Review & Uplift` (required when `bid_or_tender` + `tender_technical_requirements` or user demands; otherwise `n/a` with one-line justification is acceptable for general proposals)
15. `Rubric Mapping` (only when `evaluation_rubric` is provided; else omit or mark `n/a`)
16. `Risks And Open Questions`
17. `Decision Request And Next Step`

### B) Auto Regional Launch Structure (`auto_regional_launch`, single output)

1. `Market And Competitor Insights` (SWOT + city-level competitor action benchmark)
2. `Core Strategy` (positioning claim + propagation theme + segmented audience)
3. `Phase 1: Pre-Heat Momentum` (city buzz + circle penetration + lead accumulation)
4. `Phase 2: Launch Burst` (launch event + citywide spread + first owner delivery)
5. `Phase 3: Sustain And Conversion` (owner ops + KOC seeding + test drive + network push)
6. `Execution Action Playbook` (program-level execution cards; not framework-only bullets)
7. `Full-Funnel Conversion Path` (traffic → lead → test drive → store visit → order → WOM)
8. `KPI System And Budget Split` (KPI must bind to playbook actions)
9. `Risk Playbook`

For `auto_regional_launch`, each section must be presentation-ready (clear page title + named actions + schedule windows + channel or venue + expected output).
For `auto_regional_launch`, each phase section (3/4/5) must include at least one flagship program with a concrete mechanism and stage flow (for example: contest tracks + execution steps), not only high-level headlines.

## Template

```md
# Proposal Title

## 1. Brief Snapshot

## 2. Objective And Success Metric

## 3. Audience And Context

## 4. Research-Based Insights
(Summarize; reference competitor trust paths and regional hotspot rows explicitly.)

## 5. Core Strategic Idea
(Shape per [core-strategic-idea.md](core-strategic-idea.md) — one-line claim, contradiction, resolution path.)

## 6. Strategic Direction

## 7. Highlight Mechanism Overview
(Theme, hero, pillars summary — must align with Core Strategic Idea and canvas.)

## 8. Mechanism Design
1. **Participation** — (expand from canvas `Participation mechanism`; who joins, what they do)
2. **Spread** — (from `Spread mechanism`; why share / discuss / UGC)
3. **Conversion** — (from `Conversion mechanism`; handoff to leads, trial, store, purchase)

## 9. Core Idea Options

## 10. Phased Execution Plan
(Map Early / Mid / Late to time and to cognitive goals: 建立期待 / 验证价值 / 口碑与转化。)

## 11. Phased Event Menu

| Macro stage (Early / Mid / Late) | Cognitive focus (期待 / 信任 / 裂变) | Time (month / week / T±) | Activity name | Pillar type (声量 / 圈层 / 转化) | Format and venue or touchpoint | Link to main idea / Hero / Content asset |
| --- | --- | --- | --- | --- | --- | --- |

(Include at least three named rows per macro campaign stage, matching `Stage pillars` and `Pillar roster by phase` naming.)

## 12. Content Assets
(Long / mid / short per [content-assets.md](content-assets.md).)

## 13. Core Events, Channels, And Conversion Path

## 14. Post-Campaign Review & Uplift
(Metrics, review cadence, optimization moves; tie to `success_metric` and budget. Use `n/a` only for non-bid or when explicitly not required.)

## 15. Rubric Mapping
| Scoring item (from RFP) | Where addressed in this proposal (section + one-line) | Proof or artifact |
| --- | --- | --- |
| … | … | … |

(Include only if `evaluation_rubric` is present; otherwise `n/a` or omit.)

## 16. Risks And Open Questions

## 17. Decision Request And Next Step
```

## Auto Regional Launch Template (`auto_regional_launch`)

```md
# Proposal Title

## 1. 任务课题 / Mission & Key Questions

### Compact View
- Core mission: [single sentence — what this campaign must achieve]
- Key questions: [2-3 bullets]
- Core slogan: [the final slogan]

> **Bid-gating**: If `bid_or_tender` is false or absent, this section may be collapsed to a one-paragraph brief snapshot.

### Expanded View
- **核心营销命题**: [一句话点明"如何实现 XX 车型与 XX 区域用户的双向奔赴，在上市周期内实现声量+销量双提升"]
- **三大核心课题**:
  - 课题一: [竞争阵地与差异化定位]
  - 课题二: [全域覆盖]
  - 课题三: [全链路转化]
- **核心任务宣言**: [统领全案的核心任务口号，语言有张力]
- **Slogan derivation note**: [reference to `Slogan derivation logic` in Core Strategic Idea]

## 2. 市场洞察 / Market & Consumer Insights

### Compact View
- Product highlights: [5 bullets]
- Market trend: [1 chart description or summary]
- Competitor classification table:
  | 分类 | 定义 | 应对策略方向 |
  | --- | --- | --- |
  | 核心竞品 | 价格带重叠、目标客群高度相似 | 贴身肉搏，正面硬刚 |
  | 重点竞品 | 有交叉客群，存在明显分流威胁 | 凸显差异价值，抢声量 |
  | 延展竞品 | 客群有潜在迁移可能 | 错位竞争，潜在拦截 |
- SWOT summary: [4-quadrant bullet summary]

### Expanded View

#### 2.1 汽车产品信息梳理
- Core parameters table: [尺寸/动力/续航/智能配置/安全等级]
- Core technology highlights: [differentiated points vs competitors]
- Brand backing: [母公司/合作品牌/核心技术来源]
- Format: structured table + 传播感 highlights (not parameter dump)

#### 2.2 市场整体态势分析
- **Overall category** (national, last 3 years): sales trend, YoY growth vs passenger vehicle average
- **Power type split**: 燃油/混动/纯电 share, growth, trend
- **Per power type**: core audience / price range / future trend
- **Regional level**: local share vs national average, channel trends, structural opportunities
- **Data sources**: explicit attribution (乘联会/懂车帝/汽车之家/etc.)

#### 2.3 竞品格局分析
- Three-tier classification table (same as Compact View, expanded with examples)
- 形象对标: [traditional luxury brand used for upward positioning]
- 竞品格局图: [description of price/intelligence/brand coordinate map]

#### 2.4 核心竞品深度营销分析
- Per core/key competitor (separate subsections, do not merge):
  1. **核心定位**: [one-sentence brand tag]
  2. **营销打法**: [topic/content/endorser/price strategy]
  3. **渠道策略**: [offline layout/user operation/community]
  4. **用户信任路径**: [know → order key touchpoints]
  5. **应对策略**: [impactful strategy sentence]
- **近期重要营销动作**: [2–3 latest campaigns with timing]

#### 2.5 目标客群基础分析
- Classification: [2–4 types, e.g., 核心客群/转化客群/潜力客群]
- Per type:
  - 基本画像: [age/occupation/income/family]
  - 用车场景: [commute/family/business/long-distance]
  - 核心痛点: [unmet needs]
  - 关注要点: [top 3–5 decision dimensions]
  - 情感诉求: [emotional motivation and identity]

#### 2.6 目标客群深度洞察（区域维度）
- Per persona type:
  - 消费趋势: [rationalization/quality/scene-driven trends]
  - 触媒习惯: [platforms used for auto decisions]
  - 空间分布: [where they live/gather in the region]
  - 心态分析: [consumption mindset, anxieties, aspirations]
  - 消费习惯: [decision cycle, info path, brand loyalty]
  - 出行习惯: [weekday/weekend/holiday differences]
  - 文化与情感归因: [regional cultural anchors, e.g., 江城情怀]

#### 2.7 SWOT 分析总结
- S/W/O/T each mapped to regional specific scenarios (not generic)

## 3. 营销策略 / Core Marketing Strategy

### Compact View
- Core value: [echo from Core Strategic Idea]
- Marketing主线: [echo from Core Strategic Idea]
- Strategy pillars: [echo from Core Strategic Idea]
- Main slogan: [final slogan]
- Stage sub-themes:
  - 预热: [sub-slogan]
  - 引爆: [sub-slogan]
  - 延续: [sub-slogan]

### Expanded View

#### 3.1 产品核心差异化价值呈现
- **品牌基础层**: [backing logic, e.g., [品牌A×品牌B双巨头共创]]
- **痛点解决层**: [3 value propositions with specific solutions, not slogans]
- **产品目标层**: [one传播感 sentence defining ultimate market role]

#### 3.2 营销主线推导
- **Derivation chain** (must trace to `Slogan derivation logic` in Core Strategic Idea):
  - 品牌维度: [how brand contributes]
  - 受众/场景维度: [how audience/use-case contributes]
  - 产品价值维度: [how product value contributes]
  - → **核心营销主题**: [final slogan with记忆点]
- **阶段子主题**:
  - 预热期: [sub-theme]
  - 引爆期: [sub-theme]
  - 延续期: [sub-theme]

#### 3.3 核心影响策略
- **统领性战略语**: [one impactful strategy statement, e.g., "极致压强 饱和攻击"]
- Three strategy directions, each with:
  - **战略内涵**: [what this strategy means]
  - **落地动作举例**: [2–3 concrete actions]
  1. 声量传播 — 高饱和攻击
  2. 出行场景 — 高频式体验
  3. 目标客群 — 高效链路转化

#### 3.4 整体营销节奏 & 上市整合营销 MAP
- **三阶段节奏框架** (table):
  | 阶段 | 时间 | 阶段主题语 | 核心目标 | 核心策略 |
  | --- | --- | --- | --- | --- |
- **营销 MAP** (table): 节奏 / 目标 / 策略 / 区域动作 / 传播动作 / 终端动作
- **传播 MAP** (table): 传播方向 / 内容示意 / 传播渠道 / 媒介策略

## 4. 行动规划 / Phased Action Plan

### Phase 1: 预热造势期 / Pre-Heat Momentum

#### Compact View
##### Online Actions
| 时间 | 动作 | 产出物 | 关键节点 | 销售机制 | 话题标签 |
| --- | --- | --- | --- | --- | --- |

##### Offline Actions
| 时间 | 动作 | 产出物 | 关键节点 | 销售机制 |
| --- | --- | --- | --- | --- |

##### Program Blueprint Card (Summary)
- [One card per phase, summary only: name, role, objective, theme]
- **Platform content angle**: [which platforms, what differentiated content per platform]
- **Hashtag / topic tag examples**: [≥2 concrete tags]

#### Expanded View

##### Online Activities (each activity expanded)
For each online activity:
- 🏷️ **活动创意命名**: [brand-sounding name]
- 🎯 **活动目的**: [what marketing problem this solves]
- 💡 **核心创意亮点**: [why memorable, why viral]
- 📋 **活动玩法**: [how to play, barrier, incentive]
- 📅 **执行流程**: [启动期→创作期→传播期→颁奖期]
- 📱 **传播平台**: [which platforms, content format differences per platform]
- 🔗 **转化闭环**: [activity → lead → store → order]
- 📎 **话题标签**: [concrete tags, e.g., `#AI帮我带娃出行#`]

##### Offline Activities (each activity expanded)
For each offline activity:
- 🏷️ **活动创意命名**: [brand-sounding name]
- 🎯 **活动目的与目标客群**: [problem + audience]
- 📍 **选址逻辑**: [why this location, brand/audience fit]
- 💡 **核心创意亮点**: [car/region connection]
- 📋 **活动形式与流程**: [zones, interactions, checkpoints]
- 🎁 **激励机制**: [participation gift / checkpoint reward / lead gift]
- 🔗 **转化路径**: [know → consult → test drive → store → order]
- 📣 **传播动作**: [UGC二次传播 plan]

### Phase 2: 上市引爆期 / Launch Burst

#### Compact View
##### Online Actions
| 时间 | 动作 | 产出物 | 关键节点 | 销售机制 | 话题标签 |
| --- | --- | --- | --- | --- | --- |

##### Offline Actions
| 时间 | 动作 | 产出物 | 关键节点 | 销售机制 |
| --- | --- | --- | --- | --- |

##### Launch Event Plan (Summary)
- Venue: [1–2 alternatives with rationale]
- Core agenda: [bullet summary]

##### Program Blueprint Card (Summary)
- [Summary only: name, role, objective, theme]
- **Platform content angle**: [which platforms, what differentiated content per platform]
- **Hashtag / topic tag examples**: [≥2 concrete tags]

#### Expanded View

##### 现场核心环节
- **选址建议**: [1–2 alternatives with map rationale and audience distribution data]
- **现场空间部署**: [zone layout: 主舞台区/集客互动区/静态体验区/试驾区/签到区]
- **核心活动流程** (逐环节):
  1. **引流环节**: [pre-launch warmup with creative highlight]
  2. **车型价值讲解**: [story/scene-based, not parameter dump — e.g., 脱口秀, real family story]
  3. **车型正式亮相**: [creative form: 三幕/三篇章/场景剧]
  4. **收尾钩子设置**: [pre-heat closure + sustain hook]
  5. **现场促单环节**: [how to convert heat to orders on-site]

##### 现场集客环节
For each集客 activity:
- 活动名称 + 核心玩法
- 目标人群契合逻辑
- 与车型/品牌的关联点
- 留资机制
- 引导到正式发布会的路径

> 建议涵盖: 打卡拍照区 / 互动体验区 / 智能演示区 / 安全展示区 / 亲子互动区 / 商超异业合作

##### 上市会传播环节
- **传播内容规划图表**:
  | 时间轴 | 传播核心 | 核心动作 | 创意内容示例 | 媒介策略 | 平台 |
  | --- | --- | --- | --- | --- | --- |
- **平台差异化内容策略**:
  | 平台 | 内容风格 | 重点方向 | 内容示例标题 |
  | --- | --- | --- | --- |
  | 抖音 | 短视频，强情绪共鸣 | 场景化家庭体验、AI创意 | 《光谷爸爸换车记》 |
  | 小红书 | 图文/短vlog，精致氛围感 | 城市意境打卡、生活方式 | 《这台车和武汉很配》 |
  | 懂车帝/汽车之家 | 深度测评，专业干货 | 产品对比、提车指南 | 《[车型名] vs [竞品名] 深度对比》 |
  | 视频号 | 生活化、熟人传播 | 车主故事、活动直播 | 车主购车真实记录 |
  | 微博 | 话题制造，热搜逻辑 | 话题标签运营，舆论引导 | #武汉首台[车型名]# |
- **KOL/KOC分层策略**:
  - 头部KOL: [汽车垂类，专业背书]
  - 腰部KOL: [亲子/旅行/科技，场景种草]
  - KOC: [素人车主/真实体验者，口碑裂变]

### Phase 3: 延续转化期 / Sustain And Conversion

#### Compact View
##### Online Actions
| 时间 | 动作 | 产出物 | 关键节点 | 销售机制 | 话题标签 |
| --- | --- | --- | --- | --- | --- |

##### Offline Actions
| 时间 | 动作 | 产出物 | 关键节点 | 销售机制 |
| --- | --- | --- | --- | --- |

##### Program Blueprint Card (Summary)
- [Summary only: name, role, objective, theme]
- **Platform content angle**: [which platforms, what differentiated content per platform]
- **Hashtag / topic tag examples**: [≥2 concrete tags]

#### Expanded View

##### 螺旋上升永动机逻辑
```
前期客户 → 下单 → 传播声量 → 新客户 → 下单 → 犹豫客户 → 持续培育 → 成交
```

##### ① 口碑传递活动
- 活动创意命名: [brand-sounding]
- 口碑内容策略: [what owners say, in what format]
- KOC沙龙形式: [owner + KOC exchange]
- 传播链路: [owner experience → UGC → platform diffusion → prospect attention]
- 内容方向示例: [e.g., `《从BBA换[车型名]，为了家庭我做了这个选择》`]

##### ② 试驾价值体验活动
- 活动创意命名: [scene-based, e.g., "江城生活·[车型名]随行"]
- 场地选择理由: [urban/highway/rural road combination]
- 静态体验区设计: [zone names, interactions, product卖点 linkage]
- 动态试驾设计: [part/篇章式, e.g., 穿越生活/放飞自在/品味[车型名]]
- KOC参与机制: [how KOCs enable circle diffusion]
- 无痕促单设计: [natural purchase guidance in experience]

##### ③ 网点销售促进活动
- 政策设计: [留资礼/预定礼/抢购礼/老带新 — each with specific权益]
- 终端团购活动: [三人成团: 团类型/客群/政策差异化]
- 线上引流: [daily live stream / lottery / fast conversion]
- 线下集中大促: [regional group buying /犹豫客户二次收割]
- 门店自媒体运营: [short video frequency / launch live rhythm]

## 5. 运营检核 / Operations & Review

### Compact View
- Org chart summary
- Group list and tracking cadence

> **Bid-gating**: If `bid_or_tender` is false, output `n/a — not required`.

### Expanded View
- **矩阵层级管理汇报机制**:
  - 组织架构图: [区域负责人 → 广告公司执行组 → 市场经理 → 经销商 → KOL/媒体]
  - 群组管理机制: [which groups, what they do]
  - 传播素材下发流程: [制作→审核→下发→转发→反馈]
  - 传播效果反馈机制: [data aggregation, checkpoint schedule]

## 6. 服务团队 / Service Team

### Compact View
- Team configuration and roles

> **Bid-gating**: If `bid_or_tender` is false, output `n/a — not required`.

### Expanded View
- 核心人员构成与专业背景
- 对本次项目的重视程度与专业保障说明

---

## Appendix A. 评分对应 / Rubric Mapping

| Scoring item (from RFP) | Where addressed in this proposal | Proof or artifact | Self-assessment |
| --- | --- | --- | --- |

> **Bid-gating**: Include only if `bid_or_tender` is true and `evaluation_rubric` is non-empty. Otherwise omit.

## Appendix B. 风险应对 / Risk Playbook

| Risk | Stage | Impact | Mitigation | Trigger owner |
| --- | --- | --- | --- | --- |

## Appendix C. 预算分配 / Budget Split

| Module | KPI | Budget ratio | Measurement cadence |
| --- | --- | --- | --- |
```

## Writing Rules

- Keep the recommendation traceable to the brief and research.
- Make the brief → research → idea → **Core Strategic Idea** → execution trail explicit.
- Write in direct business language, not workshop jargon.
- Use `Highlight Mechanism Overview` and `Mechanism Design` to show the core theme, hero event, and mechanism logic explicitly; **no contradiction** with the canvas.
- Prefer concrete tradeoffs over broad possibility lists.
- Show what should happen next, who needs to decide, and what is still uncertain.
- Do not include execution recommendations that the stated constraints cannot support.
- **`Phased Event Menu` must use schedulable, name-level activity lines**; the **Cognitive focus** column must not be empty — tie each row to 期待 / 信任 / 裂变 (or a brief equivalent) consistent with the canvas.
- No invented **client master marketing rhythm**; if `client_master_calendar` was not provided, list as `Open Question`.
- `auto_regional_launch` mode must be a single PPT-ready output (no dual-document split): use compact headings, named actions, and table-first content that can move to slides with minimal rewrite.
- `auto_regional_launch` mode must reject framework-only writing. Pure KPI lists or abstract verbs (e.g., "strengthen communication", "boost awareness") are insufficient unless mapped to named program actions with concrete execution flow.
- `auto_regional_launch` chapters 5 and 6 (运营检核, 服务团队) are gated behind `bid_or_tender=true`. When false, collapse to `n/a`.
- `auto_regional_launch` Appendix A (评分对应) is gated behind `bid_or_tender=true` **and** `evaluation_rubric` non-empty.
- Program Blueprint Cards are **embedded inside Chapter 4 phases**, not a standalone section. Minimum one card per phase.
- Phase tables in Chapter 4 must include columns: 时间 / 动作 / 产出物 / 关键节点.
- Chapter 3 must echo `Core value`, `Marketing主线`, and `Strategy pillars` from `## Core Strategic Idea`.
- Chapter 2 must include audience persona, city localization insight, and market trend when research produced them.
- **Sales mechanism column rule (auto_regional_launch)**: If `bid_or_tender=true`, every row in the Offline Actions table must have a non-empty `销售机制` entry, or the row must be marked with `n/a` and justified. Online Actions rows are encouraged but not required to have sales mechanism entries.
- **Compact/Expanded rule (auto_regional_launch)**: Every chapter must have a Compact View (slide-ready, tables/bullets, ≤3-line paragraphs) and chapters 2–4 must have an Expanded View (full narrative depth). If a section has no Expanded content, mark `Expanded: n/a — compact sufficient`.
- **Platform differentiation rule**: Chapter 4 Expanded must include the 5-platform table (抖音/小红书/懂车帝/视频号/微博) with content style, key direction, and concrete title examples.
- **Derivation traceability rule**: Chapter 3 slogan and stage sub-themes must be traceable to `## Core Strategic Idea`'s `Slogan derivation logic` and `Stage sub-themes`.
- **Creative naming rule**: Every activity in Chapter 4 must have a creative, brand-sounding name. Generic names ("KOL seeding", "线下活动") are not allowed.
- **话题标签 rule**: Every online activity in Chapter 4 must have at least one concrete hashtag or topic tag example.
