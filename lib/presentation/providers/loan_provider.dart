import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gato/domain/entities/loan.dart';
import 'package:gato/domain/repositories/loan_repository.dart';

class LoanProvider extends StateNotifier<AsyncValue<List<Loan>>> {
  final LoanRepository _repo;
  LoanProvider(this._repo) : super(const AsyncValue.loading());

  Future<void> load(String businessId) async {
    state = const AsyncValue.loading();
    try {
      final items = await _repo.list(businessId);
      state = AsyncValue.data(items);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
