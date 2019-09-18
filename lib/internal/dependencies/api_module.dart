import 'package:dio/dio.dart';

import 'package:catalog_app/data/api/api_util.dart';
import 'package:catalog_app/data/api/api_config.dart';

class ApiModule {
  static ApiUtil _apiUtil;



  static BaseOptions _baseOptions() {
    return BaseOptions(
      baseUrl: ApiConfig.BASE_URL,
      connectTimeout: ApiConfig.CONNECT_TIMEOUT,
    );
  }

  static Dio _dio() {
    return Dio(_baseOptions());
  }

  static ApiFishService _apiFishService() {
    return ApiFishService(DioFish());
  }

  static ApiUtil apiUtil() {
    if (_apiUtil == null) {
      _apiUtil = ApiUtil(
        _dio(),
      );
    }
    return _apiUtil;
  }
}