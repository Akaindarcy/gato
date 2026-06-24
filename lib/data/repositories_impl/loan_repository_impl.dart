import '../../domain/entities/loan.dart';
import '../../domain/repositories/loan_repository.dart';

class LoanRepositoryImpl implements LoanRepository {
  @override
  Future<List<Loan>> list(String businessId) async => [];

  @override
  Future<Loan?> byId(String id) async => null;

  @override
  Future<Loan> apply({
    required String businessId,
    required String partnerId,
    required double amount,
    required int termDays,
  }) async {
    throw UnimplementedError('Loan application endpoint not implemented');
  }

  @override
  Future<void> repay(String id, double amount) async {}

  @override
  Future<void> updateStatus(String id, String status) async {}
}
