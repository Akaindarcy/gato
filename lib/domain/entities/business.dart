class Business {
  final String id;
  final String ownerId;
  final String name;
  final String type; // retailer | wholesaler | agent | market_vendor
  final String? location;
  final String currency;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Business({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.type,
    this.location,
    this.currency = 'BIF',
    required this.createdAt,
    required this.updatedAt,
  });

  Business copyWith({
    String? id,
    String? ownerId,
    String? name,
    String? type,
    String? location,
    String? currency,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Business(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      name: name ?? this.name,
      type: type ?? this.type,
      location: location ?? this.location,
      currency: currency ?? this.currency,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
