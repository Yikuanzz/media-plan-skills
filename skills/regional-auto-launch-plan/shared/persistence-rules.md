# Persistence Rules

This file is the canonical persistence contract for `regional-auto-launch-plan` runtime output.

## Project directory

At Intake `status = ready`, create:

`<cwd>/<YYYY-MM-DD>-<project-slug>/`

Inside the directory, chapter files are fixed:

- `00-intake.md`
- `01-insight.md`
- `02-strategy.md`
- `03-action-overview.md`
- `04-action-phase1.md`
- `05-action-phase2.md`
- `06-action-phase3.md`
- `07-action-alternatives.md`
- `08-operations.md`
- `09-service-team.md`
- `proposal.md`

## Slug derivation

`<project-slug> = <brand-pinyin>-<model-pinyin>-<city-pinyin>-<YYYYMMDD>`

Rules:

1. `brand`: parse from intake `business_goal` and `product`.
2. `model`: parse from intake `product`.
3. `city`: parse from intake `geography_or_region`, normalize lowercase, remove spaces, convert Chinese to pinyin.
4. date suffix uses current day in `YYYYMMDD`.
5. If collision exists, append `-r2`, `-r3`, ...
6. If brand/model/city cannot be derived, raise blocking error and request manual project name.

## Write trigger table

| Trigger | File | Write behavior |
| --- | --- | --- |
| Intake `status = ready` | `00-intake.md` | Write chapter `## 1. Task Brief` with intake fields and rubric/tender verbatim |
| Insight gate pass | `01-insight.md` | Write `## 2. Market Insight` (`2.1-2.7`, Compact + Expanded where required) |
| Strategy output complete (before Action) | `02-strategy.md` | Write `## 3. Strategy Plan` (`3.1-3.4`, Compact + Expanded) |
| BLOCKING-A confirmed | `03-action-overview.md` | Write chapter 4 intro + `4.1 Stage Overview` + budget placeholder rows |
| Phase 1 auto-display trigger | `04-action-phase1.md` | Write `4.2` full text and sync Phase 1 budget row back to `03` |
| Phase 2 auto-display trigger | `05-action-phase2.md` | Write `4.3 A/B/C` full text and sync Phase 2 budget row back to `03` |
| Phase 3 auto-display trigger | `06-action-phase3.md` + `07-action-alternatives.md` | Write `4.4` full text + `4.5` alternatives, then finalize budget table in `03` |
| Operations gate pass | `08-operations.md` | Write chapter `## 5. Operations Assurance` full text |
| Service Team resolved | `09-service-team.md` | `bid=true` write role cards; `bid=false` write exact skip block |
| Proposal gate pass | `proposal.md` | Assemble cover + cat `00`->`09` + closing + optional `14/15` |

## Write failure handling

- Any `Write` failure is blocking.
- Do not continue to downstream phase while required file write fails.
- Report explicit reason (permission, disk, invalid path, parse failure).

## Assembly mode

`proposal.md` is generated only by concatenation, not rewriting chapter content.

Fixed sequence:

1. Cover
2. TOC
3. `00-intake.md`
4. `01-insight.md`
5. `02-strategy.md`
6. `03-action-overview.md`
7. `04-action-phase1.md`
8. `05-action-phase2.md`
9. `06-action-phase3.md`
10. `07-action-alternatives.md`
11. `08-operations.md`
12. `09-service-team.md`
13. Closing
14. Optional `Post-Campaign Review`
15. Optional `Rubric Mapping`

## Linkage check after targeted rewrite

- If `01-insight.md` changed: verify references used by `02`, `03`, and `04`-`06` still exist.
- If `02-strategy.md` changed: verify stage sub-theme references used by `04`-`06` still exist.
- If `04`/`05`/`06` changed: verify activity names referenced in `08` still exist.

If linkage fails, emit `linkage gap`, mark loop as `fail`, and repair linkage first in next loop.
