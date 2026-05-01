# Regional Auto Launch Plan — 独立 Skill 重构设计

**日期**：2026-05-01  
**作者**：Yikuanzz × Claude  
**触发**：用户要求基于 `3.md`（六模块结构）和 `ppz13.pdf`（武汉区域上市方案参考）将「汽车区域上市传播方案」从通用 `media-plan` skill 拆出独立 skill。

---

## 1. 背景与目标

### 1.1 现状

当前 `skills/media-plan/` 内通过 `auto_regional_launch` 路由分支处理汽车区域上市方案。问题：

- 通用 skill 与汽车专项 skill 共用 gate / template / symptom map，约束相互渗透
- 通用流程不强制 `Slogan derivation chain`、`Activity Card 13 字段`、`三阶段成本带` 等汽车区域上市核心要素
- 通用 `Highlight Mechanism Canvas` 含 `Serialized IP program` 强制项，与「区域小成本营销」实际场景不符
- 评分表（rubric）对齐机制散落，未作为前置硬闸

### 1.2 目标

建立 `skills/regional-auto-launch-plan/` 独立 skill，满足：

1. **结构对齐 3.md 六模块**（任务课题 / 市场洞察 / 策略规划 / 营销动作 / 运营保障 / 服务团队）
2. **预算定位为区域小成本营销**（典型 20-30 万，含线上+线下+场地）
3. **活动设计四原则**（低成本 / 快见效 / 好落地 / 真实吸引）作为硬约束
4. **去掉「专属 IP」概念**，改为「营销核心主题（Core Theme）」从市场+产品+客群洞察推导
5. **质量四标准**（内容 / 语言 / 结构 / 创意）作为 Review Pass 硬闸
6. **评分表（rubric）非空时强制 Coverage Map + 第 5 维 Review**
7. **media-plan 退回纯通用**，移除 `auto_regional_launch` 分支

---

## 2. Skill 边界与迁移策略

### 2.1 双 skill 物理隔离

- 新 skill `skills/regional-auto-launch-plan/` 自成一包，runtime 不依赖 media-plan
- `skills/media-plan/` 移除 auto 分支后回归通用，runtime 不引用新 skill
- 入口分流由 `media-plan/SKILL.md` 顶部一段 routing notice 完成（检测到汽车区域上市信号建议切新 skill）

### 2.2 灰度迁移顺序

| 阶段 | 内容 | 是否可灰度 |
|---|---|---|
| Phase A | 创建新 skill 全套文件，不动 media-plan | 是 |
| Phase B | media-plan 加 routing notice | 是 |
| Phase C | media-plan 删除 auto 分支 gate / symptom / template chapter | 否（不可逆，先用 ppz13 反向验证） |
| Phase D | 文档/记忆补充（可选 reference memory） | 是 |
| Phase E | commit 切分提交 | 是 |

### 2.3 兼容/回滚

- Phase A-B 完成后老 brief 仍可走 media-plan 跑通（auto 分支未删）
- Phase C 完成后老路径不可逆。**必须先用 `ppz13.pdf` brief 验证新 skill 输出 ≥ 老路径质量**
- 每个 commit 独立可 revert

---

## 3. Phase 架构（7 个执行 phase + 1 个 proposal phase）

| # | Phase | 文件 | 对齐 3.md 模块 | 是否走 sub-agent 并行 |
|---|---|---|---|---|
| 1 | 预搜 | `phases/pre-brief-search.md` | — | 否 |
| 2 | Intake | `phases/intake.md` | — | 否 |
| 3 | Insight | `phases/insight.md` | 模块 2 (市场洞察) | 部分（4 个 insight-modules 可并行） |
| 4 | Strategy | `phases/strategy.md` | 模块 3 (策略规划) | 否（连贯推导） |
| 5 | Action | `phases/action.md` | 模块 4 (营销动作) | **是**（每 pillar N=2~3 sub-agent） |
| 6 | Operations | `phases/operations.md` | 模块 5 (运营保障) | 否 |
| 7 | Service Team | `phases/service-team.md` | 模块 6 (服务团队) | 否（bid-only） |
| 8 | Proposal | `phases/proposal.md` | — | 否 |

### 3.1 BLOCKING 总览（4 个用户介入点）

