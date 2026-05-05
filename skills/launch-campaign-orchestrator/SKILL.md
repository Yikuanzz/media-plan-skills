---
name: launch-campaign-orchestrator
description: >
  Use when generating a launch campaign communication proposal. Runs a
  hotspot-driven divergent workflow through pre-brief search, intake, insight,
  hotspot harvest, narrative spine, activity card draw, lead pool packaging,
  strategy plan, and proposal assembly. Triggers:
  上市传播, 新车上市, launch campaign, 传播方案, 上市策划, 上市活动方案.
---

# Launch Campaign Orchestrator

## Purpose

Run the full launch campaign proposal workflow in this package only:
Pre-brief Search → Intake → Insight → **Hotspot Harvest** → Narrative Spine →
**Activity Card Draw** → Lead Pool (Packaging) → Strategy Plan → Proposal Assembly.

Enforces hotspot-driven divergence, packaging-time spine reconciliation,
emotional state-machine design, lead lifecycle management, idea fusion,
energy curve rhythm, and variable-depth proposal writing.

## Global Execution Discipline (mandatory)

1. **SERIAL PHASES ONLY** — Run phases in order. Do not skip forward or merge
   multiple unresolved phases into one pass.
2. **BLOCKING = HARD STOP** — Stage transitions require explicit user confirmation.
3. **NO CROSS-PHASE BUNDLING** — Do not draft proposal while upstream gates are unresolved.
4. **NO SPECULATIVE BACKFILL** — Pre-brief signals narrow questions only.
5. **RUNTIME SCOPE** — Use only `./phases/*.md` and `./shared/*.md` as runtime contracts.
6. **DIVERGE FIRST, PACKAGE LATER** — During Hotspot Harvest and Activity Card Draw,
   Spine is **not** a generation gate. Raw ideas may carry `spine_friction: high`
   and still be preserved. Spine becomes a packaging contract only at Lead Pool
   Packaging and Strategy Plan. Leads still require `narrative_alignment` in the
   final pool, but it can be filled via `packaging_pass: reworked` (with a
   substantive `rework_note`) rather than direct alignment. A pool with zero
   reworked leads signals lost distinctiveness — return to Activity Card Draw.
7. **CREATIVE HEAT OVER BUDGET** — Hot ideas are not vetoed by budget. Use fuzzing,
   downplaying, or overflow strategies instead.
8. **VARIABLE DEPTH** — S-tier gets full plans, A-tier gets summaries, B-tier gets
   packaging notes. Do not write 2000 words for every activity.
9. **LEAD LIFECYCLE IS MANDATORY** — Active leads are capped at 40. Auto-compression
   triggers on duplication threshold >0.7.
10. **ENERGY CURVE DESIGN** — Intensity 100 appears once. Adjacent stages differ
    by ≥20. White space is intentional.
11. **MEMORY ANCHOR CHECK** — S-tier and A-tier activities must have a memory anchor
    that passes the "one year test".
12. **HOTSPOT BRIDGE OVER BUZZWORDS** — Any borrow from public heat must be
    evidence-traceable (`HS-*`, `TR-*`, `CS-*`, or grounded pre-brief signal), include a named
    `angle_of_entry` mechanism, and serve the Narrative Spine—never confuse stacked
    keywords with topical relevance.
13. **HOTSPOT-FIRST FUEL** — Lead Pool generation starts from `HS-*` hotspot atoms
    crossed with the activity card deck, not from product features. ≥60% of active
    leads in the final pool must reference at least one `HS-*` atom in `hotspot_lineage`.
    A pool dominated by product-self-narration leads is rejected and routed back to
    Hotspot Harvest / Activity Card Draw.
