import 'ai_provider.dart';

class AIService {
  final AIProvider provider;
  const AIService({required this.provider});

  Future<String> businessInsight(String data) =>
      provider.complete(prompt: 'Analyze this seller data and give actionable advice: $data');

  Future<String> creditReadiness(String data) =>
      provider.complete(prompt: 'Assess credit readiness from these transactions: $data');
}
