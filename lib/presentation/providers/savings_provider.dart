import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gato/domain/entities/savings_goal.dart';
import 'package:gato/domain/repositories/savings_repository.dart';

class SavingsProvider extends StateNotifier<AsyncValue<List<SavingsGoal>>> {
  final SavingsRepository _repo;
  SavingsProvider(this._repo) : super(const AsyncValue.loading());

  Future<void> load(String businessId) async {
    try {
      state = const AsyncValue.loading();
      final items = await _repo.list(businessId);
      state = AsyncValue.data(items);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> create(SavingsGoal goal) async {
    try {
      state = const AsyncValue.loading();
      await _repo.create(goal);
      await load(goal.businessId);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
