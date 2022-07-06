import 'dart:convert';

import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final int? month;
  final int? year;
  final int? transactions;
  final double? percent;
  final int? amount;
  final int? qty;
  final int? buyer;
  final int? seller;

  const Datum({
    this.month,
    this.year,
    this.transactions,
    this.percent,
    this.amount,
    this.qty,
    this.buyer,
    this.seller,
  });

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        month: data['month'] as int?,
        year: data['year'] as int?,
        transactions: data['transactions'] as int?,
        percent: (data['percent'] as num?)?.toDouble(),
        amount: data['amount'] as int?,
        qty: data['qty'] as int?,
        buyer: data['buyer'] as int?,
        seller: data['seller'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'month': month,
        'year': year,
        'transactions': transactions,
        'percent': percent,
        'amount': amount,
        'qty': qty,
        'buyer': buyer,
        'seller': seller,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());

  Datum copyWith({
    int? month,
    int? year,
    int? transactions,
    double? percent,
    int? amount,
    int? qty,
    int? buyer,
    int? seller,
  }) {
    return Datum(
      month: month ?? this.month,
      year: year ?? this.year,
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
      month,
      year,
      transactions,
      percent,
      amount,
      qty,
      buyer,
      seller,
    ];
  }
}
