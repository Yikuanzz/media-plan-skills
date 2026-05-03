# media-plan Skill Optimization — 3.md Feedback Integration

## Context

`3.md` provides detailed, page-by-page feedback on the `auto_regional_launch` output of the media-plan skill. The current `auto_regional_launch` template is skeletal compared to the expected depth. This design integrates `3.md`'s requirements into both upstream shared contracts and the downstream proposal template, using a hybrid **Compact View + Expanded View** output pattern.

## Approach

**Inline Master-Detail (Approach C)**

Every major proposal chapter contains:
- A mandatory **Compact View** (PPT-ready: tables, bullets, 1–2 paragraphs max)
- An **Expanded View** below it with full narrative depth per `3.md`

This avoids content duplication while supporting both presentation and execution needs.

---

## Section 1: Upstream Contract Changes

### 1A. `core-strategic-idea.md`

Add required fields:
- `Slogan derivation logic`: Explicit derivation chain from insight dimensions derived from the brief and research (e.g., brand dimension + audience/use-case dimension + product value dimension → final slogan). The middle dimension must reflect the car's actual positioning and target audience, not be preset to "family." Must be traceable, not invented.
- `Stage sub-themes`: Pre-heat / Launch / Sustain sub-slogans derived from the main slogan.

Update existing fields:
- `Marketing主线`: Must now be provably derivable from the derivation logic.
- `Strategy pillars`: Each pillar must map to one of three core strategies (声量传播 / 出行场景 / 高效链路转化).

### 1B. `highlight-mechanism-canvas.md`

Add/enforce fields:
- `Serialized IP program` (make mandatory for all directions): Name one IP that evolves across all three stages with phase-evolution logic.
- `Creative naming convention`: Every named pillar must carry a creative, brand-sounding name (not generic like "KOL seeding").
- `Platform differentiation map`: For each stage, note which platforms get which content angles.
- `Conversion loop per pillar`: Each pillar must state its specific conversion path (attention → lead → trial → order).

Update rules:
- `Stage pillars`: Already requires ≥3 named activities per stage; now also require each to have a creative name and a hashtag/example topic tag.
- `Defensibility`: Must explain why the serialized IP cannot be copied with wording swaps.
- For `auto_regional_launch`: Each named pillar must map to one of the `Strategy pillars` from `## Core Strategic Idea`.

### 1C. `content-assets.md`

Add required structure:
- Platform-specific content lines: Separate blocks for 抖音 / 小红书 / 懂车帝 / 视频号 / 微博, each with:
  - Content style descriptor
  - Key direction
  - Concrete title examples (actual titles like `《光谷爸爸换车记》`, not "post video")

### 1D. `competitor-actionable.md`

Add required fields per competitor row:
- `Recent campaigns`: 2–3 latest marketing campaigns with timing.
- `Trust path` (expand): How they move users from "know" to "order" (key touchpoints).
- `Our break / counter-move` (enrich): One impactful strategy sentence with brand-specific posture (e.g., `从参数对比转向极致场景体验，不做 M9 追随者`).

---

## Section 2: Downstream Template Restructure (`auto_regional_launch`)

### Chapter 1: 任务课题 / Mission & Key Questions

| View | Content |
|------|---------|
| **Compact** | One-paragraph brief snapshot + 3 bullets: key questions + core slogan |
| **Expanded** | Core marketing proposition sentence; Three key questions with 1+1+1 elaboration (竞争阵地 / 全域覆盖 / 全链路转化); Core mission slogan with derivation logic note |

### Chapter 2: 市场洞察 / Market & Consumer Insights

| View | Content |
|------|---------|
| **Compact** | Summary tables only: product highlights (5 bullets), market trend (1 chart description), competitor classification table, SWOT 4-quadrant summary |
| **Expanded** | Full 7 subsections per `3.md`: 2.1 product info table + 传播感 highlights; 2.2 3-year sales data with sources, power-type split, regional channel trends; 2.3 competitor格局图 (price/intelligence/brand coordinates) + 形象对标; 2.4 per-competitor deep dive (5 dimensions each + recent campaigns); 2.5 persona classification (2–4 types, each full profile); 2.6 regional deep dive (consumption trends, media habits, spatial distribution, cultural anchors); 2.7 SWOT with region-specific scenarios |

### Chapter 3: 营销策略 / Core Marketing Strategy

| View | Content |
|------|---------|
| **Compact** | Value proposition (1 sentence) + 3 strategy pillars table + main slogan + 3 stage sub-slogans |
| **Expanded** | 3.1 Three-layer value presentation (品牌基础层 / 痛点解决层 with 3 value propositions / 产品目标层); 3.2 Full slogan derivation chain (brand dimension + audience/use-case dimension + product value dimension → slogan); dimensions must match the car's positioning, not default to family; 3.3 Three core strategies with 内涵解释 + 落地动作举例 each; 3.4 Marketing MAP table + Communication MAP table |

### Chapter 4: 行动规划 / Phased Action Plan

| View | Content |
|------|---------|
| **Compact** | Three phase tables (Online / Offline) with columns: 时间 / 动作 / 产出物 / 关键节点 / 销售机制. One Program Blueprint Card per phase (summary only). |
| **Expanded** | **Phase 1**: Each online activity with 创意命名 / 目的 / 亮点 / 玩法 / 执行流程 / 平台差异 / 转化闭环 / 话题标签; Each offline activity with 命名 / 目的 / 选址逻辑 / 亮点 / 活动形式 / 激励机制 / 转化路径 / 传播动作. **Phase 2**: 现场核心环节 (venue rationale with 1–2 alternatives, spatial layout zones, detailed agenda flow: 引流→价值讲解→亮相→收尾钩子→促单); 现场集客环节 (per-activity: name + gameplay + audience fit + brand link + lead capture + path to main event); 上市会传播环节 (传播内容规划图表: N-7 / N / N+3 timeline, per-stage topic + action + content examples + platform strategy + KOL分层). **Phase 3**: Spiral上升 logic diagram; 口碑传递 (naming / content strategy / KOC沙龙 /传播链路 / examples); 试驾体验 (naming / venue rationale / static+动态设计 / KOC机制 / 无痕促单); 网点销售促进 (policy design / 团购 / 直播 / 大促 / 自媒体运营). |

