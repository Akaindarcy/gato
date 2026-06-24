class SavingsGoal {
  final String id;
  final String businessId;
  final String title;
  final double targetAmount;
  final double savedAmount;
  final DateTime deadline;
  final bool achieved;
  final DateTime createdAt;
  final DateTime updatedAt;

  const SavingsGoal({
    required this.id,
    required this.businessId,
    required this.title,
    required this.targetAmount,
    this.savedAmount = 0,
    required this.deadline,
    this.achieved = false,
    required this.createdAt,
    required this.updatedAt,
  });

  SavingsGoal copyWith({
    String? id,
    String? businessId,
    String? title,
    double? targetAmount,
    double? savedAmount,
    DateTime? deadline,
    bool? achieved,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SavingsGoal(
      id: id ?? this.id,
      businessId: businessId ?? this.businessId,
      title: title ?? this.title,
      targetAmount: targetAmount ?? this.targetAmount,
      savedAmount: savedAmount ?? this.savedAmount,
      deadline: deadline ?? this.deadline,
      achieved: achieved ?? this.achieved,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
