import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'buyer.dart';
import 'market_analysis.dart';
import 'pod.dart';
import 'pol.dart';
import 'supplier.dart';
import 'supply_country.dart';
import 'transaction.dart';

class ApiData extends Equatable {
  final int? id;
  final List<Transaction>? transactions;
  final MarketAnalysis? marketAnalysis;
  final List<Supplier>? supplier;
  final List<Buyer>? buyer;
  final List<SupplyCountry>? supplyCountry;
  final List<Pol>? pol;
  final List<Pod>? pod;

  const ApiData({
    this.id,
    this.transactions,
    this.marketAnalysis,
    this.supplier,
    this.buyer,
    this.supplyCountry,
    this.pol,
    this.pod,
  });

  factory ApiData.fromMap(Map<String, dynamic> data) => ApiData(
        id: data['id'] as int?,
        transactions: (data['transactions'] as List<dynamic>?)
            ?.map((e) => Transaction.fromMap(e as Map<String, dynamic>))
            .toList(),
        marketAnalysis: data['market_analysis'] == null
            ? null
            : MarketAnalysis.fromMap(
                data['market_analysis'] as Map<String, dynamic>),
        supplier: (data['supplier'] as List<dynamic>?)
            ?.map((e) => Supplier.fromMap(e as Map<String, dynamic>))
            .toList(),
        buyer: (data['buyer'] as List<dynamic>?)
            ?.map((e) => Buyer.fromMap(e as Map<String, dynamic>))
            .toList(),
        supplyCountry: (data['supply_country'] as List<dynamic>?)
            ?.map((e) => SupplyCountry.fromMap(e as Map<String, dynamic>))
            .toList(),
        pol: (data['pol'] as List<dynamic>?)
            ?.map((e) => Pol.fromMap(e as Map<String, dynamic>))
            .toList(),
        pod: (data['pod'] as List<dynamic>?)
            ?.map((e) => Pod.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'transactions': transactions?.map((e) => e.toMap()).toList(),
        'market_analysis': marketAnalysis?.toMap(),
        'supplier': supplier?.map((e) => e.toMap()).toList(),
        'buyer': buyer?.map((e) => e.toMap()).toList(),
        'supply_country': supplyCountry?.map((e) => e.toMap()).toList(),
        'pol': pol?.map((e) => e.toMap()).toList(),
        'pod': pod?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ApiData].
  factory ApiData.fromJson(String data) {
    return ApiData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ApiData] to a JSON string.
  String toJson() => json.encode(toMap());

  ApiData copyWith({
    int? id,
    List<Transaction>? transactions,
    MarketAnalysis? marketAnalysis,
    List<Supplier>? supplier,
    List<Buyer>? buyer,
    List<SupplyCountry>? supplyCountry,
    List<Pol>? pol,
    List<Pod>? pod,
  }) {
    return ApiData(
      id: id ?? this.id,
      transactions: transactions ?? this.transactions,
      marketAnalysis: marketAnalysis ?? this.marketAnalysis,
      supplier: supplier ?? this.supplier,
      buyer: buyer ?? this.buyer,
      supplyCountry: supplyCountry ?? this.supplyCountry,
      pol: pol ?? this.pol,
      pod: pod ?? this.pod,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      transactions,
      marketAnalysis,
      supplier,
      buyer,
      supplyCountry,
      pol,
      pod,
    ];
  }
}
