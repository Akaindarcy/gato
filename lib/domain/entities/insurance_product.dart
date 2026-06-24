class InsuranceProduct {
  final String id;
  final String code;
  final String name;
  final String description;
  final double monthlyPremium;
  final String currency;
  final String coverageSummary;
  final String partnerId;
  final bool active;

  const InsuranceProduct({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.monthlyPremium,
    this.currency = 'BIF',
    required this.coverageSummary,
    required this.partnerId,
    this.active = true,
  });

  InsuranceProduct copyWith({
    String? id,
    String? code,
    String? name,
    String? description,
    double? monthlyPremium,
    String? currency,
    String? coverageSummary,
    String? partnerId,
    bool? active,
  }) {
    return InsuranceProduct(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      monthlyPremium: monthlyPremium ?? this.monthlyPremium,
      currency: currency ?? this.currency,
      coverageSummary: coverageSummary ?? this.coverageSummary,
      partnerId: partnerId ?? this.partnerId,
      active: active ?? this.active,
    );
  }
}
