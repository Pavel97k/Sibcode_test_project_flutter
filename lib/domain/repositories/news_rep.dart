import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:test_project_subicode/data/models/news.dart';
import 'package:test_project_subicode/data/service/service_api.dart';

class NewsRep {
  Future<List<News>> getAllNews() async {
    try {
      final response = await ServiceAPI().getData('list.json');
      Map<String, dynamic> data = response.data;
      List<dynamic> newData = data['news'];
      return newData.map((e) => News.fromJson(e)).toList();
    } on DioException catch (ex) {
      if (kDebugMode) {
        print(ex.message);
      }
      throw ex.response?.data;
    }
  }
}
