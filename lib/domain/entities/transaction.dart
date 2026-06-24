class Transaction {
  final String id;
  final String businessId;
  final DateTime occurredAt;
  final String type; // sale | expense
  final String? note;
  final double amount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;

  const Transaction({
    required this.id,
    required this.businessId,
    required this.occurredAt,
    required this.type,
    this.note,
    required this.amount,
    required this.createdAt,
    required this.updatedAt,
    this.deleted = false,
  });

  Transaction copyWith({
    String? id,
    String? businessId,
    DateTime? occurredAt,
    String? type,
    String? note,
    double? amount,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? deleted,
  }) {
    return Transaction(
      id: id ?? this.id,
      businessId: businessId ?? this.businessId,
      occurredAt: occurredAt ?? this.occurredAt,
      type: type ?? this.type,
      note: note ?? this.note,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
    );
  }
}
