import '../../../core/error/failures.dart';
import '../../domain/entities/community_group.dart';

abstract class CommunityGroupRepository {
  Future<List<CommunityGroup>> listForUser(String userId);
  Future<CommunityGroup> create(CommunityGroup group);
  Future<void> join(String groupId, String userId);
  Future<void> leave(String groupId, String userId);
}
