import 'dart:core';

class BaseResponse<T> {
  int? statusCode;
  T? data;
  String? message;

  BaseResponse.fromJson(Map<String, dynamic> json, {T Function(dynamic json)? parseJson}) {
    statusCode = json["statusCode"]!;
    data = json['data'] != null ? parseJson?.call(json['data']) : null;
    message = json['message'] ?? "An error has occurred!";
  }

  BaseResponse.initError(int code, String mess) {
    statusCode = code;
    message = mess;
    data = null;
  }
}