14. **NO HARDCODED PROJECT VARIABLES** — Skill files (phases / shared) must not bake
    in any specific city, brand, product, calendar window, or scoring rubric. All
    project-specific values flow through `./shared/brief-intake-template.md` as
    `{target_city}` / `{brand}` / `{product}` / `{launch_window}` / `{category}` /
    `{competitor_set}` / `{evaluation_rubric}` placeholders. City-specific grounding
    derives via `./shared/local-grounding-pattern.md`; tender rubrics bind via
    `./shared/scoring-rubric-binding.md`. Concrete cities, brands, dates, or rubrics
    appearing in skill files must be **clearly labeled `EXAMPLE`** and not be load-bearing.
15. **ARCHITECT FIRST, COMPOSE LATER** — Proposal Assembly must produce three
    explicit decisions in order: (a) **Architecture Decision** — pick a narrative
    pattern from `./shared/proposal-template.md` (or design a new one), with ≥2
    candidates considered and rationale tied to *this* brief's intake/Spine/Lead Pool;
    (b) **Voice Decision** — codify tonality, slogan rhythm, dominant metaphor /
    center claim, visual key, and pick **4–7** surface mechanics from `./shared/proposal-style-guide.md`'s
    menu (fewer = under-produced, 8+ = template-党); (c) **Content Fill** — compose
    the chosen architecture's elements with the chosen voice. The element list must
    not match (≥80% sequence + naming) any reference / public deck. Slogans / 三段式 /
    hero event names must not be verbatim copies. Information coverage (per
    `proposal-template.md` Coverage Contract) is the universal contract — chapter count
    and chapter names are AI's call, not the skill's.
16. **HERO EXPANSION MANDATE** — Proposal Assembly 阶段须把 hero events 与 stage 总览
    展开到与"丰盈"参考方案对齐的颗粒：(a) **每个 S 级 lead** 必须按
    `./shared/proposal-template.md` 的 `## Hero Event Expansion Pattern` **五模块**
    （A 场地与空间 / B 核心内容环节 ≥3 子环节并列分解 / C 现场集客 / D 传播配套阶段化
    N-7 / N / N+3 / E 留资 + 预算 + KPI）展开，单个 hero markdown ≥150 行；
    (b) **每个 stage / battle / week chunk** 必须落 1 张 `## Stage MAP Pattern` 6 列
    总览大表（节奏目标 / 区域动作 / 终端动作 / 传播动作 / 传播内容示意 / 传播渠道矩阵），
    "传播内容示意"列必须从该 stage hero event 模块 D 的成稿标题中真实引用；
    (c) **每个主要传播阶段**必须有 ≥5 条**成稿颗粒**文章标题示例（《……记：从…到…》）+
    ≥1 内容脚本骨架 + ≥1 # 话题词 + ≥3 圈层 KOL/KOC 类型分组——关键词候选 / 短句 /
    话题片段不算成稿，必 fail。三件均为 Proposal Assembly 完成的硬门槛，对应
    Q37 / Q38 / Q30 升级版，触发 fail 时回 Step 4.5 / Step 4.6 / Step 4 模块 D。

## Artifact root (`{artifact_root}`) — mandatory

All **project deliverables** (phase outputs, rubric binding, proposal, etc.) are files
under a single directory resolved as `{artifact_root}`:

1. **Preferred** — Path the user names at workflow start (the engagement / brief /
   tender folder), absolute or relative to the workspace.
2. **Default** — When the user does not name one, use the **workspace root** (the root
   folder of the active Cursor project / repo the agent is working in).

**Hard rules**

- Every persisted artifact path is `{artifact_root}/<relative-path>` using the
  canonical relative paths in the table below (unless the user explicitly overrides
  the folder layout for that engagement).
- **Do not** write engagement artifacts into `./phases/`, `./shared/`, or anywhere
  inside the `launch-campaign-orchestrator` skill package — those paths are
  **runtime contracts only**. Updating the skill repo itself is an explicit exception
  and must be called out in the Phase Switch block.
- Phase Switch **must** show a resolved `Write path` (e.g. `Write path:
  ./run/my-engagement/03-strategy-plan.md` or an absolute path), not a bare filename.

