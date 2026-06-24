import '../../../core/error/failures.dart';
import '../../domain/entities/trust_score.dart';

abstract class TrustScoreRepository {
  Future<TrustScore?> getCurrent(String businessId);
  Future<TrustScore> calculate(String businessId);
  Future<void> recordAdjustment(String id, int delta, {String? explanation});
  Future<List<TrustScore>> history(String businessId, {int limit = 20});
}
