import 'package:gato/domain/entities/savings_goal.dart';
import 'package:gato/domain/repositories/savings_repository.dart';

class SavingsRepositoryImpl implements SavingsRepository {
  @override
  Future<List<SavingsGoal>> list(String businessId) async => [];

  @override
  Future<SavingsGoal?> byId(String id) async => null;

  @override
  Future<void> create(SavingsGoal goal) async {}

  @override
  Future<void> update(SavingsGoal goal) async {}

  @override
  Future<void> delete(String id) async {}
}
