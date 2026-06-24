import '../../domain/entities/trust_score.dart';
import '../../domain/repositories/trust_score_repository.dart';

class TrustScoreRepositoryImpl implements TrustScoreRepository {
  @override
  Future<TrustScore?> getCurrent(String businessId) async => null;

  @override
  Future<TrustScore> calculate(String businessId) async {
    return TrustScore(
      id: 'ts_$businessId',
      businessId: businessId,
      score: 50,
      calculatedAt: DateTime.now(),
      explanation: 'Placeholder score. Connect TrustScoreService and Drift DAOs.',
    );
  }

  @override
  Future<void> recordAdjustment(String id, int delta, {String? explanation}) async {}

  @override
  Future<List<TrustScore>> history(String businessId, {int limit = 20}) async => [];
}
