# GATO — System Architecture Overview

## High-Level Architecture

GATO follows an **offline-first** architecture where the mobile device is the system of record. All user actions are captured locally first, then synchronized to Supabase in the background.

### Layers
1. **Presentation Layer** — Flutter widgets, Riverpod providers
2. **Domain Layer** — Entities, repository interfaces, use cases
3. **Data Layer** — Drift local DAOs + Supabase remote datasources
4. **Sync Layer** — Queue-based offline-first sync engine
5. **Service Layer** — SMS, USSD, Voice, Trust Score, AI Coach
6. **Infrastructure Layer** — Supabase (Postgres, Auth, Storage), Africa's Talking (SMS/Voice)

### Data Flow (Read)
```
User taps screen
  → Riverpod provider reads repository
    → Repository checks local Drift DB first
      → If local miss, load from Supabase cache
        → Update local and emit state
```

### Data Flow (Write)
```
User records sale
  → Repository writes to local Drift DB
    → Enqueue operation in sync_queue (operation=INSERT, entity=Transaction)
      → UI updates immediately
        → Background sync worker pushes to Supabase
          → On success, mark sync_queue row as synced
          → On failure, retry with backoff
```

## Trust Score Computation

Trust Score is a weighted composite:
- Sales consistency: 30%
- Savings discipline: 25%
- Repayment history: 20%
- Community reputation: 15%
- Activity regularity: 10%

Computed nightly via Supabase Edge Function reading aggregated transaction patterns.

## Offline-First Guarantees
- Every write succeeds locally even when airplane mode is on.
- Max queue depth: 10,000 operations (prunes oldest on overflow after backup).
- Conflict resolution: server-wins with local operation log preserved for audit.

## Security & Privacy
- All data encrypted at rest using Supabase built-in encryption.
- Local SQLite encrypted with `sqlcipher` (future phase).
- Phone numbers hashed in partner APIs.
- Minimal PII storage.
