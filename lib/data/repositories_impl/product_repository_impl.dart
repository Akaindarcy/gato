import 'package:gato/data/datasources/local/daos/derived_daos.dart';
import 'package:gato/domain/entities/product.dart';
import 'package:gato/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final AppDatabase _db;
  ProductRepositoryImpl(this._db);

  @override
  Future<List<Product>> list(String businessId) => _db.productsDao.getAll(businessId);

  @override
  Future<Product?> byId(String id) => _db.productsDao.byId(id);

  @override
  Future<void> create(Product product) => _db.productsDao.insert(product);

  @override
  Future<void> update(Product product) => _db.productsDao.update(product);

  @override
  Future<void> delete(String id) => _db.productsDao.delete(id);
}
