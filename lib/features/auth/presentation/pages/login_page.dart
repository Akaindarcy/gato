import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.eco, size: 80, color: Colors.green),
              const SizedBox(height: 24),
              const Text('GATO Karakura', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Small Can Grow', style: TextStyle(fontSize: 16, color: Colors.black54)),
              const SizedBox(height: 48),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  hintText: '+257 6XX XXX XXX',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => ref.read(authProvider.notifier).sendOtp('+257'),
                  child: const Text('Send OTP'),
                ),
              ),
              if (authState.isLoading) const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
