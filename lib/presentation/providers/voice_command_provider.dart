import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gato/domain/entities/voice_command.dart';
import 'package:gato/domain/repositories/voice_command_repository.dart';

class VoiceCommandProvider extends StateNotifier<AsyncValue<List<VoiceCommand>>> {
  final VoiceCommandRepository _repo;
  VoiceCommandProvider(this._repo) : super(const AsyncValue.loading());

  Future<void> load(String businessId) async {
    state = const AsyncValue.loading();
    try {
      final items = await _repo.history(businessId);
      state = AsyncValue.data(items);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
