import '../../../../core/error/failures.dart';
import '../../../../domain/entities/transaction.dart';
import '../../../../domain/repositories/transaction_repository.dart';
import '../../../datasources/local/daos/derived_daos.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final AppDatabase _db;
  TransactionRepositoryImpl(this._db);

  @override
  Future<List<Transaction>> list(String businessId) => _db.transactionsDao.getAll(businessId);

  @override
  Future<Transaction?> byId(String id) async {
    // TODO: implement
    return null;
  }

  @override
  Future<void> create(Transaction transaction) async {
    await _db.transactionsDao.insert(transaction);
  }

  @override
  Future<void> update(Transaction transaction) async {
    // TODO: implement
  }

  @override
  Future<void> delete(String id) async {
    // TODO: implement
  }
}
