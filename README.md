# GATO (Gato Karakura)

> "Small Can Grow"

Mobile-first financial and business assistant for informal micro-entrepreneurs across Africa — especially women operating survival-level businesses: fruit sellers, vegetable vendors, street food vendors, second-hand clothes sellers, market stall owners, small livestock traders, mobile money agents, and rural merchants.

## Strategic Position

GATO is not a bookkeeping app. It is a growth partner that combines:
- Business management (sales, expenses, inventory, profit)
- Alternative credit scoring (GATO Trust Score)
- Embedded finance (micro loans, savings, insurance)
- Community (seller groups, women's circles, village networks)
- Gamification (Business Score, Trust Score, Growth Score)
- AI coaching (voice-first, SMS-first, WhatsApp-first)

All built offline-first for users with low digital literacy, limited data, old smartphones, and rural connectivity.

## Launch Markets

| Phase | Country | Timeline | Goal |
|-------|---------|----------|------|
| 1 | Burundi | 0-12 months | 5,000 users |
| 2 | Rwanda | 6-18 months | 20,000 users |
| 3 | Kenya | 12-36 months | 100,000 users |

## Supported Languages

Kirundi, French, Kinyarwanda, Swahili, English

## Repo Layout

- `lib/features/` - Sales, Expenses, Inventory, Reports, Savings, Profile, Onboarding, Community, Coach, Credit, Loans, Voice
- `lib/domain/` - Entities, repositories, use cases
- `lib/data/` - Datasources (local Drift + remote Supabase), mappers, repository implementations
- `lib/services/` - Sync, AI, SMS, USSD, WhatsApp, Voice, Trust Score, Storage
- `lib/core/` - Constants, theme (accessibility-first), error handling, localization

## Architecture

- Clean Architecture with Riverpod state management
- Offline-first: Drift (SQLite) local database with custom sync engine
- Supabase backend (planned integration points defined)
- SMS / USSD / WhatsApp / Voice integration layers ready for telco/aggregator connection
- AI: hybrid on-device (TensorFlow Lite) + cloud (OpenAI/Claude APIs)

## Local Setup

```bash
git clone https://github.com/<YOUR_ORG>/gato.git
cd gato
cp .env.example .env
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

## Key Design Principles

1. **Offline-first**: core flows work without data; sync opportunistically
2. **Literacy-agnostic**: voice input, pictograms, audio feedback, SMS fallback
3. **Privacy-first**: local-first data; user controls sharing for credit scoring
4. **Trust-first**: no surprise fees; transparent algorithms; community verification
5. **Low data**: app < 25MB; progressive asset loading; SMS compression for feature phones

## Status

Phase 0 (Research Assets & Documentation) — COMPLETE  
Phase 1 (Repository & Architecture Setup) — COMPLETE  

Next up: Phase 2 (Backend Foundation — Supabase)

## Documentation

- Feasibility Study: `/root/GATO_Karakura_Feasibility_Study.md`
- Implementation Plan: `/root/GATO_Implementation_Plan.md`
- Architecture Decisions: `/projects/gato/docs/decisions/adr-001-to-006.md`
- Architecture Overview: `/projects/gato/docs/architecture/overview.md`
- Database Schema: `/projects/gato/docs/database/schema.md`
- Sync Engine: `/projects/gato/docs/sync/engine.md`

---

*GATO Karakura — Small Can Grow*
