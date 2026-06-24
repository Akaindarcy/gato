import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../domain/entities/product.dart';
import '../../../../data/datasources/local/daos/derived_daos.dart';

class InventoryPage extends ConsumerWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    const businessId = 'demo-business';

    return FutureBuilder<List<Product>>(
      future: db.productsDao.getAll(businessId),
      builder: (context, snapshot) {
        final items = snapshot.data ?? [];
        return Scaffold(
          appBar: AppBar(title: const Text('Inventory')),
          body: items.isEmpty
              ? const Center(child: Text('No inventory items yet.'))
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: items.length,
                  itemBuilder: (_, i) {
                    final p = items[i];
                    final low = p.stockQuantity < 5;
                    return Card(
                      color: low ? Colors.red.shade50 : null,
                      child: ListTile(
                        title: Text(p.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                        subtitle: Text('${p.category} • Stock: ${p.stockQuantity}'),
                        trailing: Text(
                          '${AppConstants.defaultCurrency} ${p.purchasePrice?.toStringAsFixed(0) ?? '-'}',
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      ),
                    );
                  },
                ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Add Product'),
          ),
        );
      },
    );
  }
}
