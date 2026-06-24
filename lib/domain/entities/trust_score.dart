class TrustScore {
  final String id;
  final String businessId;
  final int score; // 0-100
  final int salesConsistencyWeight;
  final int savingsDisciplineWeight;
  final int repaymentHistoryWeight;
  final int communityReputationWeight;
  final int activityRegularityWeight;
  final int dynamicAdjustment;
  final DateTime calculatedAt;
  final String? explanation; // human-readable reason for score change

  const TrustScore({
    required this.id,
    required this.businessId,
    required this.score,
    this.salesConsistencyWeight = 30,
    this.savingsDisciplineWeight = 25,
    this.repaymentHistoryWeight = 20,
    this.communityReputationWeight = 15,
    this.activityRegularityWeight = 10,
    this.dynamicAdjustment = 0,
    required this.calculatedAt,
    this.explanation,
  });

  int get adjustedScore => (score + dynamicAdjustment).clamp(0, 100);

  TrustScore copyWith({
    String? id,
    String? businessId,
    int? score,
    int? salesConsistencyWeight,
    int? savingsDisciplineWeight,
    int? repaymentHistoryWeight,
    int? communityReputationWeight,
    int? activityRegularityWeight,
    int? dynamicAdjustment,
    DateTime? calculatedAt,
    String? explanation,
  }) {
    return TrustScore(
      id: id ?? this.id,
      businessId: businessId ?? this.businessId,
      score: score ?? this.score,
      salesConsistencyWeight: salesConsistencyWeight ?? this.salesConsistencyWeight,
      savingsDisciplineWeight: savingsDisciplineWeight ?? this.savingsDisciplineWeight,
      repaymentHistoryWeight: repaymentHistoryWeight ?? this.repaymentHistoryWeight,
      communityReputationWeight: communityReputationWeight ?? this.communityReputationWeight,
      activityRegularityWeight: activityRegularityWeight ?? this.activityRegularityWeight,
      dynamicAdjustment: dynamicAdjustment ?? this.dynamicAdjustment,
      calculatedAt: calculatedAt ?? this.calculatedAt,
      explanation: explanation ?? this.explanation,
    );
  }
}
