class AuditLog {
  final String id;
  final String? userId;
  final String action;
  final String entityType;
  final String? entityId;
  final String metadataJson;
  final DateTime createdAt;

  const AuditLog({
    required this.id,
    this.userId,
    required this.action,
    required this.entityType,
    this.entityId,
    required this.metadataJson,
    required this.createdAt,
  });
}
