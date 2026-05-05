# Proposal Architecture Playbook

This file is **not** a fixed template. It's an **architecture decision aid** — a library of narrative patterns, a list of must-cover information types, and a small set of universal mechanics. Each project picks the architecture that best serves its `intake` + `Spine` + `Lead Pool`. **AI is expected to act as a strategic planner, not a template-filler.**

> **Why this is not a template:**
> The previous version locked a 6-chapter structure. That made the workflow produce identical-looking proposals across briefs — a template-党 surface that procurement evaluators recognize and discount. Real strategic planners read each brief and design the deck shape. AI should do the same.

## The Two Layers of Decision

When entering Proposal Assembly, AI runs **two decision layers before** any chapter is written:

1. **Architecture Decision** — pick the narrative pattern, chapter count, chapter order.
2. **Voice Decision** — pick the tonality, slogan rhythm, visual key.

These two decisions are **explicit outputs** of the assembly phase (recorded at top of `{artifact_root}/04-proposal.md`), not implicit. Procurement evaluators reading the proposal should be able to feel "this team thought about how to tell *this* story" — not "this team has a template they fill in".

The output of these two decisions is then composed into chapters in **Layer 3 — Content Fill**.

## Information Types That Must Be Covered (across whatever architecture)

The architecture is free, but the **information must be there**. The list below is the universal coverage contract — a proposal failing to cover any of these is incomplete regardless of how creative the structure is. (Coverage, not chapter-count.)

| Info Type | What it answers | Common evidence sources |
|---|---|---|
| **任务理解** | 评审在赌什么？我们怎么定义成功？ | `intake.business_goal` + tender 课题原文 |
| **市场判断** | 这个赛道当下的真相是什么？数字 + 一句人话 | `ME-*`, `TR-*` |
| **竞争判断** | 主要对手在做什么？我们的空当在哪？ | `CL-*` |
| **客群洞察** | 谁会买？什么打动他们？什么让他们犹豫？ | `AU-*` |
| **区域 / 现场判断** | 这座城 / 这个场对故事意味着什么？ | `CS-*` + City Pack |
| **本品价值** | 为什么是我们？一句话能记住的差异 | `PV-*` |
| **核心策略** | 我们的总打法是什么？为什么这么打？ | Spine `core_tension` + main slogan |
| **节奏 / 时间线** | 谁先发声 / 谁来高潮 / 谁收尾？ | Strategy Plan + Hotspot Timeline |
| **具体动作** | 三个月内每周谁干什么？写到能签合同的颗粒度 | Lead Pool S/A/B leads — **S-tier 必须按 `## Hero Event Expansion Pattern` 五模块展开；A-tier 至少 4 子项；B-tier 包装方式 + 钩子** |
| **传播内容线索** | 实际要发的是什么？标题 / 脚本 / 帖子结构 | Lead Pool + 各阶段传播规划 — **每个主要传播阶段需 ≥5 条完整文章标题示例（成稿颗粒，非"关键词候选"），并附 ≥1 内容脚本骨架与 ≥3 圈层 KOL/KOC 类型分组** |
| **阶段总览** | 每个 stage 的"一页讲完一阶段"地图 | Strategy Plan + 每 stage 1 张 `## Stage MAP Pattern` 大表 |
| **本地落地** | 这案子在 `{target_city}` 怎么真的发生？ | City Pack + Strategy Plan grounding matrix |
| **终端销售机制** | 网点 / 4S 店 / 体验店现场怎么把意向转化成订单？ | Lead Pool + 销售促进设计 — **必含 ≥3 项具体工具**（如留资礼 / 抢购礼 / 预定礼 / 老带新 / 三人成团 / 店头直播 / 区域联动团购），每项含"对谁 + 给什么 + 触发条件 + 兑现节点"四要素；只写"销售转化组 N 人"组织架构、不写销售工具 = 视为未覆盖 |
| **保障 / 协作** | 谁协调？怎么开会？怎么反馈？ | 通用模板 + intake.client_master_calendar |
| **风险与应对** | 出问题了怎么办？预案是什么？ | intake.constraints + lead crazy_dose mitigations |
| **(可选) 团队 / 案例** | 招标要时才必备 | 外部资源 |
| **(招标必备) Rubric Surface** | 评审打分表的每个维度，本案在哪里回应？ | `{artifact_root}/00-rubric-binding.md` |

