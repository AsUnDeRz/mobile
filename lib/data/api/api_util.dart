import 'dart:convert';

import 'package:dio/dio.dart';

class ApiUtil {




  final Dio _dio;

  ApiUtil(this._dio);

  Future<List<String>> getFixtureTitle(int count) async {
    final result = await _get(
     '',
      queryParameters: {
        "type": "title",
        "number": count,
        "format": "json"},
      );

    return _explodeString(result);
  }

  Future<List<String>> getFixtureDescription(int count) async {
    final result = await _get(
      '',
      queryParameters: {
        "type": "paragraph",
        "number": count,
        "format": "json"},
      );

    return _explodeString(result);
  }

  List<String> _explodeString(result){
    var listItems = jsonDecode(result)['text'].split(RegExp(r"\\n\\n"));
    listItems.removeLast();
    return listItems;
  }

  Future<dynamic> getEngFixtureTitle(int count, {words=5}) async {
    final result = await _get(
     '',
      queryParameters: {
        "paragraphs": '$count-$count',
        "words": '$words-$words',
        "start-with-lorem-ipsum": "false",
        "format": "json",},
      );
    return result;
  }

  Future<dynamic> getEngFixtureDescription(int count, {words=100}) async {
    final result = await _get(
      '',
      queryParameters: {
        "paragraphs": '$count-$count',
        "words": '$words-$words',
        "start-with-lorem-ipsum": "false",
        "format": "json",},
    );
    return result;
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