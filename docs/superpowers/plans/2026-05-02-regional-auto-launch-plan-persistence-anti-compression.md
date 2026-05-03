# Regional Auto Launch Plan Persistence + Anti-Compression Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add deterministic per-phase markdown persistence and hard anti-compression gates (C1-C7) to `skills/regional-auto-launch-plan/`, then assemble `proposal.md` only from persisted chapter files.

**Architecture:** Introduce one canonical persistence contract (`shared/persistence-rules.md`) as the single source for folder shape, slug derivation, write triggers, failure handling, and linkage checks. Upgrade all runtime phase contracts to persist chapter files (`00`-`09`) and make `proposal.md` a mechanical assembly artifact (`cover + cat 00->09 + closing + optional 14/15`). Extend `quality-self-check.md` with `Standard 6` anti-compression hard gates and route-level repair mapping so any C1-C7 failure blocks proposal assembly and forces looped repair.

**Tech Stack:** Markdown runtime contracts, ripgrep contract assertions, git.

---

## File Structure and Responsibilities

- `skills/regional-auto-launch-plan/shared/persistence-rules.md` (new): canonical persistence spec (project directory, slug algorithm, write trigger table, write-failure blocking, assembly sequence, linkage checks).
- `skills/regional-auto-launch-plan/SKILL.md`: root gate upgrades (`PERSISTENCE` hard gate, phase switch output with write path, review route -> file mapping, completion requires persisted `proposal.md`).
- `skills/regional-auto-launch-plan/phases/intake.md`: initialize project dir + derive slug + write `00-intake.md` on `ready`.
- `skills/regional-auto-launch-plan/phases/insight.md`: write `01-insight.md` full chapter with C1/C2/C7 structure fail-fast.
- `skills/regional-auto-launch-plan/phases/strategy.md`: write `02-strategy.md` full chapter before Action.
- `skills/regional-auto-launch-plan/phases/action.md`: split five persistence events (`03` placeholder, `04`, `05`, `06`, `07`) and add C3/C4/C5/C6 fail-fast checks.
- `skills/regional-auto-launch-plan/phases/operations.md`: write `08-operations.md` full chapter.
- `skills/regional-auto-launch-plan/phases/service-team.md`: always create `09-service-team.md`; bid=true full role cards, bid=false exact skip text.
- `skills/regional-auto-launch-plan/phases/proposal.md`: read `00`-`09`, run review (including Standard 6), write `proposal.md` only on pass.
- `skills/regional-auto-launch-plan/shared/quality-self-check.md`: add Anti-Compression thresholds + Standard 6 C1-C7 machine-check contract + dedicated review block.
- `skills/regional-auto-launch-plan/shared/proposal-template.md`: declare assembly mode and fixed chapter source order.
- `skills/regional-auto-launch-plan/shared/action-playbook-template.md`: upgrade primary-card shape to `###` + eight `####` sections with length thresholds.
- `skills/regional-auto-launch-plan/shared/insight-modules/competitor-deep.md`: enforce C1 structure and campaign minimum.
- `skills/regional-auto-launch-plan/shared/insight-modules/customer-segmentation.md`: enforce C2 persona-per-subsection structure.
- `skills/regional-auto-launch-plan/shared/insight-modules/city-signal.md`: enforce city-evidence labels consumed by SWOT C7 checks.
- `docs/ARCHITECTURE.md`: sync architecture note for persistence and anti-compression hard gates in regional runtime.
- `docs/histories/YYYY-MM/YYYYMMDD-HHmm-regional-auto-launch-persistence-anti-compression.md`: required change history record.

---

### Task 1: Add Canonical Persistence Contract

**Files:**
- Create: `skills/regional-auto-launch-plan/shared/persistence-rules.md`
- Test: `skills/regional-auto-launch-plan/shared/persistence-rules.md`

- [ ] **Step 1: Verify target file is absent**

Run:
```bash
ls skills/regional-auto-launch-plan/shared/persistence-rules.md 2>/dev/null || echo "FILE_NOT_FOUND"
```
Expected: `FILE_NOT_FOUND`

- [ ] **Step 2: Create persistence contract file**

