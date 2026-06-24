import '../../../core/error/failures.dart';
import '../../domain/entities/transaction.dart';

abstract class TransactionRepository {
  Future<List<Transaction>> list(String businessId);
  Future<Transaction?> byId(String id);
  Future<void create(Transaction transaction);
  Future<void update(Transaction transaction);
  Future<void delete(String id);
}
