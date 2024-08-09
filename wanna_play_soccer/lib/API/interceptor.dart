import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:wanna_play_soccer/API/Auth/rest_refresh.dart';
import 'package:wanna_play_soccer/env.dart';

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

    final refreshToken = await storage.read(key: 'REFRESH_TOKEN');

    if (refreshToken == null) {
      return handler.reject(err);
    }

    final is401 = err.response?.statusCode == 401;
    final isRefreshRequest = err.requestOptions.path == 'refresh api';

    // accessToken 재발급
    if (is401 && !isRefreshRequest) {
      try {
        final newToken = await _refreshToken();
        final response = await _retryRequest(err.requestOptions, newToken);

        return handler.resolve(response);
      } catch (e) {
        return handler.reject(err);
      }
    }
    return handler.reject(err);
  }

  Future<String> _refreshToken() async {
    final refreshToken = await storage.read(key: 'REFRESH_TOKEN');

    if (refreshToken == null) {
      throw Exception('Refresh token does not exist');
    }

    final response = await _refreshApi.refreshToken('Bearer $refreshToken');
    final newToken = response.data['accessToken'];

    await storage.write(key: 'ACCESS_TOKEN', value: newToken);

    return newToken;
  }

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