**评审任何一项「未覆盖」 = fail。但呈现方式自由。**

## A Library of Narrative Patterns (pick one — or compose a hybrid)

These are battle-tested patterns. Pick the one that best fits the `Spine` and the project. **Do not default to any single one.** Hybrids are encouraged.

### Pattern A · 经典招标六章式
评审最熟悉、最易扫读，但容易显得是套模板。
> 任务课题 → 市场洞察 → 营销策略 → 营销行动 → 运营保障 → 服务团队
- **何时用**：央国企标 / 大型集团标 / 评审有固定打分表 / 客户方风格保守。
- **何时别用**：客户方是新势力 / 互联网品牌 / 强调创新性的标。

### Pattern B · 起承转合 四章式
更富文学韵味，主线感强，但风险是评审找不到具体动作。
> 起（命题与背景）→ 承（市场与本品）→ 转（核心策略与主题）→ 合（落地与保障）
- **何时用**：客户方调性偏文化 / 文旅 / 高端美学品牌 / 主题驱动型 launch。
- **何时别用**：评审需要扫到具体打分维度时。

### Pattern C · 双轴并行
左右双线（如：上半叙事 / 下半数据；线上 / 线下；声量 / 转化），适合需要"双语"的标。
> 第一部分（叙事 / 创意 / 共鸣）+ 第二部分（数据 / 落地 / KPI）
- **何时用**：客户方既要"打动我"又要"说服我老板" / 营销总监 vs 财务总监并存。

### Pattern D · 倒叙（先说彩蛋）
开篇就给最强的一个 S 级事件 / 最大的一个 KPI 承诺，再回头讲为什么这么打。
> 引子（一个不可能的承诺 / 一个 hero event）→ 凭什么（市场+本品+客群）→ 怎么打（节奏 + 动作）→ 怎么保障
- **何时用**：客户方决策者注意力短 / 提案要在 3 分钟内抓住人 / 有压倒性 hero idea 时。

### Pattern E · 客群剧本式
以三个或更多真实客群"一天的剧本"为骨架，让产品价值自然显现。
> 三个剧本（每个客群一段戏）→ 共通点是什么（产品价值汇总）→ 我们怎么把这三场戏放进 launch（动作）
- **何时用**：客群洞察是这案子最强的弹药 / 产品功能多但需要场景化 / 慢综艺式风格。

### Pattern F · 一个隐喻贯穿
用一个主导隐喻（如"主场" / "归航" / "造一座桥" / "搬一次家" / "一封信"）作为全案隐藏骨架，每章都是这个隐喻的一面。
> 隐喻总章 → 隐喻的市场面 → 隐喻的策略面 → 隐喻的行动面 → 隐喻的兑现
- **何时用**：Spine 的 `core_tension` 与 `narrative_keywords` 自然指向一个强意象时 / 客户方品牌本身有诗性。

### Pattern G · 节奏先行
不分章节，按时间轴讲故事——上市前 8 周到上市后 4 周，每一周发生什么。
> Week -8 → ... → Week 0 → ... → Week +4
- **何时用**：launch_window 卡得很死 / 客户已问"这 12 周每周做什么"的颗粒度。

### Pattern H · 战役兵棋式
以"战役 (Campaign)"为骨架，每个战役是一个完整闭环（目标 / 战术 / 兵力 / 评估），3-5 个战役构成全案。
> 任务 → 战役 1 → 战役 2 → 战役 3 → ... → 协同 / 保障
- **何时用**：客户方有军事 / 央企 / 体育 等 hard-power 调性 / 喜欢战略术语。

### Pattern I · 你定义的新模式
若以上均不合身，AI 可设计一种新模式——但必须在 `{artifact_root}/04-proposal.md` 顶部写 100-200 字 **Architecture Rationale**，说明：
- 为什么本案不适合 A-H 中任何一种？
- 新模式的章节列表与每章的 information-coverage 映射？
- 这种结构能让评审在 5 分钟内读到哪些信息？

**所有 9 种模式都必须满足上方"Information Types"的覆盖契约。**

## Architecture Decision Procedure

When entering Proposal Assembly, AI follows this 4-step decision before composing any content:

