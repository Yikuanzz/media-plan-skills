# Core Strategic Idea

Single **canonical** narrative for the chosen direction. Downstream `Theme` and `Core tension` in `highlight-mechanism-canvas.md` must **align with** this block (no contradictory second “main story”).

## When required

- **Ideation**: Before `## Selected Direction Handoff` in [idea-scorecard.md](idea-scorecard.md), every recommended primary direction (and each co-direction if it has a distinct story) must have a filled `## Core Strategic Idea` for that direction.
- **Proposal**: Include the same content under proposal section `Core Strategic Idea` (see [proposal-template.md](proposal-template.md)).

## Output shape

```md
## Core Strategic Idea

### [Direction name] (or Primary / Co)
- One-line claim: [single sentence — campaign-line / proposition level]
- Core value: [2-4 product-truth pillars, e.g. "全尺寸 | 高智能 | 超安全"]
- Marketing主线: [emotional narrative thread, e.g. "奕家主场 · 境享美好"]
- Slogan derivation logic: [explicit chain from insight dimensions — brand dimension + audience/use-case dimension + product value dimension → final slogan; dimensions must match the briefed brand positioning, not default to generic stereotypes]
- Stage sub-themes:
  - Early: [sub-theme for anticipation / setup]
  - Mid: [sub-theme for proof / participation]
  - Late: [sub-theme for conversion / retention / referral]
- Core contradiction: [what the audience does not believe, or the category default belief to break]
- Resolution path: [how comms and experience will resolve that contradiction; must be testable in-market]
- Strategy pillars: [2-4 strategic thrusts that organize execution, e.g. 声量饱和攻击 / 场景高频体验 / 链路高效转化]
```

## Rules

- **One primary claim** per direction; if multiple co-directions, each may have its own `###` block or state explicitly which is the lead narrative.
- The one-line claim must be quotable in a deck title or chapter head.
- `Core contradiction` is not generic “trust is low”; tie it to **this** brief, product, and region.
- `Resolution path` must name **at least one** proof type (event, content series, KOL layer, product demo, data, partner) — not slogans only.
- `Core value` must be **product-truth-based**, not slogans. Format: 2-4 keyword pillars separated by `|`.
- `Marketing主线` must connect product truth to audience emotion. It should be quotable as a chapter headline.
- `Marketing主线` must now be provably derivable from `Slogan derivation logic`; if the slogan appears invented without derivation, mark the block incomplete.
- `Strategy pillars` must name the **strategic thrusts** (not tactics) that organize all downstream execution. Every phase action must map to at least one pillar.
- These three fields (`Slogan derivation logic`, `Stage sub-themes`, `Strategy pillars`) are mandatory for every `keep` direction.
- Downstream binding: In `proposal-template.md` (`general_proposal` mode), the proposal must echo these fields by semantic section anchor, not fixed chapter numbering:
  - `Core value` → `Core Strategic Idea`
  - `Marketing主线` → `Strategic Direction`
  - `Strategy pillars` → `Phased Execution Plan` and `Phased Event Menu`
  - `Slogan derivation logic` → `Core Strategic Idea` (as derivation chain evidence)
  - `Stage sub-themes` → `Phased Execution Plan` (as stage theme mapping)
