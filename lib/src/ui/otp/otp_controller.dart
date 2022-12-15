import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pika/src/data/api/models/user_model.dart';
import 'package:pika/src/data/api/services/otp_service.dart';
import 'package:pika/src/data/repositories/user_repository.dart';
import 'package:pika/src/routes/app_pages.dart';
import 'package:pika/src/ui/ekyc/ekyc_page.dart';
import 'package:pika/src/ui/home/home.dart';
import 'package:pika/src/ui/login/verify_screen.dart';
import 'package:pika/src/ui/tab_screen.dart';

class OtpController extends GetxController {
  var args = Get.arguments;
  final isVerified = false.obs;
  final _userRepo = Get.find<UserRepository>();
  final _otpService = Get.find<OtpService>();

  @override
  void onInit() {
    super.onInit();
    sendOtp();
  }

  String validPhone() {
    var phone = args['phone'];

    if (phone.startsWith('0')) {
      phone = '+84' + phone.substring(1);
    }
    return phone;
  }

  void sendOtp() async {
    try {
      var response = await _otpService.sendOtp(validPhone());
      if (response!.isValid == true) {
        Get.snackbar(
          'Success',
          'OTP sent',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> verifyOtp(String value) async {
    try {
      var isSuccess = await _otpService.verifyOtp(validPhone(), value);
      if (isSuccess) {
        isVerified.value = true;
        if (args['nextRoute'] == AppRoutes.EKYC) {
          _userRepo.saveUserInfo(
            UserModel(phone: args['phone']),
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> next() async {
    if (args['nextRoute'] == AppRoutes.EKYC) {
      Get.offAllNamed(AppRoutes.EKYC);
    } else {
      Get.toNamed(args['nextRoute']);
    }
  }
}
