import 'dart:convert';

import 'package:dio/dio.dart';

class ApiUtil {


  final Dio _dio;

  ApiUtil(this._dio);

  Future<Map> getFixtureTitle(int count) async {
    final result = await _get(
     '',
      queryParameters: {
        "type": "title",
        "number": count,
        "format": "json"},
      );
    return jsonDecode(result);
  }
  Future<Map> getFixtureDescription(int count) async {
    final result = await _get(
      '',
      queryParameters: {
        "type": "paragraph",
        "number": count,
        "format": "json"},
      );
    return jsonDecode(result);
  }

  Future<dynamic> _get(String path, {
    Map<String, dynamic> queryParameters,
    Options options}) async {
      final result = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return result.data;
    }
}