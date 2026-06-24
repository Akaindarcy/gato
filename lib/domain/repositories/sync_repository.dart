import '../../../core/error/failures.dart';
import '../../domain/entities/sync_queue.dart';

abstract class SyncRepository {
  Future<void enqueue(SyncQueueEntry entry);
  Future<void markSynced(String id);
  Future<void markFailed(String id, String error);
}
