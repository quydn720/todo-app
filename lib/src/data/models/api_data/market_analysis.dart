import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';

class MarketAnalysis extends Equatable {
  final String? tradeFromDate;
  final String? tradeToDate;
  final int? transactions;
  final int? amount;
  final int? qty;
  final List<Datum>? data;

  const MarketAnalysis({
    this.tradeFromDate,
    this.tradeToDate,
    this.transactions,
    this.amount,
    this.qty,
    this.data,
  });

  factory MarketAnalysis.fromMap(Map<String, dynamic> data) {
    return MarketAnalysis(
      tradeFromDate: data['trade_from_date'] as String?,
      tradeToDate: data['trade_to_date'] as String?,
      transactions: data['transactions'] as int?,
      amount: data['amount'] as int?,
      qty: data['qty'] as int?,
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'trade_from_date': tradeFromDate,
        'trade_to_date': tradeToDate,
        'transactions': transactions,
        'amount': amount,
        'qty': qty,
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MarketAnalysis].
  factory MarketAnalysis.fromJson(String data) {
    return MarketAnalysis.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MarketAnalysis] to a JSON string.
  String toJson() => json.encode(toMap());

  MarketAnalysis copyWith({
    String? tradeFromDate,
    String? tradeToDate,
    int? transactions,
    int? amount,
    int? qty,
    List<Datum>? data,
  }) {
    return MarketAnalysis(
      tradeFromDate: tradeFromDate ?? this.tradeFromDate,
      tradeToDate: tradeToDate ?? this.tradeToDate,
      transactions: transactions ?? this.transactions,
      amount: amount ?? this.amount,
      qty: qty ?? this.qty,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props {
    return [
      tradeFromDate,
      tradeToDate,
      transactions,
      amount,
      qty,
      data,
    ];
  }
}
