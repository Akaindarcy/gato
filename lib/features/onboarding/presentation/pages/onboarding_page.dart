import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.eco, size: 96, color: Colors.green),
              const SizedBox(height: 24),
              const Text('GATO Karakura', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Small Can Grow', style: TextStyle(fontSize: 18, color: Colors.black54)),
              const SizedBox(height: 48),
              const Text(
                'Your accountant, advisor, credit profile, coach, community and bank — all in one app.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, height: 1.5),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pushReplacementNamed('/'),
                child: const Text('Get started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
