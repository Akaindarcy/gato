export '../app_database.dart';
import '../../../../domain/entities/transaction.dart';
import '../../../../domain/entities/product.dart';
import '../../../../domain/entities/savings_goal.dart';
import '../../../../domain/entities/trust_score.dart';
import '../../../../domain/entities/loan.dart';
import '../../../../domain/entities/insurance_product.dart';
import '../../../../domain/entities/community_group.dart';
import '../../../../domain/entities/achievement.dart';
import '../../../../domain/entities/voice_command.dart';

class ProductsDao {
  final AppDatabase _db;
  ProductsDao(this._db);

  Future<List<Product>> getAll(String businessId) =>
      (_db.select(_db.products)..where((p) => p.businessId.equals(businessId))..where((p) => p.deleted.equals(false))).get();

  Future<void> insert(Product p) => _db.into(_db.products).insert(p);
}

class TransactionsDao {
  final AppDatabase _db;
  TransactionsDao(this._db);

  Future<List<Transaction>> getAll(String businessId) =>
      (_db.select(_db.transactions)..where((t) => t.businessId.equals(businessId))..where((t) => t.deleted.equals(false))).get();

  Future<void> insert(Transaction t) => _db.into(_db.transactions).insert(t);
}

class SavingsGoalsDao {
  final AppDatabase _db;
  SavingsGoalsDao(this._db);

  Future<List<SavingsGoal>> getAll(String businessId) =>
      (_db.select(_db.savingsGoals)..where((s) => s.businessId.equals(businessId))).get();

  Future<void> insert(SavingsGoal s) => _db.into(_db.savingsGoals).insert(s);
}

class SyncQueueDao {
  final AppDatabase _db;
  SyncQueueDao(this._db);

  Future<List<SyncQueue>> getPending(int limit) =>
      (_db.select(_db.syncQueue)..where((s) => s.retryCount.lessThan(5))..limit(limit)).get();

  Future<void> insert(SyncQueue s) => _db.into(_db.syncQueue).insert(s);
}

class TrustScoresDao {
  final AppDatabase _db;
  TrustScoresDao(this._db);

  Future<TrustScore?> getForBusiness(String businessId) async {
    final rows = await (_db.select(_db.trustScores)..where((t) => t.businessId.equals(businessId))..orderBy([(t) => OrderingTerm.desc(t.calculatedAt)])).get();
    if (rows.isEmpty) return null;
    return rows.first;
  }

  Future<void> insert(TrustScoresCompanion s) => _db.into(_db.trustScores).insert(s);
}

class LoansDao {
  final AppDatabase _db;
  LoansDao(this._db);

  Future<List<Loan>> forBusiness(String businessId) =>
      (_db.select(_db.loans)..where((l) => l.businessId.equals(businessId))).get();
}

class CommunityGroupsDao {
  final AppDatabase _db;
  CommunityGroupsDao(this._db);

  Future<List<CommunityGroup>> forUser(String userId) async {
    final groups = await (_db.select(_db.communityGroups)).get();
    return groups;
  }
}

class AchievementsDao {
  final AppDatabase _db;
  AchievementsDao(this._db);

  Future<List<Achievement>> forUser(String userId) =>
      (_db.select(_db.achievements)..where((a) => a.userId.equals(userId))).get();
}

class VoiceCommandsDao {
  final AppDatabase _db;
  VoiceCommandsDao(this._db);

  Future<void> insert(VoiceCommandsCompanion insert) => _db.into(_db.voiceCommands).insert(insert);
}
