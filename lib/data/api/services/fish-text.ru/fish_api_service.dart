import 'dart:convert';

import 'package:dio/dio.dart';

class FishApiService {
  final Dio _dio;

  FishApiService(this._dio);

  Future<List<String>> getFixtureTitle(int count) async {
    final result = await _get(
      '',
      queryParameters: {
        "type": "title",
        "number": count,
        "format": "json"},
    );

    return _explodeItems(result);
  }

  Future<List<String>> getFixtureDescription(int count) async {
    final result = await _get(
      '',
      queryParameters: {
        "type": "paragraph",
        "number": count,
        "format": "json"},
    );

    return _explodeItems(result);
  }

  List<String> _explodeItems(result){
    var listItems = jsonDecode(result)['text'].split(RegExp(r"\\n\\n"));
    listItems.removeLast();
    return listItems;
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