| # | 触发位置 | 用户需确认什么 |
|---|---|---|
| BLOCKING-A | Phase 4 Strategy 输出后 | Core Theme + Slogan + 三阶段子主题 |
| BLOCKING-B | Phase 5 Action — Phase 1 全部 pillar 卡出齐后 | 预热阶段 primary 活动卡 |
| BLOCKING-C | Phase 5 Action — Phase 2 全部 pillar 卡出齐后 | 引爆阶段 primary 活动卡 |
| BLOCKING-D | Phase 5 Action — Phase 3 全部 pillar 卡出齐后 | 延续阶段 primary 活动卡 |

> Intake 阶段的 `blocked` 状态属于「等待用户补字段」，不是 BLOCKING；Review Pass `fail` 后回上游也不视为 BLOCKING（自动走 Review Loop）。

---

## 4. 共享契约（Shared Contracts，16 个文件 + 1 子目录）

```
shared/
├── pre-brief-source-map.md       (复制 + 区域信号增强)
├── brief-intake-template.md      (新版 — region/budget/rubric/bid 字段)
├── source-trust-policy.md        (复制)
├── query-playbook.md             (复制 + 汽车 KOL/区域车市路由)
│
├── insight-modules/              (新目录)
│   ├── product-value.md          (3.md 2.1)
│   ├── market-environment.md     (3.md 2.2)
│   ├── competitor-deep.md        (3.md 2.3+2.4 — 5 维 + 2-3 条最近 campaign)
│   ├── customer-segmentation.md  (3.md 2.5+2.6)
│   └── city-signal.md            (3.md 2.6 — 区域消费/媒体/空间/文化)
│
├── core-theme-derivation.md      (新 — 替代 core-strategic-idea)
├── highlight-mechanism-canvas.md (改造 — 去 IP，改 Core Theme + 阶段子主题映射)
│
├── action-playbook-template.md   (新 — 13 字段卡 + sub-agent dispatch prompt)
├── budget-allocation-rule.md     (新 — 三阶段成本带 + 单卡红线)
│
├── operations-assurance-template.md  (新 — 5 Blocks)
├── service-team-template.md      (新 — bid-only 4+1 角色卡)
│
├── rubric-coverage-template.md   (新 — Coverage Map + 权重深度 + Mapping §15)
├── quality-self-check.md         (新 — 四标准 + rubric 第 5 维)
│
├── idea-scorecard.md             (新版 — 四维评分 sub-agent review)
├── content-assets.md             (复制 + 5 平台差异化强化)
└── proposal-template.md          (新 — Compact/Expanded + 7 章 + Action Playbook + Budget Table)
```

---

## 5. Phase 详设

### 5.1 Pre-brief Search

复用 media-plan 模式。区域信号增强：搜索 query 加入「目标城市 + 车市 / 经销商动态 / 区域消费力」类模板。

### 5.2 Intake

新增/强化字段：

- `geography_or_region`（必填，城市级别）
- `budget_or_resource_level`（必填，**默认提示「20-30 万含线上+线下+场地」**，超出标记为「区域旗舰」需用户确认）
- `evaluation_rubric`（可选，**verbatim 录入**，条目编号化）
- `bid_or_tender`（boolean）
- `tender_technical_requirements`（可选）
- `client_master_calendar`（可选）

Intake gate：上述字段全部解决（具体值或显式 N/A）才能 `Intake Status: ready`。

### 5.3 Insight（对齐 3.md 模块 2）

5 个 insight-modules 强制全部输出：

- **2.1 产品价值** — 三层价值体系（功能/情感/身份）
- **2.2 市场环境** — 区域车市 + 政策 + 季节窗口
- **2.3+2.4 竞品深度** — 核心/次核心竞品逐个 5 维分析（定位 / 营销打法 / 渠道策略 / 信任路径 / **应对策略多句段落**）+ 每品牌 2-3 条最近 campaign
- **2.5+2.6 客群分类 + 区域深度** — 客群画像锚点 + 区域客群分布
- **2.6 City Signal** — 区域消费/媒体习惯/空间分布/文化锚点四项

Insight gate：5 模块齐 + 每模块至少两个证据来源 + City Evidence Pack 四项齐。

