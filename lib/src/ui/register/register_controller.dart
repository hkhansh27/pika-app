import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../otp/otp.dart';
import '../login/login.dart';

class RegisterController extends GetxController {
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> mobileController = TextEditingController().obs;
  Rx<TextEditingController> pswdController = TextEditingController().obs;
  RxBool isVisible = false.obs;

  final phoneController = TextEditingController().obs;
  final isAgree = false.obs;

  void onAgree() {
    isAgree.value = !isAgree.value;
  }

  void goToOtpPage() {
    Get.to(
      () => OtpPage(),
      binding: OtpBinding(),
      arguments: phoneController.value.text,
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 500),
    );
  }

  void goToLoginPage() {
    Get.to(
      () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 500),
    );
  }
}
