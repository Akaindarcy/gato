import 'package:flutter_test/flutter_test.dart';
import 'package:gato/services/trust_score_service/trust_score_service.dart';

void main() {
  group('TrustScoreService', () {
    final service = TrustScoreService();

    test('computeBase clamps inputs to 0..100', () {
      final score = service.computeBase(
        salesConsistency: -10,
        savingsDiscipline: 150,
        repaymentHistory: 50,
        communityReputation: 80,
        activityRegularity: 20,
      );
      expect(score, inInclusiveRange(0, 100));
    });

    test('computeBase returns weighted average', () {
      final score = service.computeBase(
        salesConsistency: 100,
        savingsDiscipline: 100,
        repaymentHistory: 100,
        communityReputation: 100,
        activityRegularity: 100,
      );
      expect(score, 100);
    });
  });
}
