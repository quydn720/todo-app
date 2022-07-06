import 'dart:convert';

import 'package:equatable/equatable.dart';

class Supplier extends Equatable {
  final String? supplier;
  final int? transactions;
  final double? percent;
  final int? amount;
  final int? qty;
  final int? buyer;

  const Supplier({
    this.supplier,
    this.transactions,
    this.percent,
    this.amount,
    this.qty,
    this.buyer,
  });

  factory Supplier.fromMap(Map<String, dynamic> data) => Supplier(
        supplier: data['supplier'] as String?,
        transactions: data['transactions'] as int?,
        percent: (data['percent'] as num?)?.toDouble(),
        amount: data['amount'] as int?,
        qty: data['qty'] as int?,
        buyer: data['buyer'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'supplier': supplier,
        'transactions': transactions,
        'percent': percent,
        'amount': amount,
        'qty': qty,
        'buyer': buyer,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Supplier].
  factory Supplier.fromJson(String data) {
    return Supplier.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Supplier] to a JSON string.
  String toJson() => json.encode(toMap());

  Supplier copyWith({
    String? supplier,
    int? transactions,
    double? percent,
    int? amount,
    int? qty,
    int? buyer,
  }) {
    return Supplier(
      supplier: supplier ?? this.supplier,
      transactions: transactions ?? this.transactions,
      percent: percent ?? this.percent,
      amount: amount ?? this.amount,
      qty: qty ?? this.qty,
      buyer: buyer ?? this.buyer,
    );
  }

  @override
  List<Object?> get props {
    return [
      supplier,
      transactions,
      percent,
      amount,
      qty,
      buyer,
    ];
  }
}
