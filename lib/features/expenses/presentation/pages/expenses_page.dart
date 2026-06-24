import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../domain/entities/transaction.dart';
import '../../../../data/datasources/local/daos/derived_daos.dart';

class ExpensesPage extends ConsumerWidget {
  const ExpensesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    const businessId = 'demo-business';

    return FutureBuilder<List<Transaction>>(
      future: db.transactionsDao.getAll(businessId),
      builder: (context, snapshot) {
        final items = snapshot.data ?? [];
        return Scaffold(
          appBar: AppBar(title: const Text('Expenses')),
          body: items.isEmpty
              ? const Center(child: Text('No expenses recorded yet.'))
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: items.length,
                  itemBuilder: (_, i) {
                    final t = items[i];
                    return Card(
                      child: ListTile(
                        title: Text('${t.category} ${t.note ?? ''}'),
                        trailing: Text(
                          '- ${AppConstants.defaultCurrency} ${t.amount.toStringAsFixed(0)}',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  },
                ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Add Expense'),
          ),
        );
      },
    );
  }
}
