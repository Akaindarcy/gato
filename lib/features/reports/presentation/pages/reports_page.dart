import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reports')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.insights, size: 64, color: Colors.green),
            const SizedBox(height: 16),
            Text('Understand your business.', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 8),
            Text(
              'See daily profit, best products, and spending trends — no accountant needed.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
