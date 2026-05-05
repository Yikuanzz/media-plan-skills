# Phase: Lead Pool (Packaging Phase)

## Purpose

This is the **convergent packaging** phase. It does **not** generate new ideas from scratch — that work happened in `Phase: Activity Card Draw` and produced `{artifact_root}/02a-activity-cards.md`. This phase:

1. Clusters and deduplicates raw ideas (`RI-*`).
2. Promotes selected raw ideas into formal Leads (`L-*`) with full schema.
3. Reconciles each Lead with the Narrative Spine — including **reworking** ideas that started with `spine_friction: high` rather than discarding them.
4. Scores the resulting pool.

The shift from previous versions: Lead Pool used to be a **generation** stage, where Spine was the king and hotspots were add-ons. Now Lead Pool is a **packaging** stage — it inherits a richer, hotspot-driven idea pool and forces convergence by making `narrative_alignment` a fillable contract rather than a generation gate.

## Required Reads

- `./phases/activity-card-draw.md` (read `{artifact_root}/02a-activity-cards.md`)
- `./phases/narrative-spine.md` (Spine is **read as packaging contract** here; artifact: `{artifact_root}/01g-narrative-spine.md`)
- `./shared/lead-template.md`
- `./shared/hotspot-angle-playbook.md`
- `./shared/idea-scorecard.md`
- `./shared/fusion-rules.md`
- `./shared/hotspot-atom-template.md`

## Action

### Step 1 — Cluster the Raw Pool

Read all `RI-*` raw ideas. Use `cluster_hint` from Activity Card Draw as a starting line. Group by:

- **Same `hotspot_lineage` set** ⇒ likely same beat
- **Same `emotional_charge` (from referenced HS-* atoms)** ⇒ likely same arc role
- **Same `local_hook_used`** (City Pack G-cat / local_signature) ⇒ likely same physical scene

For each cluster, write a one-line `cluster_summary` and pick a representative idea.

### Step 2 — Promote to Lead Schema

For each cluster's representative idea (and additional non-overlapping ideas), promote to a `L-*` Lead. Fill the full schema in `./shared/lead-template.md`:

- Required: `id`, `hook`, `concept`, `value_category`, `execution_tier`, `narrative_roles`, `narrative_alignment`, `story_function`, `memory_anchor`, `lifecycle_stage`, `target_audience`, `budget_level`, `insight_links`, `channels`, `kpi_targets`, `lead_status`, `lead_confidence`, `lead_uniqueness`, `lead_overlap_score`.
- **New required fields** (carried from raw idea):
  - `hotspot_lineage: [HS-*]` — preserved from raw idea; ≥60% of leads must have ≥1 HS-* reference.
  - `divergence_card: D-*` — preserved.
  - `packaging_pass: direct | reworked | n/a` (see Step 3).
  - `crazy_dose / safe_dose` — preserved as a tuple block.
- Hotspot fields from the previous version still apply: `public_heat_signal`, `angle_of_entry`, `spine_bridge`, `shallow_stack_check`. These are now **derived from** `hotspot_lineage` + `divergence_card`, not improvised.

### Step 3 — Spine Reconciliation (the rework gate)

For each promoted Lead, check `spine_friction` from the source raw idea:

- **`low`** ⇒ `packaging_pass: direct`. Fill `narrative_alignment` straightforwardly.
- **`medium`** ⇒ try `direct` first; if it forces a contradiction with Spine `narrative_transitions`, downgrade to `reworked` (Step 3b).
- **`high`** ⇒ `packaging_pass: reworked`. Mandatory rework note.

#### Step 3a — `direct` packaging

The Lead serves a Spine transition without modification. Fill:

```yaml
narrative_alignment:
  serves_transition: <one of Spine's transitions>
  emotional_target: <Spine's target state>
  trigger_mechanism: <e.g. ugc_invite | social_proof | reward_unlock>
spine_bridge: |
  <one sentence: how this lead's mechanism implements the transition's
   trigger_types AND fulfills lead_requirements>
```

#### Step 3b — `reworked` packaging

The Lead's original `crazy_dose` had spine friction. Action:

1. **Identify the friction point** — what about the original idea contradicts which Spine element (`core_tension` / a specific `narrative_transition` / a `symbolic_object`)?
2. **Choose a rework strategy** from this menu:
   - **Tone shift**: keep mechanism, change voice (e.g. central-SOE-toned to wry self-aware).
   - **Audience widen / narrow**: pivot to a sub-segment that resolves the friction.
   - **Mechanism re-anchor**: keep hook surface, anchor the mechanism on a different Spine transition.
   - **Symbol reuse**: replace a problematic symbol with one of Spine's `symbolic_objects`.
   - **Dose flip**: promote `safe_dose` over `crazy_dose` if `crazy_dose` cannot be salvaged; document the loss.
3. **Write `rework_note`**: a one-paragraph record of the friction + chosen strategy + what is preserved + what is changed.

```yaml
packaging_pass: reworked
rework_note: |
  原始 crazy_dose: "..."
  Spine 摩擦点: "..."
  采用策略: tone_shift | audience_widen | mechanism_reanchor | symbol_reuse | dose_flip
  保留: "..."
  改写: "..."
```

#### Step 3c — Reject (last resort)

A raw idea is rejected only when:
- All 5 rework strategies fail to produce a coherent Lead, **and**
- The idea's `crazy_dose` and `safe_dose` are both un-anchorable to any Spine transition.

Rejected ideas are not deleted — set `lead_status: rejected` with a `rejection_reason`. Procurement evaluators read these as evidence the team explored boundaries.

### Step 4 — Hotspot Field Derivation

For each Lead, derive these from the rich upstream structure rather than improvise:

