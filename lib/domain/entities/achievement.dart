class Achievement {
  final String id;
  final String code;
  final String title;
  final String description;
  final String iconAsset;
  final int rewardPoints;
  final String? partnerReward; // e.g., supplier discount coupon
  final bool isUnlocked;
  final DateTime? unlockedAt;

  const Achievement({
    required this.id,
    required this.code,
    required this.title,
    required this.description,
    required this.iconAsset,
    this.rewardPoints = 0,
    this.partnerReward,
    this.isUnlocked = false,
    this.unlockedAt,
  });

  Achievement copyWith({
    String? id,
    String? code,
    String? title,
    String? description,
    String? iconAsset,
    int? rewardPoints,
    String? partnerReward,
    bool? isUnlocked,
    DateTime? unlockedAt,
  }) {
    return Achievement(
      id: id ?? this.id,
      code: code ?? this.code,
      title: title ?? this.title,
      description: this.description,
      iconAsset: iconAsset ?? this.iconAsset,
      rewardPoints: rewardPoints ?? this.rewardPoints,
      partnerReward: partnerReward ?? this.partnerReward,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      unlockedAt: unlockedAt ?? this.unlockedAt,
    );
  }
}
