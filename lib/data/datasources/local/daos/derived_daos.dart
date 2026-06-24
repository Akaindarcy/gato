export '../app_database.dart';

class TrustScoreDao {
  final Database _db;
  TrustScoreDao(this._db);

  Future<TrustScoreData?> getForBusiness(String businessId) =>
      (_db.select(_db.trustScores)
            ..where((t) => t.businessId.equals(businessId))
            ..orderBy([(t) => OrderingTerm.desc(t.calculatedAt)])
          )
          .getSingleOrNull();

  Future<void> insert(TrustScoresCompanion insert) => _db.into(_db.trustScores).insert(insert);
}

class LoanDao {
  final Database _db;
  LoanDao(this._db);

  Future<List<LoanData>> forBusiness(String businessId) =>
      (_db.select(_db.loans)..where((l) => l.businessId.equals(businessId))).get();
}

class CommunityGroupDao {
  final Database _db;
  CommunityGroupDao(this._db);

  Future<List<CommunityGroupData>> forUser(String userId) async {
    final groups = await (_db.select(_db.communityGroups)).get();
    // Placeholder: filter by owner or membership (membership table not yet added)
    return groups;
  }
}

class AchievementDao {
  final Database _db;
  AchievementDao(this._db);

  Future<List<AchievementData>> forUser(String userId) =>
      (_db.select(_db.achievements)..where((a) => a.userId.equals(userId))).get();
}

class VoiceCommandDao {
  final Database _db;
  VoiceCommandDao(this._db);

  Future<void> insert(VoiceCommandsCompanion insert) => _db.into(_db.voiceCommands).insert(insert);
}
