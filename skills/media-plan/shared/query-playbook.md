# Query Playbook

## Research module routing (read before first search in a pass)

- **Competitor / benchmark depth** (trust path, campaign proof): read `./research-modules/competitor-deep.md` then run queries below.
- **City / region / Hotspot pairings** (venues, local calendar): read `./research-modules/city-signal.md` then run regional queries.
- **Review loop** re-entry for evidence gaps: load the same module that matches the gap type before new `tavily_search` calls.

## Hotspot Query

- intent: detect recent platform chatter, live attention spikes, memes, or event-adjacent discussion
- pattern: `<brand or category> recent trend China`, `<topic> Xiaohongshu Weibo Douyin hot`, `<event> brand discussion China`
- preferred window: last 30 to 90 days

## Trend Query

- intent: understand broader consumer or category movement beyond a single news cycle
- pattern: `<category> China trend report`, `<audience> behavior China 2026`, `<category> consulting report China`
- preferred window: last 6 to 12 months

## Regional Query

- intent: validate city or region-specific culture, tourism, commerce, or creator signals
- pattern: `<city> tourism trend`, `<city> local culture campaign`, `<city> brand event`, `<city> creator trend`
- preferred window: last 3 to 12 months depending on event timing

## Platform Signal Query

- intent: check platform-native formats, creator norms, topic heat, and participation mechanics
- pattern: `<platform> topic trend <category>`, `<platform> challenge case`, `<platform> user discussion <topic>`
- preferred window: last 30 to 90 days

## Validation Rule

- Start with the query family closest to the brief signal.
- If the first pass returns only weak or noisy signals, tighten the time window or add a stronger source class.
- If signal discovery succeeds but trust is weak, run a follow-up validation query through stronger editorial, consulting, or official sources.
