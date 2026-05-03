# Phase: Lead Pool

## Purpose

Generate creative leads by Value Category batch. Every lead must align with
Narrative Spine and serve a state transition. Manage lead lifecycle and
auto-compression.

## Required Reads

- `./phases/narrative-spine.md`
- `./shared/lead-template.md`
- `./shared/idea-scorecard.md`
- `./shared/fusion-rules.md`
- `./shared/query-playbook.md`

## Action

1. Read Narrative Spine and insight modules.
2. Generate leads **by Value Category in batches**:
   - 够新鲜: First-ever /首创 topics
   - 够亮眼: High-visual-impact assets
   - 够爆: Controversy /裂变 /福利 events
   - 够热: Trend-riding / node-hitting actions
3. For each lead, assign at generation time:
   - `value_category`, `execution_tier`, `narrative_roles` (primary + secondary + weights)
   - `narrative_alignment` (serves_transition, emotional_target, trigger_mechanism)
   - `story_function`
   - `memory_anchor` (anchor, type, memorability_test, one_sentence_recall)
   - `insight_links`, `channels`, `kpi_targets`
   - `lead_status: active`, `lead_confidence`, `lead_uniqueness`, `lead_overlap_score`
4. Score each lead per `idea-scorecard.md`.
5. Monitor pool size:
   - If active leads > 40, suggest compression.
   - If any pair overlap_score > 70, suggest fusion.

## Lead Output

Append to `02-leads/02-lead-pool.md`.

## Quality Gate

- ≥10 valid leads.
- Cover ≥2 Value Categories.
- Cover ≥2 Execution Tiers.
- Every lead has `narrative_alignment` and `memory_anchor`.
- No lead without Spine alignment is admitted.

## Checkpoint

```markdown
## Lead Pool complete
- [x] ≥10 valid leads
- [x] ≥2 Value Categories
- [x] ≥2 Execution Tiers
- [x] All leads narrative-aligned
- [x] Scorecard filled
- [ ] Next: Strategy Plan (when user confirms)
```
