import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gato/domain/entities/trust_score.dart';
import 'package:gato/domain/entities/community_group.dart';
import 'package:gato/domain/entities/achievement.dart';
import 'package:gato/domain/entities/loan.dart';
import 'package:gato/domain/entities/voice_command.dart';
import 'package:gato/domain/repositories/trust_score_repository.dart';
import 'package:gato/domain/repositories/community_group_repository.dart';
import 'package:gato/domain/repositories/achievement_repository.dart';
import 'package:gato/domain/repositories/loan_repository.dart';
import 'package:gato/domain/repositories/voice_command_repository.dart';

class TrustScoreProvider extends StateNotifier<AsyncValue<TrustScore?>> {
  final TrustScoreRepository _repo;
  TrustScoreProvider(this._repo) : super(const AsyncValue.data(null));

  Future<void> load(String businessId) async {
    state = const AsyncValue.loading();
    try {
      final score = await _repo.getCurrent(businessId);
      state = AsyncValue.data(score);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

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

class AchievementProvider extends StateNotifier<AsyncValue<List<Achievement>>> {
  final AchievementRepository _repo;
  AchievementProvider(this._repo) : super(const AsyncValue.loading());

  Future<void> load(String userId) async {
    state = const AsyncValue.loading();
    try {
      final items = await _repo.listForUser(userId);
      state = AsyncValue.data(items);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

class LoanProvider extends StateNotifier<AsyncValue<List<Loan>>> {
  final LoanRepository _repo;
  LoanProvider(this._repo) : super(const AsyncValue.loading());

  Future<void> load(String businessId) async {
    state = const AsyncValue.loading();
    try {
      final items = await _repo.list(businessId);
      state = AsyncValue.data(items);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

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
