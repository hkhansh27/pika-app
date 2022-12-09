import 'dart:math';

import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'exceptions/errors.dart';

class ApiClient {
  static const TIMEOUT = 60000;
  static const ENABLE_LOG = true;
  static const ACCESS_TOKEN_HEADER = 'Authorization';

  // singleton
  static final ApiClient instance = ApiClient._internal();

  factory ApiClient() {
    return instance;
  }

  ApiClient._internal();

  late String baseUrl;
  late Map<String, dynamic> headers;

  void init(String baseUrl, String? accessToken) {
    this.baseUrl = baseUrl;
    headers = {
      'Content-Type': 'application/json',
    };
    if (accessToken != null) setToken(accessToken);
  }

  void setToken(String token) {
    headers[ACCESS_TOKEN_HEADER] = "Bearer $token";
  }

  void clearToken() {
    headers.remove(ACCESS_TOKEN_HEADER);
  }

  static Dio getDio() {
    var dio = Dio(instance.getBaseOptions());
    //error handling
    dio.interceptors.add(AppInterceptors(dio));
    //log
    dio.interceptors.add(LogInterceptor(
      request: ENABLE_LOG,
      requestBody: ENABLE_LOG,
      responseBody: ENABLE_LOG,
      responseHeader: ENABLE_LOG,
      error: ENABLE_LOG,
      requestHeader: ENABLE_LOG,
    ));
    return dio;
  }

  BaseOptions getBaseOptions() {
    return BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: TIMEOUT,
      receiveTimeout: TIMEOUT,
      headers: headers,
    );
  }
}
