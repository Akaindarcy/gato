import '../../domain/entities/achievement.dart';
import '../../domain/repositories/achievement_repository.dart';

class AchievementRepositoryImpl implements AchievementRepository {
  @override
  Future<List<Achievement>> listForUser(String userId) async => [];

  @override
  Future<void> unlock(String userId, String achievementCode) async {}

  @override
  Future<List<Achievement>> listDefinitions() async => [];
}
