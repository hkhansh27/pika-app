import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'exceptions/errors.dart';

class EkycApiClient {
  static const TIMEOUT = 60000;
  static const ENABLE_LOG = true;
  static const ACCESS_TOKEN_HEADER = 'Authorization';
  static const TOKEN_ID = 'Token-id';
  static const TOKEN_KEY = 'Token-key';

  // singleton
  static final EkycApiClient instance = EkycApiClient._internal();

  factory EkycApiClient() {
    return instance;
  }

  EkycApiClient._internal();

  late String baseUrl;
  late Map<String, dynamic> headers;

  void init(String baseUrl, String accessToken, String tokenId, String tokenKey) {
    this.baseUrl = baseUrl;
    headers = {
      'Content-Type': 'application/json',
    };

    setToken(accessToken, tokenId, tokenKey);
  }

  void setToken(String token, String tokenId, String tokenKey) {
    headers[ACCESS_TOKEN_HEADER] = "Bearer $token";
    headers[TOKEN_ID] = tokenId;
    headers[TOKEN_KEY] = tokenKey;
  }

  void clearToken() {
    headers.remove(ACCESS_TOKEN_HEADER);
  }

  static Dio getDio() {
    var dio = Dio(instance.getBaseOptions());
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
