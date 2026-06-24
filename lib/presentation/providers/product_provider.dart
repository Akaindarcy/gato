import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gato/core/constants/app_constants.dart';
import 'package:gato/domain/entities/product.dart';
import 'package:gato/domain/repositories/product_repository.dart';

class ProductProvider extends StateNotifier<AsyncValue<List<Product>>> {
  final ProductRepository _repo;
  ProductProvider(this._repo) : super(const AsyncValue.loading());

  Future<void> load(String businessId) async {
    try {
      state = const AsyncValue.loading();
      final items = await _repo.list(businessId);
      state = AsyncValue.data(items);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> create(Product product) async {
    try {
      state = const AsyncValue.loading();
      await _repo.create(product);
      await load(product.businessId);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> update(Product product) async {
    try {
      state = const AsyncValue.loading();
      await _repo.update(product);
      await load(product.businessId);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
