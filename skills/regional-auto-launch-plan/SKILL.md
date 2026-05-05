---
name: regional-auto-launch-plan
description: Use when handling an automotive regional launch planning brief that needs a gated, evidence-backed workflow across insight, strategy, staged actions, operations, and proposal review.
---

# regional-auto-launch-plan

## Purpose

Run the full automotive regional launch workflow in this package only: pre-brief search -> intake -> insight -> strategy -> action -> operations -> service team -> proposal -> review loop. Enforce regional small-budget realism, phase-by-phase gates, and explicit user confirmations at the defined blocking points.

## Global execution discipline (mandatory)

1. **SERIAL PHASES ONLY** - Run phases in order. Do not skip forward or merge multiple unresolved phases into one pass.
2. **BLOCKING = HARD STOP** - Marker `BLOCKING-A` requires explicit user confirmation before continuing. Phase transitions in Action (was BLOCKING-B/C/D) now use Auto-Display Checkpoints and proceed automatically.
3. **NO CROSS-PHASE BUNDLING** - Do not draft proposal while any upstream gate is unresolved. Do not generate action cards before strategy is confirmed.
4. **NO SPECULATIVE BACKFILL** - Pre-brief signals narrow questions only. They never auto-fill required intake fields.
5. **RUNTIME SCOPE** - Use only `./phases/*.md` and `./shared/*.md` (including `./shared/insight-modules/*.md`) as runtime contracts.
6. **REGIONAL SMALL-BUDGET REALISM** - Default budget context is regional small-cost marketing (typically 200k-300k CNY, online + offline + venue). Flag out-of-band budget as a user confirmation item.
7. **ACTION DESIGN FOUR PRINCIPLES** - Every action must satisfy low cost, fast impact, executable delivery, and real audience pull. Reject gimmick-only ideas.
8. **CORE THEME, NOT SERIALIZED IP** - Do not force serialized IP programs. Use evidence-backed `Core Theme` and stage sub-themes.
9. **ACTIVITY FORM CONSTRAINTS** - All activity design must comply with `./shared/activity-form-constraints.md`. Exclude List items are hard vetos; Preference List items receive scoring bonus during idea evaluation. Every offline card must include dealer-linkage; every online card must include traceability.
10. **PERSISTENCE IS MANDATORY** - Every phase must persist chapter output per `./shared/persistence-rules.md`; write failure blocks phase transition.
11. **BUYER-IDENTITY-FIRST THEMING** - Core Theme and all activity design must derive from `<primary-buyer-identity>` produced by customer segmentation, never from preset universals. Family, performance, adventure, status, individualism are all valid anchors; which one applies is determined per engagement. No phase file may hardcode a specific identity as default.
12. **DELIVERY-FIRST LAUNCH DESIGN** - Launch方案必须优先输出可落地执行包（选址、现场布置、活动流程、留资与促单路径）。行业展会/行业大会不得作为主事件主轴；可作为辅助触点。

## Contract maturity (scaffold phase)

During the current scaffold/migration phase, this `SKILL.md` is the canonical gate contract for runtime enforcement. Shared and phase files may still contain stubs and must be completed in Task 3+; until then, enforce gates from this file when conflicts or omissions appear.

## Phase index

| Phase file | Stage | Purpose |
| --- | --- | --- |
| `./phases/pre-brief-search.md` | Pre-brief search | Lightweight public signals before formal intake |
| `./phases/intake.md` | Intake | Normalize brief fields and determine `ready` or `blocked` |
| `./phases/insight.md` | Insight | Build module-complete evidence pack for regional launch |
| `./phases/strategy.md` | Strategy | Build slogan derivation chain, Core Theme, and stage sub-themes |
| `./phases/action.md` | Action | Build staged Activity Cards with pillar-level sub-agent comparison |
| `./phases/operations.md` | Operations | Build execution assurance mechanisms and governance |
| `./phases/service-team.md` | Service Team | Output bid-only team section when tender mode applies |
| `./phases/proposal.md` | Proposal | Assemble proposal and run `Review Pass` + loop handling |

## Shared contract index