1. **Read the brief signals**:
   - Is this a procurement tender (`bid_or_tender = true`)? → Pattern A is safer; B/D/F/H are higher-risk-higher-reward.
   - What's the brand tonality? Conservative central-SOE → A/H; lifestyle/cultural → B/E/F; tech-startup → C/D/G; family-themed → E/F.
   - Is there a hero idea (one explosive S-tier lead)? → Pattern D worth considering.
   - Is there a strong dominant metaphor in `Spine.narrative_keywords`? → Pattern F worth considering.
   - Does the timeline/calendar feel like the strongest spine? → Pattern G.
   - Does the audience analysis carry most evidence? → Pattern E.

2. **Compose 2-3 candidate architectures**, each with:
   - A name (one of A-I, or hybrid name).
   - Chapter list with one-line description per chapter.
   - Information-coverage map (which chapter covers which "Info Type" from the table above).
   - Risk note (which evaluator instinct does this architecture risk irritating?).

3. **Pick one (or commit to a hybrid)**. Record the rationale at the top of `{artifact_root}/04-proposal.md`:

```markdown
## Architecture Rationale (50-200 words)
- Pattern picked: {A | B | C | D | E | F | G | H | I-hybrid}
- Why this fits `intake` + `Spine` + `Lead Pool` for *this* brief: ...
- Information-coverage map: ...
- What this architecture sacrifices vs alternatives: ...
- One sentence to evaluators: ...
```

4. **Move to Voice Decision** (covered in `./proposal-style-guide.md`), then to Content Fill.

## Tier Depth Rules (universal — applies across all patterns)

| Tier | Write Style | Content depth |
|---|---|---|
| **S 级** | 完整方案（必走 `## Hero Event Expansion Pattern` 五模块） | 模块 A 场地与空间 + 模块 B 核心内容环节（≥3 子环节并列分解）+ 模块 C 现场集客动作 + 模块 D 传播配套阶段化（N-7 / N / N+3 三段）+ 模块 E 留资链路 + 预算 + KPI；markdown 行数 ≥150 / 等价 PPT 6-10 页颗粒 |
| **A 级** | 执行摘要（≥4 子项） | 形式 + 渠道 + 内容方向 + 传播标题示例 ≥3 条 + 预算 + KPI，附简要流程 |
| **B 级** | 包装方式 | 传播钩子 + 亮点 + 建议方向 + 预算区间 + 供应商类型 |

Activity slot count per "stage" (or pattern equivalent):
- A stage / battle / week / chapter that hosts ≥1 S-tier event must also have ≥1 A or B for breathing room.
- No two S-tier events compete in the same stage / battle / week.
- **每个 stage 末尾必须有 1 张 `## Stage MAP Pattern` 大表**作为"一页讲完一阶段"的总览图。

## Hero Event Expansion Pattern

每一个 **S 级 hero event**（无论它属于哪个 stage / battle / week）必须按下方五模块展开。骨架是结构契约，**填入的内容自由**——不抄任何品牌 / 城市 / 节日 / 活动名。任一模块缺位即视为 hero 展开不足，触发 Q37 fail 并回 Step 4.5 Hero Expansion Pass。

> **判别口径**：单个 S 级活动在 `{artifact_root}/04-proposal.md` 中的 markdown 行数应 ≥150 行（中位 200 行，等价 PPT 6-10 页颗粒）。30-60 行的 bullet 段落 = template-党 surface，必 fail。

### 模块 A · 场地与空间

- **候选场地 ≥2**：每个候选场地写出名称 + **3-5 行推荐理由**（为什么是这里、人流 / 调性 / 道路 / 成本如何契合）；
- **空间分区 / LAYOUT 描述**：把整个活动空间按区域拆解（如：迎宾区 / 主题展车区 / 互动展车区 / 交付区 / 冷餐区 / 主舞台 / 对话区 ……），每个区一句"做什么 + 给谁看"；
- **视觉关键词**：3-6 个词，告诉设计师这场活动的色 / 字 / 镜头 / 风格基调（与 Voice Decision 的 visual key 对齐但更聚焦本场）。

### 模块 B · 核心内容环节（必走"赛道 / 篇章 / Step / Part"分解法之一）

把 hero event 的内容拆成 **3-6 个并列子环节**，四种分解法任选其一：

