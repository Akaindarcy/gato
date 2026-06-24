import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gato/data/datasources/local/app_database.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  throw UnimplementedError('Provide AppDatabase via a ProviderScope override in main.dart or bootstrap.');
});
