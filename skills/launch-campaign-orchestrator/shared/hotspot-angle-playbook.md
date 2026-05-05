# Hotspot Angle Playbook (Launch Lead Pool)

This file is now **a creative engine + an anti–1+1 filter**. Earlier versions used it only as a scorecard guard; that left the lead pool spine-first and product-self-narrating (see `run/r1/02-lead-pool.md` for the failure case). The upgraded playbook drives **divergent generation** in Activity Card Draw and **packaging filtering** in Lead Pool.

> **Non-runtime maintenance note:** Conceptual sibling for human sync: `skills/media-plan/shared/inspiration-directions.md` (same "mechanism + angle + anti-pattern" spirit). Execution must not depend on reading that file. The runtime card deck for divergence lives in `./activity-card-deck.md`.

## Definition: what "蹭热度" means here

**Hotspot packaging** = take a **traceable** public signal (what people are already discussing, where, and roughly when — captured as `HS-*` atom) and apply a **single entry mechanism** that **re-routes** understanding of the brand or launch — so the lead **serves a Narrative Spine state transition** (`narrative_alignment.serves_transition` + `trigger_mechanism`) **after packaging** (it does not have to start aligned during divergent draw).

**Not** hotspot packaging: placing "festival / trend + product claim" **side by side** with no semantic bridge (classic **1+1 stack**).

## When to use this playbook

| Phase | Role of this playbook |
|---|---|
| Hotspot Harvest | Read the **direction cheatsheet** to ensure HS-* atoms span ≥4 buckets and ≥6 of the 8 directions are reachable |
| Activity Card Draw | Use **prompt formulas** (§ Divergence Engine) to generate raw ideas; produce **double dose** per idea |
| Lead Pool Packaging | Use **Anti–1+1 checklist** as the rejection filter; use direction cheatsheet to validate `angle_of_entry` against the chosen card |
| Idea Scoring | Use the dimension guidance in `./idea-scorecard.md` (which references this playbook) |

## Three questions (before any "够热" or hotspot-driven lead)

Answer in one line each:

1. **Heat source:** What is burning in public — platform/topic/memetic node/event window/city chatter? (Reference the specific `HS-*` atom; cross-link to `TR-*` / `CS-*` if relevant.)
2. **Why this hook:** Why **this** signal and not a generic label (e.g. "Spring Festival")?
3. **Spine isomorphism (post-packaging):** Which transition does `trigger_mechanism` **implement** after packaging — same causal direction as Spine, not pasted keywords?

If (1) is vague or (3) cannot be answered even after rework, reject the lead. **Note**: during Activity Card Draw, only (1) and (2) are required; (3) is deferred to Lead Pool Packaging.

## Direction cheatsheet (mechanisms + sharp angle + avoid)

Strip to **borrow / fold-in / exit** logic. Names align with inspiration-direction taxonomy and the runtime card deck (`./activity-card-deck.md`). Examples are illustrative, not mandatory.

| Direction | Borrow (public attention) | Fold-in (entry mechanism) | Exit / guardrail |
|-----------|---------------------------|---------------------------|------------------|
| Time anchors (D-TA) | Festival, seasonal ritual, calendar urgency | Single **time-coded** ritual or countdown that proves product role in that moment | Avoid generic greetings; close after node; differentiate vs crowd |
| Regional / local IP (D-RL) | City symbol, dialect, place-based pride | **Local truth** (route, craft, landmark behavior) tied to launch geography | No stereotype props; needs on-ground path |
| Cross-category shock (D-CC) | Unexpected pairing with believable overlap | **Contrast resolves** into one use scene or one proof artifact | Logo swap only; no product truth |
| Major events / competition waves (D-ME) | Sports, music, industry summit peaks | Planned **keywords + live beats** + recap; participation not cheerleading | Late "me too" posts; passive sponsorship skinning |
| Culture / meme (D-CM) | Meme lifecycle, subculture tone, hit content formats | Native language; fast lane; **remix authority** or invite creator in | Forced meme; tone mismatch |
| Tech / innovation proof (D-TP) | Builder buzz, demos, benchmarks | Scenario-first proof; credible demo or third-party tie | Spec dump; "we use AI" with no demo |
| Social resonance (D-SR) | Shared public emotion aligned with brief | Earned narrative; real stories; sustained beats | Purpose-wash; one-off virtue post |
| Co-creation / challenge (D-CR) | Platform challenge norms, low-friction loops | Clear participation frame + amplification + moderation | Hollow hashtag; no prize or follow-through |

## Divergence Engine (prompt formulas)

For each direction, three prompt families. Apply by substituting `{HS-id}` (the hotspot atom) and `{车}` (the launch product) into the prompt. Use these in Activity Card Draw to force divergent ideation. **Each prompt is meant to provoke 2–3 raw ideas, not a single answer.**

### Time anchors (D-TA)

- **Ritual prompt**: "如果把上市那天倒推 30 天做成一种仪式，每天发生一件什么事，让 {HS-id} 中提到的人群觉得『值得等』？"
- **Reverse prompt**: "{HS-id} 的传统语义里有什么是这次上市要刻意反着来的？"
- **Calendar fold prompt**: "{车} 在 {HS-id} 节点能不能成为某个具体仪式的『新道具』？"

### Regional / local IP (D-RL)

- **Local truth prompt**: "{HS-id} 在 {city} 里最具体、最少被官方化的一帧画面是什么？{车} 站进去会怎样？"
- **Pain prompt**: "{HS-id} 里 {city} 用户最不能告诉外人的尴尬是什么？{车} 有底气接吗？"
- **Route prompt**: "{HS-id} 涉及的 {city} 路线里，哪一段被 {车} 重新定义后会变成新词？"

