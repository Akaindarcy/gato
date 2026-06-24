import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gato/data/datasources/remote/supabase_client.dart';
import 'package:gato/core/error/failures.dart';

class AuthNotifier extends StateNotifier<AsyncValue<void>> {
  AuthNotifier() : super(const AsyncValue.data(null));

  Future<void> sendOtp(String phone) async {
    state = const AsyncValue.loading();
    try {
      await SupabaseClientProvider.client.auth.signInWithOtp(phone: phone);
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(AuthFailure(message: e.toString()), StackTrace.current);
    }
  }

  Future<void> verifyOtp(String phone, String token) async {
    state = const AsyncValue.loading();
    try {
      await SupabaseClientProvider.client.auth.verifyOTP(phone: phone, token: token, type: OtpType.sms);
      state = const AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(AuthFailure(message: e.toString()), StackTrace.current);
    }
  }

  Future<void> signOut() async {
    await SupabaseClientProvider.client.auth.signOut();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AsyncValue<void>>((ref) => AuthNotifier());
