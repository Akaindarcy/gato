import '../../../core/error/failures.dart';
import '../../domain/entities/voice_command.dart';

abstract class VoiceCommandRepository {
  Future<VoiceCommand> save(VoiceCommand command);
  Future<List<VoiceCommand>> history(String businessId);
  Future<void> markExecuted(String id);
}
