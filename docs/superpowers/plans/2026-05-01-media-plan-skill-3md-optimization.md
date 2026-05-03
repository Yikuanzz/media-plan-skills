# media-plan Skill 3.md Optimization — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Enrich the media-plan skill's `auto_regional_launch` output by updating upstream shared contracts, restructuring the downstream proposal template with Compact/Expanded views, and tightening phase gates.

**Architecture:** Inline Master-Detail pattern — every proposal chapter has a mandatory Compact View (slide-ready) and an Expanded View (playbook-depth). Upstream contracts are enriched first so downstream templates and phase gates can reference them.

**Tech Stack:** Markdown skill files only. No code or tests. Verification is file-reading and cross-reference consistency checks.

---

## File Map

| File | Responsibility | Change Size |
|------|---------------|-------------|
| `skills/media-plan/shared/core-strategic-idea.md` | Canonical narrative block; adds slogan derivation and stage sub-themes | Small |
| `skills/media-plan/shared/highlight-mechanism-canvas.md` | Creative naming, platform map, conversion loops, serialized IP rules | Medium |
| `skills/media-plan/shared/content-assets.md` | Platform-specific content lines (5 platforms) | Small |
| `skills/media-plan/shared/competitor-actionable.md` | Recent campaigns, trust path, enriched counter-move | Small |
| `skills/media-plan/phases/research.md` | Enforce new competitor and city evidence requirements | Small |
| `skills/media-plan/phases/ideation.md` | Add validation checks for creative naming, slogan derivation, serialized IP | Medium |
| `skills/media-plan/phases/execution.md` | Add platform content angle and hashtag fields to Program Blueprint Cards | Small |
| `skills/media-plan/phases/proposal.md` | Add Review Pass checks for Compact/Expanded views and platform differentiation | Small |
| `skills/media-plan/SKILL.md` | Update global gates to enforce new upstream and downstream requirements | Medium |
| `skills/media-plan/shared/proposal-template.md` | Restructure `auto_regional_launch` with Compact/Expanded views per chapter | Large |

---

## Dependency Order

```
Shared contracts (1-4) → Phase files (5-8) → SKILL.md gates (9) → Proposal template (10)
```

Do not start Task 10 until Tasks 1-9 are complete and verified.

---

## Task 1: Update `core-strategic-idea.md`

**Files:**
- Modify: `skills/media-plan/shared/core-strategic-idea.md`

**Context:** Current file has `One-line claim`, `Core value`, `Marketing主线`, `Core contradiction`, `Resolution path`, `Strategy pillars`. Need to add `Slogan derivation logic` and `Stage sub-themes`.

- [ ] **Step 1: Add `Slogan derivation logic` field**

  Insert after `Marketing主线` in the Output shape block:

  ```markdown
  - Slogan derivation logic: [explicit chain from insight dimensions — brand dimension + audience/use-case dimension + product value dimension → final slogan; dimensions must match the car's positioning, not default to "family"]
  ```

- [ ] **Step 2: Add `Stage sub-themes` field**

  Insert after `Slogan derivation logic`:

  ```markdown
  - Stage sub-themes:
    - Pre-heat: [sub-slogan for 预热造势期]
    - Launch: [sub-slogan for 上市引爆期]
    - Sustain: [sub-slogan for 延续转化期]
  ```

- [ ] **Step 3: Update `Marketing主线` rule**

  Append to existing `Marketing主线` rule:

  ```markdown
  - `Marketing主线` must now be provably derivable from `Slogan derivation logic`; if the slogan appears invented without derivation, mark the block incomplete.
  ```

- [ ] **Step 4: Update downstream binding note**

  Append to the existing downstream binding paragraph:

  ```markdown
  - `Slogan derivation logic` → Section 3.2 (as derivation chain evidence)
  - `Stage sub-themes` → Section 3.2 (as stage theme table)
  ```

