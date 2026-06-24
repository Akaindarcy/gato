import '../../domain/entities/trust_score.dart';

class TrustScoreService {
  static const salesConsistencyWeight = 30;
  static const savingsDisciplineWeight = 25;
  static const repaymentHistoryWeight = 20;
  static const communityReputationWeight = 15;
  static const activityRegularityWeight = 10;

  /// Compute base score from normalized component values in 0..100 range.
  int computeBase({
    required double salesConsistency,
    required double savingsDiscipline,
    required double repaymentHistory,
    required double communityReputation,
    required double activityRegularity,
  }) {
    final valid = (v) => v.clamp(0.0, 100.0);
    final base =
        (valid(salesConsistency) * salesConsistencyWeight / 100) +
            (valid(savingsDiscipline) * savingsDisciplineWeight / 100) +
            (valid(repaymentHistory) * repaymentHistoryWeight / 100) +
            (valid(communityReputation) * communityReputationWeight / 100) +
            (valid(activityRegularity) * activityRegularityWeight / 100);

    return base.round().clamp(0, 100);
  }

  String explainAdjustment(int delta) {
    if (delta > 0) return 'Score increased by $delta due to improved consistency.';
    if (delta < 0) return 'Score decreased by ${delta.abs()} due to missed activity.';
    return 'Score unchanged.';
  }
}
