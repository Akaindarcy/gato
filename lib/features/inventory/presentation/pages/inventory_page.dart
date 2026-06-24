import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inventory')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.inventory_2, size: 64, color: Colors.green),
            const SizedBox(height: 16),
            Text('Know what you have.', style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 8),
            Text(
              'Track stock of mangoes, tomatoes, clothes, or any product. Get alerts before items run out.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text('Add Item'),
      ),
    );
  }
}
