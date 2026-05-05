# Phase: Hotspot Harvest

## Purpose

Collect **public attention beats** (`HS-*` atoms) that will fuel the divergent Activity Card Draw stage. This phase runs **after** Insight (which still produces `TR-*` industry trends and `CS-*` city baselines) and **before** Narrative Spine.

This is the phase that breaks "spine-first" thinking. Hotspot Harvest is **agnostic of brand spine** — its only job is to capture what the public is actually burning over, with enough structural metadata that downstream Activity Card Draw can fold any one of them into a launch idea.

## Required Reads

- `./phases/insight.md` (for `TR-*` / `CS-*` cross-links)
- `./shared/brief-intake-template.md` (resolves `{target_city}` / `{target_audience}` / `{launch_window}` etc.)
- `./shared/hotspot-source-map.md`
- `./shared/hotspot-atom-template.md`
- `./shared/local-grounding-pattern.md` (city pack derivation)
- `./shared/source-trust-policy.md`
- `./shared/query-playbook.md` (Hotspot Harvest Queries section, with intake variable substitution)

## Action

1. **Bucket sweep** — for each of the 6 buckets in `hotspot-source-map.md`, run at least 2 targeted queries from `query-playbook.md`'s Hotspot Harvest Queries. Capture the raw signal first (URL / screenshot / quote), normalize to `HS-*` atom only after.

2. **Pin the clock** — every captured atom gets `lifecycle_phase` and `expiry_window` immediately. If the captured signal cannot be clocked (no rising/peaking/declining trace, no end window), do **not** create the atom — re-do the query.

3. **Pin the audience** — every atom must have a concrete `audience_cluster` (人口学 + 平台 + 行为). "All consumers" is rejected. "Northeast moms" passes.

4. **Pin the emotion** — single dominant emotional polarity. Mixed feelings ⇒ split into two atoms.

5. **Score regional_relevance** — for the launch city `{target_city}` (resolved from intake), each atom carries `{target_city}` 含金量 (high/medium/low) plus a one-line evidence. Atoms with regional_relevance=low are still kept but flagged for "national-tier" usage rather than "city activation".

6. **Trust-tag** — apply `source-trust-policy.md`. Low-trust atoms are admitted only if they ladder into a medium/high atom on the same audience_cluster, OR they will only be used as Activity Card Draw inspiration (not as evidence in proposal core claims).

7. **Cross-link to Insight** — fill in `cross_links.related_TR / related_CS / related_HS` where atoms cluster around the same audience or scene. This makes downstream Lead Pool easier to fuse.

8. **No spine check** — explicitly forbidden in this phase. Even if an atom feels "anti-brand", capture it. Spine-fit is decided two phases later in Lead Pool Packaging.

## Step N — Append City Pack

After atoms are written, append a `## City Pack` section per `./shared/local-grounding-pattern.md`. The city pack maps `G1–G9` and `C1–C12` categories to concrete place names / channels for `{target_city}`. The pack is consumed by Activity Card Draw and Strategy Plan.

## Output

Write to `{artifact_root}/01h-hotspot-harvest.md` using the schema in `./shared/hotspot-atom-template.md`. Group atoms by bucket for readability:

```markdown
## Module: Hotspot Harvest

### 1. Calendar Nodes

```yaml
HotspotAtom:
  id: HS-001
  ...
```

### 2. Public Emotion
...
### 3. Entertainment Heat
...
### 4. City Events
...
### 5. Viral Memes
...
### 6. Cross-category Crossover
...

## City Pack
<G1–G9 mapped to concrete places in `{target_city}`>
<C1–C12 mapped to concrete platforms / partners>
<local_signatures for `{target_city}`>
```

## Quality Gate

- [ ] **Atom count**: ≥12 valid `HS-*` atoms.
- [ ] **Bucket coverage**: ≥4 of 6 buckets have ≥1 atom.
- [ ] **Regional relevance**: ≥3 atoms carry `regional_relevance: {target_city} 含金量 high|medium`.
- [ ] **Lifecycle distribution**: at least one atom each in 预热 / 爆发 / 长尾 (衰退 optional, only as long-tail tail-pickup).
- [ ] **Trust mix**: ≥50% atoms are medium or high trust; low-trust atoms have explicit ladder-up notes (related_HS / related_TR).
- [ ] **Schema completeness**: every atom passes the 8-item Quality Gate in `hotspot-atom-template.md`.
- [ ] **Two-question audit pass**: every atom answers "What's burning?" + "Why this audience?" in one line.
- [ ] **City Pack present**: `## City Pack` section appended; G1–G9 each mapped (or explicitly noted as missing for this city); local_signatures non-empty.

## Failure → Return

| Symptom | Return to |
|---|---|
| 抽出的 atom 仍是行业趋势报告 | 重做 — 检查是否误用了 TR-* 来源 |
| atom 没有时间窗 | 同条 atom 不达标，重写或弃 |
| 单一 bucket 占比 >50% | 补扫缺失 bucket |
| 都是 low-trust 单帖 | 加做 medium 来源验证 |
| 无 `{target_city}` regional_relevance | 城市信号不足，补扫 City Events bucket，再次派生 City Pack |
| 例子里写的还是上次标的城市 | 重新读 `intake.target_city`，重做 |

## Checkpoint

```markdown
## Hotspot Harvest complete
- [x] ≥12 HS-* atoms
- [x] ≥4 buckets covered
- [x] ≥3 atoms with `{target_city}` 含金量 high|medium
- [x] Lifecycle phases distributed (预热/爆发/长尾 each ≥1)
- [x] Trust mix ≥50% medium+
- [x] City Pack appended
- [x] `{artifact_root}/01h-hotspot-harvest.md` written
- [ ] Next: Narrative Spine (then Activity Card Draw)
```

## Note on Spine ordering

After Hotspot Harvest, the workflow proceeds to Narrative Spine **as before** — but the Spine is no longer a hard gate for lead generation. See `../SKILL.md` rule #6 (DIVERGE FIRST, PACKAGE LATER). Activity Card Draw runs immediately after Spine and is allowed to surface ideas with spine_friction; only Lead Pool Packaging finally reconciles them with the spine.
