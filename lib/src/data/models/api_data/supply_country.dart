import 'dart:convert';

import 'package:equatable/equatable.dart';

class SupplyCountry extends Equatable {
  final String? country;
  final int? transactions;
  final double? percent;
  final int? amount;
  final int? qty;
  final int? buyer;
  final int? seller;

  const SupplyCountry({
    this.country,
    this.transactions,
    this.percent,
    this.amount,
    this.qty,
    this.buyer,
    this.seller,
  });

  factory SupplyCountry.fromMap(Map<String, dynamic> data) => SupplyCountry(
        country: data['country'] as String?,
        transactions: data['transactions'] as int?,
        percent: (data['percent'] as num?)?.toDouble(),
        amount: data['amount'] as int?,
        qty: data['qty'] as int?,
        buyer: data['buyer'] as int?,
        seller: data['seller'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'country': country,
        'transactions': transactions,
        'percent': percent,
        'amount': amount,
        'qty': qty,
        'buyer': buyer,
        'seller': seller,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SupplyCountry].
  factory SupplyCountry.fromJson(String data) {
    return SupplyCountry.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SupplyCountry] to a JSON string.
  String toJson() => json.encode(toMap());

  SupplyCountry copyWith({
    String? country,
    int? transactions,
    double? percent,
    int? amount,
    int? qty,
    int? buyer,
    int? seller,
  }) {
    return SupplyCountry(
      country: country ?? this.country,
      transactions: transactions ?? this.transactions,
      percent: percent ?? this.percent,
      amount: amount ?? this.amount,
      qty: qty ?? this.qty,
      buyer: buyer ?? this.buyer,
      seller: seller ?? this.seller,
    );
  }

  @override
  List<Object?> get props {
    return [
      country,
      transactions,
      percent,
      amount,
      qty,
      buyer,
      seller,
    ];
  }
}
