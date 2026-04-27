# Design: Align media-plan skill output with TARGET_REAL bid quality

## Context

The `media-plan` skill's `auto_regional_launch` mode produces creative-rich proposals that lack the **strategic derivation layer** and **bid-document structure** demonstrated by the TARGET_REAL reference (奕境品牌首款全尺寸 SUV 武汉区域上市整合营销方案). This design modifies 5 files to close the gap.

## Design principles

1. **Preserve existing workflows** — No phase sequencing changes; no new gates; no mandatory-fail additions that break non-bid briefs.
2. **Bid-gated sections** — Sections that only matter for bid/tender responses (任务课题, 运营检核, 服务团队, 评分对应) are gated behind `bid_or_tender=true`.
3. **Strategy-before-creative** — Require `Core value` → `Marketing主线` → `Strategy pillars` before execution planning, so proposals read as strategy-derived rather than tactic-stacked.
4. **Traceability** — Every downstream proposal section must be traceable to an upstream ideation or research block.

## Files changed

| File | Change |
|---|---|
| `shared/proposal-template.md` | Restructure `auto_regional_launch` to 6-chapter TARGET_REAL flow |
| `shared/core-strategic-idea.md` | Add `Core value`, `Marketing主线`, `Strategy pillars` fields |
| `shared/highlight-mechanism-canvas.md` | Echo strategy fields; strengthen `Local life map`; add pillar mapping |
| `phases/ideation.md` | Mandate 5-field core idea for auto launch; validate multi-selection compatibility |
| `shared/research-rubric.md` | Add 3 recommended research depth items; new output block; enrich ammunition |

---

## 1. `shared/proposal-template.md` — Restructure `auto_regional_launch`

### Current structure (9 sections)

1. Market And Competitor Insights
2. Core Strategy
3. Phase 1: Pre-Heat Momentum
4. Phase 2: Launch Burst
5. Phase 3: Sustain And Conversion
6. Execution Action Playbook
7. Full-Funnel Conversion Path
8. KPI System And Budget Split
9. Risk Playbook

### New structure (6 chapters + appendices)

```
1. 任务课题 / Mission & Key Questions
2. 市场洞察 / Market & Consumer Insights
3. 营销策略 / Core Marketing Strategy
4. 行动规划 / Phased Action Plan
5. 运营检核 / Operations & Review        [bid-only]
6. 服务团队 / Service Team                [bid-only]

Appendix A. 评分对应 / Rubric Mapping     [bid-only, when evaluation_rubric present]
Appendix B. 风险应对 / Risk Playbook
Appendix C. 预算分配 / Budget Split
```

### Chapter details

**Chapter 1: 任务课题 / Mission & Key Questions**

- `bid_or_tender=true`: Full section with 核心任务 + 2-3 核心课题 (strategic questions the proposal must answer).
- `bid_or_tender=false`: Collapse to a brief snapshot (1 paragraph summarizing goal and scope).

**Chapter 2: 市场洞察 / Market & Consumer Insights**

- Market trend snapshot (category growth, technology shift, policy window).
- Competitor analysis with tiers: 核心竞品 / 重点竞品 / 延展竞品.
- Target audience persona (age, income, family structure, decision drivers, pain points).
- City localization insight (distribution patterns, consumption habits, cultural anchors).
- SWOT analysis (本品 in this city).

**Chapter 3: 营销策略 / Core Marketing Strategy**

- Core value (echo from `## Core Strategic Idea`).
- Marketing主线 (echo from `## Core Strategic Idea`).
- Core strategy (2-4 strategic thrusts / pillars).
- Brand fit table (brand tone → strategy action mapping).

**Chapter 4: 行动规划 / Phased Action Plan**

- Phase 1: 预热造势期 — action table + **embedded Program Blueprint Card(s)**.
- Phase 2: 上市引爆期 — action table + **embedded Program Blueprint Card(s)**.
- Phase 3: 延续转化期 — action table + **embedded Program Blueprint Card(s)**.

