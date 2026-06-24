import '../../../core/error/failures.dart';
import '../../domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> list(String businessId);
  Future<Product?> byId(String id);
  Future<void create(Product product);
  Future<void update(Product product);
  Future<void delete(String id);
}
