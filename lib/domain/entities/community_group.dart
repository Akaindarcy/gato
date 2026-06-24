class CommunityGroup {
  final String id;
  final String name;
  final String description;
  final String type; // seller_group | village_network | women_circle | marketplace
  final String ownerId;
  final int maxMembers;
  final int currentMembers;
  final String language;
  final bool isPrivate;
  final DateTime createdAt;
  final DateTime updatedAt;

  const CommunityGroup({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.ownerId,
    this.maxMembers = 20,
    this.currentMembers = 0,
    this.language = 'rn',
    this.isPrivate = false,
    required this.createdAt,
    required this.updatedAt,
  });

  CommunityGroup copyWith({
    String? id,
    String? name,
    String? description,
    String? type,
    String? ownerId,
    int? maxMembers,
    int? currentMembers,
    String? language,
    bool? isPrivate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CommunityGroup(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      ownerId: ownerId ?? this.ownerId,
      maxMembers: maxMembers ?? this.maxMembers,
      currentMembers: currentMembers ?? this.currentMembers,
      language: language ?? this.language,
      isPrivate: isPrivate ?? this.isPrivate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
