import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gato/data/datasources/local/app_database.dart';
import 'package:gato/data/datasources/remote/supabase_client.dart';
import 'package:gato/presentation/providers/database_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drift/drift.dart';
import 'dart:io';
import 'routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await SupabaseClientProvider.initialize();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final dir = await getApplicationDocumentsDirectory();
  final db = AppDatabase(LazyDatabase(() async {
    final file = File('${dir.path}/gato.sqlite');
    return NativeDatabase.createInBackground(file);
  }));

  runApp(ProviderScope(
    overrides: [
      databaseProvider.overrideWithValue(db),
    ],
    child: const GatoApp(),
  ));
}

class GatoApp extends StatelessWidget {
  const GatoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GATO',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
