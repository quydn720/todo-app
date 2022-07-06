import 'dart:convert';

import 'package:equatable/equatable.dart';

class Pod extends Equatable {
  final String? pod;
  final int? transactions;
  final int? percent;
  final int? amount;
  final int? qty;
  final int? buyer;
  final int? seller;

  const Pod({
    this.pod,
    this.transactions,
    this.percent,
    this.amount,
    this.qty,
    this.buyer,
    this.seller,
  });

  factory Pod.fromMap(Map<String, dynamic> data) => Pod(
        pod: data['pod'] as String?,
        transactions: data['transactions'] as int?,
        percent: data['percent'] as int?,
        amount: data['amount'] as int?,
        qty: data['qty'] as int?,
        buyer: data['buyer'] as int?,
        seller: data['seller'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'pod': pod,
        'transactions': transactions,
        'percent': percent,
        'amount': amount,
        'qty': qty,
        'buyer': buyer,
        'seller': seller,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Pod].
  factory Pod.fromJson(String data) {
    return Pod.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Pod] to a JSON string.
  String toJson() => json.encode(toMap());

  Pod copyWith({
    String? pod,
    int? transactions,
    int? percent,
    int? amount,
    int? qty,
    int? buyer,
    int? seller,
  }) {
    return Pod(
      pod: pod ?? this.pod,
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
      pod,
      transactions,
      percent,
      amount,
      qty,
      buyer,
      seller,
    ];
  }
}
