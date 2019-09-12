import 'dart:io';

import 'package:dio/dio.dart';

class ApiUtil {
  static const _RESET_PASSWORD = '/users/password-reset';
  static const _CHECK_EMAIL = '/users/email';
  static const _TOKEN = '/oauth2/token';

  final Dio _dio;

  ApiUtil(this._dio);

//  Future<Token> authWithUsernamePassword(String authorization, String username, String password, String grantType) async {
//    final result = await _post(
//      _TOKEN,
//      data: {
//        'username': username,
//        'password': password,
//        'grant_type': grantType
//      },
//      options: Options(
//        headers: {
//          'authorization': authorization,
//        },
//        contentType: ContentType.parse('application/x-www-form-urlencoded'),
//      ),
//    );
//    return Token.fromMap(result);
//  }
//
//  Future<Token> refreshToken(String authorization, String refreshToken, String grantType) async {
//    final result = await _post(
//      _TOKEN,
//      data: {
//        'refresh_token': refreshToken,
//        'grant_type': grantType
//      },
//      options: Options(
//        headers: {
//          'authorization': authorization,
//        },
//        contentType: ContentType.parse('application/x-www-form-urlencoded'),
//      ),
//    );
//    return Token.fromMap(result);
//  }
//
//  Future<void> resetPassword(String authorization, String email) async {
//    final result = await _post(
//      _RESET_PASSWORD,
//      data: {
//        'email': email
//      },
//      options: Options(
//        headers: {
//          'authorization': authorization,
//        },
//        contentType: ContentType.parse('application/x-www-form-urlencoded'),
//      ),
//    );
//    return result;
//  }
//
//  Future<void> checkEmail(String authorization, String email) async {
//    final result = await _post(
//      _CHECK_EMAIL,
//      data: {
//        'email': email
//      },
//      options: Options(
//        headers: {
//          'authorization': authorization,
//        },
//        contentType: ContentType.parse('application/x-www-form-urlencoded'),
//      ),
//    );
//    return result;
//  }
//
//  Future<Profile> getProfile(String authorization) async {
//    final result = await _get(
//      _PROFILE,
//      options: Options(
//        headers: {
//          'authorization': authorization,
//        },
//      ),
//    );
//    return Profile.fromMap(result);
//  }
//
//  Future<Profile> updateUser(String authorization, String userId, UpdateUserRequest updateUserRequest) async {
//    final result = await _patch(
//      _USERS + '/$userId',
//      data: updateUserRequest.toMap(),
//      options: Options(
//        headers: {
//          'authorization': authorization,
//        },
//      ),
//    );
//    return Profile.fromMap(result);
//  }
//
//  Future<Profile> updateUserInterests(String authorization, String userId, UpdateUserInterestsRequest updateUserInterestsRequest) async {
//    final result = await _patch(
//      _USERS + '/$userId',
//      data: updateUserInterestsRequest.toMap(),
//      options: Options(
//        headers: {
//          'authorization': authorization,
//        },
//      ),
//    );
//    return Profile.fromMap(result);
//  }
//
//  Future<Profile> changePassword(String authorization, ChangePasswordRequest changePasswordRequest) async {
//    final result = await _patch(
//      _CHANGE_PASSWORD,
//      data: changePasswordRequest.toMap(),
//      options: Options(
//        headers: {
//          'authorization': authorization,
//        },
//      ),
//    );
//    return Profile.fromMap(result);
//  }
//
//  Future<Profile> updatePrivacy(String authorization, UpdatePrivacyRequest updatePrivacyRequest) async {
//    final result = await _patch(
//      _UPDATE_PRIVACY,
//      data: updatePrivacyRequest.toMap(),
//      options: Options(
//        headers: {
//          'authorization': authorization,
//        },
//      ),
//    );
//    return Profile.fromMap(result);
//  }
//
//  Future<List<UserImage>> getUserImages(String authorization) async {
//    final result = await _get(
//      _IMAGES,
//      options: Options(
//        headers: {
//          'authorization': authorization,
//        },
//      ),
//    );
//    return (result as List)
//        .map((map) => UserImage.fromMap(map))
//        .toList(growable: false);
//  }
//
//  Future<ApiResponse> uploadImage(String authorization, ImageUploadRequest imageUploadRequest) async {
//    final result = await _post(
//      _UPLOAD_IMAGE,
//      data: imageUploadRequest.toMap(),
//      options: Options(
//        headers: {
//          'authorization': authorization,
//        },
//      ),
//    );
//    return ApiResponse.fromMap(result);
//  }
//
//  Future<ImageActionResponse> imageAction(String authorization, String imageId, String action) async {
//    final result = await _post(
//      _IMAGES + '/$imageId' + '/$action',
//      options: Options(
//        headers: {
//          'authorization': authorization,
//        },
//      ),
//    );
//    return ImageActionResponse.fromMap(result);
//  }
//
//  Future<ImageActionResponse> updateImageDescription(String authorization, String imageId, String description) async {
//    final result = await _post(
//      _IMAGES + '/$imageId' + '/update-description',
//      data: {
//        'description': description
//      },
//      options: Options(
//        headers: {
//          'authorization': authorization,
//        },
//      ),
//    );
//    return ImageActionResponse.fromMap(result);
//  }
//
//  Future<List<Location>> locationSearch(String authorization, String query) async {
//    final result = await _get(
//      _LOCATION_SEARCH,
//      queryParameters: {
//        'query': query
//      },
//      options: Options(
//        headers: {
//          'authorization': authorization,
//        },
//      ),
//    );
//    return (result as List)
//        .map((map) => Location.fromMap(map))
//        .toList(growable: false);
//  }
//
//  Future<dynamic> _post(String path, {
//    dynamic data,
//    Options options
//  }) async {
//    try {
//      final result = await _dio.post(
//        path,
//        data: data,
//        options: options,
//      );
//      return result.data;
//    } on DioError catch(error) {
//      if (error.response != null) {
//        throw ApiException(error.response.statusCode);
//      } else {
//        throw InternetConnectionException();
//      }
//    }
//  }
//
//  Future<dynamic> _get(String path, {
//    Map<String, dynamic> queryParameters,
//    Options options
//  }) async {
//    try {
//      final result = await _dio.get(
//        path,
//        queryParameters: queryParameters,
//        options: options,
//      );
//      return result.data;
//    } on DioError catch(error) {
//      if (error.response != null) {
//        throw ApiException(error.response.statusCode);
//      } else {
//        throw InternetConnectionException();
//      }
//    }
//  }
//
//  Future<dynamic> _patch(String path, {
//    dynamic data,
//    Options options
//  }) async {
//    final result = await _dio.patch(
//      path,
//      data: data,
//      options: options,
//    );
//    return result.data;
//  }
}