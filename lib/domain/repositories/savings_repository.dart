import '../../../core/error/failures.dart';
import '../../domain/entities/savings_goal.dart';

abstract class SavingsRepository {
  Future<List<SavingsGoal>> list(String businessId);
  Future<SavingsGoal?> byId(String id);
  Future<void create(SavingsGoal goal);
  Future<void update(SavingsGoal goal);
  Future<void delete(String id);
}
