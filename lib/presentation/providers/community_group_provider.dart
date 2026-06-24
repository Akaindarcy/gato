import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gato/domain/entities/community_group.dart';
import 'package:gato/domain/repositories/community_group_repository.dart';

class CommunityGroupProvider extends StateNotifier<AsyncValue<List<CommunityGroup>>> {
  final CommunityGroupRepository _repo;
  CommunityGroupProvider(this._repo) : super(const AsyncValue.loading());

  Future<void> load(String userId) async {
    state = const AsyncValue.loading();
    try {
      final groups = await _repo.listForUser(userId);
      state = AsyncValue.data(groups);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