Write `skills/regional-auto-launch-plan/shared/persistence-rules.md`:

```markdown
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
```

- [ ] **Step 3: Run persistence contract assertions**

Run:
```bash
rg -n "Project directory|Slug derivation|Write trigger table|Write failure handling|Assembly mode|Linkage check" skills/regional-auto-launch-plan/shared/persistence-rules.md
```
Expected: all section titles found.

- [ ] **Step 4: Commit**

```bash
git add skills/regional-auto-launch-plan/shared/persistence-rules.md
git commit -m "feat(regional-auto-launch): add canonical persistence rules contract"
```

---

### Task 2: Upgrade Root Skill Contract for Persistence and Route Mapping

**Files:**
- Modify: `skills/regional-auto-launch-plan/SKILL.md`
- Test: `skills/regional-auto-launch-plan/SKILL.md`

- [ ] **Step 1: Verify insertion anchors exist**

Run:
```bash
rg -n "Global execution discipline|Phase switch protocol|Symptom -> Review Gap route|Completion gate" skills/regional-auto-launch-plan/SKILL.md
```
Expected: all anchors found.

- [ ] **Step 2: Add persistence hard gate and required read index entry**

In `skills/regional-auto-launch-plan/SKILL.md`, add these lines:

```markdown
10. **PERSISTENCE IS MANDATORY** - Every phase must persist chapter output per `./shared/persistence-rules.md`; write failure blocks phase transition.
```

and in shared index:

```markdown
| `./shared/persistence-rules.md` | Persistence contract: folder shape, slug, write triggers, assembly order |
```

- [ ] **Step 3: Extend phase switch protocol with write path disclosure**

In the protocol output block, replace with:

```markdown
## [Phase: <StageName>]
Read: <phase path> + <shared paths>
Write path: <project-dir>/<target-file-or-files>
Task: <one-line objective for this phase>
```

- [ ] **Step 4: Replace route table with file-targeted route mapping**

In `Symptom -> Review Gap route`, replace the generic table with rows that include route + file target:

```markdown
| Symptom | Route | Target file |
| --- | --- | --- |
| C1 fail / competitor compression | research | `01-insight.md` section `2.4` |
| C2 fail / persona compression | research | `01-insight.md` section `2.6` |
| C7 fail / generic SWOT | research | `01-insight.md` section `2.7` |
| Strategy chain inconsistency | ideation | `02-strategy.md` |
| C3/C4/C5/C6 card compression | execution | `04`/`05`/`06-action-phaseN.md` targeted section |
| Budget red-line failure | execution | failed phase file + `03-action-overview.md` |
| Proposal ordering/assembly issue | proposal_enrich | `proposal.md` only |
| Intake verbatim capture issue | intake | `00-intake.md` |
```

- [ ] **Step 5: Tighten completion gate to require persisted proposal**

In completion gate section, ensure pass path includes:

```markdown
- `Review Pass` is `pass`, all global hard gates are satisfied, `BLOCKING-A` is confirmed, and `<project-dir>/proposal.md` is persisted.
```

- [ ] **Step 6: Re-run assertions**

Run:
```bash
rg -n "PERSISTENCE IS MANDATORY|persistence-rules.md|Write path:|Target file|proposal.md is persisted" skills/regional-auto-launch-plan/SKILL.md
```
Expected: all strings found.

- [ ] **Step 7: Commit**

```bash
git add skills/regional-auto-launch-plan/SKILL.md
git commit -m "feat(regional-auto-launch): enforce persistence gate in root skill"
```

---

### Task 3: Intake Persistence and Slug Derivation

**Files:**
- Modify: `skills/regional-auto-launch-plan/phases/intake.md`
- Test: `skills/regional-auto-launch-plan/phases/intake.md`

- [ ] **Step 1: Add required read for persistence rules**

Update Required Read block to include:

```markdown
- `../shared/persistence-rules.md`
```

- [ ] **Step 2: Add project-dir + slug derivation output contract**

Append an output contract block:

