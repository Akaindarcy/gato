import 'package:gato/domain/entities/business.dart';
import 'package:gato/domain/repositories/business_repository.dart';

class BusinessRepositoryImpl implements BusinessRepository {
  @override
  Future<Business?> current() async => null;

  @override
  Future<void> save(Business business) async {}
}
