import '../datasources/local/app_database.dart';
import '../datasources/local/daos/product_dao.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../../core/error/failures.dart';

class ProductRepositoryImpl implements ProductRepository {
  final AppDatabase _db;

  ProductRepositoryImpl(this._db);

  @override
  Future<List<Product>> list(String businessId) => _db.productDao.getAll(businessId);

  @override
  Future<Product?> byId(String id) => _db.productDao.byId(id);

  @override
  Future<void> create(Product product) => _db.productDao.insert(product);

  @override
  Future<void> update(Product product) => _db.productDao.update(product);

  @override
  Future<void> delete(String id) => _db.productDao.delete(id);
}
