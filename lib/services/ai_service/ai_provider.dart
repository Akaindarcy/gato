abstract class AIProvider {
  Future<String> complete({required String prompt, String? systemPrompt});
}
