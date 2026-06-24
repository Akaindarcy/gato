class SyncProtocol {
  static const pendingStatus = 'pending';
  static const syncingStatus = 'syncing';
  static const errorStatus = 'error';
  static const doneStatus = 'done';

  static const defaultVersion = 2;
  static const defaultMaxRetries = 3;
  static const batchSize = 50;

  // Conflict resolution strategies
  static const conflictStrategyLastWriteWins = 'last_write_wins';
  static const conflictStrategyMerge = 'merge';
  static const conflictStrategyUserPrompt = 'user_prompt';

  // Record types
  static const recordTypeTransaction = 'transaction';
  static const recordTypeProduct = 'product';
  static const recordTypeSavingsGoal = 'savings_goal';
  static const recordTypeCommunityMember = 'community_member';

  // Directions
  static const directionUp = 'up';
  static const directionDown = 'down';
}