| Shared file | Role |
| --- | --- |
| `./shared/persistence-rules.md` | Persistence contract: folder shape, slug, write triggers, assembly order |
| `./shared/pre-brief-source-map.md` | Pre-brief source priorities |
| `./shared/brief-intake-template.md` | Intake schema, statuses, and required fields |
| `./shared/source-trust-policy.md` | Evidence trust tiers |
| `./shared/query-playbook.md` | Regional auto query routes |
| `./shared/insight-modules/product-value.md` | Product value module |
| `./shared/insight-modules/market-environment.md` | Market and policy window module |
| `./shared/insight-modules/competitor-landscape.md` | Competitor three-tier classification and landscape map |
| `./shared/insight-modules/competitor-deep.md` | Competitor 5-dimension + recent campaign module |
| `./shared/insight-modules/customer-segmentation.md` | Customer segmentation and local distribution module |
| `./shared/insight-modules/city-signal.md` | City evidence module |
| `./shared/core-theme-derivation.md` | Core Theme and slogan derivation contract |
| `./shared/highlight-mechanism-canvas.md` | Stage theme and mechanism alignment canvas |
| `./shared/action-playbook-template.md` | Activity Card schema and dispatch pattern |
| `./shared/launch-execution-template.md` | Phase 2 launch execution package template (site/layout/run sheet/communication map) |
| `./shared/lead-capture-playbook.md` | Lead capture, scoring, warming, and dealer intake SOP |
| `./shared/conversion-mechanics-playbook.md` | Conversion mechanism catalog and test-drive-to-order path |
| `./shared/continuation-activity-templates.md` | Phase 3 structured activity templates (referral/deep test-drive/dealer sales) |
| `./shared/budget-allocation-rule.md` | Three-stage budget bands and red lines |
| `./shared/operations-assurance-template.md` | Operations assurance structure |
| `./shared/private-domain-operations.md` | WeChat private-domain architecture, retention, and referral operations |
| `./shared/service-team-template.md` | Bid-only role cards |
| `./shared/rubric-coverage-template.md` | Rubric coverage map and mapping structure |
| `./shared/quality-self-check.md` | Four quality standards (+ rubric dimension when needed) |
| `./shared/idea-scorecard.md` | Primary/alternative selection scorecard |
| `./shared/content-assets.md` | Platform-differentiated content assets |
| `./shared/proposal-template.md` | Final proposal structure |
| `./shared/3md-alignment-checklist.md` | Final proposal alignment checks against delivery intent |

## Phase switch protocol

Before entering each phase, read that phase file and its required shared contracts, then emit:

```markdown
## [Phase: <StageName>]
Read: <phase path> + <shared paths>
Write path: <project-dir>/<target-file-or-files>
Task: <one-line objective for this phase>
```

Do not skip required reads.

## Global hard gates

