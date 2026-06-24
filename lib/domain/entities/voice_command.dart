class VoiceCommand {
  final String id;
  final String businessId;
  final String transcript; // what user said
  final String intent; // record_sale | record_expense | check_balance | ask_help
  final Map<String, dynamic>? parsedValues; // amount, category, note
  final String? audioPath;
  final bool executed;
  final String? errorMessage;
  final DateTime executedAt;
  final DateTime createdAt;

  const VoiceCommand({
    required this.id,
    required this.businessId,
    required this.transcript,
    required this.intent,
    this.parsedValues,
    this.audioPath,
    this.executed = false,
    this.errorMessage,
    required this.executedAt,
    required this.createdAt,
  });

  VoiceCommand copyWith({
    String? id,
    String? businessId,
    String? transcript,
    String? intent,
    Map<String, dynamic>? parsedValues,
    String? audioPath,
    bool? executed,
    String? errorMessage,
    DateTime? executedAt,
    DateTime? createdAt,
  }) {
    return VoiceCommand(
      id: id ?? this.id,
      businessId: businessId ?? this.businessId,
      transcript: transcript ?? this.transcript,
      intent: intent ?? this.intent,
      parsedValues: parsedValues ?? this.parsedValues,
      audioPath: audioPath ?? this.audioPath,
      executed: executed ?? this.executed,
      errorMessage: errorMessage ?? this.errorMessage,
      executedAt: executedAt ?? this.executedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
