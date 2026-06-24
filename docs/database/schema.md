# GATO — Database Schema Reference

## Local Tables (Drift)

### transactions
| Column | Type | Notes |
|--------|------|-------|
| id | TEXT PK | |
| business_id | TEXT FK | |
| occurred_at | DATETIME | When sale/expense happened |
| type | TEXT | 'sale' or 'expense' |
| category | TEXT | e.g., 'fruits', 'transport', ' packaging' |
| amount | REAL | Amount in local currency |
| note | TEXT nullable | Free form |
| created_at | DATETIME | |
| updated_at | DATETIME | |
| deleted | BOOLEAN | Soft delete |
| deleted_at | DATETIME nullable | |

### products
| Column | Type | Notes |
|--------|------|-------|
| id | TEXT PK | |
| business_id | TEXT FK | |
| name | TEXT | |
| category | TEXT | |
| purchase_price | REAL nullable | |
| selling_price | REAL nullable | |
| stock_quantity | INTEGER | |
| unit | TEXT nullable | e.g., 'kg', 'piece' |
| created_at | DATETIME | |
| updated_at | DATETIME | |
| deleted | BOOLEAN | |
| deleted_at | DATETIME nullable | |

### savings_goals
| Column | Type | Notes |
|--------|------|-------|
| id | TEXT PK | |
| business_id | TEXT FK | |
| title | TEXT | |
| target_amount | REAL | |
| saved_amount | REAL | |
| deadline | DATETIME | |
| achieved | BOOLEAN | |
| created_at | DATETIME | |
| updated_at | DATETIME | |

### sync_queue
| Column | Type | Notes |
|--------|------|-------|
| id | TEXT PK | |
| entity_type | TEXT | |
| entity_id | TEXT | |
| operation | TEXT | INSERT/UPDATE/DELETE |
| payload_json | TEXT | |
| retry_count | INTEGER | |
| last_error | TEXT nullable | |
| created_at | DATETIME | |
| last_attempt_at | DATETIME nullable | |

### trust_scores
| Column | Type | Notes |
|--------|------|-------|
| id | TEXT PK | |
| business_id | TEXT FK | |
| score | INTEGER | 0-100 |
| dynamic_adjustment | INTEGER | +/- delta |
| explanation | TEXT nullable | |
| calculated_at | DATETIME | |

### loans
| Column | Type | Notes |
|--------|------|-------|
| id | TEXT PK | |
| business_id | TEXT FK | |
| partner_id | TEXT | Microfinance partner |
| amount | REAL | |
| currency | TEXT | BIF / RWF / KES / etc. |
| interest_rate | REAL | Annual % |
| term_days | INTEGER | |
| status | TEXT | pending/disbursed/repaid/written_off |
| outstanding_balance | REAL nullable | |
| disbursed_at | DATETIME nullable | |
| due_date | DATETIME nullable | |
| repaid_at | DATETIME nullable | |
| created_at | DATETIME | |
| updated_at | DATETIME | |

### community_groups
| Column | Type | Notes |
|--------|------|-------|
| id | TEXT PK | |
| name | TEXT | |
| description | TEXT | |
| type | TEXT | market/village/rotating_savings |
| owner_id | TEXT FK profiles | |
| max_members | INTEGER | |
| current_members | INTEGER | |
| language | TEXT | Primary discussion language |
| is_private | BOOLEAN | |
| created_at | DATETIME | |
| updated_at | DATETIME | |

### achievements
| Column | Type | Notes |
|--------|------|-------|
| id | TEXT PK | |
| user_id | TEXT FK profiles | |
| code | TEXT | Unique achievement code |
| title | TEXT | |
| description | TEXT | |
| icon_asset | TEXT | |
| reward_points | INTEGER | |
| partner_reward | TEXT nullable | e.g., discount code from partner |
| is_unlocked | BOOLEAN | |
| unlocked_at | DATETIME nullable | |
| created_at | DATETIME | |

### voice_commands
| Column | Type | Notes |
|--------|------|-------|
| id | TEXT PK | |
| business_id | TEXT FK | |
| transcript | TEXT | Raw user speech text |
| intent | TEXT | record_sale / query_balance / ask_help |
| parsed_values | TEXT nullable | JSON payload |
| audio_path | TEXT nullable | For review |
| executed | BOOLEAN | |
| error_message | TEXT nullable | |
| executed_at | DATETIME nullable | |
| created_at | DATETIME | |
