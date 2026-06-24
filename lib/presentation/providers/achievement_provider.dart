import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gato/domain/entities/achievement.dart';
import 'package:gato/domain/repositories/achievement_repository.dart';

class AchievementProvider extends StateNotifier<AsyncValue<List<Achievement>>> {
  final AchievementRepository _repo;
  AchievementProvider(this._repo) : super(const AsyncValue.loading());

  Future<void> load(String userId) async {
    state = const AsyncValue.loading();
    try {
      final items = await _repo.listForUser(userId);
      state = AsyncValue.data(items);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
