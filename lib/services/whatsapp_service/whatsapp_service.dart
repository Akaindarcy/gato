class WhatsAppService {
  final String businessNumber;

  WhatsAppService({required this.businessNumber});

  Future<void> sendText(String toPhone, String message) async {
    // Integration point for WhatsApp Business API or local aggregator
    // Placeholder for backend-mediated send
    throw UnimplementedError('Integrate with WhatsApp Business API provider');
  }

  Future<void> sendInteractive({
    required String toPhone,
    required String header,
    required String body,
    required List<Map<String, String>> buttons,
  }) async {
    // Placeholder for button/menu-based WhatsApp UX
    throw UnimplementedError('Integrate with WhatsApp Business API provider');
  }
}