- **赛道法**（适合内容生产 / UGC 大赛 / 多角度种草）：3-4 个赛道（如"家庭 / 科技 / 安全"或"汽车 / 旅行 / 亲子 / 科技"），每赛道含名称 + 内容方向 + 想被记住的画面；
- **篇章法**（适合发布会 / 仪式型 hero / 多幕戏剧结构）：3-4 个篇章（如"篇章一 全尺寸空间·团圆秀 / 篇章二 华为智驾·生活秀 / 篇章三 武汉意境·时光秀"），每篇章含名称 + 展示形式 + 升华到主题的方式；
- **Step 法**（适合多触点 / 接待型 / 时间线驱动的活动，如媒体试乘、私享会、轻量化邀约体验）：3-5 个 Step（如"Step 1 接嘉宾上车 / Step 2 车内对话 / Step 3 路上互动 / Step 4 沉浸体验场 / Step 5 私域沉淀"），每 Step 含名称 + 时段（开场 / 路上 / 到站 / 离场） + 体验设计 + 想被记住的画面；
- **Part 法**（适合多流程线下体验 / 长时间活动）：3-6 个 Part（如"Part 1 穿越生活 / Part 2 放飞自在 / Part 3 品味奕境 / Part 4 山野厨房 / Part 5 装载空间 / Part 6 星空派对"），每 Part 含名称 + 玩法 + 互动机制。

每个子环节都要交代："**叫什么 + 怎么玩 + 想让评审 / 用户记住的那一幕画面**"。

> **全案分解法多样性硬约束**：当全案 S 级 hero events ≥3 个时，**必须使用 ≥2 种不同分解法**交错（如 1 个 hero 用篇章法 + 1 个用赛道法 + 1 个用 Step / Part 法），不允许 3 个 hero 全部使用同一分解法。监测口径：若所有 S 级 hero 的模块 B 全部用赛道（或全部用篇章 / 全部用 Part / 全部用 Step） = 视为执行单调，触发 Q37 升级版 fail，回 Step 4.5 把至少 1 个 hero 改造为另一种分解法。<br>**为什么这条存在**：参考"丰盈范本"的 hero event 通常交错使用 篇章 / 赛道 / Step / Part 四种骨架，不同 hero 看起来不一样；千篇一律的"模块 A-E + 同一分解法"会让评审感受"模板生成味"。

### 模块 C · 现场集客动作

- **客流入口动作**：如何从场外把人引进来（异业合作 / 商圈引流 / 邀请函 / 票务联动）— ≥1 件具体动作；
- **互动留资动作**：如何在场内把意向变成线索（打卡集章 / 3D 打印 / 空间挑战赛 / 智驾试驾 / 扫码留资）— ≥1 件具体动作；
- **异业 / 圈层联动**：如何放大触达半径（与 N+ 商户 / 圈层组织 / 媒体平台联动）— ≥1 件具体动作；

三件套至少落到 **2 件具体动作**（含奖品 / 路线 / 道具 / 礼品颗粒）。

### 模块 D · 传播配套阶段化（N-7 / N / N+3）

围绕 hero event 落地日（N），强制三阶段展开：

- **N-7（预热）**：内容方向 + ≥3 条文章标题示例 + 渠道矩阵（哪些平台 / 哪类账号 / 投放 vs 自然流）；
- **N（当天）**：现场直播 / 达人现场视频 / 价格 / 政策释放等当天动作 + ≥3 条文章标题示例 + 渠道矩阵；
- **N+3（续热）**：口碑维系 / 多角度回顾 / KOC 跟拍 + ≥3 条文章标题示例 + 渠道矩阵。

> **文章标题示例**必须是**成稿颗粒**——形如《二孩家庭换车记：从开两辆车到一台 X，终于实现全家出行自由》，不是"换车 + 二孩 + 全家出行"这种关键词堆叠。

### 模块 E · 留资链路 + 预算 + KPI

- **留资到转化的链路**：用户从看到→到场→留资→试驾→下定的每一步触点（≥4 步）；
- **预算区间**：S 级仅给区间，含创意制作 / 场地 / 媒介 / 礼品 / 运营 五大块的相对占比；
- **KPI**：曝光 / 互动 / 留资 / 试驾 / 转化五维度，每维度 1 个具体数字目标。

### Hero Expansion 自检清单

