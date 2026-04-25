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

- Core mission: [single sentence — what this campaign must achieve]
- Key questions: [2-3 strategic questions this proposal answers]

> **Bid-gating**: If `bid_or_tender` is false or absent, this section may be collapsed to a one-paragraph brief snapshot.

## 2. 市场洞察 / Market & Consumer Insights

### 2.1 Market trend snapshot
- Category growth / technology shift / policy window in this region.

### 2.2 Competitor local benchmark (last 12 months)
- Core competitor: [name, local actions, trust path, our break]
- Key competitor: [name, local actions, trust path, our break]
- Extended competitor: [name, local actions, trust path, our break]

### 2.3 Target audience persona
- Demographics: [age, income, family structure]
- Decision drivers: [what they care about]
- Pain points: [what frustrates them]

### 2.4 City localization insight
- Distribution pattern: [where they live / gather]
- Consumption behavior: [category-specific local habits]
- Cultural anchors: [emotional / cultural touchstones]

### 2.5 SWOT (brand + model in this city)
- Strengths:
- Weaknesses:
- Opportunities:
- Threats:

## 3. 营销策略 / Core Marketing Strategy

### 3.1 Core value
- [Echo from Core Strategic Idea's Core value]

### 3.2 Marketing主线
- [Echo from Core Strategic Idea's Marketing主线]

### 3.3 Core strategy
- [2-4 strategic thrusts / pillars from Core Strategic Idea's Strategy pillars]

### 3.4 Brand fit table
| Brand tone | In this proposal |
| --- | --- |
| [tone 1] | [how the strategy expresses it] |
| [tone 2] | [how the strategy expresses it] |

## 4. 行动规划 / Phased Action Plan

### Phase 1: 预热造势期 / Pre-Heat Momentum
#### Online Actions
| 时间 | 动作 | 产出物 | 关键节点 | 销售机制 |
| --- | --- | --- | --- | --- |

#### Offline Actions
| 时间 | 动作 | 产出物 | 关键节点 | 销售机制 |
| --- | --- | --- | --- | --- |

#### Program Blueprint Card: [Program name]
- Program name and role: (awareness / circle / lead / conversion)
- Objective and audience slice:
- Theme and hooks: (include one-line theme and example hashtags)
- Mechanism design: (e.g., track setup, grouping logic, or participation routes)
- **Interaction flow**: (step-by-step user journey on-site or online: what the user does, in what order, and what triggers the next step)
- **Execution flow**: (brand-side step-by-step: launch → creation → voting → award)
- **Sales mechanism**: (conversion incentive tied to this program: e.g., "现场扫码预约试驾送定制周边", "三人成团享额外权益", "集章打卡解锁购车优惠券")
- Deliverables and asset pack: (content templates, creator assets, event materials)
- Owner and partner model:
- **Lead capture path**: (specific method and trigger: e.g., "扫码进入小程序留资 → 销售顾问24h内回访", "现场注册会员 → 自动派发试驾券")
- KPI linked to this program:
- Fallback plan:

### Phase 2: 上市引爆期 / Launch Burst
#### Online Actions
| 时间 | 动作 | 产出物 | 关键节点 | 销售机制 |
| --- | --- | --- | --- | --- |

#### Offline Actions
| 时间 | 动作 | 产出物 | 关键节点 | 销售机制 |
| --- | --- | --- | --- | --- |

#### Launch Event Plan
- Venue:
- Core agenda:
- **On-site interaction → lead capture → conversion incentive loop**: (describe the full closed loop: what visitors do on-site, how they are prompted to leave contact info, and what immediate conversion incentive they receive)
- On-site traffic collection method:
- **Circle resource integration**: (which local premium circles, clubs, or associations are invited or co-hosting, and how they are activated)

#### Program Blueprint Card: [Program name]
- Program name and role: (awareness / circle / lead / conversion)
- Objective and audience slice:
- Theme and hooks: (include one-line theme and example hashtags)
- Mechanism design: (e.g., track setup, grouping logic, or participation routes)
- **Interaction flow**: (step-by-step user journey on-site or online: what the user does, in what order, and what triggers the next step)
- **Execution flow**: (brand-side step-by-step: launch → creation → voting → award)
- **Sales mechanism**: (conversion incentive tied to this program: e.g., "现场扫码预约试驾送定制周边", "三人成团享额外权益", "集章打卡解锁购车优惠券")
- Deliverables and asset pack: (content templates, creator assets, event materials)
- Owner and partner model:
- **Lead capture path**: (specific method and trigger: e.g., "扫码进入小程序留资 → 销售顾问24h内回访", "现场注册会员 → 自动派发试驾券")
- KPI linked to this program:
- Fallback plan:

### Phase 3: 延续转化期 / Sustain And Conversion
#### Online Actions
| 时间 | 动作 | 产出物 | 关键节点 | 销售机制 |
| --- | --- | --- | --- | --- |

#### Offline Actions
| 时间 | 动作 | 产出物 | 关键节点 | 销售机制 |
| --- | --- | --- | --- | --- |

#### Program Blueprint Card: [Program name]
- Program name and role: (awareness / circle / lead / conversion)
- Objective and audience slice:
- Theme and hooks: (include one-line theme and example hashtags)
- Mechanism design: (e.g., track setup, grouping logic, or participation routes)
- **Interaction flow**: (step-by-step user journey on-site or online: what the user does, in what order, and what triggers the next step)
- **Execution flow**: (brand-side step-by-step: launch → creation → voting → award)
- **Sales mechanism**: (conversion incentive tied to this program: e.g., "现场扫码预约试驾送定制周边", "三人成团享额外权益", "集章打卡解锁购车优惠券")
- Deliverables and asset pack: (content templates, creator assets, event materials)
- Owner and partner model:
- **Lead capture path**: (specific method and trigger: e.g., "扫码进入小程序留资 → 销售顾问24h内回访", "现场注册会员 → 自动派发试驾券")
- KPI linked to this program:
- Fallback plan:

## 5. 运营检核 / Operations & Review

- Matrix management and reporting mechanism:
- Content uniformity controls:
- Effect tracking cadence:

> **Bid-gating**: If `bid_or_tender` is false or absent, output `n/a — not required for non-bid proposals`.

## 6. 服务团队 / Service Team

- Project team configuration and roles:

> **Bid-gating**: If `bid_or_tender` is false or absent, output `n/a — not required for non-bid proposals`.

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
