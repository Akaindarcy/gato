import 'package:gato/data/datasources/remote/supabase_client.dart';
import 'package:gato/domain/entities/trust_score.dart';

class TrustScoreRemoteDataSource {
  Future<TrustScore?> getCurrent(String businessId) async {
    final resp = await SupabaseClientProvider.client
        .from('trust_scores')
        .select()
        .eq('business_id', businessId)
        .order('calculated_at', ascending: false)
        .limit(1)
        .maybeSingle();
    if (resp == null) return null;
    return TrustScore(
      id: resp['id'] as String,
      businessId: resp['business_id'] as String,
      score: (resp['score'] as num).toInt(),
      calculatedAt: DateTime.parse(resp['calculated_at'] as String),
      explanation: resp['explanation'] as String?,
    );
  }
}