### 5.4 Strategy（对齐 3.md 模块 3）

四个子节强制输出：

- **3.1 三层价值体系** — 衔接 Insight 2.1
- **3.2 主线推导（Slogan derivation chain）** — 品牌锚点 + 客群洞察 + 产品价值 三维推导出 Slogan，**链条可追溯**
- **3.3 Core Theme + 三阶段子主题** — Core Theme 来源能解释（市场/产品/客群任一推出即可）；三阶段子主题各自不同且与 Core Theme 一致
- **3.4 整合 MAP** — 节奏 × 客群 × 渠道矩阵

Strategy gate：Core Theme 有来源解释 + Slogan 推导链 3 维齐 + 三阶段子主题各异 + MAP 完整。

**BLOCKING-A（1 次）**：Strategy 输出后用户必须显式确认 Core Theme + Slogan + 三阶段子主题，才能进入 Action。

### 5.5 Action（对齐 3.md 模块 4）— 主体最重 phase

#### 5.5.1 三阶段差异

| 维度 | Phase 1 预热 (5月) | Phase 2 引爆 (6月) | Phase 3 延续 (7月) |
|---|---|---|---|
| 思路 | 造势 + 客群预筛 + Core Theme 入心 | 集中爆破 + 上市仪式 + 全城话题 | 临门一脚 + 老带新 + 口碑沉淀 |
| 节奏 | 慢启动 4-6 周 | N-7/N-1/N/N+3 四节点 | 多轮周末小场 + 网点常态 |
| 重心 | 线上重 / 线下轻 | 线下重 / 线上配合 | 线下中等 / 线上中等 |
| 典型 KPI | 曝光 / UGC / 留资 | 到场 / 现场订单 / 直播 | 订单转化 / 老带新 / 试驾邀约 |

#### 5.5.2 每阶段强制拆线上/线下子分类

- Phase 1: `1-online`（UGC/KOL/私域）+ `1-offline`（小快闪/私享会）
- Phase 2: `2-offline-core`（主舞台核心）+ `2-offline-aux`（集客）+ `2-online`（直播+内容矩阵）
- Phase 3: `3-offline-conv`（网点促定）+ `3-offline-trial`（深度试驾+KOC）+ `3-online`（车主故事+成团 H5）

#### 5.5.3 Sub-agent 并行 dispatch 模式

```
对每一个 pillar（如 2-offline-core / 2-offline-aux / 2-online ……）：
    Step A 主 agent 写 brief（pillar 名 / 客群锚点 / 必达 KPI / 成本上限 / 风险背景）
    Step B 主 agent 并行 dispatch N=2~3 个 sub-agent，每个出一张完整 Activity Card
    Step C 主 agent 用四维评分 review：
              · 真实吸引力（客群凭什么真的来）
              · 落地可行性（团队能否执行）
              · 成本可行性（占比是否在阶段带内）
              · 主题契合度（与 Core Theme + 子主题一致）
    Step D 选 1 张为 primary，保留 1 张为 alternative
    Step E 输出 primary 卡到 ## Action Playbook 对应槽位
```

#### 5.5.4 阶段化 BLOCKING（共 3 次，每阶段 1 次）

每个阶段（Phase 1 / Phase 2 / Phase 3）的全部 pillar 卡出齐时**一次性 BLOCKING**，不逐张确认。三个阶段对应三次独立的 BLOCKING：

- BLOCKING #1：Phase 1 所有 pillar 卡（`1-online` + `1-offline`）出齐 → 用户确认 → 进入 Phase 2 sub-agent dispatch
- BLOCKING #2：Phase 2 所有 pillar 卡（`2-offline-core` + `2-offline-aux` + `2-online`）出齐 → 用户确认 → 进入 Phase 3 sub-agent dispatch
- BLOCKING #3：Phase 3 所有 pillar 卡（`3-offline-conv` + `3-offline-trial` + `3-online`）出齐 → 用户确认 → 进入 Operations

### 5.6 Operations（对齐 3.md 模块 5）

5 Blocks 强制输出：