**Canonical relative paths under `{artifact_root}`** (Insight + Spine are flat at root):

| Relative path | Phase / role |
|---|---|
| `00-pre-brief.md` | Pre-brief Search (resolved status + contract blocks) |
| `00-intake.md` | Intake (normalized brief + status) |
| `00-rubric-binding.md` | Rubric binding (when `bid_or_tender = true`) |
| `01a-product-value.md` … `01f-trend-signal.md` | Insight modules |
| `01g-narrative-spine.md` | Narrative Spine |
| `01h-hotspot-harvest.md` | Hotspot Harvest |
| `02a-activity-cards.md` | Activity Card Draw |
| `02-lead-pool.md` | Lead Pool |
| `03-strategy-plan.md` | Strategy Plan |
| `04-proposal.md` | Proposal Assembly — 评审视角的成品稿（不含自检区块） |
| `04a-self-audit.md` | Proposal Assembly — 内部审计稿（Coverage Map / Voice Audit / Originality Audit / Hero & Stage Self-Check / Mechanic Fulfillment / Saturation Pass 全部落此） |

## Phase Index

| Phase file | Stage | Purpose |
|---|---|---|
| `./phases/pre-brief-search.md` | Pre-brief Search | Lightweight public signals before formal intake |
| `./phases/intake.md` | Intake | Normalize brief fields |
| `./phases/insight.md` | Insight | Build atomic insight resources (PV/ME/CL/AU/CS/TR) |
| `./phases/hotspot-harvest.md` | Hotspot Harvest | Capture `HS-*` public-attention beats across 6 buckets |
| `./phases/narrative-spine.md` | Narrative Spine | Build worldview + state machine + memory anchor (read-for-context during card draw) |
| `./phases/activity-card-draw.md` | Activity Card Draw | Divergent raw-idea generation; double-dose; no spine gate |
| `./phases/lead-pool.md` | Lead Pool (Packaging) | Cluster RI-*, promote to L-*, reconcile spine via direct/reworked |
| `./phases/strategy-plan.md` | Strategy Plan | Hotspot timeline + narrative arc + Energy Curve + city-pack grounding matrix |
| `./phases/proposal-assembly.md` | Proposal Assembly | Deep processing + Review Pass |

## Shared Contract Index

| Shared file | Role |
|---|---|
| `./shared/brief-intake-template.md` | **Single source** of project-specific variables (city/brand/product/window/rubric) |
| `./shared/local-grounding-pattern.md` | City pack derivation (G1–G9 geography categories, C1–C12 channel categories, local signatures) — replaces hardcoded city-specific lists |
| `./shared/scoring-rubric-binding.md` | Tender rubric binding — maps any procurement scoring rubric onto internal scorecard evidence |
| `./shared/pre-brief-source-map.md` | Pre-brief source priorities |
| `./shared/hotspot-source-map.md` | Hotspot Harvest source buckets (节庆/情绪/文娱/城市/模因/跨界) |
| `./shared/hotspot-atom-template.md` | `HS-*` atom schema and quality gate |
| `./shared/source-trust-policy.md` | Evidence trust tiers |
| `./shared/query-playbook.md` | Query patterns and routing (incl. Hotspot Harvest queries with variable substitution) |
| `./shared/hotspot-angle-playbook.md` | Hotspot creative engine: prompt formulas + double-dose rule + anti–1+1 filter |
| `./shared/activity-card-deck.md` | 24-card divergence deck (8 directions × prompt formulas × city-pack-derived hooks) |
| `./shared/narrative-spine-template.md` | Spine schema, transitions, quality gates |
| `./shared/lead-template.md` | Lead entry schema (incl. hotspot_lineage / divergence_card / packaging_pass / dual-dose) |
| `./shared/fusion-rules.md` | Fusion basis priority and compression rules |
| `./shared/idea-scorecard.md` | Scoring dimensions including Hotspot Coverage + Divergence Quality |
| `./shared/energy-curve-template.md` | Energy curve design principles |
| `./shared/proposal-template.md` | Proposal **architecture playbook** — Information Coverage Contract + library of 8 narrative patterns (A–H) + decision procedure; AI picks per brief, not a fixed template |
| `./shared/proposal-style-guide.md` | Proposal **voice & taste** — eight qualities of good planning voice (人话洞察 / 痛点闭环 / 传播具象化 / 节奏感 / 主张可记 / 不端着 / 评审视角 / 自洽气质) + 12 optional surface mechanics to mix-and-match |
| `./shared/quality-self-check.md` | Review Pass criteria |

