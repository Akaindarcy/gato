import '../../../core/error/failures.dart';
import '../../domain/entities/achievement.dart';

abstract class AchievementRepository {
  Future<List<Achievement>> listForUser(String userId);
  Future<void> unlock(String userId, String achievementCode);
  Future<List<Achievement>> listDefinitions();
}
