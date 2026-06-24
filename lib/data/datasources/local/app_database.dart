export 'package:drift/drift.dart';

class Products extends Table {
  TextColumn get id => text()();
  TextColumn get businessId => text()();
  TextColumn get name => text()();
  TextColumn get category => text()();
  RealColumn get purchasePrice => real().nullable()();
  RealColumn get sellingPrice => real().nullable()();
  IntColumn get stockQuantity => integer()();
  TextColumn get unit => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get deleted => boolean().withDefault(Constant(false))();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Transactions extends Table {
  TextColumn get id => text()();
  TextColumn get businessId => text()();
  DateTimeColumn get occurredAt => dateTime()();
  TextColumn get type => text()();
  TextColumn get note => text().nullable()();
  RealColumn get amount => real()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get deleted => boolean().withDefault(Constant(false))();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class SavingsGoals extends Table {
  TextColumn get id => text()();
  TextColumn get businessId => text()();
  TextColumn get title => text()();
  RealColumn get targetAmount => real()();
  RealColumn get savedAmount => real().withDefault(Constant(0))();
  DateTimeColumn get deadline => dateTime()();
  BoolColumn get achieved => boolean().withDefault(Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class SyncQueue extends Table {
  TextColumn get id => text()();
  TextColumn get entityType => text()();
  TextColumn get entityId => text()();
  TextColumn get operation => text()();
  TextColumn get payloadJson => text()();
  IntColumn get retryCount => integer().withDefault(Constant(0))();
  TextColumn get lastError => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get lastAttemptAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class TrustScores extends Table {
  TextColumn get id => text()();
  TextColumn get businessId => text()();
  IntColumn get score => integer()();
  IntColumn get dynamicAdjustment => integer().withDefault(Constant(0))();
  TextColumn get explanation => text().nullable()();
  DateTimeColumn get calculatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Loans extends Table {
  TextColumn get id => text()();
  TextColumn get businessId => text()();
  TextColumn get partnerId => text()();
  RealColumn get amount => real()();
  TextColumn get currency => text()();
  RealColumn get interestRate => real()();
  IntColumn get termDays => integer()();
  TextColumn get status => text()();
  RealColumn get outstandingBalance => real().nullable()();
  DateTimeColumn get disbursedAt => dateTime().nullable()();
  DateTimeColumn get dueDate => dateTime().nullable()();
  DateTimeColumn get repaidAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class CommunityGroups extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get type => text()();
  TextColumn get ownerId => text()();
  IntColumn get maxMembers => integer().withDefault(Constant(20))();
  IntColumn get currentMembers => integer().withDefault(Constant(0))();
  TextColumn get language => text()();
  BoolColumn get isPrivate => boolean().withDefault(Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Achievements extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get code => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get iconAsset => text()();
  IntColumn get rewardPoints => integer().withDefault(Constant(0))();
  TextColumn get partnerReward => text().nullable()();
  BoolColumn get isUnlocked => boolean().withDefault(Constant(false))();
  DateTimeColumn get unlockedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class VoiceCommands extends Table {
  TextColumn get id => text()();
  TextColumn get businessId => text()();
  TextColumn get transcript => text()();
  TextColumn get intent => text()();
  TextColumn get parsedValues => text().nullable()();
  TextColumn get audioPath => text().nullable()();
  BoolColumn get executed => boolean().withDefault(Constant(false))();
  TextColumn get errorMessage => text().nullable()();
  DateTimeColumn get executedAt => dateTime()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
