---
name: regional-auto-launch-plan
description: Use when handling an automotive regional launch planning brief that needs a gated, evidence-backed workflow across insight, strategy, staged actions, operations, and proposal review.
---

# regional-auto-launch-plan

## Purpose

Run the full automotive regional launch workflow in this package only: pre-brief search -> intake -> insight -> strategy -> action -> operations -> service team -> proposal -> review loop. Enforce regional small-budget realism, phase-by-phase gates, and explicit user confirmations at the defined blocking points.

## Global execution discipline (mandatory)

1. **SERIAL PHASES ONLY** - Run phases in order. Do not skip forward or merge multiple unresolved phases into one pass.
2. **BLOCKING = HARD STOP** - Markers `BLOCKING-A`, `BLOCKING-B`, `BLOCKING-C`, `BLOCKING-D` require explicit user confirmation before continuing.
3. **NO CROSS-PHASE BUNDLING** - Do not draft proposal while any upstream gate is unresolved. Do not generate action cards before strategy is confirmed.
4. **NO SPECULATIVE BACKFILL** - Pre-brief signals narrow questions only. They never auto-fill required intake fields.
5. **RUNTIME SCOPE** - Use only `./phases/*.md` and `./shared/*.md` (including `./shared/insight-modules/*.md`) as runtime contracts.
6. **REGIONAL SMALL-BUDGET REALISM** - Default budget context is regional small-cost marketing (typically 200k-300k CNY, online + offline + venue). Flag out-of-band budget as a user confirmation item.
7. **ACTION DESIGN FOUR PRINCIPLES** - Every action must satisfy low cost, fast impact, executable delivery, and real audience pull. Reject gimmick-only ideas.
8. **CORE THEME, NOT SERIALIZED IP** - Do not force serialized IP programs. Use evidence-backed `Core Theme` and stage sub-themes.

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
| `./shared/pre-brief-source-map.md` | Pre-brief source priorities |
| `./shared/brief-intake-template.md` | Intake schema, statuses, and required fields |
| `./shared/source-trust-policy.md` | Evidence trust tiers |
| `./shared/query-playbook.md` | Regional auto query routes |
| `./shared/insight-modules/product-value.md` | Product value module |
| `./shared/insight-modules/market-environment.md` | Market and policy window module |
| `./shared/insight-modules/competitor-deep.md` | Competitor 5-dimension + recent campaign module |
| `./shared/insight-modules/customer-segmentation.md` | Customer segmentation and local distribution module |
| `./shared/insight-modules/city-signal.md` | City evidence module |
| `./shared/core-theme-derivation.md` | Core Theme and slogan derivation contract |
| `./shared/highlight-mechanism-canvas.md` | Stage theme and mechanism alignment canvas |
| `./shared/action-playbook-template.md` | Activity Card schema and dispatch pattern |
| `./shared/budget-allocation-rule.md` | Three-stage budget bands and red lines |
| `./shared/operations-assurance-template.md` | Operations assurance structure |
| `./shared/service-team-template.md` | Bid-only role cards |
| `./shared/rubric-coverage-template.md` | Rubric coverage map and mapping structure |
| `./shared/quality-self-check.md` | Four quality standards (+ rubric dimension when needed) |
| `./shared/idea-scorecard.md` | Primary/alternative selection scorecard |
| `./shared/content-assets.md` | Platform-differentiated content assets |
| `./shared/proposal-template.md` | Final proposal structure |

## Phase switch protocol

Before entering each phase, read that phase file and its required shared contracts, then emit:

```markdown
## [Phase: <StageName>]
Read: <phase path> + <shared paths>
Task: <one-line objective for this phase>
```

Do not skip required reads.

## Global hard gates