## Phase Switch Protocol

Before entering each phase, read its phase file and every shared file listed
for that phase. Then emit:

```markdown
## [Phase: <StageName>]
Read: <phase path> + <shared paths>
Write path: {artifact_root}/<relative-path>   # resolved to concrete path in this run
Task: <one-line objective for this phase>
```

Do not skip required reads.

First-phase bootstrap: when cold-starting the workflow, begin with `./phases/pre-brief-search.md`, reading `./shared/pre-brief-source-map.md` and `./shared/query-playbook.md`, before Intake.

## Global Hard Gates

- Do not start **Intake** until Pre-brief Search has resolved with status `used`, `skipped`, or `inconclusive`.
- Do not start **Insight** until intake has all research-start fields.
- Do not start **Hotspot Harvest** until Insight has ≥3 modules with findings
  and ≥2 Atomic Resources per module, and (when `intake.bid_or_tender = true`)
  Rubric Binding (`{artifact_root}/00-rubric-binding.md`) is produced via `./shared/scoring-rubric-binding.md`.
- Do not start **Narrative Spine** until Hotspot Harvest produces ≥12 `HS-*`
  atoms covering ≥4 of 6 buckets, with ≥3 atoms carrying `regional_relevance: {target_city}含金量 medium|high`,
  and a `## City Pack` section is appended per `./shared/local-grounding-pattern.md`.
- Do not start **Activity Card Draw** until Narrative Spine passes all quality
  gates (Spine is read for context, not as a generation gate).
- Do not start **Lead Pool (Packaging)** until Activity Card Draw produces
  ≥30 raw ideas (`RI-*`) with `hotspot_lineage`, double-dose filled, and the
  coverage gates in `./phases/activity-card-draw.md`.
- Do not start **Strategy Plan** until Lead Pool has ≥10 valid leads covering
  ≥3 Value Categories and ≥2 Execution Tiers, **HS coverage ≥60%**,
  **packaging mix has both `direct` and `reworked`**, and meets the
  hotspot-density / hotspot-key requirements in `./phases/lead-pool.md`.
- Do not start **Proposal Assembly** until Strategy Plan is explicitly
  user-confirmed and the Rubric Binding gap list (when applicable) is closed.
- Do not declare completion until `{artifact_root}/04-proposal.md` passes Review Pass.

## Within-Stage Expansion Protocol

When user requests modifications within the current stage:
1. Identify the target artifact file under `{artifact_root}`.
2. Apply modification (add / edit / delete).
3. Emit brief change summary.
4. **Do not** emit "advancing to next stage" unless user explicitly requests it.

When user requests upstream modifications while in a downstream stage:
1. Allow writing to upstream files.
2. Emit: "已更新 upstream 文件 X，当前仍在 [Current Stage] 阶段。"
3. Continue awaiting stage-specific instructions.

## Symptom → Upstream Return

