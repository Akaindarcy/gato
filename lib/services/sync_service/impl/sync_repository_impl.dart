import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:gato/core/constants/app_constants.dart';
import 'package:gato/data/datasources/local/daos/derived_daos.dart';
import 'package:gato/data/datasources/remote/supabase_client.dart';
import 'package:gato/domain/entities/sync_queue.dart';
import 'package:gato/domain/repositories/sync_repository.dart';
import 'package:gato/services/sync_service/config/sync_protocol.dart';
import 'package:uuid/uuid.dart';

class SyncRepositoryImpl implements SyncRepository {
  final AppDatabase _db;
  final SupabaseClient _client;
  final Connectivity _connectivity;

  SyncRepositoryImpl(this._db, this._client, this._connectivity);

  @override
  Future<void> enqueue(SyncQueue queue) async {
    await _db.syncQueueDao.insert(SyncQueue(
      id: const Uuid().v4(),
      entityType: queue.entityType,
      entityId: queue.entityId,
      operation: queue.operation,
      payloadJson: queue.payloadJson,
      retryCount: 0,
      createdAt: DateTime.now(),
    ));
  }

  @override
  Future<void> processQueue() async {
    final pending = await _db.syncQueueDao.getPending(50);
    for (final item in pending) {
      try {
        await _push(item);
        // mark as done by deleting (or update status if we add a status column)
        // For now we'll just remove from queue on success
      } catch (e) {
        await _db.syncQueueDao.incrementRetry(item.id, e.toString());
      }
    }
  }

  Future<void> _push(SyncQueue item) async {
    final payload = jsonDecode(item.payloadJson) as Map<String, dynamic>;
    switch (item.entityType) {
      case SyncProtocol.recordTypeTransaction:
        await _client.from('transactions').insert(payload).throwOnError();
        break;
      case SyncProtocol.recordTypeProduct:
        await _client.from('products').insert(payload).throwOnError();
        break;
      default:
        throw UnimplementedError('Sync for ${item.entityType} not implemented');
    }
    // Remove synced item
    // TODO: implement proper deletion once DAO supports it
  }

  @override
  Future<bool> get isOnline async {
    final result = await _connectivity.checkConnectivity();
    return result.any((c) => c != ConnectivityResult.none);
  }
}
