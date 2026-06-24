import '../../domain/entities/community_group.dart';
import '../../domain/repositories/community_group_repository.dart';

class CommunityGroupRepositoryImpl implements CommunityGroupRepository {
  @override
  Future<List<CommunityGroup>> listForUser(String userId) async => [];

  @override
  Future<CommunityGroup> create(CommunityGroup group) async => group;

  @override
  Future<void> join(String groupId, String userId) async {}

  @override
  Future<void> leave(String groupId, String userId) async {}
}