```markdown
## Persistence Output Contract

When `Intake Status = ready`, do all items in order:

1. Derive `<project-slug>` using `../shared/persistence-rules.md`.
2. Create `<cwd>/<YYYY-MM-DD>-<project-slug>/`.
3. Write `00-intake.md` with:
   - `## 1. Task Brief`
   - intake required fields table (all required fields present)
   - rubric/tender source text verbatim (if provided)
4. Emit:

```md
## Persistence Path
- project_dir: <absolute-or-cwd-relative path>
- intake_file: <project_dir>/00-intake.md
```
```

- [ ] **Step 3: Add write-failure blocking rule**

Add gate clause:

```markdown
- If slug derivation or `00-intake.md` write fails, set `Intake Status = blocked` and stop before Insight.
```

- [ ] **Step 4: Validate contract text exists**

Run:
```bash
rg -n "Persistence Output Contract|project-slug|00-intake.md|Persistence Path|write fails" skills/regional-auto-launch-plan/phases/intake.md
```
Expected: all strings found.

- [ ] **Step 5: Commit**

```bash
git add skills/regional-auto-launch-plan/phases/intake.md
git commit -m "feat(regional-auto-launch): persist intake chapter and project path"
```

---

### Task 4: Insight and Strategy Full-Chapter Persistence

**Files:**
- Modify: `skills/regional-auto-launch-plan/phases/insight.md`
- Modify: `skills/regional-auto-launch-plan/phases/strategy.md`
- Test: `skills/regional-auto-launch-plan/phases/insight.md`
- Test: `skills/regional-auto-launch-plan/phases/strategy.md`

- [ ] **Step 1: Add persistence required read to both phase files**

Add:

```markdown
- `../shared/persistence-rules.md`
```

to the `Read` list in both files.

- [ ] **Step 2: Upgrade insight output contract for C1/C2/C7 + file write**

In `phases/insight.md`, append:

```markdown
## Persistence Output Contract

- Write `01-insight.md` as final chapter text for `## 2. Market Insight` (`2.1`-`2.7`).
- `2.4` must use per-competitor structure (`### 2.4.<n>`) with 5 fixed `####` dimensions + `#### 近期 Campaign` (>=2).
- `2.6` must use per-persona structure (`### 2.6.<n>`) with 7 fixed `####` dimensions.
- `2.7` SWOT four quadrants must each be >=60 words and cite at least one city evidence source label from `2.5/2.6`.
- If any structural check fails, keep `Insight Gate = fail`, repair in-phase, and do not emit pass.
```

- [ ] **Step 3: Upgrade strategy output contract for chapter write**

In `phases/strategy.md`, append:

```markdown
## Persistence Output Contract

- Before Action begins, write `02-strategy.md` as final chapter text for `## 3. Strategy Plan` (`3.1`-`3.4`, Compact then Expanded).
- Preserve `BLOCKING-A`: Action starts only after user confirms strategy outputs.
- If `02-strategy.md` write fails, keep `Strategy Gate = fail` and stop.
```

- [ ] **Step 4: Run assertions**

Run:
```bash
rg -n "Persistence Output Contract|01-insight.md|2.4.<n>|2.6.<n>|>=60 words|02-strategy.md|BLOCKING-A" skills/regional-auto-launch-plan/phases/insight.md skills/regional-auto-launch-plan/phases/strategy.md
```
Expected: matches in both files.

- [ ] **Step 5: Commit**

```bash
git add skills/regional-auto-launch-plan/phases/insight.md skills/regional-auto-launch-plan/phases/strategy.md
git commit -m "feat(regional-auto-launch): persist insight and strategy chapters"
```

---

### Task 5: Action Phase Five-Event Persistence + C3-C6 Fail-Fast

**Files:**
- Modify: `skills/regional-auto-launch-plan/phases/action.md`
- Test: `skills/regional-auto-launch-plan/phases/action.md`

- [ ] **Step 1: Add persistence required read**

In read section, add:

```markdown
- Read `../shared/persistence-rules.md` for project path and chapter write triggers.
```

- [ ] **Step 2: Replace current transition section with five write events**

Add a new section in `phases/action.md`:

```markdown
## Persistence Events (mandatory)

