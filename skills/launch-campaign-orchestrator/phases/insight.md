# Phase: Insight

## Purpose

Build atomic insight resources across 6 modules. Each module produces
Key Findings and Atomic Resources with IDs.

## Required Reads

- `./phases/intake.md` (for intake context)
- `./shared/source-trust-policy.md`
- `./shared/query-playbook.md`

## Modules

Run all 6 modules. Each module file is a standalone artifact under `{artifact_root}/` (see `SKILL.md` **Artifact root**).

| Module | File | Output ID Prefix |
|---|---|---|
| Product Value | `01a-product-value.md` | PV-xxx |
| Market Environment | `01b-market-environment.md` | ME-xxx |
| Competitor Landscape | `01c-competitor-landscape.md` | CL-xxx |
| Customer Segmentation | `01d-customer-segmentation.md` | AU-xxx |
| City Signal | `01e-city-signal.md` | CS-xxx |
| Trend Signal | `01f-trend-signal.md` | TR-xxx |

## Module Output Shape

```markdown
## Module: Product Value

### Key Findings
- Finding 1: ...
- Finding 2: ...

### Atomic Resources
| ID | Type | Content | Source | Trust |
|---|---|---|---|---|
| PV-001 | product_feature | ... | ... | high |
```

## Quality Gate

- >=3 modules must have Key Findings.
- Each module must have >=2 Atomic Resources.
- Each Atomic Resource must have a source and trust tier.

## Checkpoint

```markdown
## Insight complete
- [x] >=3 modules with findings
- [x] >=2 Atomic Resources per module
- [x] All resources trust-tagged
- [ ] Next: Hotspot Harvest (when ready)
```
