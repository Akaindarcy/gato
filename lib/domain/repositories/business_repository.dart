import '../../../core/error/failures.dart';
import '../../domain/entities/business.dart';

abstract class BusinessRepository {
  Future<Business?> current();
  Future<void save(Business business);
}