1. After `BLOCKING-A` confirm:
   - write `03-action-overview.md` with chapter 4 intro + `4.1 Stage Overview` + budget placeholder rows (`TBD`).
2. On Phase 1 auto-display trigger:
   - write `04-action-phase1.md` (`4.2` full text: `1-online` + `1-offline`, each with primary + alternative);
   - backfill Phase 1 budget row in `03-action-overview.md`.
3. On Phase 2 auto-display trigger:
   - write `05-action-phase2.md` (`4.3.A/B/C` full text);
   - enforce venue ratio evidence for `<=60%`;
   - backfill Phase 2 budget row in `03-action-overview.md`.
4. On Phase 3 auto-display trigger:
   - write `06-action-phase3.md` (`4.4` full text);
   - write `07-action-alternatives.md` (`4.5` full alternatives);
   - finalize budget table in `03-action-overview.md`.
5. If any write fails:
   - stop progression and emit blocking error.
```

- [ ] **Step 3: Add C3/C4/C5/C6 hard-gate enforcement block**

Append:

```markdown
## Anti-Compression Hard Gates in Action

- C3: every primary card must use `### <pillar>.primary <name>` + 8 fixed `####` sub-headings.
- C3: each required `####` field must be >=120 words.
- C4: `05-action-phase2.md` must contain `### 4.3.A`, `### 4.3.B`, `### 4.3.C`; each section includes one primary + one alternative.
- C5: every online primary card `#### 媒介平台矩阵` must include Douyin, Xiaohongshu, Dongchedi, Video Account, Weibo, each with >=1 title example.
- C6: every online primary card `#### KOL 矩阵` must include `头部 KOL`, `腰部 KOL`, `KOC`; each layer includes >=2 tactics.
- Fail-fast: if any C3-C6 item fails, do not emit that phase auto-display summary.
```

- [ ] **Step 4: Update output contract to include persisted artifacts**

Ensure output list includes explicit file outputs:

```markdown
6. `## Persisted Files Snapshot`
   - `03-action-overview.md`
   - `04-action-phase1.md`
   - `05-action-phase2.md`
   - `06-action-phase3.md`
   - `07-action-alternatives.md`
```

- [ ] **Step 5: Assert key markers**

Run:
```bash
rg -n "Persistence Events|03-action-overview.md|04-action-phase1.md|05-action-phase2.md|06-action-phase3.md|07-action-alternatives.md|Anti-Compression Hard Gates|C3|C4|C5|C6|>=120" skills/regional-auto-launch-plan/phases/action.md
```
Expected: all tokens found.

- [ ] **Step 6: Commit**

```bash
git add skills/regional-auto-launch-plan/phases/action.md
git commit -m "feat(regional-auto-launch): persist staged action chapters with anti-compression fail-fast"
```

---

### Task 6: Operations and Service-Team Persistence

**Files:**
- Modify: `skills/regional-auto-launch-plan/phases/operations.md`
- Modify: `skills/regional-auto-launch-plan/phases/service-team.md`
- Test: `skills/regional-auto-launch-plan/phases/operations.md`
- Test: `skills/regional-auto-launch-plan/phases/service-team.md`

- [ ] **Step 1: Add persistence required read to both files**

Add:

```markdown
- Read `../shared/persistence-rules.md`.
```

- [ ] **Step 2: Add operations persistence output contract**

In `phases/operations.md`, append:

```markdown
## Persistence Output Contract

- On `Operations Gate = pass`, write `08-operations.md` with final chapter `## 5. Operations Assurance`.
- If write fails, keep gate as fail and stop before Service Team.
```

- [ ] **Step 3: Add service-team always-create rule + exact non-bid text**

In `phases/service-team.md`, replace non-bid routing block with:

```markdown
### Case A: `bid_or_tender = false`

Write `09-service-team.md` exactly:

```md
## 6. Service Team

_本项目 `bid_or_tender = false`，按规范跳过服务团队章节。_

_如后续转为招投标场景，请重新触发 Service Team phase 以补齐角色卡。_
```

