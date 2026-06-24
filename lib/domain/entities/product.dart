class Product {
  final String id;
  final String name;
  final String category;
  final double? purchasePrice;
  final double? sellingPrice;
  final int stockQuantity;
  final String? unit;
  final String businessId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    this.purchasePrice,
    this.sellingPrice,
    required this.stockQuantity,
    this.unit,
    required this.businessId,
    required this.createdAt,
    required this.updatedAt,
    this.deleted = false,
  });

  Product copyWith({
    String? id,
    String? name,
    String? category,
    double? purchasePrice,
    double? sellingPrice,
    int? stockQuantity,
    String? unit,
    String? businessId,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? deleted,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      sellingPrice: sellingPrice ?? this.sellingPrice,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      unit: unit ?? this.unit,
      businessId: businessId ?? this.businessId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
    );
  }
}