- `public_heat_signal` ← reference `hotspot_lineage` HS-* IDs + one-sentence summary of `burning_topic` from those atoms.
- `angle_of_entry` ← from `divergence_card`'s direction + the specific `{target_city}`-local hook used (resolved from City Pack); phrased as the **fold-in mechanism**, not "热点 + 卖点".
- `spine_bridge` ← from Step 3 above.
- `shallow_stack_check` ← from raw idea's `why_not_1plus1`, sharpened.

Anti–1+1 checklist (from `./shared/hotspot-angle-playbook.md`) runs as a filter here. Leads failing the checklist with no recoverable rework are rejected.

### Step 5 — Score & Filter

Score every active Lead per `./shared/idea-scorecard.md`. The scorecard now includes:

- `Hotspot Coverage` (High weight) — driven by `hotspot_lineage` count and `divergence_card` direction diversity.
- `Divergence Quality` (Medium weight) — tension between `crazy_dose` and `safe_dose` and the rework's preservation of `crazy_dose` punch.

If pool-wide `Hotspot Coverage` average <6, return to Activity Card Draw (insufficient hotspot fuel).

### Step 6 — Compression Check

Apply `./shared/fusion-rules.md`:

- If active Leads >40, propose fusion or archive lowest-confidence.
- If any pair has `lead_overlap_score >70`, propose fusion (with hotspot lineage merge — see fusion-rules.md "Hotspot lineage" note).

### Step 7 — Final Pool

Persist the pool to `{artifact_root}/02-lead-pool.md`. Group by Spine `narrative_transitions` so Strategy Plan can directly map.

## Output

Write to `{artifact_root}/02-lead-pool.md`. Structure:

```markdown
# Lead Pool: <project name>

## Cluster Summary
| Cluster | HS lineage | RI sources | Lead | Packaging |
|---|---|---|---|---|
| 家庭安心仪式 | HS-007, HS-009 | RI-003, RI-018, RI-025 | L001 | direct |
| 央企老干部 meme | HS-002, HS-011 | RI-007, RI-022 | L004 | reworked |

## Leads

### L001: ...
```yaml
id: L001
...
packaging_pass: direct
hotspot_lineage: [HS-007, HS-009]
divergence_card: D-RL-3
crazy_dose: |
  ...
safe_dose: |
  ...
```

## Scorecard
| Lead | Fresh | Visual | Buzz | Trend | Insight | Memo | Trans | Tier | Budget | Hotspot | Divergence | Total |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
...

## Quality Gate Check
- ≥10 valid leads: ...
- HS coverage ≥60%: ...
- Hotspot-density gate: ...
- Packaging distribution: direct X / reworked Y / rejected Z

## Rejected (for transparency)
- L0NN: <hook> — rejection_reason: ...
```

## Quality Gate

- [ ] **≥10 valid leads** with `lead_status: active`.
- [ ] **Cover ≥3 of 4 Value Categories** (够新鲜 / 够亮眼 / 够爆 / 够热). Single-category pool indicates failure of upstream divergence.
- [ ] **Cover ≥2 Execution Tiers** (S / A / B).
- [ ] **Every active Lead has `narrative_alignment` and `memory_anchor`**.
- [ ] **HS coverage gate**: ≥60% of active Leads have `hotspot_lineage` with ≥1 HS-* reference (the proof that the pool is hotspot-driven, not product-driven).
- [ ] **Hotspot-density gate (preserved)**: Let `N` = count of active leads. At least **`max(4, ⌈0.4 × N⌉)`** leads carry traceable `public_heat_signal` (HS-* / TR-* / CS-* with substantive `angle_of_entry` + `spine_bridge` + `shallow_stack_check`).
- [ ] **Packaging mix**: `packaging_pass: direct` and `packaging_pass: reworked` both present in the active pool. **A pool with zero `reworked` leads means the team filtered out distinctive ideas** — return to Activity Card Draw (or revisit Step 3 here).
- [ ] **Rework integrity**: every `reworked` Lead has a substantive `rework_note` (friction point + strategy + preserved + changed).
- [ ] **Anti–1+1 pass**: every Lead's `shallow_stack_check` reads as a third-party-readable mechanism statement, not marketing speak.
- [ ] **Scorecard** filled including `Hotspot Coverage` and `Divergence Quality` columns.
- [ ] **Pool-wide Hotspot Coverage average ≥6**.

## Failure → Return

| Symptom | Return to |
|---|---|
| <10 active leads | Activity Card Draw — under-supply upstream |
| HS coverage <60% | Activity Card Draw — atoms underused |
| All packaging_pass=direct (no reworked) | Activity Card Draw — divergence too tame; or this phase Step 3 — refused to rework |
| Reworked leads' rework_note empty | this phase Step 3b — rework integrity check failed |
| Single value_category dominance >70% | Activity Card Draw — Step 1 cartesian sweep skipped |
| Pool-wide Hotspot Coverage avg <6 | Activity Card Draw — atom diversity insufficient |
| spine_bridge contradicts narrative_alignment | this phase Step 3 — re-route through Step 3b rework |

## Checkpoint

```markdown
## Lead Pool complete
- [x] ≥10 valid leads
- [x] ≥3 Value Categories
- [x] ≥2 Execution Tiers
- [x] All leads narrative-aligned (direct or reworked)
- [x] HS coverage ≥60%
- [x] Hotspot-density gate met
- [x] Packaging mix has both direct and reworked
- [x] Rework integrity verified
- [x] Scorecard filled with Hotspot Coverage + Divergence Quality
- [x] Pool-wide Hotspot Coverage average ≥6
- [ ] Next: Strategy Plan (when user confirms)
```