1. **群组矩阵**（最小 3 群上限 5 群）
2. **内容下发流程**（一句话流程）
3. **反馈回流机制**（监督 / 汇总 / 反馈 三步）
4. **层级汇报矩阵**（4 层可裁 3 层）
5. **节点检核机制**（与 Phase 4 三阶段对齐，KPI 与 Phase 4 字段 10 一致）

不走 sub-agent 并行（机制类内容）。

### 5.7 Service Team（对齐 3.md 模块 6）— bid-only

`bid_or_tender = true` 时触发，否则 proposal 写 `## 7. 服务团队 (skipped — non-bid)`。

bid 触发后强制输出 4+1 角色卡：客户对接 / 策略主理 / 创意主理 / 执行督导 + 媒介投放（可选）。每张卡含背景 / 职责 / 投入度（数字化）。

若 `tender_technical_requirements` 含岗位资质或案例数限制，必须在角色卡内对应。

### 5.8 Proposal + Review Pass

#### 5.8.1 章节大纲

```
0. 封面 / 目录
1. 任务课题                 [Compact only 默认]
2. 市场洞察                 [Compact + Expanded]
   2.1 产品价值
   2.2 市场环境
   2.3 竞品格局
   2.4 竞品深度（5 维）
   2.5 客群分类
   2.6 客群区域深度
   2.7 SWOT
3. 策略规划                 [Compact + Expanded]
   3.1 三层价值体系
   3.2 主线推导
   3.3 Core Theme + 阶段子主题
   3.4 整合 MAP
4. 营销动作                 [Compact + Expanded] ← 主体
   4.1 阶段总览 + Budget Allocation Table
   4.2 Phase 1 预热
   4.3 Phase 2 引爆
   4.4 Phase 3 延续
   4.5 Alternative Cards
5. 运营保障                 [Compact only]
6. 服务团队                 [bid-only]
7. 鸣谢
[Optional]
14. Post-Campaign Review & Uplift  (招标技术要求触发，结构沿用 media-plan 既有模板：复盘维度 + 数据回流 + 二次提升建议)
15. Rubric Mapping                 (rubric 非空触发)
```

#### 5.8.2 Review Pass 四标准（rubric 非空时升级为五维）

每个标准 4-5 条具体 check item，全部 pass 才该维 pass，**全维 pass 才整体 pass**。详见第 10 节。

#### 5.8.3 Review Loop

`MAX_REVIEW_LOOPS = 3`。失败时 emit `## Review Gap` 含 `route` ∈ {research, ideation, execution, proposal_enrich, intake}，跑最小必要上游修复后重组 proposal。耗尽 3 次仍未 pass → emit `## Open Issues`，**不宣布完成**。

---

## 6. Activity Card 13 字段（Phase 5 核心契约）

按 4 组归类，**字段 1-7 必填，8-13 能写多深写多深，缺则标 `partial`**：

**组 A · 身份 (4)**
1. 创意命名（必填，反映 Core Theme 子主题）
2. 所属阶段 / 子主题
3. 时间窗口（周期 + 高峰节点）
4. 地点 / 阵地（必标 `online` / `offline` / `hybrid`）

**组 B · 客群吸引 (3)**
5. 目标客群与画像锚点（可识别人群，非「年轻人」）
6. 吸引机制（一句话答「客群凭什么放下周末来」）
7. 核心玩法 / 子环节列表（多 step 流，每环节 1 行说清）

**组 C · 执行推进 (4)**
8. 资源清单（异业 / KOL-KOC / 道具 / 物料 / 礼品政策）
9. 传播节奏 / 内容产出（节点 + 5 平台差异化：抖音/小红书/懂车帝/视频号/微博）
10. 转化闭环 / KPI（可量化）
11. 成本量级估算（4 sub-fields）：
    - 所属阶段成本带
    - 本卡单项金额（占总盘 X% / 占阶段 X%）
    - 线上/线下属性
    - 大头费用解释

**组 D · 风险与替代 (2)**
12. 风险 & 应对策略（**多句段落**，含定位反制 / 内容反制 / 渠道反制 / 心智反制 + 内部 Plan B）
13. 来源解释（一句话答「从 Insight 哪一块推导出来」）

---

## 7. Sub-agent 并行 Dispatch Pattern

### 7.1 适用范围

