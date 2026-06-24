# GATO Architecture

This document describes the architecture of the GATO MVP app.

## Overview

GATO follows **Clean Architecture** principles, adapted for Flutter. The app is offline-first and targets informal African sellers. Key constraints:
- Low connectivity environments
- Limited storage on entry-level phones
- Simple, understandable UX
- Fast entry and search

## Layers

### 1. Domain Layer (`lib/domain/`)
The innermost layer. Contains pure Dart with no framework dependencies.

#### Entities
Business objects that represent core data:
- `Product`
- `Customer`
- `TransactionRecord`
- `TransactionItemRecord`

#### Repository Interfaces
Abstract contracts that define how data is accessed:
- `ProductRepository`
- `TransactionRepository`

#### Usecases
Application-specific business rules.
- `GetProducts`
- `AddProduct`

#### Why?
Domain layer ensures business rules are independent of UI, database, or network frameworks.

### 2. Data Layer (`lib/data/`)
Handles data sources and mapping between sources and domain entities.

#### Datasources
- **Local**: Drift (SQLite) implementation. Primary source of truth.
- **Remote**: Supabase REST client.

#### Models
Drift table definitions (used by database generation).

#### Repository Implementations
Concrete classes that implement domain repository interfaces using datasources.

#### Why?
Isolates data access logic. Allows swapping local DB for Hive or remote for a different backend without touching the UI or domain layers.

### 3. Presentation Layer (`lib/presentation/`)
Flutter widgets and state management.

#### Pages
Screens navigated via the router.

#### Widgets
Reusable UI components.

#### Providers
Riverpod providers that expose state to the UI.

#### Why?
Riverpod was chosen for:
- Compile-time safety
- Easy testability
- Lightweight provider pattern

## Data Flow

```
UI (Riverpod Provider)
    ↓ calls
Usecase
    ↓ calls
Repository Interface
    ↓ implemented by
Repository Implementation
    ↓ uses
Datasource (Local Drift / Remote Supabase)
    ↓ returns
Domain Entity
```

For writes:
```
UI action -> Repository -> Local DB (instant) + SyncQueue
                                     ↓ (when online)
                               Supabase remote
```

## Offline-First Design

### Local Database (Drift)
- Auto-generated from `app_database.dart`
- Uses SQLite with `sqlite3_flutter_libs`
- Database located in app documents directory

### Sync Queue
Every write also creates a row in `sync_queue`:
- `entity_type`: products, transactions, etc.
- `operation`: create, update, delete
- `retry_count`: for exponential backoff
- `last_error_at`: for retry tracking

### Connectivity Detection
`connectivity_plus` monitors network state. A `StreamProvider` exposes online/offline status.

### Conflict Resolution
- Simple last-write-wins on `updatedAt` for MVP
- Soft deletes via `deletedAt` column
- Marked as unsynced until confirmed by server

## State Management (Riverpod)

### Provider Types Used
- `Provider`: dependencies (database, service)
- `FutureProvider`: async data streams
- `StreamProvider`: connectivity status
- `StateNotifierProvider`: (reserved for future)

### Example
```dart
final productsProvider = FutureProvider.autoDispose((ref) async {
  final db = ref.watch(databaseProvider);
  return db.getAllProducts();
});
```

## Navigation

Simple `onGenerateRoute` implementation. Screens are stateless widgets for the MVP.

## Configuration

Environment variables loaded via `flutter_dotenv`. Configure `.env` locally:
```bash
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-anon-key
```

## Code Generation

Drift requires build_runner to generate database code from `.g.dart` parts.

Run:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Generated files are not committed to Git.

## Security Notes

- `.env` is gitignored
- Supabase RLS policies must restrict access to authenticated users only
- All Supabase calls should pass through the backend validation

## Future Improvements

- Riverpod code generation with `riverpod_annotation`
- Freezed for immutable models
- GoRouter for type-safe navigation
- Logging and crash reporting (Sentry/Firebase)
- Offline image caching (cached_network_image)
- Form validation with Formz or Flutter Form Builder