Set `Service Team Phase Status = skipped_non_bid` and continue to Proposal.
```

and in bid mode section add:

```markdown
- On success, persist full role cards to `09-service-team.md`.
```

- [ ] **Step 4: Run assertions**

Run:
```bash
rg -n "Persistence Output Contract|08-operations.md|09-service-team.md|bid_or_tender = false|跳过服务团队章节" skills/regional-auto-launch-plan/phases/operations.md skills/regional-auto-launch-plan/phases/service-team.md
```
Expected: all strings found.

- [ ] **Step 5: Commit**

```bash
git add skills/regional-auto-launch-plan/phases/operations.md skills/regional-auto-launch-plan/phases/service-team.md
git commit -m "feat(regional-auto-launch): persist operations and service-team chapters"
```

---

### Task 7: Proposal Phase Mechanical Assembly Contract

**Files:**
- Modify: `skills/regional-auto-launch-plan/phases/proposal.md`
- Test: `skills/regional-auto-launch-plan/phases/proposal.md`

- [ ] **Step 1: Add persistence rules to inputs**

In input read list add:

```markdown
- `../shared/persistence-rules.md`
```

- [ ] **Step 2: Replace assembly contract with file-based assembly**

Replace current section with:

```markdown
## Assembly contract

1. Read persisted files from project directory in fixed order:
   `00-intake.md` -> `01-insight.md` -> `02-strategy.md` -> `03-action-overview.md` -> `04-action-phase1.md` -> `05-action-phase2.md` -> `06-action-phase3.md` -> `07-action-alternatives.md` -> `08-operations.md` -> `09-service-team.md`.
2. Build `proposal.md` by concatenation only:
   `cover + toc + cat 00->09 + closing + optional 14/15`.
3. Do not rewrite or summarize chapter text during assembly.
4. Run `Review Pass` before writing final `proposal.md`.
```

- [ ] **Step 3: Add pass/fail persistence behavior**

Append:

```markdown
## Persistence behavior

- If `Review Pass = pass`: write `proposal.md` by full overwrite.
- If `Review Pass = fail`: do not write `proposal.md`; emit `Review Gap` and route loop repair.
- If loop cap exhausted (`MAX_REVIEW_LOOPS = 3`): write `OPEN-ISSUES.md` in project directory and explicitly report incomplete state.
```

- [ ] **Step 4: Update output contract block**

Replace old output sample with:

```markdown
## Output contract

Emit:

```md
## Review Pass
...

## Anti-Compression Coverage
- verdict: pass/fail
- failed_items: [...]

## Persistence Result
- proposal_written: true/false
- proposal_path: <project_dir>/proposal.md|null
- open_issues_path: <project_dir>/OPEN-ISSUES.md|null

## Review Gap
- route: research|ideation|execution|proposal_enrich|intake|null
- target_file: <file>|null
- required_fixes: [...]
```
```

- [ ] **Step 5: Run assertions**

Run:
```bash
rg -n "cat 00->09|Do not rewrite|Review Pass = pass|Review Pass = fail|OPEN-ISSUES.md|Anti-Compression Coverage|Persistence Result|target_file" skills/regional-auto-launch-plan/phases/proposal.md
```
Expected: all markers found.

- [ ] **Step 6: Commit**

```bash
git add skills/regional-auto-launch-plan/phases/proposal.md
git commit -m "feat(regional-auto-launch): switch proposal phase to mechanical persisted assembly"
```

---

### Task 8: Shared Proposal Template and Action Card Schema Upgrade

**Files:**
- Modify: `skills/regional-auto-launch-plan/shared/proposal-template.md`
- Modify: `skills/regional-auto-launch-plan/shared/action-playbook-template.md`
- Test: `skills/regional-auto-launch-plan/shared/proposal-template.md`
- Test: `skills/regional-auto-launch-plan/shared/action-playbook-template.md`

- [ ] **Step 1: Add assembly-mode section to proposal template**

At top of `shared/proposal-template.md`, add:

```markdown
## Assembly mode (mandatory)

- `proposal.md` is a mechanical assembly artifact from persisted chapter files.
- Chapter source-of-truth files are `00`-`09`; assembly layer must not summarize or rewrite.
- Fixed order is defined in `../shared/persistence-rules.md` and cannot be reordered.
```

- [ ] **Step 2: Upgrade action-playbook card format to eight `####` sections**