Each phase table includes: 时间 / 动作 / 产出物 / 关键节点 (matching TARGET_REAL's column set).

**Chapter 5: 运营检核 / Operations & Review** [bid-only]

- Matrix management and reporting mechanism.
- Content uniformity controls.
- Effect tracking cadence.
- Collapse to `n/a` when `bid_or_tender=false`.

**Chapter 6: 服务团队 / Service Team** [bid-only]

- Project team configuration.
- Collapse to `n/a` when `bid_or_tender=false`.

**Appendix A: 评分对应 / Rubric Mapping** [bid-only, when `evaluation_rubric` present]

- Map each scoring dimension to proposal chapter + evidence.
- Include self-assessment score estimates per dimension (innovation, executability, competitor benchmark, brand fit, logic).

**Appendix B: 风险应对 / Risk Playbook**

- Risk table with stage, impact, mitigation, trigger owner.

**Appendix C: 预算分配 / Budget Split**

- Module / KPI / Budget ratio / Measurement cadence.

### Program Blueprint Cards

- Cards are **embedded inside Chapter 4 phases**, not a standalone section.
- Minimum one card per phase.
- Each card must include: Program name, Objective, Theme/hooks, Mechanism design, Execution flow, Deliverables, Owner, Lead capture, KPI, Fallback plan.

---

## 2. `shared/core-strategic-idea.md` — Add strategic derivation layer

### New required fields

```md
## Core Strategic Idea
### [Direction name]
- One-line claim: [campaign-line / proposition level]
- Core value: [2-4 product-truth pillars, e.g. "全尺寸 | 高智能 | 超安全"]
- Marketing主线: [emotional narrative thread, e.g. "奕家主场 · 境享美好"]
- Core contradiction: [what the audience does not believe]
- Resolution path: [how comms and experience resolve it; must name proof type]
- Strategy pillars: [2-4 strategic thrusts, e.g. 声量饱和攻击 / 场景高频体验 / 链路高效转化]
```

### Rules

- `Core value` must be product-truth-based, not slogans. Format: 2-4 keyword pillars separated by `|`.
- `Marketing主线` must connect product truth to audience emotion. Quotable as chapter headline.
- `Strategy pillars` must name strategic thrusts (not tactics) that organize all downstream execution. Every phase action must map to at least one pillar.
- These three new fields are **mandatory** for `auto_regional_launch`; strongly recommended for `general_proposal`.
- Downstream binding: Chapter 3 of proposal echoes these fields directly.

---

## 3. `shared/highlight-mechanism-canvas.md` — Canvas alignment

### Added fields

```md
## Highlight Mechanism Canvas
### [Direction name]
- Theme:
- Core value: [must align with Core Strategic Idea's Core value]
- Marketing主线: [must align with Core Strategic Idea's Marketing主线]
- Core tension:
...
```

### Validation rule

- If canvas `Core value` or `Marketing主线` contradicts the `## Core Strategic Idea` block, mark direction `revise`.

### Strengthened `Local life map`

- Current: "at least three concrete city-life slices"
- New: "at least three concrete city-life slices, with **at least one** showing:
  - Audience distribution pattern (e.g. '一江两湖三极')
  - Local consumption behavior insight (e.g. '混动车型渗透率高于全国平均')
  - Or cultural/emotional anchor (e.g. '过早文化')"

### Strengthened `Stage pillars` for auto launch

- Each stage's pillars must also map to one of the `Strategy pillars` from `## Core Strategic Idea`.
- Example: `[name] — 声量 — maps to Strategy pillar: 声量饱和攻击`

---

## 4. `phases/ideation.md` — Ideation rules for strategy derivation

### New mandatory output rule (before scoring)

For `auto_regional_launch`, a `keep` direction is **invalid** unless its `## Core Strategic Idea` block contains all five fields:
1. `One-line claim`
2. `Core value`
3. `Marketing主线`
4. `Core contradiction`
5. `Resolution path`

If any field is missing or placeholder-only, mark `revise`, not `keep`.

### Propagation-theme-clarity enforcement

- `One-line propagation theme`, `City or regional emotional binding`, `Product-sellpoint mapping`, `Hashtag extensibility` must appear in `## Core Strategic Idea` or `## Highlight Mechanism Canvas` (not just in Notes).

### New Notes requirement

- `Strategy pillars`: [2-4 strategic thrusts that organize execution]

### Multi-selection compatibility rule

When co-directions are selected, verify their `Core value` and `Marketing主线` are either identical or hierarchically compatible. Contradictory core values → reject the combination.

---

## 5. `shared/research-rubric.md` — Selective depth enhancement

### Enhanced `## City Evidence Pack`

Add three **recommended** (not mandatory-fail) sub-items:

```md
## City Evidence Pack
- Circle map: (existing)
- Event and hotspot calendar: (existing)
- Competitor local actions (12 months): (existing)
- KOL/KOC matrix: (existing)
- Premium venue pool: (existing)
- Audience persona: [age/income/family structure/decision drivers/pain points]
- City localization insight: [consumption patterns, distribution maps, cultural anchors]
- Market trend snapshot: [category growth, technology shift, policy window]
```

- Research can `pass` without these three, but they must be flagged in `## Gaps` if missing.

### New output block

```md
## Audience & Market Context
- Target audience persona:
- Market trend (region + category):
- City localization insight:
```

### Enriched `## Proposal Ammunition`

Add:
- `Strategic derivation anchors`: [inputs for Core value / Marketing主线]
- `Family/emotional scene hooks`: [emotional entry points beyond tech specs, for family-SUV briefs]

---

## Scope boundaries

### In scope
- Proposal template restructuring for `auto_regional_launch`
- Strategy derivation layer (core value, marketing主线, strategy pillars)
- Bid-gating logic for 任务课题 / 运营检核 / 服务团队 / 评分对应
- Program Blueprint Card embedding in phased action plan
- Research depth recommendations (audience persona, city insight, market trend)
- Ideation validation rules for strategy completeness

### Out of scope
- Changes to `general_proposal` template structure (only guidance, not restructuring)
- New phase files or new shared contracts
- Changes to pre-brief search, intake, or execution phase workflow sequencing
- Changes to inspiration-directions library
- Changes to source-trust-policy or query-playbook
- New research module files

---

## Implementation order

1. `shared/core-strategic-idea.md` — Add fields (no downstream dependencies).
2. `shared/highlight-mechanism-canvas.md` — Add echo fields and strengthen rules.
3. `shared/research-rubric.md` — Add recommended items and new output block.
4. `phases/ideation.md` — Add validation rules (depends on 1 and 2).
5. `shared/proposal-template.md` — Restructure template (depends on all above).
