# GATO — Synchronization Engine Design

## Objectives
- Enable full offline operation.
- Guarantee eventual consistency between local Drift DB and Supabase Postgres.
- Minimize data usage for users on limited mobile data plans.
- Maintain audit trail of every change.

## Components

### 1. Local Sync Queue
Table: `sync_queue`
- `id`: UUID
- `entity_type`: enum (transaction, product, savings_goal, ...)
- `entity_id`: string (local record id)
- `operation`: enum (INSERT, UPDATE, DELETE)
- `payload_json`: JSON body of the change
- `retry_count`: integer (default 0)
- `last_error`: nullable text
- `created_at`: timestamp
- `last_attempt_at`: nullable timestamp

### 2. Remote Sync Queue
Supabase table: `remote_sync_queue`
Same schema. Used to push server-originated changes (e.g., loan status updates) back to device.

### 3. Conflict Resolution Rules
| Conflict Type | Resolution |
|---------------|------------|
| Same record, same timestamp | Server wins + local operation appended to change log |
| Server updated after local | Server wins; notify user of merge via UI banner |
| Deleting already-deleted record | Idempotent DELETE marks both as deleted |

### 4. Push / Pull Strategy
- **Push**: Every app foreground + every 5 minutes in background.
- **Pull**: Every app foreground.
- **Backoff**: 2^n seconds where n = retry count, capped at 1 hour.
- **Max batch**: 50 operations per request to avoid large payloads.

### 5. Delta Sync Schema
Supabase exposes:
- `GET /rest/v1/changes?since=<last_sync_timestamp>`
- Filters by `business_id` and `updated_at`.

This minimizes payload by only fetching rows modified since the device's last check.

### 6. Recovery
- On new device login, full sync initiated from server to local.
- Pending `sync_queue` older than 30 days purged after user confirmation.
