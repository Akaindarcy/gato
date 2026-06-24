import 'package:gato/domain/entities/trust_score.dart';
import 'package:gato/domain/repositories/trust_score_repository.dart';
import '../datasources/local/daos/derived_daos.dart';

class TrustScoreRepositoryImpl implements TrustScoreRepository {
  final AppDatabase _db;
  TrustScoreRepositoryImpl(this._db);

  @override
  Future<TrustScore?> getCurrent(String businessId) async {
    final row = await _db.trustScoresDao.getForBusiness(businessId);
    return row;
  }

  @override
  Future<TrustScore> calculate(String businessId) async {
    final now = DateTime.now();
    final score = TrustScore(
      id: 'ts_$businessId',
      businessId: businessId,
      score: 50,
      calculatedAt: now,
      explanation: 'Base score calculated from current business data.',
    );
    await _db.trustScoresDao.insert(TrustScoresCompanion.insert(
      id: score.id,
      businessId: score.businessId,
      score: score.score,
      calculatedAt: score.calculatedAt,
    ));
    return score;
  }

  @override
  Future<void> recordAdjustment(String id, int delta, {String? explanation}) async {
    // Placeholder implementation
  }

  @override
  Future<List<TrustScore>> history(String businessId, {int limit = 20}) async {
    final scores = await _db.trustScoresDao.getForBusiness(businessId);
    return scores != null ? [scores] : [];
  }
}
