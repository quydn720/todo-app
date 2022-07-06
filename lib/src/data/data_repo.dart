import 'dart:convert';

import 'package:account_data_portal/src/data/models/api_data/api_data.dart';
import 'package:dio/dio.dart';

class DataRepo {
  final Dio dio;

  DataRepo(this.dio);

  Future<List<ApiData>> getData() async {
    final response = await dio.get('http://139.99.84.118:31321/accounts/?id=1');
    if (response.statusCode == 200) {
      final list = (response.data as List<dynamic>);
      return list.map((e) => ApiData.fromJson(jsonEncode(e))).toList();
    } else {
      throw Exception('Error');
    }
  }
}
