import 'package:dio/dio.dart';

class LoremApiService {
  final Dio _dio;

  LoremApiService(this._dio);

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