仅 Phase 5 Action 启用。Phase 3 Insight 的 4 个 insight-modules 可选并行，其余 phase 不走 sub-agent。

### 7.2 并行数

`N = 2-3` 个 sub-agent per pillar。少于 2 创意不足，超过 3 review 成本陡增。

### 7.3 Sub-agent prompt 模板（写入 `action-playbook-template.md`）

每个 sub-agent prompt 含：
- 通用约束：13 字段卡 schema + 四原则（低成本/快见效/好落地/真实吸引）
- 阶段约束（按所在阶段）：
  - Phase 1：「线上为主、线下轻量；蓄水筛潜客；不写整城仪式或大场地搭建；单卡预算 ≤2.5 万」
  - Phase 2：「上市当日核心场，允许大头预算（场地+搭建），但场地相关 ≤60% phase 2，整卡 ≤8 万；必须含 N-7/N/N+3 节点联动」
  - Phase 3：「目的是抓犹豫客群转化或老带新裂变；单卡预算 ≤3 万；KPI 必须可量化到订单/留资/邀约转化数」

### 7.4 主 agent review 四维评分（写入 `idea-scorecard.md`）

| 维度 | 评分依据 |
|---|---|
| 真实吸引力 | 字段 6（吸引机制）能否解释「客群凭什么真的来」 |
| 落地可行性 | 字段 7+8（玩法+资源）经销商团队能否执行 |
| 成本可行性 | 字段 11 是否在阶段带内 + 单卡 ≤30% 总盘 |
| 主题契合度 | 字段 1+2+13 是否与 Core Theme + 子主题一致 |

primary 选最高总分；alternative 选第二高，写入 `## Alternative Cards`。

---

## 8. Budget Allocation Rule（写入 `budget-allocation-rule.md`）

### 8.1 阶段成本带（按 25 万中位）

| 阶段 | 占总盘比例 | 绝对金额 | 大头去向 |
|---|---|---|---|
| Phase 1 预热 | 25-30% | 6.25-7.5 万 | KOL 圈层投放 + UGC 奖品 + 小快闪 + 私享会 |
| Phase 2 引爆 | 50-55% | 12.5-13.75 万 | 场地租赁+搭建（约 phase 2 的 50-60%）+ 主舞台 + KOL 到场 + 直播 |
| Phase 3 延续 | 20-25% | 5-6.25 万 | KOC 沙龙 + 深度试驾物料 + 网点礼品 |

### 8.2 硬约束

- Phase 2 场地相关（租赁+搭建+物料+人力）单项 ≤ phase 2 预算的 60%
- 任何单张活动卡 ≤ 总盘 30%
- 线上/线下分项必须在 Budget Allocation Table 内分开标，加总 = 阶段预算

### 8.3 Budget Allocation Table（必出章节）

```
| 阶段 | 线上 | 线下 | 合计 | 占比 |
|---|---|---|---|---|
| Phase 1 | ¥… | ¥… | ¥… | …% |
| Phase 2 | ¥… | ¥…（含场地 ¥…） | ¥… | …% |
| Phase 3 | ¥… | ¥… | ¥… | …% |
| 合计 | ¥… | ¥… | ¥20-30 万 | 100% |
```

---

## 9. Rubric Coverage Mechanism（评分表对齐）

### 9.1 触发

`evaluation_rubric` 非空（招标 / 客户内部评分表 / 客户明示侧重点）→ 强制启动。

### 9.2 工作流（4 步）

1. **原文 verbatim 录入**（intake，条目编号化）
2. **Coverage Map**（proposal 起草前，标注每条评分项 → 提案章节 + 深度要求 + 预备状态）
3. **权重→深度规则**：≥15% 强制 Expanded；5-15% 默认章节深度；<5% Compact 即可
4. **Rubric Mapping §15**（proposal 末尾固定章节，每条评分项给章节锚点 + 1-2 句关键证据）

### 9.3 起草前置闸

任何 `partial` / `missing` 必须在起草前补齐。**不允许带 missing 进 Review Pass**。

---

## 10. Quality Self-Check（四标准 + rubric 第 5 维）

### 10.1 标准 1 · 内容

