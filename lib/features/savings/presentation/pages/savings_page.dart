import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../domain/entities/savings_goal.dart';
import '../../../../presentation/providers/database_provider.dart';
import '../../../../presentation/providers/savings_provider.dart';
import '../../../../data/repositories_impl/savings_repository_impl.dart';

class SavingsPage extends ConsumerWidget {
  const SavingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    final repo = SavingsRepositoryImpl(db);
    final goals = ref.watch(savingsProvider(repo));

    return Scaffold(
      appBar: AppBar(title: const Text('Savings Goals')),
      body: goals.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Error: $err')),
        data: (items) {
          if (items.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.savings, size: 64, color: Colors.green),
                  const SizedBox(height: 16),
                  Text(
                    'No savings goal yet.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Create your first locked pot: for school fees, emergency cash, or inventory restock.',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: items.length,
            itemBuilder: (_, i) {
              final g = items[i];
              final pct = g.targetAmount > 0 ? (g.savedAmount / g.targetAmount).clamp(0.0, 1.0) : 0.0;
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.savings),
                  title: Text(g.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LinearProgressIndicator(value: pct),
                      const SizedBox(height: 4),
                      Text('${(pct * 100).toStringAsFixed(0)}% of target'),
                    ],
                  ),
                  trailing: Text(
                    '${AppConstants.defaultCurrency} ${g.savedAmount.toStringAsFixed(0)} / ${g.targetAmount.toStringAsFixed(0)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text('New Goal'),
      ),
    );
  }
}