- [ ] **Step 5: Verification**

  Read back `skills/media-plan/shared/core-strategic-idea.md` and confirm:
  - `Slogan derivation logic` appears in Output shape
  - `Stage sub-themes` appears in Output shape
  - Rules reference derivation as mandatory
  - Downstream binding includes new fields

- [ ] **Step 6: Commit**

  ```bash
  git add skills/media-plan/shared/core-strategic-idea.md
  git commit -m "feat(core-strategic-idea): add slogan derivation logic and stage sub-themes"
  ```

---

## Task 2: Update `highlight-mechanism-canvas.md`

**Files:**
- Modify: `skills/media-plan/shared/highlight-mechanism-canvas.md`

**Context:** Current file already has `Serialized IP program` (auto_regional_launch only) and many fields. Need to make serialized IP mandatory for all directions, add creative naming convention, platform differentiation map, conversion loop per pillar.

- [ ] **Step 1: Update Required Fields**

  Add these new fields to the Required Fields list:

  ```markdown
  - `Creative naming convention`: Every named pillar, program, and activity must carry a creative, brand-sounding name (not generic placeholders like "KOL seeding" or "线下活动").
  - `Platform differentiation map`: For each stage, note which platforms get which content angles and format differences.
  - `Conversion loop per pillar`: Each named pillar must state its specific conversion path (attention → lead → trial → order).
  ```

- [ ] **Step 2: Make `Serialized IP program` mandatory for all directions**

  Change:
  ```markdown
  - `Serialized IP program` (mandatory for `auto_regional_launch` only)
  ```
  To:
  ```markdown
  - `Serialized IP program` (mandatory for all directions): Name one IP that evolves across all three stages with phase-evolution logic.
  ```

- [ ] **Step 3: Update Output Shape**

  Add to the Output Shape block, after `Conversion mechanism`:

  ```markdown
  - Platform differentiation map:
    - Early: [platform + angle]
    - Mid: [platform + angle]
    - Late: [platform + angle]
  - Conversion loop per pillar:
    - [pillar name]: [attention → lead → trial → order path]
  ```

- [ ] **Step 4: Update Rules**

  Add these rules:

  ```markdown
  - `Creative naming convention`: If any stage pillar uses generic naming ("KOL seeding", "线下活动", "线上推广"), mark the direction `revise`.
  - `Platform differentiation map`: Each stage must show distinct platform angles; identical content across all platforms is insufficient.
  - `Conversion loop per pillar`: Generic conversion language ("引导购买") is insufficient; each pillar must name its specific trigger and handoff method.
  ```

- [ ] **Step 5: Verification**

  Read back the file and confirm:
  - `Serialized IP program` is mandatory for all directions
  - `Creative naming convention`, `Platform differentiation map`, `Conversion loop per pillar` appear in Required Fields
  - Output Shape includes new fields
  - Rules enforce creative naming and non-generic conversion

- [ ] **Step 6: Commit**

  ```bash
  git add skills/media-plan/shared/highlight-mechanism-canvas.md
  git commit -m "feat(highlight-canvas): enforce creative naming, platform map, conversion loops, serialized IP for all directions"
  ```

---

## Task 3: Update `content-assets.md`

**Files:**
- Modify: `skills/media-plan/shared/content-assets.md`

**Context:** Current file has Long-form / Mid-form / Short-form tiers. Need to add platform-specific content lines.

