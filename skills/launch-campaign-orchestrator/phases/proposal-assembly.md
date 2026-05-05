# Phase: Proposal Assembly

## Purpose

Compose the upstream-built leads into a deliverable proposal. **AI runs as a strategic planner, not a template-filler.** This phase produces three explicit decisions before any chapter is written:

1. **Architecture Decision** — pick a narrative pattern from `./shared/proposal-template.md` (or design a new one).
2. **Voice Decision** — codify tonality / slogan rhythm / visual key per `./shared/proposal-style-guide.md`.
3. **Content Fill** — compose the chosen architecture's chapters with the chosen voice, drawing from upstream artifacts.

> **Why this is no longer a fixed 13-step recipe:**
> The previous version locked AI into a 6-chapter form + 12 surface mechanics. That produced template-党 surface output. The new SOP keeps the rigor (information must be covered; rubric must be surfaced; citations must be cited) but **delegates form to AI's judgment per brief**.

## Required Reads

- `./phases/strategy-plan.md` (artifact: `{artifact_root}/03-strategy-plan.md`)
- `./phases/lead-pool.md` (artifact: `{artifact_root}/02-lead-pool.md`)
- `./phases/hotspot-harvest.md` (artifact: `{artifact_root}/01h-hotspot-harvest.md` for `## City Pack` and HS-* lineage)
- `./phases/insight.md` (artifacts: `{artifact_root}/01a-product-value.md` … `{artifact_root}/01f-trend-signal.md` for atomic resources)
- `./phases/narrative-spine.md` (artifact: `{artifact_root}/01g-narrative-spine.md` for main narrative + transitions)
- `./shared/brief-intake-template.md` (resolves all `{...}` placeholders)
- `./shared/proposal-template.md` ← **Architecture Playbook**
- `./shared/proposal-style-guide.md` ← **Voice & Taste**
- `./shared/scoring-rubric-binding.md` + `{artifact_root}/00-rubric-binding.md` (when bid_or_tender)
- `./shared/quality-self-check.md`

## Action

### Step 0 — Resolve Variables

Resolve all `{brand}` / `{brand_endorser}` / `{product}` / `{category}` / `{target_city}` / `{target_audience}` / `{launch_window}` / `{competitor_set}` / `{tier_1_label}`–`{tier_3_label}` from intake. Record at top of `{artifact_root}/04-proposal.md` as a `## Variables Resolved` block.

If any variable is missing → return to Phase: Intake.

### Step 1 — Architecture Decision (must produce 2-3 candidates)

Read `./shared/proposal-template.md` (Architecture Playbook). Generate **2-3 candidate architectures** for *this* brief, each with:

- **Pattern label** (one of A-H, or hybrid like "B+F", or fully custom "I").
- **Chapter / battle / week list** with one-line description per element.
- **Information-coverage map** showing which element covers which "Info Type" from the playbook's Coverage Contract.
- **Risk note** (which evaluator instinct does this risk irritating?).

Then **pick one** based on:
- intake.bid_or_tender (true → safer side; false → freer)
- intake.brand_tonality_anchors (conservative → A/H; lifestyle → B/E/F; tech → C/D/G)
- Lead Pool S-tier (one big hero idea → D worth considering; multiple hero ideas → A/H)
- Spine.narrative_keywords (strong dominant metaphor → F)
- Whether timeline is the strongest spine → G

Record at top of `{artifact_root}/04-proposal.md`:

```markdown
## Architecture Rationale (50-200 words)
- Candidates considered: [pattern_1, pattern_2, pattern_3]
- Pattern picked: <one of A | B | C | D | E | F | G | H | I-hybrid-name>
- Why this fits *this* brief's intake + Spine + Lead Pool: ...
- Information-coverage map: ...
- What this architecture sacrifices vs alternatives: ...
- One sentence to evaluators: "..."
```

### Step 2 — Voice Decision

Read `./shared/proposal-style-guide.md`. Make a Voice Decision and record it:

