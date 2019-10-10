import 'package:dio/dio.dart';

import 'package:catalog_app_bloc/data/api/model/api_offer.dart';

class MockableApiService {
  final Dio _dio;

  MockableApiService(this._dio);

  Future<List<ApiOffer>> getListOffer() async {
    List<dynamic> result = await _get('list-offer');

    var t=result
        .map((res) => ApiOffer.fromMap(res))
        .toList(growable: false);

    return t;
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