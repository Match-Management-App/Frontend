import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:wanna_play_soccer/API/Auth/rest_refresh.dart';
import 'package:wanna_play_soccer/Utils/env.dart';
import 'package:wanna_play_soccer/Utils/navigation_service.dart';

class CustomInterceptor extends dio.Interceptor {
  // local storage
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  late final dio.Dio _refreshDio = dio.Dio();
  late final RestRefresh _refreshApi =
      RestRefresh(_refreshDio, baseUrl: Env.baseUrl);

  @override
  void onRequest(
      dio.RequestOptions options, dio.RequestInterceptorHandler handler) async {
    debugPrint('[REQ] [${options.method}] => ${options.uri}');

    debugPrint('[REQ_HEADER] ${options.headers}');
    debugPrint('[REQ_DATA] ${options.data}');

    if (options.headers['accessToken'] == 'true') {
      options.headers.remove('accessToken');

      // 토큰 삽입
      final token = await storage.read(key: 'ACCESS_TOKEN');
      options.headers.addAll({'authorization': 'Bearer $token'});
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(
      dio.Response response, dio.ResponseInterceptorHandler handler) {
    debugPrint(
      '[RES] [${response.statusCode}] [${response.requestOptions.method}] ${response.statusCode} ${response.requestOptions.uri}',
    );

    super.onResponse(response, handler);
  }

  @override
  void onError(
      dio.DioException err, dio.ErrorInterceptorHandler handler) async {
    debugPrint(
      '[ERR] [${err.response?.statusCode}] [${err.requestOptions.method}] => ${err.requestOptions.uri}',
    );
    debugPrint('[ERR] ${err.response?.data}');

    final is401 = err.response?.statusCode == 401;
    final is403 = err.response?.statusCode == 403;

    if (is401) {
      // 토큰 삭제
      await storage.delete(key: 'ACCESS_TOKEN');
      // login page로 이동
      NavigationService.navigateToLogin();
    }

    if (is403) {
      // TODO : reissue api로 토큰 보내기 > 기존 토큰 그대로 body에 넣어서 보내면 됨
      // 여기서 받은 토큰으로 다시 요청 보내기
      // 여기서도 403 뜨면 재로그인 해야함
      // 아마 retry도 고쳐야 할 듯
    }

    return handler.reject(err);
  }

  // Future<String> _refreshToken() async {
  //   final refreshToken = await storage.read(key: 'REFRESH_TOKEN');

  //   if (refreshToken == null) {
  //     throw Exception('Refresh token does not exist');
  //   }

  //   final response = await _refreshApi.refreshToken('Bearer $refreshToken');
  //   final newToken = response.data['accessToken'];

  //   await storage.write(key: 'ACCESS_TOKEN', value: newToken);

  //   return newToken;
  // }

  Future<dio.Response<dynamic>> _retryRequest(
      dio.RequestOptions requestOptions, String token) async {
    final options = dio.Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        'authorization': 'Bearer $token',
      },
    );

    return _refreshDio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