- Do not start **Insight** until intake is `ready` with explicit values or explicit `N/A` for `business_goal`, `target_audience`, `timeline`, `budget_or_resource_level`, `geography_or_region`, `channel_constraints`, `deliverables_needed`, `constraints`, and `success_metric`.
- Do not pass **Insight** unless all 5 insight modules are complete, each has at least two sources, and city evidence covers consumption, media habits, spatial distribution, and cultural anchors.
- Do not pass **Strategy** unless slogan derivation chain is traceable across brand anchor + audience insight + product value, `Core Theme` source is explained, and dual-axis balance (technology + `<primary-buyer-identity>`) passes, where `<primary-buyer-identity>` is sourced from `2.5 Audience Segmentation` output, not assumed.
- `BLOCKING-A`: After strategy output, present `3-5` strategy packages (each includes slogan + Core Theme + three stage sub-themes) with recommendation reasons, then require explicit user selection/confirmation of one package before Action.
- Do not pass **Action** unless each stage has required pillars, each pillar has a primary Activity Card plus one alternative candidate, budget constraints match `./shared/budget-allocation-rule.md`, and event design requirements pass (budget-busting event each stage + non-traditional launch ritual in Phase 2).
- Do not pass **Action** unless each stage has required pillars, each pillar has a primary Activity Card plus one alternative candidate, budget constraints match `./shared/budget-allocation-rule.md`, and all three dimensions are complete (`lead capture`, `conversion mechanics`, `retention seeding`).
- Do not pass **Action Phase 3** unless conversion depth is explicit (test-drive-to-order path, close mechanism, and deposit follow-up ownership), and Phase 3 pillars use structured continuation templates from `./shared/continuation-activity-templates.md` (Template A for referral/advocacy, Template B for deep test-drive, Template C for dealer sales).
- Do not pass **Action** if any selected card violates high-cost/high-complexity form exclusions in `./shared/activity-form-constraints.md` (unless user explicitly approved exception).
- Do not pass **Action** unless at least one owned launch event outputs a complete execution package (`选址建议 + 现场空间部署 + 核心流程 + 现场集客留资 + 促单环节`).
- Do not pass **Action** if industry events/trade shows are used as primary tie-in event for main launch storyline.
- Do not pass **Action** unless budget tier selection is explicit and all budget checks follow tier-specific thresholds in `./shared/budget-allocation-rule.md`.
- Auto-Display Phase 1: After all Phase 1 pillar cards are complete, emit Phase 1 Auto-Display Summary and proceed to Phase 2 automatically.
- Auto-Display Phase 2: After all Phase 2 pillar cards are complete, emit Phase 2 Auto-Display Summary and proceed to Phase 3 automatically.
- Auto-Display Phase 3: After all Phase 3 pillar cards are complete, emit Phase 3 Auto-Display Summary and proceed to Operations automatically.
- Do not pass **Operations** unless all six assurance blocks are complete, KPI checkpoints align with staged action KPIs with dual dimensions (sales + brand), and private-domain architecture is complete.
- Do not enter **Service Team** unless `bid_or_tender = true`; otherwise emit skipped state in proposal service-team section.
- Do not pass **Proposal** review unless quality standards pass (content, language, structure, creativity), and rubric coverage also passes when rubric is non-empty.
- Do not claim completion while review is failing without `Open Issues` at loop limit.

## Workflow

Global hard gates in this file are canonical. Step-level `GATE` and `BLOCKING-*` checkpoints below are summaries for execution flow and must not conflict with the global gates.

### Step 1: Pre-brief search

**GATE**: User request has enough regional auto launch signals to run lightweight search; otherwise follow skip rules in phase contract.

**Required reads**: `./phases/pre-brief-search.md`, `./shared/pre-brief-source-map.md`, `./shared/query-playbook.md`

**Action**: Produce pre-brief context and inspiration hints to sharpen intake questions only.

### Step 2: Intake

**GATE**: Pre-brief result is resolved (`used`, `skipped`, or `inconclusive`).

**Required reads**: `./phases/intake.md`, `./shared/brief-intake-template.md`

**Action**: Normalize brief; set intake status (`ready` or `blocked`); capture rubric and tender fields verbatim when provided.

### Step 3: Insight

**GATE**: Intake status is `ready`.

**Required reads**: `./phases/insight.md`, `./shared/source-trust-policy.md`, `./shared/query-playbook.md`, all `./shared/insight-modules/*.md`

**Action**: Build complete insight pack including product value, market environment, competitor deep-dive, customer segmentation, and city signal.

### Step 4: Strategy

**GATE**: Insight verdict is `pass`.

**Required reads**: `./phases/strategy.md`, `./shared/core-theme-derivation.md`, `./shared/highlight-mechanism-canvas.md`

**Action**: Produce value system, slogan derivation chain, Core Theme, three stage sub-themes, and integrated map.

**BLOCKING-A**: Stop and output `3-5` candidate strategy packages (`slogan + Core Theme + phase 1/2/3 sub-themes`) plus recommendation reasons; request explicit user selection/confirmation of one package.

### Step 5: Action

**GATE**: `BLOCKING-A` is confirmed.

**Required reads**: `./phases/action.md`, `./shared/action-playbook-template.md`, `./shared/launch-execution-template.md`, `./shared/activity-form-constraints.md`, `./shared/lead-capture-playbook.md`, `./shared/conversion-mechanics-playbook.md`, `./shared/idea-scorecard.md`, `./shared/budget-allocation-rule.md`, `./shared/content-assets.md`

