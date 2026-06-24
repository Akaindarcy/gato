export 'package:drift/drift.dart';
import '../product.dart';

class ProductsDao {
  final Database _db;
  ProductsDao(this._db);

  Future<List<Product>> getAll(String businessId) => (_db.select(_db.products)
        ..where((p) => p.businessId.equals(businessId))
        ..where((p) => p.deleted.equals(false)))
      .get();

  Future<void insert(Product p) => _db.into(_db.products).insert(p);

  Future<void update(Product p) => (_db.update(_db.products)
        ..where((x) => x.id.equals(p.id)))
      .write(p);

  Future<void delete(String id) =>
      (_db.update(_db.products)..where((x) => x.id.equals(id)))
          .write(Companion(deleted: const Value(true), deletedAt: Value(DateTime.now())));
}
