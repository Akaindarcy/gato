import '../../domain/entities/insurance_product.dart';
import '../../domain/repositories/insurance_product_repository.dart';

class InsuranceProductRepositoryImpl implements InsuranceProductRepository {
  @override
  Future<List<InsuranceProduct>> listAvailable() async => [];

  @override
  Future<InsuranceProduct?> byId(String id) async => null;
}
