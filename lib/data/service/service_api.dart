import 'dart:async';

import 'package:dio/dio.dart';

///
///Класс для обслуживания запросов CRUD к API
///
class ServiceAPI {
  final Dio _dio;

  ServiceAPI()
      : _dio = Dio(
          BaseOptions(baseUrl: 'https://webstripe.ru/'),
        );

  Future<Response> getData(String endpoint) async {
    try {
      return await _dio.get(endpoint);
    } catch (e) {
      throw Exception('Failed to get data: $e');
    }
  }
}
