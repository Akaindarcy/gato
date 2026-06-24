import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseClientProvider {
  static SupabaseClient? _client;

  static SupabaseClient get client {
    if (_client == null) {
      throw StateError('SupabaseClient not initialized. Call initialize() first.');
    }
    return _client!;
  }

  static Future<void> initialize() async {
    if (_client != null) return;

    final url = dotenv.env['SUPABASE_URL'];
    final anonKey = dotenv.env['SUPABASE_ANON_KEY'];

    if (url == null || anonKey == null) {
      if (kDebugMode) {
        debugPrint('Supabase env vars missing. Running in debug stub mode.');
      }
      // Create a stub client for debug builds when env vars are not set.
      _client = SupabaseClient('https://STUB.supabase.co', 'STUB_ANON_KEY');
      return;
    }

    await Supabase.initialize(url: url, anonKey: anonKey);
    _client = Supabase.instance.client;
  }

  static bool get isConnected => _client != null;
}
