import '../../domain/entities/voice_command.dart';
import '../../domain/repositories/voice_command_repository.dart';

class VoiceCommandRepositoryImpl implements VoiceCommandRepository {
  @override
  Future<VoiceCommand> save(VoiceCommand command) async => command;

  @override
  Future<List<VoiceCommand>> history(String businessId) async => [];

  @override
  Future<void> markExecuted(String id) async {}
}