```
[ ] 凡核心观点都有数据支撑（标了来源/年份/口径）
[ ] 凡竞品判断都有对照（5 维 + 2-3 条最近 campaign）
[ ] 凡客群洞察都来自 2.5/2.6 区域客群分析推导
[ ] 凡阶段动作都能从 Strategy 主线追溯（不是凭空编）
[ ] City Evidence Pack 含区域消费/媒体习惯/空间分布/文化锚点四项
```

### 10.2 标准 2 · 语言

```
[ ] 章节标题是结论句而非主题词
[ ] 段落首句是结论先行
[ ] 动词主导，忌空词（全方位/赋能/打造/构建）
[ ] 主语清晰（"我们/品牌/客户"必指代具体方）
[ ] 数字优先于形容词（"+38%" 而非 "大幅提升"）
```

### 10.3 标准 3 · 结构

```
[ ] 每章 Compact View 在前，Expanded View 在后
[ ] 章 2-4 必须有 Expanded View
[ ] 同级标题之间是平行/递进/对照三关系之一（不混）
[ ] 任何 Activity Card 13 字段顺序与模板一致
[ ] Budget Allocation Table 含线上/线下分项 + 三阶段合计
```

### 10.4 标准 4 · 创意

```
[ ] Core Theme 来源能解释（市场/产品/客群任一推出）
[ ] Slogan derivation 链 3 维齐（品牌+客群+产品）
[ ] 三阶段子主题各异 + 与 Core Theme 一致
[ ] 每个 pillar 都有创意命名（非通名）
[ ] 至少有 1 个动作能解释「为什么客群真的会来」（不是噱头）
```

### 10.5 标准 5 · Rubric Coverage（rubric 非空时启用）

```
[ ] 评分表逐条 verbatim 录入
[ ] Coverage Map 100% covered（无 partial / missing）
[ ] 高权重项 (≥15%) 全部 Expanded
[ ] Rubric Mapping §15 每条有章节锚点 + 关键证据
[ ] 评分表「必含项」「必含数据」「必含案例数」逐条满足
```

### 10.6 Review Pass 输出格式

```markdown
## Review Pass

### 内容
- pass / fail / partial
- 失败项: [...]

### 语言 / 结构 / 创意
（同结构）

### Rubric Coverage（仅 rubric 非空）
（同结构）

### 整体
- verdict: pass / fail
- 仅当所有维度全 pass 时整体才 pass

## Review Gap (verdict=fail 时)
- route: research | ideation | execution | proposal_enrich | intake
- 必修项: [...]
- 估计 loop 次数: 1 / 2 / 3
```

---

## 11. Review Loop & Symptom → Route

`MAX_REVIEW_LOOPS = 3`。

| 症状 | route |
|---|---|
| 内容标准失败：证据缺、数据无来源、客群洞察凭空 | research |
| 内容标准失败：竞品 5 维不全 / 缺 2-3 条最近 campaign | research |
| 内容标准失败：City Evidence Pack 不全 | research |
| 创意标准失败：Core Theme 无来源解释 | ideation |
| 创意标准失败：Slogan derivation 链断 | ideation |
| 创意标准失败：阶段子主题缺 / 与 Core Theme 不一致 | ideation |
| 创意标准失败：pillar 缺创意命名 | ideation |
| 结构标准失败：Compact / Expanded 错位 | proposal_enrich |
| 结构标准失败：章节关系混乱 | proposal_enrich |
| 语言标准失败：标题非结论句 / 空词多 / 主语模糊 | proposal_enrich |
| 阶段成本超带 / 场地占比 >60% phase 2 | execution |
| 平台差异化缺 / hashtag 例子缺 | execution |
| pillar 卡缺字段 1-7（必填项） | execution |
| 活动 KPI 无法量化 | execution |
| 老带新 / 三人成团结构缺 | execution |
| 评分表录入非 verbatim / 缺条目编号 | intake |
| Coverage Map 有 missing 章节 | proposal_enrich |
| Coverage Map 有 partial pillar 创意命名 | ideation |
| 高权重项未 Expanded | proposal_enrich |
| 评分表「必含数据/案例」缺源 | research |
| Rubric Mapping §15 章节锚点错指 | proposal_enrich |
| 评分表「必含规模/资质」缺 | intake 或 proposal_enrich |

---