In `shared/action-playbook-template.md`, append a canonical expanded schema for `primary` cards:

```markdown
## Primary Card Expanded Schema (anti-compression)

Each `primary` card in phase outputs must use:

```md
### <pillar>.primary <creative name>
#### 活动目的
#### 核心创意亮点
#### 活动玩法
#### 执行流程
#### 媒介平台矩阵
#### KOL 矩阵
#### 转化闭环
#### 话题标签
```

Rules:

- Each `####` section must be >=120 words.
- For online pillars, `媒介平台矩阵` and `KOL 矩阵` must satisfy C5/C6 in quality self-check.
- Keep original 13-field schema as semantic appendix (mapping only), not as compressed output form.
```

- [ ] **Step 3: Verify both contract updates**

Run:
```bash
rg -n "Assembly mode|source-of-truth|Primary Card Expanded Schema|<pillar>.primary|#### 活动目的|>=120 words|semantic appendix" skills/regional-auto-launch-plan/shared/proposal-template.md skills/regional-auto-launch-plan/shared/action-playbook-template.md
```
Expected: all keywords found.

- [ ] **Step 4: Commit**

```bash
git add skills/regional-auto-launch-plan/shared/proposal-template.md skills/regional-auto-launch-plan/shared/action-playbook-template.md
git commit -m "feat(regional-auto-launch): align proposal template and action schema with anti-compression design"
```

---

### Task 9: Add Standard 6 Anti-Compression Coverage

**Files:**
- Modify: `skills/regional-auto-launch-plan/shared/quality-self-check.md`
- Test: `skills/regional-auto-launch-plan/shared/quality-self-check.md`

- [ ] **Step 1: Add threshold constants section**

Insert near top:

```markdown
## Anti-Compression Thresholds

- C3 minimum words per card field: 120
- C7 minimum words per SWOT quadrant: 60
- C1 minimum recent campaigns per competitor: 2
- C5 minimum title examples per required platform row: 1
- C6 minimum tactics per KOL layer: 2
- C4 minimum cards per Phase 2 segment: 1 primary + 1 alternative
```

- [ ] **Step 2: Add Standard 6 definition with C1-C7 checks**

Append:

```markdown
## Standard 6: Anti-Compression Coverage (always enabled)

- C1: `01-insight.md` section `2.4` has per-competitor `### 2.4.<n>` blocks with 5 fixed dimensions and >=2 recent campaigns.
- C2: `01-insight.md` section `2.6` has per-persona `### 2.6.<n>` blocks with 7 fixed dimensions.
- C3: every `primary` card in `04/05/06` has 8 fixed `####` headings and each field >=120 words.
- C4: `05-action-phase2.md` contains `4.3.A/B/C`; each includes one primary + one alternative.
- C5: online primary `#### 媒介平台矩阵` includes five required platforms each with >=1 title example.
- C6: online primary `#### KOL 矩阵` includes `头部 KOL/腰部 KOL/KOC`, each with >=2 tactics.
- C7: SWOT quadrants in `2.7` are >=60 words and include city-evidence label reference.

Any single fail forces overall `Review Pass = fail`.
```

- [ ] **Step 3: Upgrade review output template to include anti-compression block**

Add to template block:

```markdown
### Anti-Compression Coverage
- verdict: pass/fail
- failed_items:
  - Cx: <failure detail>
