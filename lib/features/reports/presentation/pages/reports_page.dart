import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../domain/entities/transaction.dart';
import '../../../../domain/entities/product.dart';
import '../../../../data/datasources/local/daos/derived_daos.dart';

class ReportsPage extends ConsumerWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    const businessId = 'demo-business';

    return FutureBuilder<List<Transaction>>(
      future: db.transactionsDao.getAll(businessId),
      builder: (context, snapshot) {
        final txs = snapshot.data ?? [];
        return Scaffold(
          appBar: AppBar(title: const Text('Reports')),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.insights, size: 64, color: Colors.green),
                const SizedBox(height: 16),
                Text('Business Snapshot',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text('Transactions: ${txs.length}'),
                const SizedBox(height: 8),
                Text('This is a lightweight offline report. Cloud sync needed for profit and inventory valuation.'),
              ],
            ),
          ),
        );
      },
    );
  }
}
