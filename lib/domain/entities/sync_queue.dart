class SyncQueueEntry {
  final String id;
  final String entityType;
  final String entityId;
  final String operation; // create | update | delete
  final String payloadJson;
  final int retryCount;
  final String? lastError;
  final DateTime createdAt;
  final DateTime? lastAttemptAt;

  const SyncQueueEntry({
    required this.id,
    required this.entityType,
    required this.entityId,
    required this.operation,
    required this.payloadJson,
    this.retryCount = 0,
    this.lastError,
    required this.createdAt,
    this.lastAttemptAt,
  });
}