```

- [ ] **Step 4: Run assertions**

Run:
```bash
rg -n "Anti-Compression Thresholds|Standard 6|C1:|C2:|C3:|C4:|C5:|C6:|C7:|Any single fail|### Anti-Compression Coverage" skills/regional-auto-launch-plan/shared/quality-self-check.md
```
Expected: all markers found.

- [ ] **Step 5: Commit**

```bash
git add skills/regional-auto-launch-plan/shared/quality-self-check.md
git commit -m "feat(regional-auto-launch): add standard 6 anti-compression hard gates"
```

---

### Task 10: Insight Submodule Contract Tightening for C1/C2/C7 Inputs

**Files:**
- Modify: `skills/regional-auto-launch-plan/shared/insight-modules/competitor-deep.md`
- Modify: `skills/regional-auto-launch-plan/shared/insight-modules/customer-segmentation.md`
- Modify: `skills/regional-auto-launch-plan/shared/insight-modules/city-signal.md`
- Test: `skills/regional-auto-launch-plan/shared/insight-modules/competitor-deep.md`
- Test: `skills/regional-auto-launch-plan/shared/insight-modules/customer-segmentation.md`
- Test: `skills/regional-auto-launch-plan/shared/insight-modules/city-signal.md`

- [ ] **Step 1: Enforce competitor-per-subsection shape in `competitor-deep.md`**

Replace output template with explicit chapter shape:

```markdown
## 2.4 Competitor Deep Dive

### 2.4.<n> <competitor name>
#### 核心定位
#### 营销打法
#### 渠道策略
#### 用户信任路径
#### 应对策略
#### 近期 Campaign
1. ...
2. ...
```

- [ ] **Step 2: Enforce persona-per-subsection shape in `customer-segmentation.md`**

Add required format:

```markdown
## 2.6 Audience Regional Depth

### 2.6.<n> <persona name>
#### 消费趋势
#### 触媒习惯
#### 空间分布
#### 心态
#### 消费习惯
#### 出行习惯
#### 文化情感归因
```

- [ ] **Step 3: Add city-evidence source label rule in `city-signal.md`**

Append:

```markdown
## Source label requirement

Each evidence item must include reusable label format:

- `[CITY-EV-<short-id>] <source + key point>`

SWOT (`2.7`) must quote at least one label per quadrant.
```

- [ ] **Step 4: Run assertions across all three files**

Run:
```bash
rg -n "2.4.<n>|#### 核心定位|#### 近期 Campaign|2.6.<n>|#### 文化情感归因|CITY-EV-|SWOT" skills/regional-auto-launch-plan/shared/insight-modules/competitor-deep.md skills/regional-auto-launch-plan/shared/insight-modules/customer-segmentation.md skills/regional-auto-launch-plan/shared/insight-modules/city-signal.md
```
Expected: all markers found.

- [ ] **Step 5: Commit**

```bash
git add skills/regional-auto-launch-plan/shared/insight-modules/competitor-deep.md skills/regional-auto-launch-plan/shared/insight-modules/customer-segmentation.md skills/regional-auto-launch-plan/shared/insight-modules/city-signal.md
git commit -m "feat(regional-auto-launch): tighten insight module contracts for anti-compression checks"
```

---

### Task 11: Docs Sync (Architecture + Change History)

**Files:**
- Modify: `docs/ARCHITECTURE.md`
- Create: `docs/histories/2026-05/YYYYMMDD-HHmm-regional-auto-launch-persistence-anti-compression.md`
- Test: `docs/ARCHITECTURE.md`
- Test: `docs/histories/2026-05/YYYYMMDD-HHmm-regional-auto-launch-persistence-anti-compression.md`

- [ ] **Step 1: Update architecture notes for persistence and assembly mechanics**

In `docs/ARCHITECTURE.md`, add bullets in regional package sections:

```markdown
- regional runtime now uses persisted chapter files (`00`-`09`) as source-of-truth and assembles `proposal.md` mechanically.
- `shared/persistence-rules.md` is required by phase contracts and blocks downstream progression on write failure.
- `shared/quality-self-check.md` includes `Standard 6` anti-compression hard gates (C1-C7).
```

- [ ] **Step 2: Create history record using repository template style**

Create `docs/histories/2026-05/YYYYMMDD-HHmm-regional-auto-launch-persistence-anti-compression.md` with:

```markdown
# regional-auto-launch 持久化与反压缩硬闸改造

## 用户诉求（脱敏）

用户要求 regional-auto-launch 输出必须落盘，并禁止章节压缩/缩略，最终 `proposal.md` 必须由分章节文件机械拼装。

## 主要改动