## 12. Migration Plan（5 commit）

| # | Commit | 内容 |
|---|---|---|
| 1 | `feat(regional-auto-launch-plan): scaffold new skill package` | Phase A — 新建 25 个文件 |
| 2 | `feat(media-plan): add routing notice to regional-auto-launch-plan` | Phase B — media-plan 顶部 routing 提示 |
| 3 | `refactor(media-plan): remove auto_regional_launch branch from gates and symptom map` | Phase C 前半 — SKILL.md 删 9 行 gate + 7 行 symptom |
| 4 | `refactor(media-plan): remove auto_regional_launch chapter from proposal-template` | Phase C 后半 — proposal-template 删 auto 整段 |
| 5 | `docs(memory): add regional-auto-launch-plan skill reference` | Phase D（可选） |

**验证关卡**：commit 1 完成后用 `ppz13.pdf` brief 反向 dry-run，输出质量 ≥ 老 media-plan auto 路径才能进 commit 3。

---

## 13. 文件清单

### 13.1 新增（25 个）

```
skills/regional-auto-launch-plan/
├── SKILL.md
├── phases/
│   ├── pre-brief-search.md
│   ├── intake.md
│   ├── insight.md
│   ├── strategy.md
│   ├── action.md
│   ├── operations.md
│   ├── service-team.md
│   └── proposal.md
└── shared/
    ├── pre-brief-source-map.md
    ├── brief-intake-template.md
    ├── source-trust-policy.md
    ├── query-playbook.md
    ├── insight-modules/
    │   ├── product-value.md
    │   ├── market-environment.md
    │   ├── competitor-deep.md
    │   ├── customer-segmentation.md
    │   └── city-signal.md
    ├── core-theme-derivation.md
    ├── highlight-mechanism-canvas.md
    ├── action-playbook-template.md
    ├── budget-allocation-rule.md
    ├── operations-assurance-template.md
    ├── service-team-template.md
    ├── rubric-coverage-template.md
    ├── quality-self-check.md
    ├── idea-scorecard.md
    ├── content-assets.md
    └── proposal-template.md
```

### 13.2 修改（2 个）

- `skills/media-plan/SKILL.md` — 删 9 行 auto gate + 7 行 symptom + 加 routing notice 段
- `skills/media-plan/shared/proposal-template.md` — 删 `auto_regional_launch` 整段

### 13.3 不动

- `CLAUDE.md` / `AGENTS.md`（顶部入口仍是 media-plan/SKILL.md，分流由该文件指引）
- 现有 memory（两条 feedback/project memory 仍适用）

---

## 14. 待办与可选

- 新增 1 条 reference memory「区域汽车上市 skill 入口路径 = `skills/regional-auto-launch-plan/SKILL.md`」（Phase D 可选）
- 新 skill 落地后用 `ppz13.pdf` brief 跑一次完整 dry-run 验证
- 后续可扩展：非汽车区域上市的「区域 + 小成本 + 重场景」类目（如餐饮/家电区域上市）的 sibling skill，但本次不做

---

## 15. 用户决策回放（关键约束来源）

| 决策 | 来源 |
|---|---|
| 拆 skill / media-plan 只留通用 | 用户 (2026-05-01) Answer 1+2 |
| 新 skill 名 `regional-auto-launch-plan` | 用户 Answer 3 |
| 按 3.md 六模块架构重构 phase | 用户 Answer 4 |
| 质量四标准作为 Review Pass 硬闸 | 用户 Answer 5 |
| 预算 20-30 万含线上+线下+场地 | 用户原文（已存 memory） |
| 活动设计四原则 + 去掉专属 IP / 改 Core Theme | 用户原文（已存 memory） |
| 应对策略多句段落 | 用户修正 |
| Core Theme 「能解释来源即可」 | 用户修正 |
| 活动详细展开 + sub-agent 并行 review 选优 | 用户修正 |
| 字段 1-7 必填 + 8-13 写多深写多深 / N=2~3 / 阶段 BLOCKING | 用户确认 |
| 三阶段思路/节奏/目的不同 + 每阶段拆线上线下 + 成本大头在引爆当天 | 用户修正 |
| 评分表对齐：补缺章节 + 加强高权重项 | 用户修正 |
