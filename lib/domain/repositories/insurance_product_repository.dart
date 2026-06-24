import '../../domain/entities/insurance_product.dart';

abstract class InsuranceProductRepository {
  Future<List<InsuranceProduct>> listAvailable();
  Future<InsuranceProduct?> byId(String id);
}
