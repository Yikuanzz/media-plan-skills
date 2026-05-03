# Fusion Rules

## Fusion Basis Priority

1. **emotional** (highest) — Leads share the same emotional beat
2. **symbolic** (highest) — Leads share symbolic objects from Narrative Spine
3. **narrative** — Leads serve the same story function
4. **audience** — Shared target audience
5. **scene** — Shared physical or digital space
6. **topic** — Shared topical theme

## Fusion Group Output

```markdown
## Fusion Group #N: 「母事件名称」
- **Candidates**: Lxxx, Lyyy, Lzzz
- **Fusion Basis**: emotional + symbolic + narrative
- **Mother Event Concept**: ...
- **Tier Upgrade**: B×3 → S
- **Narrative Roles**: Ignition (0.6) + Social Currency (0.3) + Participation (0.1)
- **Memory Anchor**: ...
- **Budget Impact**: Budget more concentrated
```

## Compression Rules

- Candidates sharing emotional/symbolic basis are prioritized.
- Post-fusion mother events can upgrade Execution Tier.
- Unfused leads are kept as touchpoints or archived.
- Fusion is not mandatory — use when pool is fragmented.

## Auto Compression Trigger

```yaml
compression_trigger:
  max_active_leads: 40
  duplication_threshold: 0.7
  actions:
    - active > 40: Suggest fusion or archive lowest-confidence leads
    - overlap > 70: Suggest fusion for that pair
    - new batch added: Auto-calculate overlap with existing pool
```