写完 hero event 后，AI 必须当场自查：

```markdown
- [ ] 模块 A 候选场地 ≥2 + 推荐理由 + 空间分区 + 视觉关键词
- [ ] 模块 B 子环节 ≥3 (赛道 / 篇章 / Step / Part 四选一)，每个含名称+玩法+画面
- [ ] 模块 C 客流 / 留资 / 异业 三件套至少落 2 件具体动作
- [ ] 模块 D N-7 / N / N+3 三段，每段 ≥3 条成稿标题示例 + 渠道矩阵
- [ ] 模块 E 留资链路 ≥4 步 + 预算区间 + KPI 五维度
- [ ] markdown 行数 ≥150
- [ ] **全案多样性自查**：本 hero 的分解法（赛道 / 篇章 / Step / Part）与其他 S 级 hero ≥1 个不同（当全案 S 级 ≥3 个时强制）
```

任何一项未打勾即视为 hero 未展开，触发 Q37 fail。

## Stage MAP Pattern

每个 **stage / battle / week chunk**（视所选 architecture 而定）末尾必须落 1 张"一页讲完一阶段"的 MAP 总览大表。这是给评审 5 秒读懂一阶段全貌的浓缩页。

### MAP 列结构（最少 6 列）

| 列名 | 内容要求 |
|---|---|
| **节奏目标** | 这一阶段的情绪迁移目标 + intensity 数字（与 Strategy Plan Energy Curve 对齐） |
| **区域动作** | 区域级线下动作（包场 / 圈层私享 / 大型活动 / 路演）— 1-3 项 |
| **终端动作** | 4S 店 / 体验店 / 商圈触点的销售促进动作（预售品鉴 / 留资礼 / 三人团 / 老带新）— 1-3 项 |
| **传播动作** | 主要传播事件（话题 / KOL / 地标 / 直播 / 公关）— 1-3 项 |
| **传播内容示意** | 这一阶段的内容主轴（一句话） + 1-2 条代表性文章标题（指向 Hero Expansion 模块 D） |
| **传播渠道矩阵** | 主用平台 + 主用账号类型（如：微博官号 / 抖音同城 / 小红书 KOC / 视频号 / 户外大屏 / 朋友圈定向） |

### MAP 样表（结构契约，内容自由）

```markdown
| 节奏 | 区域动作 | 终端动作 | 传播动作 | 传播内容示意 | 传播渠道 |
|---|---|---|---|---|---|
| <stage 名> · 情绪迁移 · intensity X | ① …… ② …… | ① …… ② …… | ① …… ② …… ③ …… | 主轴："……"；标题示例：《……》 | 抖音同城 / 微博 / 小红书 KOC / 视频号 / …… |
```

### Stage MAP 自检清单

```markdown
- [ ] 每个 stage / battle / week chunk 都有 1 张 MAP（不多不少 1 张，不与活动详写表混用）
- [ ] 列结构含至少 6 列（节奏 / 区域 / 终端 / 传播动作 / 内容示意 / 渠道）
- [ ] "传播内容示意" 列引用至少 1 条来自该 stage hero event 模块 D 的成稿标题
- [ ] MAP 表上方或下方有 1 句这一阶段的"主轴 / 总打法"概括（≤30 字）
```

任何一 stage 缺 MAP 即视为 Stage MAP 缺位，触发 Q38 fail。

## Budget Presentation Rules

- S 级：Budget range + creative value note. No penny-precision.
- A 级：Brief budget.
- B 级：Budget range only, or aggregate in total table.
- Apply fuzzing / downplaying / overflow for hot ideas.

## Budget Roll-up Table（全案预算分配总表）

每份 `{artifact_root}/04-proposal.md` 必须有 1 张全案预算分配总表（不分活动，按职能切），通常落在"运营保障"或全案末尾："分活动预算"加总应能合到这张总盘上。

### 必填六大职能切分（占比和=100%）

| 职能 | 内容 | 占比区间参考 |
|---|---|---|
| 创意制作 | slogan / KV / 短视频 / 物料设计 / 海报 | 10-25% |
| 场地与执行 | 活动场地租赁 / 搭建 / 人员 / 物流 | 25-40% |
| 媒介投放 | 线上信息流 / 户外 OOH / 公关稿件 / 直播 | 20-35% |
| 礼品与权益 | 用户激励 / 异业券 / 留资礼 / 抢购礼 | 5-15% |
| KOL/KOC 内容 | KOL 创作费 / 平台分成 / KOC 招募 | 10-25% |
| 运营与机动 | 项目人员 / 应急预留 / 风险预算 | 5-15% |

