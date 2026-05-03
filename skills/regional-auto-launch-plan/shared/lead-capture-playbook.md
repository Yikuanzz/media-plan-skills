# Lead Capture Playbook

Use this contract in `Phase: Action` for traffic capture, lead qualification, and dealer intake handoff.

## Platform-Level Lead Capture Mechanics

### Required platforms (7)

1. Douyin
2. Xiaohongshu
3. WeChat Video Account
4. WeChat Official Account
5. WeCom / private QR entry
6. Dongchedi
7. Weibo

### Platform capture methods and trigger content

#### Required output per platform card

- capture entry
- trigger content
- tracking key

| Platform | Core capture method | Trigger content examples | Tracking key |
| --- | --- | --- | --- |
| Douyin | lead form + private message keyword | test-drive challenge, family scenario short video | UTM + keyword code |
| Xiaohongshu | comment keyword + private card | city lifestyle note, family trip checklist | note-id + keyword tag |
| Video Account | live预约 + QR scan | launch live preview, policy Q&A | live room tag + QR source |
| Official Account | menu CTA + form | subsidy explainer, ordering timeline | menu path + form source |
| WeCom / private QR | poster QR + auto greeting | event invitation, owner referral card | staff id + qr batch |
| Dongchedi | compare page CTA + inquiry | spec compare, pricing calculator | campaign id + model id |
| Weibo | topic card + landing form | city event co-creation, launch day countdown | topic id + short link |

## Lead Scoring and Qualification Model

### Tier model

#### Tier execution rule

- Tier must be assigned before dealer handoff.

- `H` high intent
- `W` warm intent
- `C` cold or early research

### 5-dimension scorecard

| Dimension | Score range | Guide |
| --- | --- | --- |
| Purchase window | 0-20 | <30 days highest |
| Budget match | 0-20 | price-band fit |
| Product fit | 0-20 | family usage + feature demand |
| Engagement depth | 0-20 | multi-touch behavior |
| Contact validity | 0-20 | reachable + verified |

Threshold:

- `H`: >=75
- `W`: 45-74
- `C`: <45

### Tier talk tracks

- `H` tier: book test-drive or order consultation within 24h.
- `W` tier: content warming + policy education + scheduled follow-up.
- `C` tier: low-frequency nurture with comparison and ownership basics.

## Pre-Event Lead Warming Sequence

### N-14 to N calendar

#### Daily operation minimum

- one content touch
- one response handling rule
- one lead-status update

| Window | Objective | Touch format | Expected output |
| --- | --- | --- | --- |
| N-14 to N-10 | awareness and screening | short video + poster + lead quiz | first lead pool |
| N-9 to N-6 | intent enrichment | family scenario content + policy brief | H/W/C split |
| N-5 to N-3 | appointment push | test-drive slot release + reminder | confirmed attendance |
| N-2 to N-1 | conversion prep | one-to-one reminder + FAQ | no-show reduction |
| N day | on-site conversion | check-in script + sales handoff | test-drive and order |

## Dealer Lead Intake SOP

### Intake flow

#### Mandatory intake fields

- source id
- lead tier
- owner and SLA
- next follow-up timestamp

1. Lead source normalization (platform/source code/timestamp).
2. H/W/C tagging and dealer assignment.
3. SLA callback execution.
4. Follow-up record into CRM.
5. Daily conversion sync and exception handling.

### SLA baseline

- `H`: first callback <=30 minutes.
- `W`: first callback <=4 hours.
- `C`: first callback <=24 hours.

### Performance dashboard minimum fields

- leads received
- callback SLA hit rate
- test-drive booking rate
- order conversion rate

## CPL Benchmark Reference

### Platform benchmark ranges (reference only)

#### Benchmark usage note

- Use as planning reference, not guaranteed outcome.

| Platform | CPL reference (CNY) |
| --- | --- |
| Douyin | 60-150 |
| Xiaohongshu | 80-180 |
| Video Account | 50-120 |
| Official Account | 40-100 |
| WeCom private QR | 20-80 |
| Dongchedi | 90-220 |
| Weibo | 70-160 |

### Stage-level guidance for small budget (200k-300k)

- Phase 1: prioritize low-cost lead expansion and scoring.
- Phase 2: prioritize test-drive and order-conversion leads.
- Phase 3: prioritize referral and reactivation leads.

## Persona-to-Platform Targeting Matrix

### Mapping usage note

#### Activation rule

- Each selected persona must map to at least one primary platform and one tracking parameter set.

| Persona signal | Primary platform | Targeting parameters |
| --- | --- | --- |
| young family, first buy | Douyin + Xiaohongshu | parenting, commuting, city life |
| upgrade family, quality focus | Official Account + Video Account | high-intent followers, policy readers |
| value-driven conversion seekers | Dongchedi + WeCom | price compare, test-drive interest |
| social sharing owners | Weibo + WeCom | topic engagement + referral groups |

## Gate for Action use

- Fail if platform mechanics are missing for any required platform.
- Fail if H/W/C model or SLA mapping is missing.
- Fail if N-14 to N warming sequence is not present.