```markdown
## Voice Decision (50-150 words)
- Tone: <端着 / 不端着 / 文学 / 数据派 / 接地气 / 反差幽默 / ...>
- Slogan rhythm: <几字几段 / 押韵 vs 不押 / 一句 vs 三段式 / ...>
- Dominant metaphor or center claim: "..."
- Visual key (告诉设计师): <2-3 sentences: 色 + 字 + 镜头感 + 风格关键词>
- What this voice is NOT: <反向定义>
- Surface mechanics picked from style-guide menu: [4-7 items, with one-line "why each fits this voice"]
```

**Rule of thumb:** Pick **4-7** surface mechanics from the Style Guide's 12-item menu — fewer than 4 = under-produced; more than 8 = template-党.

### Step 3 — Compose 目录 (Table of Contents) per Chosen Architecture

Output the chapter / battle / week / element list from Step 1's pattern. **Do NOT default to "01 任务课题 → 02 市场洞察 → 03 营销策略 → 04 营销行动 → 05 运营保障 → 06 服务团队"** unless that's what Step 1 explicitly chose.

### Step 4 — Compose Each Element (Chapter / Battle / Week / Sub-Pattern)

For each element in the chosen architecture:

1. **Open with a chapter cover or rhythm-marker** (form per Voice Decision; not always 章扉页 + 黑底 — depends on tone picked).
2. **Cover the assigned Info Types** (from Step 1's coverage map).
3. **Pull leads from Lead Pool** that belong to this element. Each lead activity opens with one sentence linking it to:
   - Architecture's main spine (whatever its specific framing in Step 1)
   - Narrative Spine transition served
   - Target emotional state for this part
4. **Tier-aware depth** — 严格对接 `./shared/proposal-template.md` 的 `## Tier Depth Rules` 与新增的 `## Hero Event Expansion Pattern` / `## Stage MAP Pattern`：
   - **S 级** → **必走 Hero Event Expansion Pattern 五模块**（A 场地与空间 / B 核心内容环节 ≥3 子环节并列分解 / C 现场集客 / D 传播配套阶段化 N-7 / N / N+3 / E 留资 + 预算 + KPI），单个 hero markdown ≥150 行；
   - **A 级** → 执行摘要 ≥4 子项（形式 + 渠道 + 内容方向 + 标题示例 ≥3 条 + 预算 + KPI）；
   - **B 级** → 包装方式（钩子 + 亮点 + 方向 + 预算区间）；
   - **每个 stage / battle / week chunk 末尾**额外落 1 张 `## Stage MAP Pattern` 6 列大表。
5. **Cite atomic resources** for every core claim (`PV-*` / `ME-*` / `CL-*` / `AU-*` / `CS-*` / `TR-*` / `HS-*`).
6. **Cite Lead IDs + RawIdea IDs** for activities (`L00X` + `RI-*` + `D-XX-N` if from divergence).
7. **`packaging_pass: reworked` Leads** must surface `rework_note` strategy in the activity intro, not buried.

### Step 4.5 — Hero Event Expansion Pass (mandatory for every S-tier lead)

After all elements are drafted in Step 4, walk through **every S-tier lead** and verify it has been expanded per `./shared/proposal-template.md` 的 `## Hero Event Expansion Pattern` 五模块。对每个 S 级 lead 落地后，**必须当场出一份自检清单**：

```markdown
#### Hero Expansion Self-Check · <lead_id> <lead_name>
- [ ] 模块 A 场地与空间：候选场地 ≥2 (含名称 + 推荐理由) + 空间分区 / LAYOUT + 视觉关键词
- [ ] 模块 B 核心内容环节：≥3 子环节 (赛道 / 篇章 / Part 三选一)，每个含名称 + 玩法 + 想被记住的画面
- [ ] 模块 C 现场集客：客流入口 / 互动留资 / 异业联动 三件套至少落 2 件具体动作
- [ ] 模块 D 传播配套阶段化：N-7 / N / N+3 三段，每段 ≥3 条**成稿颗粒**文章标题示例 + 渠道矩阵
- [ ] 模块 E 留资 + 预算 + KPI：留资链路 ≥4 步 + 预算区间（5 大块占比）+ KPI 五维度（曝光 / 互动 / 留资 / 试驾 / 转化）
- [ ] markdown 行数 ≥150
```

任一项未打勾 → **当场原地补到位**，不允许跳过进入 Step 5。整段补完之前不得离开本 lead。

模块 D 标题示例的口径必须是**完整成稿**（如《二孩家庭换车记：从开两辆车到一台 X，终于实现全家出行自由》），**不允许用关键词候选 / 短句 / 话题片段**充数。如发现是关键词级颗粒 → 重写。

### Step 4.6 — Stage MAP Pass (mandatory for every stage / battle / week chunk)

针对当前所选 architecture 中的每一个 **stage / battle / week chunk**（按 Step 1 确定的 element list），在该 chunk 末尾追加 1 张 `## Stage MAP Pattern` 6 列大表：

| 节奏目标 | 区域动作 | 终端动作 | 传播动作 | 传播内容示意 | 传播渠道矩阵 |
|---|---|---|---|---|---|

要求：

- "节奏目标" 列引用 Strategy Plan Energy Curve 的 intensity 与情绪迁移；
- "区域动作 / 终端动作 / 传播动作" 三列每列 1-3 项具体动作；
- "传播内容示意" 列必须**引用至少 1 条该 stage 内 hero event 的模块 D 成稿标题**（不许另外编造）；
- "传播渠道矩阵" 列写主用平台 + 主用账号类型；
- MAP 表上方或下方有 ≤30 字的"主轴 / 总打法"概括。

> **判别口径**：每个 stage 不多不少 1 张 MAP，与活动详写表分离。缺一张即视为 Q38 fail，必须当场补回。

战役兵棋式（Pattern H）已自带战役框架时，"battle" 即视为 stage chunk，每个 battle 末尾仍需 1 张 MAP，但可与 battle 章末小结合并呈现。

### Step 4.7 — Voice & Local Saturation Pass（mandatory before Step 5）

写完所有元素 + Step 4.5 hero expansion + Step 4.6 stage MAP 之后，整案进入"收口审计"——把 r3 翻车主因（隐喻只挂 slogan / 本地色彩单薄 / 行文碎裂 / hero 分解单调 / mechanic 勾了不兑现 / 销售机制空白 / 自检泄漏）一网打尽。这一步必须**全部 pass** 才能进入 Step 5 Coverage Audit。

#### 七项收口检查（按顺序执行）

##### 7-1 隐喻下渗自检（对应 Q43）

读 Voice Decision 中的 `Dominant metaphor or center claim`。该隐喻必须出现在以下三处中**至少两处**：

- [ ] 主 slogan / 中心句 — 隐喻字面或语感出现
- [ ] 每个 stage / battle / week 的命名 — 不允许整案 stage 名仍是"悬念期 / 揭秘期 / 上市期 / 延续期 / 长尾期"通用语
- [ ] ≥2 个 S 级 hero event 命名或子环节命名 — hero / 子环节带隐喻字面或意象延伸

不通过 → 回 Step 4 改 stage 名 / hero 名做变奏。

##### 7-2 本地饱和自检（对应 Q37 升级版）

walk 每个 S 级 hero 的模块 A：

- [ ] 该 hero 模块 A cite ≥2 个 G 类具体地名（直接引用 City Pack）
- [ ] 该 hero 模块 A cite ≥1 个 cultural_hook（City Pack 中的本地文化梗）
- [ ] 该 hero 模块 A 至少在某段引用 1 处 geo_pattern_insight 的格局意象

任一未达 → 回 Step 4.5 把模块 A 改写到包含格局 + 地名 + 文化梗三件齐。

##### 7-3 分解法多样性自检（对应 Q37）

清点全案 S 级 hero events 使用的分解法（赛道 / 篇章 / Step / Part 之一）：

- [ ] 当全案 S 级 hero ≥3 个时，使用了 ≥2 种不同分解法
- [ ] 不存在"3 个 hero 全用同一分解法"

不通过 → 回 Step 4.5 把至少 1 个 hero 改造为另一种分解法。

##### 7-4 Surface Mechanic 兑现自检（对应 Q44）

打开 Voice Decision 的 surface mechanic 列表，逐条核对：

- [ ] 双层页眉：勾了 → 章节标题真两层 ✅ / 未勾 ☐ / 勾了未兑现 ❌
- [ ] 章扉页大开大合：勾了 → 每章独立扉页段落 ✅
- [ ] 八字双段主标语：勾了 → slogan 真为 8×2 字数对仗 ✅
- [ ] 三段式核心策略：勾了 → 核心策略章真分 3 段 ✅
- [ ] MAP 总览大表：勾了 → 至少 1 张 3×N 大表 ✅
- [ ] 客群三档分类：勾了 → 客群章真切 3 档 ✅
- [ ] SWOT 四象限：勾了 → 真出现 2×2 SWOT ✅
- [ ] 痛点-卖点对应表：勾了 → 真出现 2 列对应表 ✅
- [ ] 传播标题清单：勾了 → 每主要阶段 ≥5 条成稿标题 ✅
- [ ] 视觉注解 [VISUAL: ...] 块：勾了 → ≥3 处 [VISUAL: ...] ✅
- [ ] 阶段四要素卡 / Hero 多页展开：勾了 → S 级活动按四 / 五要素展开 ✅
- [ ] 章末小结 / 营销回顾：勾了 → 章末或全案末有专门小结 ✅

任一"勾了未兑现" → 回 Step 2 重选 mechanic（删掉勾选）或回 Step 4 改写正文。

##### 7-5 中文流畅自检（对应 Q42 / Quality 9）

按 `proposal-style-guide.md` Quality 9 三类语病清单做：

- [ ] 短语重复粘连扫描（≤10 字窗口同字 / 同词重复）：≤2 处通过
- [ ] 句子主谓错位 / 并列残缺扫描：≤2 处通过
- [ ] 碎裂语义扫描（无法 1 句话复述其意思的长句）：≤2 处通过

≥3 处任一类语病 → 回 Step 4 当段重写。

##### 7-6 终端销售机制覆盖自检（对应 Q40）

- [ ] 04-proposal.md 中存在专门段落（保障章 / 销售促进章 / 或 Stage MAP 终端动作列扩展）覆盖"终端销售机制"信息类型
- [ ] 含 ≥3 项具体销售工具（如留资礼 / 抢购礼 / 预定礼 / 老带新 / 三人成团 / 店头直播 / 区域联动团购）
- [ ] 每项含"对谁 + 给什么 + 触发条件 + 兑现节点"四要素

不通过 → 回 Step 4 在保障章节或 Stage MAP 终端动作列扩写。

##### 7-7 自检洁净自检（对应 Q41）

- [ ] 04-proposal.md 内不残留 `## Coverage Map`、`## Voice Audit`、`## Architecture Originality Audit`、`Hero Expansion Self-Check`、`Stage MAP Self-Check`、`Mechanic Fulfillment Check`、`Voice & Local Saturation Pass` 等区块标题
- [ ] 04a-self-audit.md 已独立创建并包含上述全部自检产物
- [ ] 唯一例外：`## Rubric-Surface Map`（招标场景）保留在 04-proposal.md 末尾

不通过 → 把残留自检区块从 04-proposal.md 剪到 04a-self-audit.md。

#### Step 4.7 输出（写入 04a-self-audit.md 第 7 节）

```markdown
## 7. Voice & Local Saturation Pass

| 检查项 | Pass / Fail | 备注 |
|---|---|---|
| 7-1 隐喻下渗 | pass / fail | metaphor "..." 在 stage 名 / hero 名出现 ≥2 处变奏 |
| 7-2 本地饱和 | pass / fail | 每个 S 级 hero 模块 A cite ≥2 G + ≥1 hook + ≥1 格局意象 |
| 7-3 分解法多样 | pass / fail | hero 用了 X 种分解法 |
| 7-4 Mechanic 兑现 | pass / fail | Voice Decision 勾选 N 项 / 兑现 N 项 |
| 7-5 中文流畅 | pass / fail | 三类语病各扫描，≤2 处通过 |
| 7-6 终端销售机制覆盖 | pass / fail | 含 ≥3 销售工具，每项四要素齐 |
| 7-7 自检洁净 | pass / fail | 04-proposal.md 内仅留 Rubric-Surface Map（招标时）|
```

任一项 fail → 回对应 Step 修正后再次执行 Step 4.7，直至七项全 pass 才能进入 Step 5。

### Step 5 — Coverage Audit (Universal — applies to any architecture)

Walk the **Information Types Coverage Contract** in `./shared/proposal-template.md`. For each row in that contract:

- Find which element of *this* proposal covers it.
- If a row has no covering element → **return to Step 4** and either expand an existing element or insert a new one.

Output a `## Coverage Map` block at proposal end:

```markdown
| Info Type | Covered In | Evidence cited |
|---|---|---|
| 任务理解 | <element> | intake.business_goal + ... |
| 市场判断 | <element> | ME-001, TR-002, ... |
| ... | ... | ... |
```

### Step 6 — Citation Audit

For each element:
- Every core claim cites Atomic Resource ID.
- Every activity cites at least one Lead `L00X` and (when from divergence) `RI-*` + `D-XX-N`.
- All `packaging_pass: reworked` Leads have surfaced `rework_note`.

If gaps → return to Phase: Insight or Lead Pool.

### Step 7 — Rubric Surface Audit (when bid_or_tender)

Open `{artifact_root}/00-rubric-binding.md`. For each tender dimension:
- Locate the element (chapter / battle / week / pattern element) that surfaces it.
- If a dimension has no surface, return to the element that owns the relevant evidence and fix.

Append a `## Rubric-Surface Map` block at proposal end:

```markdown
| Tender Dim | Surface Location | Why this part fulfills it |
|---|---|---|
| 创新性 | <element> | <one-line evidence> |
| ... | ... | ... |
```

### Step 8 — Voice & Taste Audit

Walk the **Eight Qualities** in `./shared/proposal-style-guide.md`. For each Quality, give a one-line self-assessment:

```markdown
## Voice Audit (self-check)
- Q1 人话洞察: pass / fail-with-fix-plan ...
- Q2 痛点闭环: ...
- ... (Q3-Q8)
```

Any `fail` → return to relevant element and rewrite.

### Step 9 — Architecture Originality Audit

A specific check to prevent **template-党 fail-modes**:

- Does this proposal's element list match (by ≥80%) any historic / public reference deck's chapter list, in the same order? → If yes, return to Step 1 and re-pick a different pattern (or hybridize).
- Does the main slogan / 三段式 / hero event name match any well-known competitor / historic deck verbatim? → return to relevant element and re-derive from Spine.
- Are the surface mechanics from Voice Decision (Step 2) used in 6+ places when only 4-7 were promised? → return to Step 4 and prune.

### Step 10 — Visual Annotation Pass (selective)

For each **关键页** (architecture cover, hero pages, MAP-style overviews if used, S-tier activity main visuals), append a `[VISUAL: ...]` annotation block:

```
[VISUAL: <场景描述>; <镜头/构图>; <色调>; <风格关键词>]
```

Don't annotate every page — only those where the visual is intentional and load-bearing.

### Step 11 — Run Review Pass

Run `./shared/quality-self-check.md` checklist. Each item must pass. Failures route per the cheatsheet at the bottom of that file.

## Review Pass Failure Routing (architecture-aware)

| Symptom | Route |
|---|---|
| Narrative drift | Strategy Plan — realign lead map |
| Redundancy | Lead Pool — compress or archive duplicates |
| Peak collision | Strategy Plan — redistribute S-tier events |
| White space missing | Strategy Plan — redesign energy curve |
| Creative density too high | Proposal Assembly Step 4 — compress element content |
| Insight support weak | Insight — add missing resources |
| Superficial hotspot / missing angle bridge | Lead Pool — strengthen `angle_of_entry`/`spine_bridge` |
| **Info Type uncovered** (Coverage Audit fail) | Step 4 — expand/insert element |
| **Rubric Dim un-surfaced** | Step 7 — return to evidence-owning element |
| **Voice Quality fail** (e.g., 人话洞察 missing, 痛点未闭环, 节奏全程平峰, 主张不可记, 端着) | Step 8 — return to relevant element and rewrite |
| **Architecture matches reference deck ≥80%** | Step 1 — re-pick or hybridize |
| **Slogan / 三段式 verbatim from external** | Step 4 — re-derive from Spine |
| **Surface mechanics > 8 (template-党)** | Step 2/Step 4 — prune to 4-7 |
| **Activities only show "logo 露出 + KOL 投放"** (Quality 3 fail) | Lead Pool — rewrite crazy_dose / safe_dose; Step 4 — expand specifics |
| **Architecture rationale missing or thin** | Step 1 — re-do candidate generation |
| **S 级活动展开不足 5 模块或 < 150 行**（Q37 fail） | Step 4.5 Hero Expansion Pass — 当场补全 5 模块 |
| **Stage 缺 MAP 总览**（Q38 fail） | Step 4.6 Stage MAP Pass — 为缺失 stage 补 MAP |
| **传播标题只是关键词候选 / 短句**（Quality 3 升级版 fail） | Step 4 模块 D — 重写为成稿颗粒《……记：从…到…》 |
| **跨产物 ID 漂移（L-XXX 命名不一致）**（Q39 fail） | Step 4.7 / lead-pool — 全案统一命名后跨文件替换 |
| **终端销售机制空白 / 仅写组织架构无具体工具**（Q40 fail） | Step 4 — 在保障章或 Stage MAP 终端动作列补 ≥3 销售工具 |
| **Self-Audit 区块泄漏到 04-proposal.md**（Q41 fail） | Step 5-9 输出位置 — 把所有自检区块剪到 04a-self-audit.md |
| **碎裂语病 ≥3 处（双段双段 / 在北晚高堵 / 最不硬的车）**（Q42 fail） | Step 4.7 / Step 4 — 按 Quality 9 三类清单当段重写 |
| **隐喻只挂 slogan、stage 名 / hero 名仍通用语**（Q43 fail） | Step 4.7 / Step 4 — 改 stage / hero 命名做隐喻变奏 |
| **Voice Decision 勾选机制未兑现 / 形式不符**（Q44 fail） | Step 4.7 / Step 2 — 删掉未兑现勾选或改写正文符合 |
| **缺全案预算分配总表**（Q45 fail） | Step 4 末尾 — 补 6 大职能占比表 |
| **本地饱和不足 / hero 模块 A 无 G 类地名 + cultural hook**（Q37 升级版 fail） | Step 4.7 / Step 4.5 — 把模块 A 改写到含格局 + 地名 + 文化梗三件齐 |
| **全案 S 级 hero ≥3 但分解法单一**（Q37 升级版 fail） | Step 4.7 / Step 4.5 — 至少 1 个 hero 改用另一种分解法 |

## Output

写两个文件：**评审看的成品** = `{artifact_root}/04-proposal.md`；**内部审计凭证** = `{artifact_root}/04a-self-audit.md`。

### `{artifact_root}/04-proposal.md`（成品稿，评审视角）

```markdown
# {brand} {product} {target_city} 区域上市方案

> bid_or_tender: <true | false>
> launch_window: {launch_window}
> brand_endorser: {brand_endorser}

## Variables Resolved
- brand: ...
- product: ...
- target_city: ...
- ...

## Architecture Rationale
<from Step 1>

## Voice Decision
<from Step 2>

## 目录 / Outline
<element list per chosen pattern>

[ELEMENT 1 OPENING]
...

[ELEMENT 2 OPENING]
...

(...rest of proposal in chosen architecture...)

## Budget Roll-up Table（全案预算分配总表）
<from Step 4 末尾，按 6 大职能切分占比>

## Rubric-Surface Map (when bid_or_tender)
<from Step 7 — **唯一保留在成品里的自检**，因为评审需要打分对应>
```

> **不允许写入** `04-proposal.md` 的区块：`## Coverage Map`、`## Voice Audit`、`## Architecture Originality Audit`、`Hero Expansion Self-Check`、`Stage MAP Self-Check`、`Mechanic Fulfillment Check`、`Voice & Local Saturation Pass` 报告——**全部**搬到 `04a-self-audit.md`。

### `{artifact_root}/04a-self-audit.md`（内部审计稿，QA 视角）

```markdown
# Self-Audit Report

> 产出时间：<timestamp>
> 对应正稿：04-proposal.md
> 用途：内部 review / 项目交接 / 后续迭代回溯，不交付评审

## 1. Coverage Map
<from Step 5>

## 2. Voice Audit
<from Step 8 — Q1-Q9 自评>

## 3. Architecture Originality Audit
<from Step 9>

## 4. Hero Expansion Self-Check
<from Step 4.5 — 每个 S 级 lead 七项打勾清单>

## 5. Stage MAP Self-Check
<from Step 4.6 — 每个 stage 一行>

## 6. Mechanic Fulfillment Check
<from Step 8 后 — Voice Decision 勾选项 vs 正文兑现 一一对账>

## 7. Voice & Local Saturation Pass（Step 4.7 七项收口）
1. 隐喻下渗：pass / fail
2. 本地饱和：pass / fail
3. 分解法多样：pass / fail
4. Surface mechanic 兑现：pass / fail
5. 中文流畅 (Q9)：pass / fail
6. 终端销售机制覆盖：pass / fail
7. 自检洁净（self-audit 已分离）：pass / fail
```

## Checkpoint

```markdown
## Proposal Assembly complete
- [x] All variables resolved at top
- [x] Architecture Rationale written; 2-3 candidates considered; one picked
- [x] Voice Decision written; 4-7 surface mechanics picked deliberately (含强制项 Hero 多页展开法 / 阶段 MAP 一页 — 触发条件命中时)
- [x] Outline reflects chosen architecture (NOT a default 6-chapter)
- [x] All Info Types in Coverage Contract covered (Coverage Map present in 04a-self-audit.md)
- [x] Citation audit passed
- [x] (When bid_or_tender) Rubric-Surface Map appended **in 04-proposal.md**; no open gaps
- [x] Voice Audit passed (Q1-Q9 each pass) — **recorded in 04a-self-audit.md**
- [x] **Hero Event Expansion Pass 通过**：每个 S 级 lead 五模块自检清单全部打勾，markdown ≥150 行；自检清单写入 04a-self-audit.md
- [x] **Stage MAP Pass 通过**：每个 stage / battle / week chunk 末尾各有 1 张 6 列 MAP 大表
- [x] **Headline-not-keyword 通过**：每个主要传播阶段 ≥5 条成稿颗粒文章标题示例（非关键词候选）
- [x] **Mechanic Fulfillment Check 通过**：Voice Decision 勾选的所有 surface mechanic 均在 04-proposal.md 真兑现
- [x] **Voice & Local Saturation Pass 通过**（Step 4.7 七项收口全 pass）
- [x] **Self-Audit 分离**：04a-self-audit.md 已独立产出；04-proposal.md 内不残留 Coverage Map / Voice Audit / Originality Audit / Hero Expansion Self-Check / Stage MAP Self-Check / Mechanic Fulfillment Check 等自检区块
- [x] Architecture Originality Audit passed (no ≥80% match to reference deck) — 记录在 04a
- [x] Visual annotations placed on load-bearing pages only
- [x] `{artifact_root}/04-proposal.md` 与 `{artifact_root}/04a-self-audit.md` 双双完成 (Review Pass passed)
- [ ] Next: Completion
```