### Cross-category (D-CC)

- **Unlikely pairing prompt**: "如果 {车} 和 {HS-id} 中提到的某个非汽车物品/品牌联名，最反直觉但最讲得通的是哪一对？"
- **Object fold prompt**: "{车} 的某个零件能不能变成 {HS-id} 里的爆款单品？"
- **Service crossover prompt**: "{车} 的服务体系借给 {HS-id} 涉及的服务行业，谁最受益？"

### Major events (D-ME)

- **Live beat prompt**: "{HS-id} 中事件发生时，{车} 不做赞助也能 让人觉得『他们好像和这事有关』，要做什么？"
- **Forgotten audience prompt**: "{HS-id} 里被忽略的群体是谁？{车} 如何为他们说一句话？"
- **Recap fold prompt**: "{HS-id} 结束后 7 天，{车} 能产出一种什么内容让讨论延续？"

### Culture meme (D-CM)

- **Native adopt prompt**: "{HS-id} 里的 meme 主角能不能官方化为 {车} 的某个零件人格？"
- **Tone reverse prompt**: "{车} 不正经一回，最该模仿 {HS-id} 中提到的哪种调性？"
- **Subculture code prompt**: "{HS-id} 涉及圈层的暗语里，哪一句最适合 {车} 收编进车机/UI？"

### Tech proof (D-TP)

- **Scenario prompt**: "{车} 的某个技术指标翻译成 {HS-id} 里的具体场景，最反直觉的版本是什么？"
- **Builder prompt**: "{HS-id} 中的工程师/创始人 IP 能否复用为 {车} 的某种人格？"
- **Public lab prompt**: "把 {车} 的实验室搬到 {HS-id} 提到的物理场景里，最先公开测什么？"

### Social resonance (D-SR)

- **Wave prompt**: "{HS-id} 里那句最痛的公共情绪，{车} 敢真诚回答吗？怎么答而不滑成 purpose-wash？"
- **Generation prompt**: "{HS-id} 的代际/群体冲突中，{车} 站在哪一侧？怎么不端着？"
- **Quiet pride prompt**: "{HS-id} 里有没有一种『悄悄骄傲』的情绪？{车} 怎么不掉书袋地承接？"

### Co-creation (D-CR)

- **Low-friction prompt**: "把 {HS-id} 的格式做成一个 3 秒就能拍的 challenge，钩子是什么？"
- **User-IP prompt**: "{HS-id} 涉及的人群里，谁的故事一旦被 {车} 放大就变成事件 IP？"
- **Closed loop prompt**: "{HS-id} 中的 UGC 能否变成 {车} 一年后真实可售/可用的物品？"

## Double-Dose Production Rule

For every raw idea generated via the prompts above, produce **both** a `crazy_dose` and a `safe_dose`:

- `crazy_dose`: pushed to the edge of brand permission, budget, and central-SOE etiquette. Goal: maximum social explosion.
- `safe_dose`: the same core mechanism but contractable, trackable, defendable. Goal: procurement and legal sleep at night.

**Both doses share the same fold-in mechanism**, otherwise they are two different ideas. The dose pair lets Strategy Plan choose per stage based on energy curve — peaks take crazy, valleys take safe.

A raw idea **without both doses is incomplete**. A raw idea where the two doses are essentially the same sentence indicates the team did not push the boundary in `crazy_dose` — re-do.

## Anti–1+1 checklist (reject or rewrite)

Flag as **invalid** for "够热" or any hotspot-driven lead if any apply:

- Heat is only a **label** (e.g. holiday name) with no **mechanism** in `angle_of_entry`.
- Creative is **logo / generic blessing / template poster** on a hot background.
- No **time window** (pre / peak / exit) or meme **lifecycle** awareness.
- `spine_bridge` restates marketing slogans but does not **name the transition** the user undergoes (post-packaging).
- Single low-trust source or pure speculation — must stay provisional until backed by `HS-*` (medium+) / `TR-*` / `CS-*` or resolved Pre-brief Search (see `source-trust-policy.md`).
- `crazy_dose` and `safe_dose` are essentially the same sentence (no dose tension).
- `divergence_card` was drawn but no `prompt_question` was actually answered (the card was decoration, not a generator).

## Linking to Lead schema

Every lead must stay consistent with `./shared/lead-template.md`:

- **`hotspot_lineage`**: list of `HS-*` IDs that fueled this lead (≥60% of pool must have ≥1).
- **`divergence_card`**: which card was drawn during Activity Card Draw.
- **`angle_of_entry`**: structural relation (how public meaning **feeds** the launch story), not "A + B".
- **`spine_bridge`**: explicit link from that mechanism to `narrative_alignment.serves_transition` (must not contradict `trigger_mechanism`).
- **`shallow_stack_check`**: one concrete reason this is **not** a lazy stack (or `n/a` only when hotspot fields are waived per template rules).
- **`packaging_pass`**: `direct` if Spine fits without rework; `reworked` with a substantive `rework_note` otherwise.

## Quick self-test ("whiteboard test")

Can someone else draw **one arrow** from public signal → mechanism → emotion shift on Spine, **without** adding a second parallel arrow for "and also our USP"? If they need two disconnected arrows, the lead is still 1+1.

If it took a `reworked` packaging to get the arrow to draw, that is fine — the packaging is the rework. But if even with rework two arrows are needed, the lead fails the test.