- Do not start **Insight** until intake is `ready` with explicit values or explicit `N/A` for `business_goal`, `target_audience`, `timeline`, `budget_or_resource_level`, `geography_or_region`, `channel_constraints`, `deliverables_needed`, `constraints`, and `success_metric`.
- Do not pass **Insight** unless all 5 insight modules are complete, each has at least two sources, and city evidence covers consumption, media habits, spatial distribution, and cultural anchors.
- Do not pass **Strategy** unless slogan derivation chain is traceable across brand anchor + audience insight + product value, `Core Theme` source is explained, and three stage sub-themes are distinct but aligned.
- `BLOCKING-A`: After strategy output, require explicit user confirmation of Core Theme + slogan + three stage sub-themes before Action.
- Do not pass **Action** unless each stage has required pillars, each pillar has a primary Activity Card plus one alternative candidate, and budget constraints match `./shared/budget-allocation-rule.md`.
- `BLOCKING-B`: After all Phase 1 pillar cards are complete, require user confirmation before Phase 2 dispatch.
- `BLOCKING-C`: After all Phase 2 pillar cards are complete, require user confirmation before Phase 3 dispatch.
- `BLOCKING-D`: After all Phase 3 pillar cards are complete, require user confirmation before Operations.
- Do not pass **Operations** unless all five assurance blocks are complete and KPI checkpoints align with staged action KPIs.
- Do not enter **Service Team** unless `bid_or_tender = true`; otherwise emit skipped state in proposal service-team section.
- Do not pass **Proposal** review unless quality standards pass (content, language, structure, creativity), and rubric coverage also passes when rubric is non-empty.
- Do not claim completion while review is failing without `Open Issues` at loop limit.

## Workflow

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

**BLOCKING-A**: Stop and request explicit user confirmation for Core Theme + slogan + stage sub-themes.

### Step 5: Action

**GATE**: `BLOCKING-A` is confirmed.

**Required reads**: `./phases/action.md`, `./shared/action-playbook-template.md`, `./shared/idea-scorecard.md`, `./shared/budget-allocation-rule.md`, `./shared/content-assets.md`

**Action**:
- For each pillar, dispatch `N = 2-3` sub-agent candidates, score by real attraction, feasibility, budget feasibility, and theme fit.
- Select one `primary` and keep one `alternative` per pillar.
- Enforce Activity Card field requirements and stage budget red lines.

**BLOCKING-B**: After all Phase 1 pillars are complete (`1-online`, `1-offline`), request user confirmation for Phase 1 primary cards.

**BLOCKING-C**: After all Phase 2 pillars are complete (`2-offline-core`, `2-offline-aux`, `2-online`), request user confirmation for Phase 2 primary cards.

**BLOCKING-D**: After all Phase 3 pillars are complete (`3-offline-conv`, `3-offline-trial`, `3-online`), request user confirmation for Phase 3 primary cards.

### Step 6: Operations

**GATE**: `BLOCKING-D` is confirmed.

**Required reads**: `./phases/operations.md`, `./shared/operations-assurance-template.md`

**Action**: Produce group matrix, content dispatch flow, feedback loop, reporting matrix, and node checkpoints.

### Step 7: Service Team (bid-only)

**GATE**: Operations output complete.

**Required reads**: `./phases/service-team.md`, `./shared/service-team-template.md`, `./shared/brief-intake-template.md`

**Action**: If `bid_or_tender = true`, output role cards per template. If false, emit skipped state.

### Step 8: Proposal

**GATE**: Upstream outputs are complete and decision-useful.

**Required reads**: `./phases/proposal.md`, `./shared/proposal-template.md`, `./shared/quality-self-check.md`, `./shared/rubric-coverage-template.md`, `./shared/highlight-mechanism-canvas.md`, `./shared/content-assets.md`

**Action**: Assemble proposal, run quality self-check, then emit `Review Pass`.

## Review loop (conditional)

**Constant**: `MAX_REVIEW_LOOPS = 3`

When `Review Pass` verdict is `fail` and loops remain:

1. Emit `Review Gap` with exactly one route: `research` | `ideation` | `execution` | `proposal_enrich` | `intake`.
2. Run minimum upstream repair on that route only.
3. Rebuild proposal and emit new `Review Pass`.

If still `fail` after max loops, emit `Open Issues` and stop claiming completion.

### Symptom -> Review Gap route

| Symptom | Route |
| --- | --- |
| Missing evidence, weak source grounding, missing competitor/city support | `research` |
| Core Theme source unclear, slogan chain broken, sub-themes inconsistent | `ideation` |
| Pillar cards incomplete, KPI non-quantified, budget band violations | `execution` |
| Chapter structure, wording quality, mapping anchors, formatting completeness | `proposal_enrich` |
| Rubric item capture not verbatim, mandatory intake clauses missing | `intake` |

## Completion gate

Declare completion only when either path is true:

- `Review Pass` is `pass`, all global hard gates are satisfied, and blocking confirmations are completed; or
- loop cap reached with `Open Issues` documented and no false success claim.
