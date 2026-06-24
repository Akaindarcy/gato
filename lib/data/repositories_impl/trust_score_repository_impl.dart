import '../../domain/entities/trust_score.dart';
import '../../domain/repositories/trust_score_repository.dart';
import '../../services/trust_score_service/trust_score_service.dart';
import '../datasources/local/daos/derived_daos.dart';

class TrustScoreRepositoryImpl implements TrustScoreRepository {
  final AppDatabase _db;
  TrustScoreRepositoryImpl(this._db);

  static final _service = TrustScoreService();

  @override
  Future<TrustScore?> getCurrent(String businessId) async {
    final row = await _db.trustScoresDao.getForBusiness(businessId);
    return row;
  }

  @override
  Future<TrustScore> calculate(String businessId) async {
    // TODO: derive normalized indicators from transactions/products/savings
    final score = TrustScore(
      id: 'ts_$businessId',
      businessId: businessId,
      score: _service.computeBase(
        salesConsistency: 60.0,
        savingsDiscipline: 70.0,
        repaymentHistory: 65.0,
        communityReputation: 55.0,
        activityRegularity: 80.0,
      ),
      calculatedAt: DateTime.now(),
      explanation: 'Calculated from business behavior signals.',
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