- [ ] **Step 1: Add platform-specific content structure**

  Append a new section after the existing Output shape:

  ```markdown
  ## Platform-Specific Content Lines (auto_regional_launch)

  For each primary platform, provide:

  | Platform | Content style | Key direction | Example titles |
  | --- | --- | --- | --- |
  | 抖音 | [e.g., 短视频，强情绪共鸣] | [e.g., 场景化家庭体验、AI创意] | [actual titles like `《光谷爸爸换车记》`] |
  | 小红书 | [e.g., 图文/短vlog，精致氛围感] | [e.g., 城市意境打卡、生活方式] | [actual titles like `《这台车和武汉很配》`] |
  | 懂车帝/汽车之家 | [e.g., 深度测评，专业干货] | [e.g., 产品对比、提车指南] | [actual titles like `《奕境 vs 理想L9 深度对比》`] |
  | 视频号 | [e.g., 生活化、熟人传播] | [e.g., 车主故事、活动直播] | [actual titles like `车主购车真实记录`] |
  | 微博 | [e.g., 话题制造，热搜逻辑] | [e.g., 话题标签运营，舆论引导] | [actual titles like `#武汉首台奕境DH1#`] |

  - At least 3 platforms must have concrete title examples.
  - Titles must be specific enough to appear in a content calendar, not generic descriptions.
  ```

- [ ] **Step 2: Update Rules**

  Append:

  ```markdown
  - For `auto_regional_launch`, platform-specific content lines are mandatory. If missing, the Content Assets block is incomplete.
  ```

- [ ] **Step 3: Verification**

  Read back and confirm the platform table and rule are present.

- [ ] **Step 4: Commit**

  ```bash
  git add skills/media-plan/shared/content-assets.md
  git commit -m "feat(content-assets): add platform-specific content lines for auto_regional_launch"
  ```

---

## Task 4: Update `competitor-actionable.md`

**Files:**
- Modify: `skills/media-plan/shared/competitor-actionable.md`

**Context:** Current file has a simple table with 5 columns. Need to add `Recent campaigns` as a new column, expand `Trust path`, and enrich `Our break`.

- [ ] **Step 1: Update Output shape table headers**

  Change:
  ```markdown
  | Competitor / benchmark | What users trust and why | What they distrust or ignore | Implication for our trust path | Our break / counter-move (comms or experience) |
  ```
  To:
  ```markdown
  | Competitor / benchmark | What users trust and why | Trust path (know → order) | Recent campaigns (2–3, last 12 months) | What they distrust or ignore | Implication for our trust path | Our break / counter-move (impactful strategy sentence) |
  ```

- [ ] **Step 2: Update example row**

  Change:
  ```markdown
  | [name] | [evidence-backed] | [evidence-backed or hypothesis stated as such] | [one line] | [named action, no vague "do better"] |
  ```
  To:
  ```markdown
  | [name] | [evidence-backed] | [key touchpoints: know → consider → trial → order] | [campaign name + timing + core mechanic] | [evidence-backed or hypothesis stated as such] | [one line] | [impactful strategy sentence, e.g., `从参数对比转向极致场景体验，不做 M9 追随者`] |
  ```

- [ ] **Step 3: Update Rules**

  Add:

  ```markdown
  - `Recent campaigns` column must contain 2–3 named campaigns from the last 12 months with timing and core mechanic. If unavailable, mark `TBC` and add to Gaps.
  - `Trust path` must describe the competitor's key touchpoints that move users from awareness to order, not just "users trust their brand."
  - `Our break / counter-move` must be one impactful strategy sentence with brand-specific posture, not a generic "differentiate on service."
  ```

- [ ] **Step 4: Verification**

  Read back and confirm table has 7 columns, example row matches, and new rules exist.

- [ ] **Step 5: Commit**

  ```bash
  git add skills/media-plan/shared/competitor-actionable.md
  git commit -m "feat(competitor-actionable): add recent campaigns, trust path, enriched counter-move"
  ```

---

## Task 5: Update `phases/research.md`

**Files:**
- Modify: `skills/media-plan/phases/research.md`

**Context:** Need to enforce new competitor deep-dive requirements and city evidence pack enrichment.

- [ ] **Step 1: Add competitor deep-dive requirements**

  After the existing competitor bullet in Rules, add:

  ```markdown
  - Competitor deep-dive must cover 5 dimensions per core/key competitor: 核心定位 / 营销打法 / 渠道策略 / 用户信任路径 / 应对策略. Each dimension must have evidence-backed content, not generic praise.
  - Each core/key competitor must have 2–3 recent campaigns (last 12 months) documented with timing and core mechanic.
  ```

- [ ] **Step 2: Enrich city evidence pack requirements**

  After the existing `## City Evidence Pack` section, add:

  ```markdown
  - For `auto_regional_launch`, `## City Evidence Pack` must also include:
    - Regional consumption trends (category-specific local habits, e.g., 混动渗透率高于全国平均)
    - Media habits (platforms used for auto decision-making in this region)
    - Spatial distribution (where target audiences live/gather, e.g., "一江两湖三极")
    - Cultural anchors (emotional/cultural touchstones, e.g., 过早文化, 江城情怀)
  ```

- [ ] **Step 3: Add source attribution rule**

  Append to Rules:

  ```markdown
  - All market data claims (sales, share, growth) must cite explicit sources (e.g., 乘联会, 懂车帝, 汽车之家). Unsourced data must be marked `TBC` and added to Gaps.
  ```

- [ ] **Step 4: Verification**

  Read back and confirm new competitor, city evidence, and source rules are present.

- [ ] **Step 5: Commit**

  ```bash
  git add skills/media-plan/phases/research.md
  git commit -m "feat(research): enforce 5-dimension competitor deep-dive, enriched city evidence, source attribution"
  ```

---

## Task 6: Update `phases/ideation.md`

**Files:**
- Modify: `skills/media-plan/phases/ideation.md`

**Context:** Need to add validation checks for creative naming, slogan derivation, and serialized IP.

- [ ] **Step 1: Add creative naming validation**

  After the existing Highlight Mechanism Canvas completeness rule, add:

  ```markdown
  ### Creative naming validation (auto_regional_launch)
  For `auto_regional_launch`, a `keep` direction is **invalid** if any stage pillar uses generic naming ("KOL seeding", "线下活动", "线上推广", "媒体投放", "社群运营"). Every named activity must have a creative, brand-sounding name. If generic names exist, mark the direction `revise`.
  ```

- [ ] **Step 2: Add slogan derivation validation**

  After Step 1, add:

  ```markdown
  ### Slogan derivation validation (auto_regional_launch)
  For `auto_regional_launch`, a `keep` direction is **invalid** if its `## Core Strategic Idea` lacks `Slogan derivation logic` or if the `Marketing主线` appears invented without a traceable derivation chain. The derivation must show how insight dimensions (brand + audience/use-case + product value) converge to the slogan. If missing or invented, mark `revise`.
  ```

- [ ] **Step 3: Add serialized IP cross-check**

  In the existing Highlight Mechanism Canvas completeness rule, the first item already requires serialized IP. Add a cross-reference note:

  ```markdown
  - (Cross-check) The serialized IP named here must also appear in `## Notes` under `Serialized IP candidates` with consistent phase-evolution logic.
  ```

- [ ] **Step 4: Verification**

  Read back and confirm all three validation blocks exist and reference `auto_regional_launch` correctly.

- [ ] **Step 5: Commit**

  ```bash
  git add skills/media-plan/phases/ideation.md
  git commit -m "feat(ideation): add creative naming, slogan derivation, serialized IP validation checks"
  ```

---

## Task 7: Update `phases/execution.md`

**Files:**
- Modify: `skills/media-plan/phases/execution.md`

**Context:** Need to add platform content angle and hashtag fields to Program Blueprint Cards, and enforce online actions hashtag column.

- [ ] **Step 1: Add platform content angle to Program Blueprint Cards**

  In the Rules section, after the existing Launch Event closed-loop requirement, add:

  ```markdown
  - **Platform content angle (auto_regional_launch)**: Every Program Blueprint Card must include `Platform content angle` — which platform(s) this program targets and what content angle/format is used per platform. If a program is multi-platform, list each platform's differentiated angle.
  ```

- [ ] **Step 2: Add hashtag/topic tag requirement**

  After Step 1, add:

  ```markdown
  - **Hashtag / topic tag requirement (auto_regional_launch)**: Every Program Blueprint Card must include at least 2 concrete hashtag or topic tag examples (e.g., `#AI帮我带娃出行#`, `#一车装下整个家#`). Generic tags ("#新车上市#") are insufficient.
  ```

- [ ] **Step 3: Add online actions column rule**

  After Step 2, add:

  ```markdownn  - **Online Actions hashtag column (auto_regional_launch)**: In Phase Online Actions tables, add a `话题标签` column. Every row should have at least one concrete hashtag or topic tag. Rows without tags must be marked `n/a` with justification.
  ```

- [ ] **Step 4: Verification**

  Read back and confirm platform content angle, hashtag requirement, and online actions column rule are present.

- [ ] **Step 5: Commit**

  ```bash
  git add skills/media-plan/phases/execution.md
  git commit -m "feat(execution): add platform content angle, hashtag requirements, online actions column"
  ```

---

## Task 8: Update `phases/proposal.md`

**Files:**
- Modify: `skills/media-plan/phases/proposal.md`

**Context:** Need to add Review Pass checks for Compact/Expanded views, platform differentiation, and derivation logic traceability.

- [ ] **Step 1: Add Compact/Expanded view checks**

  In the Review Pass checklist, after the existing auto_regional_launch checks, add:

  ```markdown
  - [ ] if auto regional launch: every chapter (1–4) has a Compact View (slide-ready: tables/bullets, ≤3-line paragraphs)
  - [ ] if auto regional launch: chapters 2–4 have Expanded Views with full narrative depth per proposal-template.md
  - [ ] if auto regional launch: Compact and Expanded Views are traceable to upstream contracts (Core Strategic Idea, Highlight Mechanism Canvas)
  ```

- [ ] **Step 2: Add platform differentiation check**

  After Step 1, add:

  ```markdown
  - [ ] if auto regional launch: Chapter 4 Expanded includes platform differentiation table (抖音/小红书/懂车帝/视频号/微博) with content style, key direction, and example titles
  - [ ] if auto regional launch: Chapter 4 has per-activity hashtag examples (not generic descriptions)
  ```

- [ ] **Step 3: Add derivation logic traceability check**

  After Step 2, add:

  ```markdown
  - [ ] if auto regional launch: Chapter 3 slogan is traceable to `Slogan derivation logic` in Core Strategic Idea (derivation chain present, not invented)
  - [ ] if auto regional launch: Chapter 3 stage sub-themes align with `Stage sub-themes` in Core Strategic Idea
  ```

- [ ] **Step 4: Verification**

  Read back and confirm all new checklist items are in the Review Pass block.

- [ ] **Step 5: Commit**

  ```bash
  git add skills/media-plan/phases/proposal.md
  git commit -m "feat(proposal): add Compact/Expanded, platform differentiation, derivation logic review checks"
  ```

---

## Task 9: Update `SKILL.md`

**Files:**
- Modify: `skills/media-plan/SKILL.md`

**Context:** Update global gates to enforce new requirements from Tasks 1–8.

- [ ] **Step 1: Update Research pass gate**

  Find the Research pass bullet:
  ```markdown
  - Do not pass **research** without at least two evidence classes, `## Competitor Actionable View` when competitive context exists, and at least one concrete source per important claim; generic competitor praise only → do not pass (see `research-rubric.md`).
  ```

  Append:
  ```markdown
  - For `auto_regional_launch`, research must include 5-dimension competitor analysis per core/key competitor (定位/营销打法/渠道策略/信任路径/应对策略) with 2–3 recent campaigns each; generic praise → do not pass.
  - For `auto_regional_launch`, `## City Evidence Pack` must include regional consumption trends, media habits, spatial distribution, and cultural anchors beyond industrial clusters.
  ```

- [ ] **Step 2: Update Ideation pass gate**

  Find the Ideation pass bullet:
  ```markdown
  - Do not pass **ideation** unless at least three distinct directions were considered, at least one wildcard direction was preserved, `## Core Strategic Idea` is filled for the primary `keep` path, `## Content Assets` exists for the primary direction, and `## Highlight Mechanism Canvas` is complete per `./shared/highlight-mechanism-canvas.md`.
  ```

  Append:
  ```markdown
  - For `auto_regional_launch`, `## Core Strategic Idea` must include `Slogan derivation logic` and `Stage sub-themes`.
  - For `auto_regional_launch`, `## Highlight Mechanism Canvas` must show creative naming for all pillars, a `Platform differentiation map`, `Conversion loop per pillar`, and a serialized IP spanning all three stages.
  ```

- [ ] **Step 3: Update Execution pass gate**

  Find the Execution pass bullet:
  ```markdownn  - Do not start **execution** until the user **explicitly confirms** `## Selected Direction Handoff` (Step 5 BLOCKING) and the chosen direction includes a complete `## Highlight Mechanism Canvas` with `Stage pillars`, `Local life map`, and `Calendar alignment`.
  ```

  Append:
  ```markdown
  - For `auto_regional_launch`, execution planning is blocked unless `## Content Assets` includes platform-specific content lines (抖音/小红书/懂车帝/视频号/微博) and Program Blueprint Cards include platform content angles and hashtag examples.
  ```

- [ ] **Step 4: Update Proposal pass gate**

  Find the Proposal pass bullet:
  ```markdown
  - Do not enter **proposal** without `## Selected Direction Handoff`, `## Core Strategic Idea`, `## Content Assets`, `## Highlight Mechanism Canvas`, and `## Validated Execution-Plan Handoff` with `Validation status: validated`.
  ```

  Append:
  ```markdown
  - For `auto_regional_launch`, do not enter proposal unless every chapter has a Compact View and chapters 2–4 have Expanded Views.
  - For `auto_regional_launch`, do not pass proposal review without platform differentiation table in Chapter 4 and derivation logic traceability in Chapter 3.
  ```

- [ ] **Step 5: Update Review Loop symptom table**

  Append new rows to the existing Symptom → route table:

  ```markdown
  | Missing slogan derivation or stage sub-themes | `ideation` |
  | Generic stage pillar names (no creative naming) | `ideation` |
  | Missing serialized IP or weak phase-evolution logic | `ideation` |
  | Competitor analysis lacks 5 dimensions or recent campaigns | `research` |
  | City evidence lacks regional consumption/media/spatial data | `research` |
  | Missing platform differentiation or hashtag examples | `execution` |
  | Compact/Expanded view mismatch or missing | `proposal_enrich` |
  ```

- [ ] **Step 6: Verification**

  Read back `skills/media-plan/SKILL.md` and confirm:
  - Research gate has competitor 5-dimension and city evidence enrichment
  - Ideation gate has slogan derivation and canvas enrichment
  - Execution gate has platform content and hashtag requirements
  - Proposal gate has Compact/Expanded and traceability requirements
  - Review loop symptom table has new rows

- [ ] **Step 7: Commit**

  ```bash
  git add skills/media-plan/SKILL.md
  git commit -m "feat(SKILL): update global gates for enriched auto_regional_launch requirements"
  ```

---

## Task 10: Restructure `proposal-template.md` (`auto_regional_launch`)

**Files:**
- Modify: `skills/media-plan/shared/proposal-template.md`

**Context:** This is the largest change. The current `auto_regional_launch` template needs Compact View + Expanded View pattern per chapter, plus richer content specifications per `3.md`.

**Prerequisite:** Tasks 1–9 must be complete and committed.

### Step 1: Rewrite Chapter 1 (任务课题)

- [ ] Replace the existing Chapter 1 block with:

  ```markdown
  ## 1. 任务课题 / Mission & Key Questions

  ### Compact View
  - Core mission: [single sentence — what this campaign must achieve]
  - Key questions: [2–3 bullets]
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
  ```

### Step 2: Rewrite Chapter 2 (市场洞察)

- [ ] Replace the existing Chapter 2 block with:

  ```markdown
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
  ```

### Step 3: Rewrite Chapter 3 (营销策略)

- [ ] Replace the existing Chapter 3 block with:

  ```markdown
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
  - **品牌基础层**: [backing logic, e.g., 东风×华为双巨头共创]
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
  ```

### Step 4: Rewrite Chapter 4 (行动规划) — Compact Views

- [ ] Replace the existing Phase 1/2/3 Compact blocks with:

  ```markdown
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
  - [Summary only]

  ### Phase 3: 延续转化期 / Sustain And Conversion

  #### Compact View
  ##### Online Actions
  | 时间 | 动作 | 产出物 | 关键节点 | 销售机制 | 话题标签 |
  | --- | --- | --- | --- | --- | --- |

  ##### Offline Actions
  | 时间 | 动作 | 产出物 | 关键节点 | 销售机制 |
  | --- | --- | --- | --- | --- |

  ##### Program Blueprint Card (Summary)
  - [Summary only]
  ```

### Step 5: Add Chapter 4 Expanded Views

- [ ] Append after each Phase Compact View:

  **Phase 1 Expanded:**
  ```markdown
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
  ```

  **Phase 2 Expanded:**
  ```markdown
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
    | 懂车帝/汽车之家 | 深度测评，专业干货 | 产品对比、提车指南 | 《奕境 vs 理想L9 深度对比》 |
    | 视频号 | 生活化、熟人传播 | 车主故事、活动直播 | 车主购车真实记录 |
    | 微博 | 话题制造，热搜逻辑 | 话题标签运营，舆论引导 | #武汉首台奕境DH1# |
  - **KOL/KOC分层策略**:
    - 头部KOL: [汽车垂类，专业背书]
    - 腰部KOL: [亲子/旅行/科技，场景种草]
    - KOC: [素人车主/真实体验者，口碑裂变]
  ```

  **Phase 3 Expanded:**
  ```markdown
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
  - 内容方向示例: [e.g., `《从BBA换奕境，为了家庭我做了这个选择》`]

  ##### ② 试驾价值体验活动
  - 活动创意命名: [scene-based, e.g., "江城生活·奕境随行"]
  - 场地选择理由: [urban/highway/rural road combination]
  - 静态体验区设计: [zone names, interactions, product卖点 linkage]
  - 动态试驾设计: [part/篇章式, e.g., 穿越生活/放飞自在/品味奕境]
  - KOC参与机制: [how KOCs enable circle diffusion]
  - 无痕促单设计: [natural purchase guidance in experience]

  ##### ③ 网点销售促进活动
  - 政策设计: [留资礼/预定礼/抢购礼/老带新 — each with specific权益]
  - 终端团购活动: [三人成团: 团类型/客群/政策差异化]
  - 线上引流: [daily live stream / lottery / fast conversion]
  - 线下集中大促: [regional group buying /犹豫客户二次收割]
  - 门店自媒体运营: [short video frequency / launch live rhythm]
  ```

### Step 6: Rewrite Chapter 5 & 6 and Program Blueprint Card template

- [ ] Update Chapter 5 & 6 with Compact/Expanded pattern:

  ```markdown
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
  ```

- [ ] Update Program Blueprint Card template (embedded in Chapter 4 phases) to include new fields:

  Add after `Theme and hooks`:
  ```markdown
  - **Platform content angle**: [which platforms, what differentiated content per platform]
  - **Hashtag / topic tag examples**: [≥2 concrete tags]
  ```

### Step 7: Add Template Writing Rules

- [ ] Append to the Template Writing Rules section:

  ```markdown
  - **Compact/Expanded rule (auto_regional_launch)**: Every chapter must have a Compact View (slide-ready, tables/bullets, ≤3-line paragraphs) and chapters 2–4 must have an Expanded View (full narrative depth). If a section has no Expanded content, mark `Expanded: n/a — compact sufficient`.
  - **Platform differentiation rule**: Chapter 4 Expanded must include the 5-platform table (抖音/小红书/懂车帝/视频号/微博) with content style, key direction, and concrete title examples.
  - **Derivation traceability rule**: Chapter 3 slogan and stage sub-themes must be traceable to `## Core Strategic Idea`'s `Slogan derivation logic` and `Stage sub-themes`.
  - **Creative naming rule**: Every activity in Chapter 4 must have a creative, brand-sounding name. Generic names ("KOL seeding", "线下活动") are not allowed.
  - **话题标签 rule**: Every online activity in Chapter 4 must have at least one concrete hashtag or topic tag example.
  ```

### Step 8: Verification

- [ ] Read back `skills/media-plan/shared/proposal-template.md` and confirm:
  - Chapter 1 has Compact + Expanded with core proposition, 3 key questions, mission slogan
  - Chapter 2 has Compact + Expanded with 7 subsections (2.1–2.7)
  - Chapter 3 has Compact + Expanded with three-layer value, derivation chain, 3 strategies, MAPs
  - Chapter 4 has Compact + Expanded with per-activity detail, platform differentiation table, KOL分层
  - Chapter 5 & 6 have Compact + Expanded with bid-gating
  - Program Blueprint Cards include platform content angle and hashtag fields
  - Template Writing Rules include Compact/Expanded, platform, derivation, naming, hashtag rules
  - All `auto_regional_launch` template examples are brand-agnostic (no hardcoded 奕境)

### Step 9: Commit

- [ ] Commit:

  ```bash
  git add skills/media-plan/shared/proposal-template.md
  git commit -m "feat(proposal-template): restructure auto_regional_launch with Compact/Expanded views per 3.md"
  ```

---

## Final Verification (Cross-File Consistency Check)

- [ ] **Step 1: Check cross-references**

  Run a grep to verify key terms appear consistently:
  ```bash
  grep -n "Slogan derivation logic" skills/media-plan/shared/core-strategic-idea.md skills/media-plan/phases/ideation.md skills/media-plan/SKILL.md
  grep -n "Platform differentiation" skills/media-plan/shared/highlight-mechanism-canvas.md skills/media-plan/phases/execution.md skills/media-plan/phases/proposal.md skills/media-plan/SKILL.md
  grep -n "Compact View" skills/media-plan/shared/proposal-template.md
  grep -n "Expanded View" skills/media-plan/shared/proposal-template.md
  ```

- [ ] **Step 2: Check for brand-specific leakage**

  Ensure no hardcoded brand names (奕境, DH1, 东风) remain in templates:
  ```bash
  grep -n "奕境\|DH1\|东风\|华为" skills/media-plan/shared/*.md skills/media-plan/phases/*.md skills/media-plan/SKILL.md || echo "No brand leakage found"
  ```

- [ ] **Step 3: Commit verification**

  ```bash
  git log --oneline -10
  ```

  Expected: 10 commits from Tasks 1–10.

---

## Spec Coverage Check

| Spec Section | Implementing Task |
|-------------|-------------------|
| 1A: `core-strategic-idea.md` add fields | Task 1 |
| 1B: `highlight-mechanism-canvas.md` add/enforce fields | Task 2 |
| 1C: `content-assets.md` platform-specific | Task 3 |
| 1D: `competitor-actionable.md` enrich | Task 4 |
| 2: Chapter 1 Compact/Expanded | Task 10 Step 1 |
| 2: Chapter 2 Compact/Expanded (7 subsections) | Task 10 Step 2 |
| 2: Chapter 3 Compact/Expanded (derivation, MAP) | Task 10 Step 3 |
| 2: Chapter 4 Compact/Expanded (per-activity, platform table) | Task 10 Steps 4–5 |
| 2: Chapter 5 & 6 Compact/Expanded | Task 10 Step 6 |
| 3A: SKILL.md gates | Task 9 |
| 3B: `phases/research.md` | Task 5 |
| 3B: `phases/ideation.md` | Task 6 |
| 3B: `phases/execution.md` | Task 7 |
| 3B: `phases/proposal.md` | Task 8 |
| 3C: Review loop symptoms | Task 9 Step 5 |

All spec requirements are covered. No placeholders remain.
