import 'dart:convert';

import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final String? tradeDate;
  final String? buyer;
  final String? supplier;
  final String? products;

  const Transaction({
    this.tradeDate,
    this.buyer,
    this.supplier,
    this.products,
  });

  factory Transaction.fromMap(Map<String, dynamic> data) => Transaction(
        tradeDate: data['trade_date'] as String?,
        buyer: data['buyer'] as String?,
        supplier: data['supplier'] as String?,
        products: data['products'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'trade_date': tradeDate,
        'buyer': buyer,
        'supplier': supplier,
        'products': products,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Transaction].
  factory Transaction.fromJson(String data) {
    return Transaction.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Transaction] to a JSON string.
  String toJson() => json.encode(toMap());

  Transaction copyWith({
    String? tradeDate,
    String? buyer,
    String? supplier,
    String? products,
  }) {
    return Transaction(
      tradeDate: tradeDate ?? this.tradeDate,
      buyer: buyer ?? this.buyer,
      supplier: supplier ?? this.supplier,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [tradeDate, buyer, supplier, products];
}
