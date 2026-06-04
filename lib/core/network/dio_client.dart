import 'package:caffchat/core/config/app_config.dart';
import 'package:caffchat/core/utils/app_logger.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';

class DioClient {
  late final Dio _dio;

  DioClient({
    required String baseUrl,
    Duration connectTimeout =
        const Duration(seconds: 30),
    Duration receiveTimeout =
        const Duration(seconds: 30),
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        headers: {
          'Content-Type':
              'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Chucker Interceptor
    if (AppConfig
        .instance
        .enableChucker) {
      _dio.interceptors.add(
        ChuckerDioInterceptor(),
      );
    }

    // Logging interceptior
    if (AppConfig
        .instance
        .enableDebugLogging) {
      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            AppLogger.debug(
              'Logger: ${options.method} ${options.uri}',
            );
            handler.next(options);
          },
          onResponse: (response, handler) {
            AppLogger.debug(
              'Logger: ${response.statusCode} ${response.requestOptions.uri}',
            );
            handler.next(response);
          },
          onError: (error, handler) {
            AppLogger.debug(
              'Logger: ${error.message} ${error.response?.statusCode} ${error.response?.requestOptions.uri}',
            );
            handler.next(error);
          },
        ),
      );
    }
  }

  Dio get dio => _dio;

  // Attach authorization token to all request
  void setAuthToken(String token) {
    _dio
            .options
            .headers['Authorization'] =
        'Bearer $token';
  }

  // Remove authorization token
  void clearAuthToken() {
    _dio.options.headers.remove(
      'Authorization',
    );
  }
}
