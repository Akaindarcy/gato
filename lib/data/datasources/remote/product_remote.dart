import 'package:gato/data/datasources/remote/supabase_client.dart';
import 'package:gato/domain/entities/product.dart';

class ProductRemoteDataSource {
  Future<void> create(Product p) async {
    await SupabaseClientProvider.client
        .from('products')
        .insert({
          'id': p.id,
          'business_id': p.businessId,
          'name': p.name,
          'category': p.category,
          'purchase_price': p.purchasePrice,
          'selling_price': p.sellingPrice,
          'stock_quantity': p.stockQuantity,
          'unit': p.unit,
          'created_at': p.createdAt.toIso8601String(),
          'updated_at': p.updatedAt.toIso8601String(),
        })
        .throwOnError();
  }

  Future<void> update(Product p) async {
    await SupabaseClientProvider.client
        .from('products')
        .update({
          'name': p.name,
          'category': p.category,
          'purchase_price': p.purchasePrice,
          'selling_price': p.sellingPrice,
          'stock_quantity': p.stockQuantity,
          'unit': p.unit,
          'updated_at': p.updatedAt.toIso8601String(),
        })
        .eq('id', p.id)
        .throwOnError();
  }
}