- 新增 `shared/persistence-rules.md`，定义目录、slug、触发表、失败处理、装订顺序、linkage 检查。
- 升级所有 phase 合同，落盘 `00`-`09` 章节文件。
- proposal 改为仅在 Review Pass 通过后写 `proposal.md`，失败进入 loop。
- 新增 Standard 6（C1-C7）反压缩硬闸与阈值常量。

## 关键影响文件

- `skills/regional-auto-launch-plan/SKILL.md`
- `skills/regional-auto-launch-plan/phases/*.md`
- `skills/regional-auto-launch-plan/shared/quality-self-check.md`
- `skills/regional-auto-launch-plan/shared/persistence-rules.md`
```

- [ ] **Step 3: Validate docs updates**

Run:
```bash
rg -n "persistence-rules|00-09|mechanically|Standard 6|C1-C7" docs/ARCHITECTURE.md docs/histories/2026-05/*regional-auto-launch-persistence-anti-compression.md
```
Expected: all markers found.

- [ ] **Step 4: Commit**

```bash
git add docs/ARCHITECTURE.md docs/histories/2026-05/*regional-auto-launch-persistence-anti-compression.md
git commit -m "docs: sync architecture and history for regional persistence anti-compression rollout"
```

---

### Task 12: End-to-End Contract Verification Against Acceptance Criteria

**Files:**
- Test: `skills/regional-auto-launch-plan/**/*`
- Test: `docs/ARCHITECTURE.md`

- [ ] **Step 1: Run focused contract checks for persistence files and assembly chain**

Run:
```bash
rg -n "00-intake.md|01-insight.md|02-strategy.md|03-action-overview.md|04-action-phase1.md|05-action-phase2.md|06-action-phase3.md|07-action-alternatives.md|08-operations.md|09-service-team.md|proposal.md" skills/regional-auto-launch-plan/SKILL.md skills/regional-auto-launch-plan/phases/*.md skills/regional-auto-launch-plan/shared/persistence-rules.md
```
Expected: all file names referenced in contracts.

- [ ] **Step 2: Run anti-compression marker checks (C1-C7)**

Run:
```bash
rg -n "C1|C2|C3|C4|C5|C6|C7|>=120|>=60|Anti-Compression Coverage" skills/regional-auto-launch-plan/phases/*.md skills/regional-auto-launch-plan/shared/*.md skills/regional-auto-launch-plan/shared/insight-modules/*.md
```
Expected: C1-C7 markers and thresholds found in runtime contracts.

- [ ] **Step 3: Run git diff sanity check before final commit**

Run:
```bash
git diff -- skills/regional-auto-launch-plan docs/ARCHITECTURE.md docs/histories
```
Expected: only intended persistence + anti-compression + docs-sync changes appear.

- [ ] **Step 4: Final commit**

```bash
git add skills/regional-auto-launch-plan docs/ARCHITECTURE.md docs/histories
git commit -m "feat(regional-auto-launch): enforce persisted chapter workflow and anti-compression gates"
```

---

## Spec Coverage Self-Check

- Persistence scope (`00`-`09` + `proposal.md`) is mapped in Tasks 1-7 and verified in Task 12.
- Slug derivation, directory creation, and write failure blocking are covered in Tasks 1 and 3.
- Mechanical assembly and no-rewrite rule for `proposal.md` are covered in Tasks 1 and 7.
- C1-C7 anti-compression hard gates and thresholds are covered in Tasks 4, 5, 9, and 10.
- Review-loop route-to-file mapping and linkage checks are covered in Tasks 1, 2, and 7.
- Documentation sync requirements are covered in Task 11.
- Non-goals are preserved (no `skills/media-plan/` edits, no pre-brief-search modifications).

## Placeholder Scan

- No `TODO`, `TBD`, or deferred placeholders in execution steps.
- Every code-edit step includes concrete markdown blocks and exact file paths.
- Every verification step includes exact commands and expected outcomes.

## Type and Contract Consistency

- `00`-`09` file names are used consistently across root, phase, and proposal tasks.
- Anti-compression labels `C1`-`C7` are used consistently between phase gates and quality checks.
- Route names stay constrained to `research|ideation|execution|proposal_enrich|intake`.
