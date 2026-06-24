class Loan {
  final String id;
  final String businessId;
  final String partnerId;
  final double amount;
  final String currency;
  final double interestRate; // percentage
  final int termDays;
  final String status; // pending | approved | active | repaid | defaulted | rejected
  final double? outstandingBalance;
  final DateTime? disbursedAt;
  final DateTime? dueDate;
  final DateTime? repaidAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Loan({
    required this.id,
    required this.businessId,
    required this.partnerId,
    required this.amount,
    this.currency = 'BIF',
    required this.interestRate,
    required this.termDays,
    this.status = 'pending',
    this.outstandingBalance,
    this.disbursedAt,
    this.dueDate,
    this.repaidAt,
    required this.createdAt,
    required this.updatedAt,
  });

  Loan copyWith({
    String? id,
    String? businessId,
    String? partnerId,
    double? amount,
    String? currency,
    double? interestRate,
    int? termDays,
    String? status,
    double? outstandingBalance,
    DateTime? disbursedAt,
    DateTime? dueDate,
    DateTime? repaidAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Loan(
      id: id ?? this.id,
      businessId: businessId ?? this.businessId,
      partnerId: partnerId ?? this.partnerId,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      interestRate: interestRate ?? this.interestRate,
      termDays: termDays ?? this.termDays,
      status: status ?? this.status,
      outstandingBalance: outstandingBalance ?? this.outstandingBalance,
      disbursedAt: disbursedAt ?? this.disbursedAt,
      dueDate: dueDate ?? this.dueDate,
      repaidAt: repaidAt ?? this.repaidAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
