import '../app_database.dart';
import '../transaction.dart';

class TransactionDao {
  final Database _db;
  TransactionDao(this._db);

  Future<List<Transaction>> getAll(String businessId) => (_db.select(_db.transactions)
        ..where((t) => t.businessId.equals(businessId))
        ..where((t) => t.deleted.equals(false)))
      .get();

  Future<void insert(Transaction t) => _db.into(_db.transactions).insert(t);
}
