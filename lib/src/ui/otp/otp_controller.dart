import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pika/src/routes/app_pages.dart';
import 'package:pika/src/ui/ekyc/ekyc_page.dart';
import 'package:pika/src/ui/home/home.dart';
import 'package:pika/src/ui/login/verify_screen.dart';
import 'package:pika/src/ui/tab_screen.dart';

class OtpController extends GetxController {
  var phone = Get.arguments;
  final generatedOtp = '1111';
  final isVerified = false.obs;

  void verifyOtp(String value) {
    if (value == generatedOtp) {
      isVerified.value = true;
    } else {
      Get.snackbar(
        'Error',
        'Invalid OTP',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void next() {
    Get.offAllNamed(AppRoutes.EKYC);
  }
}
