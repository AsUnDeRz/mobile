import 'package:dio/dio.dart';

import 'package:catalog_app_bloc/data/api/api_config.dart';
import 'package:catalog_app_bloc/data/api/api_util.dart';
import 'package:catalog_app_bloc/data/api/services/fish-text.ru/fish_api_service.dart';
import 'package:catalog_app_bloc/data/api/services/loremapi.org/lorem_api_service.dart';
import 'package:catalog_app_bloc/data/api/services/demo7592015.mockable.io/mockable_api_service.dart';

class ApiModule {
  static  ApiUtil _apiUtil;

  static BaseOptions _fishBaseOptions() {
    return BaseOptions(
      baseUrl: FishConfig.BASE_URL,
      connectTimeout: FishConfig.CONNECT_TIMEOUT,
    );
  }

  static BaseOptions _loremBaseOptions() {
    return BaseOptions(
      baseUrl: LoremConfig.BASE_URL,
      connectTimeout: LoremConfig.CONNECT_TIMEOUT,
    );
  }

  static BaseOptions _mockableBaseOptions() {
    return BaseOptions(
      baseUrl: MockableConfig.BASE_URL,
      connectTimeout: MockableConfig.CONNECT_TIMEOUT,
    );
  }

  static Dio _fishDio() {
    return Dio(_fishBaseOptions());
  }

  static Dio _loremDio() {
    return Dio(_loremBaseOptions());
  }

  static Dio _mockableDio() {
    return Dio(_mockableBaseOptions());
  }

  static FishApiService _fishApiService() {
    return FishApiService(_fishDio());
  }

  static LoremApiService _loremApiService() {
    return LoremApiService(_loremDio());
  }

  static MockableApiService _mockableApiService() {
    return MockableApiService(_mockableDio());
  }

  static ApiUtil apiUtil() {
    if (_apiUtil == null) {
      _apiUtil = ApiUtil(
        _fishApiService(),
        _loremApiService(),
        _mockableApiService(),
      );
    }
    return _apiUtil;
  }
}