### 与分活动预算的对账规则

- 每个 S 级活动模块 E 的预算区间需在结尾标注"主要落在哪几大职能"（如"主落场地+礼品+KOL"），便于回溯到总盘；
- 总盘中的"创意制作 / 媒介投放"两块通常不挂在单一活动下——属于全案级支出，单独列；
- 若分活动预算之和 ÷ 总盘 > 110% 或 < 70%，视为对账不齐，需重新核对。

### 自检口径

- 缺总表 = `04-proposal.md` 不完整，触发 Coverage Audit fail（终端销售机制 + 全案预算总表都属"具体动作"延展），需补回；
- 总表只列总数不列六大切分 = 不合规，必须按职能切；
- 占比和不等于 100% = 数学错误，重算。

## Citation Discipline (universal)

- Every core claim cites Atomic Resource ID (`PV-*` / `ME-*` / `CL-*` / `AU-*` / `CS-*` / `TR-*` / `HS-*`).
- Every activity cites at least one Lead `L00X` and (when from divergent generation) `RI-*` + `D-XX-N`.
- `packaging_pass: reworked` Leads must surface their `rework_note` strategy in the activity intro, not buried.

## Narrative Consistency Rule

Every activity opens with one sentence linking it to:
1. The chosen **architecture's main spine** (whatever its specific framing).
2. The **Narrative Spine transition** it serves.
3. The **target emotional state** for that part of the proposal.

Isolated activities are prohibited.

## Rubric Surface Rule (when `intake.bid_or_tender = true`)

Each tender dimension in `{artifact_root}/00-rubric-binding.md` must be **explicitly surfaced** somewhere. Where it surfaces depends on the architecture chosen. Append a `## Rubric-Surface Map` block at proposal end:

```markdown
| Tender Dim | Surface Location | Why this part fulfills it |
|---|---|---|
| 创新性 | <chapter / battle / week / pattern element> | <one-line evidence> |
| ... | ... | ... |
```

If a dimension has no surface, return to the chapter / battle / week / element that owns the relevant evidence and fix.

## Examples — three sample architectures (illustrative; do not reuse verbatim)

> These are **examples** of how a planner might think — not menu items. Re-do for each brief.

### Example 1 — A central-SOE family SUV launch (might pick Pattern A or A+F hybrid)
> **Pattern**: A 六章 + Pattern F 一个隐喻 ("主场" 贯穿)
> **Why**: 央企标 → A 章节顺序让评审打分表对得齐；Spine `narrative_keywords` 全在"家"附近 → F 隐喻天然成立。
> **Sacrificed**: 失去倒叙的爆发感；没有 D 模式的 hero-first hook。
> **Surface to evaluators**: "这是一份评审能扫得到分、但又不只是六章的方案。"

### Example 2 — A tech-startup EV launch in Shanghai (might pick Pattern D or D+C hybrid)
> **Pattern**: D 倒叙 + 后半 C 双轴
> **Why**: 客户方互联网调性 / 一个压倒性 hero event（如"魔都首日万人通勤实测"）→ D 引子先放彩蛋；后半两轴并行讲叙事/数据让 CMO 与 CFO 各取所需。
> **Sacrificed**: 老派评审可能感到结构"不像招标方案"；需要更强的开篇控场。
> **Surface to evaluators**: "我们打从一开始就在打。"

### Example 3 — A cultural-tourism fashion brand launch in Chengdu (might pick Pattern F or B+F)
> **Pattern**: B 起承转合 + Pattern F 隐喻 ("一程慢生活" 贯穿)
> **Why**: 慢生活城市 + 文旅时装 → 文学骨架。Spine 的核心张力天然指向"快/慢"。
> **Sacrificed**: 章节看不到"营销策略"四个字 → 需要在合（落地）章节明确讲打分维度。
> **Surface to evaluators**: "这案子的策略本身就是一种生活方式。"

The point of these three: same workflow, three radically different shapes. **AI must produce the equivalent of these examples — not copy them.**
