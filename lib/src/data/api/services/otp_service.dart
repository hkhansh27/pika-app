import 'package:pika/src/data/api/models/response/auth/register_response.dart';
import 'package:pika/src/data/api/models/response/auth/login_response.dart';
import 'package:pika/src/data/api/models/response/otp/send_otp_response.dart';
import 'package:pika/src/data/api/models/response/otp/verify_otp_response.dart';
import 'package:pika/src/data/api/models/user_model.dart';

import '../api_client.dart';
import '../api_constants.dart';

class OtpService {
  Future<SendOtpRespone?> sendOtp(String phone) async {
    final response = await ApiClient.getDio().post(
      ApiConstants.OTP_SEND,
      data: {
        'phone': phone,
        'channel': "sms",
      },
    );
    if (response.statusCode == 200) {
      var sendOtpResponse = SendOtpRespone.fromJson(response.data);
      if (sendOtpResponse.isValid! == true) {
        return sendOtpResponse;
      } else {
        throw Exception(sendOtpResponse.errors!);
      }
    }
    throw Exception('Send otp failed');
  }

  Future<bool> verifyOtp(String phone, String code) async {
    try {
      final response = await ApiClient.getDio().post(
        ApiConstants.OTP_VERIFY,
        data: {
          "phone": phone,
          "code": code,
        },
      );

      if (response.statusCode == 200) {
        var verifyOtpResponse = VerifyOtpRespone.fromJson(response.data);
        if (verifyOtpResponse.isValid! == true) {
          return true;
        } else {
          throw Exception(verifyOtpResponse.errors!.first);
        }
      } else {
        throw Exception('Verify otp failed');
      }
    } catch (e) {
      rethrow;
    }
  }
}
