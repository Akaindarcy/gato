import 'package:gato/data/datasources/remote/supabase_client.dart';
import 'package:gato/domain/entities/transaction.dart';

class TransactionRemoteDataSource {
  Future<void> create(Transaction t) async {
    final payload = {
      'id': t.id,
      'business_id': t.businessId,
      'occurred_at': t.occurredAt.toIso8601String(),
      'type': t.type,
      'category': t.category,
      'amount': t.amount,
      'note': t.note,
      'created_at': t.createdAt.toIso8601String(),
      'updated_at': t.updatedAt.toIso8601String(),
    };
    await SupabaseClientProvider.client
        .from('transactions')
        .insert(payload)
        .throwOnError();
  }

  Future<void> update(Transaction t) async {
    await SupabaseClientProvider.client
        .from('transactions')
        .update({'amount': t.amount, 'note': t.note, 'updated_at': t.updatedAt.toIso8601String()})
        .eq('id', t.id)
        .throwOnError();
  }

  Future<void> delete(String id) async {
    await SupabaseClientProvider.client
        .from('transactions')
        .delete()
        .eq('id', id)
        .throwOnError();
  }
}
