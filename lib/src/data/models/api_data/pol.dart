import 'dart:convert';

import 'package:equatable/equatable.dart';

class Pol extends Equatable {
  final String? pol;
  final int? transactions;
  final int? percent;
  final int? qty;
  final int? buyer;
  final int? seller;

  const Pol({
    this.pol,
    this.transactions,
    this.percent,
    this.qty,
    this.buyer,
    this.seller,
  });

  factory Pol.fromMap(Map<String, dynamic> data) => Pol(
        pol: data['pol'] as String?,
        transactions: data['transactions'] as int?,
        percent: data['percent'] as int?,
        qty: data['qty'] as int?,
        buyer: data['buyer'] as int?,
        seller: data['seller'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'pol': pol,
        'transactions': transactions,
        'percent': percent,
        'qty': qty,
        'buyer': buyer,
        'seller': seller,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Pol].
  factory Pol.fromJson(String data) {
    return Pol.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Pol] to a JSON string.
  String toJson() => json.encode(toMap());

  Pol copyWith({
    String? pol,
    int? transactions,
    int? percent,
    int? qty,
    int? buyer,
    int? seller,
  }) {
    return Pol(
      pol: pol ?? this.pol,
      transactions: transactions ?? this.transactions,
      percent: percent ?? this.percent,
      qty: qty ?? this.qty,
      buyer: buyer ?? this.buyer,
      seller: seller ?? this.seller,
    );
  }

  @override
  List<Object?> get props {
    return [
      pol,
      transactions,
      percent,
      qty,
      buyer,
      seller,
    ];
  }
}