### Chapter 5 & 6: 运营检核 + 服务团队

| View | Content |
|------|---------|
| **Compact** | Org chart + group list + tracking cadence (5–6 bullets) |
| **Expanded** | Matrix management structure (org chart with roles); Group management mechanism (which groups, what they do); Material distribution flow (create→review→distribute→forward→feedback); Effect feedback mechanism (data aggregation, checkpoint schedule) |

### Template Writing Rules (new)

- Every **Compact View** must fit on 1–2 PPT slides (tables + bullets only, no paragraphs >3 lines).
- Every **Expanded View** must reference upstream contracts explicitly (e.g., "Derivation logic from `## Core Strategic Idea`").
- If a section has no Expanded content (e.g., non-bid 运营检核), mark `Expanded: n/a — compact sufficient`.
- Platform differentiation in Chapter 4 Expanded must use the 5-platform table from `3.md` (抖音/小红书/懂车帝/视频号/微博).

---

## Section 3: Phase Gate & Workflow Updates

### 3A. SKILL.md Global Gates

| Gate | Current | New |
|------|---------|-----|
| **Research pass** | `## Competitor Actionable View` exists | Also: each core/key competitor has 5 dimensions (定位/营销打法/渠道策略/信任路径/应对策略) + 2–3 recent campaigns; city pack includes consumption trends, media habits, spatial distribution, cultural anchors |
| **Research pass** | `## City Evidence Pack` complete | Also: data points have explicit sources (乘联会/懂车帝/etc.); regional vs. national variance explained |
| **Ideation pass** | `## Core Strategic Idea` filled | Also: `Slogan derivation logic` present and traceable; `Stage sub-themes` present for 预热/引爆/延续 |
| **Ideation pass** | `## Highlight Mechanism Canvas` complete | Also: every stage pillar has a creative name (not generic); `Serialized IP program` named with phase-evolution logic; `Platform differentiation map` noted per stage; `Conversion loop per pillar` stated |
| **Execution pass** | `## Validated Execution-Plan Handoff` validated | Also: platform-specific content lines exist per `content-assets.md` (抖音/小红书/懂车帝/视频号/微博); each program card has lead capture path + sales mechanism |
| **Proposal pass** | All template sections present | Also: every chapter has Compact View; Expanded View present for chapters 2–4; chapter 4 has per-activity hashtag examples; platform differentiation table present |

### 3B. Phase File Updates

**`phases/research.md`**
- Competitor deep-dive must use `competitor-actionable.md` new fields (5 dimensions + recent campaigns).
- City signal module must cover consumption trends, media habits, spatial distribution, cultural anchors — not just industrial clusters.
- Source attribution is mandatory for all market data claims.

**`phases/ideation.md`**
- Validation check: if any stage pillar has a generic name ("KOL seeding", "线下活动"), mark `revise`.
- Validation check: if `Slogan derivation logic` is missing or the slogan appears invented, mark `revise`.
- Validation check: if no serialized IP spans all three stages, mark `revise`.

**`phases/execution.md`**
- Program Blueprint Cards must include `Platform content angle` (which platform gets what message).
- Program Blueprint Cards must include `Hashtag / topic tag examples` (≥2 per program).
- For auto_regional_launch, offline actions table must have non-empty `销售机制` per existing rule; now also enforce online actions have `话题标签` column.

**`phases/proposal.md`**
- Review Pass checks for Compact/Expanded view completeness.
- Review Pass checks for platform differentiation table presence in Chapter 4.
- Review Pass checks for derivation logic traceability (slogan must map back to `Core Strategic Idea`).

### 3C. Review Loop — New Symptom → Route Mappings

| Symptom | Route |
|---------|-------|
| Missing slogan derivation or stage sub-themes | `ideation` |
| Generic stage pillar names (no creative naming) | `ideation` |
| Missing serialized IP or weak phase-evolution logic | `ideation` |
| Competitor analysis lacks 5 dimensions or recent campaigns | `research` |
| City evidence lacks regional consumption/media/spatial data | `research` |
| Missing platform differentiation or hashtag examples | `execution` |
| Compact/Expanded view mismatch or missing | `proposal_enrich` |

---

## Files to Modify

| File | Change Type |
|------|-------------|
| `skills/media-plan/shared/core-strategic-idea.md` | Add fields, update rules |
| `skills/media-plan/shared/highlight-mechanism-canvas.md` | Add/enforce fields, update rules |
| `skills/media-plan/shared/content-assets.md` | Add platform-specific structure |
| `skills/media-plan/shared/competitor-actionable.md` | Add fields per row |
| `skills/media-plan/shared/proposal-template.md` | Restructure `auto_regional_launch` template |
| `skills/media-plan/SKILL.md` | Update global gates |
| `skills/media-plan/phases/research.md` | Add module requirements |
| `skills/media-plan/phases/ideation.md` | Add validation checks |
| `skills/media-plan/phases/execution.md` | Add card fields, column rules |
| `skills/media-plan/phases/proposal.md` | Add review checks |

---

## Out of Scope

- Changes to `general_proposal` template structure (only `auto_regional_launch` is affected).
- New research modules (existing `competitor-deep.md` and `city-signal.md` are enriched via contract changes, not new files).
- UI or frontend changes (this is a markdown skill optimization).