| Symptom | Return to |
|---|---|
| Brief too vague to form search queries | Pre-brief Search — emit `skipped` or rerun with minimal signals |
| Missing intake fields | Intake — ask only for missing fields |
| Weak or missing insight | Insight — load modules, re-research |
| Hotspot atoms are industry trend reports | **Hotspot Harvest** — re-do bucket sweep using `hotspot-source-map.md` |
| Hotspot atoms missing time/audience/emotion | **Hotspot Harvest** — re-do schema check |
| Spine quality gate fail | Narrative Spine — rebuild tension/arc/transitions |
| Lead pool only orbits product, no public heat | **Hotspot Harvest** + **Activity Card Draw** — refuel and redraw |
| Activity card draw too tame / no spine_friction | **Activity Card Draw** — redraw with aggressive cards |
| Lead pool has zero `reworked` packaging | **Activity Card Draw** (under-supply) or **Lead Pool** Step 3 (refused to rework) |
| Pool-wide Hotspot Coverage avg <6 | **Activity Card Draw** — atom diversity insufficient |
| Review Pass superficial hotspot checklist | Proposal Assembly → **Lead Pool** (or Hotspot Harvest if `HS-*` missing) |
| Lead pool too fragmented | Lead Pool — trigger compression / fusion |
| Narrative drift in proposal | Strategy Plan — realign lead map to spine |
| Energy curve collapse | Strategy Plan — redistribute intensity |
| Creative density too high | Proposal Assembly — compress, add white space |
| Review Pass fail (Info Type uncovered) | Proposal Assembly — expand or insert element |
| Review Pass fail (Voice Quality 1–8) | Proposal Assembly — return to relevant element and rewrite |
| Review Pass fail (Architecture too template-党) | Proposal Assembly Step 1 — re-pick pattern or hybridize |
| Review Pass fail (Q37 Hero 展开不足 / S 级 < 150 行 / 缺五模块任一) | Proposal Assembly Step 4.5 Hero Expansion Pass — 当场补全 |
| Review Pass fail (Q38 Stage 缺 MAP 总览 / 列数不足 / 内容引用编造) | Proposal Assembly Step 4.6 Stage MAP Pass — 为缺失 stage 补 MAP |

## Completion Gate

Declare completion only when:
- Pre-brief Search resolved (`used`, `skipped`, or `inconclusive`).
- Intake is ready.
- Insight has ≥3 modules with Atomic Resources.
- Hotspot Harvest produced ≥12 `HS-*` atoms covering ≥4 buckets with ≥3 `{target_city}`-relevant atoms; City Pack section is appended.
- (When `bid_or_tender = true`) Rubric Binding `{artifact_root}/00-rubric-binding.md` exists with no open gaps.
- Narrative Spine passes all quality gates.
- Activity Card Draw produced ≥30 raw ideas with double-dose, HS-coverage, and `{target_city}`-local-hook gates met.
- Lead Pool has ≥10 valid leads with narrative alignment, HS coverage ≥60%, and both `direct`+`reworked` packaging present; satisfies the hotspot key + hotspot-density gates in `./phases/lead-pool.md`.
- Strategy Plan is user-confirmed with hotspot timeline, energy curve, and lead map.
- Proposal Assembly passes Review Pass, including the four Hero Expansion Mandate sub-gates:
  - **Hero Event Expansion Pass** (Q37): 每个 S 级 lead 五模块自检清单全部打勾，markdown ≥150 行；全案 ≥3 个 S 级 hero 时使用 ≥2 种不同分解法（赛道 / 篇章 / Step / Part）。
  - **Stage MAP Pass** (Q38): 每个 stage / battle / week chunk 末尾各有 1 张 6 列 MAP 大表，"传播内容示意"列引用真实成稿标题。
  - **Headline-not-keyword** (Q30 升级版): 每个主要传播阶段 ≥5 条成稿颗粒文章标题示例 + ≥1 脚本骨架 + ≥1 # 话题词 + ≥3 圈层 KOL/KOC 分组。
  - **Voice & Local Saturation Pass** (Step 4.7): 隐喻下渗 / 本地饱和 / 分解法多样 / Mechanic 兑现 / 中文流畅 / 终端销售机制覆盖 / 自检洁净 七项全 pass。
- `{artifact_root}/04-proposal.md` is persisted（**不含自检区块**，仅成品 + Rubric-Surface Map）；`{artifact_root}/04a-self-audit.md` is also persisted（内部审计凭证）.