**Action**:
- For each pillar, dispatch `N = 2-3` sub-agent candidates, score by real attraction, feasibility, budget feasibility, theme fit, and emotional resonance.
- Select one `primary` and keep one `alternative` per pillar.
- Enforce Activity Card field requirements and stage budget red lines.
- Enforce lead capture, conversion mechanics, and retention seeding outputs in the phase contract.

### Auto-Display Checkpoints (was BLOCKING-B/C/D)

Phase transitions no longer require explicit user confirmation. After each phase's pillars are complete, output an `## Auto-Display Summary` and proceed automatically.

#### After Phase 1

Output:
```md
## Phase 1 Auto-Display Summary
- Primary cards: <list>
- Alternative cards: <list>
- Budget snapshot: <online/offline/total>
- Activity form compliance: <all compliant | partial items noted>
- Next: dispatching Phase 2 pillars automatically.
```

#### After Phase 2

Output:
```md
## Phase 2 Auto-Display Summary
- Primary cards: <list>
- Alternative cards: <list>
- Budget snapshot: <online/offline/total + venue-related amount + venue-related ratio>
- Activity form compliance: <all compliant | partial items noted>
- Next: dispatching Phase 3 pillars automatically.
```

#### After Phase 3

Output:
```md
## Phase 3 Auto-Display Summary
- Primary cards: <list>
- Alternative cards: <list>
- Budget snapshot: <online/offline/total>
- Activity form compliance: <all compliant | partial items noted>
- Next: moving to Operations automatically.
```

### Step 6: Operations

**GATE**: Phase 3 Auto-Display Summary is emitted.

**Required reads**: `./phases/operations.md`, `./shared/operations-assurance-template.md`, `./shared/private-domain-operations.md`

**Action**: Produce group matrix, content dispatch flow, feedback loop, reporting matrix, node checkpoints, and private-domain architecture.

### Step 7: Service Team (bid-only)

**GATE**: Operations output complete.

**Required reads**: `./phases/service-team.md`, `./shared/service-team-template.md`, `./shared/brief-intake-template.md`

**Action**: If `bid_or_tender = true`, output role cards per template. If false, emit skipped state.

### Step 8: Proposal

**GATE**: Upstream outputs are complete and decision-useful.

**Required reads**: `./phases/proposal.md`, `./shared/proposal-template.md`, `./shared/quality-self-check.md`, `./shared/3md-alignment-checklist.md`, `./shared/rubric-coverage-template.md`, `./shared/highlight-mechanism-canvas.md`, `./shared/content-assets.md`

**Action**: Assemble proposal, run quality self-check, then emit `Review Pass`.

## Review loop (conditional)

**Constant**: `MAX_REVIEW_LOOPS = 3`

When `Review Pass` verdict is `fail` and loops remain:

1. Emit `Review Gap` with exactly one route: `research` | `ideation` | `execution` | `proposal_enrich` | `intake`.
2. Run minimum upstream repair on that route only.
3. Rebuild proposal and emit new `Review Pass`.

If still `fail` after max loops, emit `Open Issues` and stop claiming completion.

### Symptom -> Review Gap route

| Symptom | Route | Target file |
| --- | --- | --- |
| C1 fail / competitor compression | research | `01-insight.md` section `2.4` |
| C2 fail / persona compression | research | `01-insight.md` section `2.6` |
| C7 fail / generic SWOT | research | `01-insight.md` section `2.7` |
| C8 fail / missing insight data table | research | `01-insight.md` section `2.2` or `2.5` |
| Strategy chain inconsistency | ideation | `02-strategy.md` |
| C3/C4/C5/C6 card compression | execution | `04`/`05`/`06-action-phaseN.md` targeted section |
| Budget red-line failure | execution | failed phase file + `03-action-overview.md` |
| Proposal ordering/assembly issue | proposal_enrich | `proposal.md` only |
| Intake verbatim capture issue | intake | `00-intake.md` |

## Completion gate

Declare completion only when either path is true:

- `Review Pass` is `pass`, all global hard gates are satisfied, `BLOCKING-A` is confirmed, and `<project-dir>/proposal.md` is persisted; or
- loop cap reached with `Open Issues` documented and no false success claim.
