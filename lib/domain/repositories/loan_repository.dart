import '../../../core/error/failures.dart';
import '../../domain/entities/loan.dart';

abstract class LoanRepository {
  Future<List<Loan>> list(String businessId);
  Future<Loan?> byId(String id);
  Future<Loan> apply({
    required String businessId,
    required String partnerId,
    required double amount,
    required int termDays,
  });
  Future<void> repay(String id, double amount);
  Future<void> updateStatus(String id, String status);
}
