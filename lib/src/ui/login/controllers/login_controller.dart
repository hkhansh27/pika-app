import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user_repository.dart';
import '../../register/register.dart';

class LoginController extends GetxController {
  //login
  Rx<TextEditingController> mobileController = TextEditingController().obs;
  Rx<TextEditingController> pswdController = TextEditingController().obs;
  RxBool isVisible = false.obs;

  final usernameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final isPasswordVisible = false.obs;
  final _userRepo = Get.find<UserRepository>();

  void goToRegisterPage() {
    Get.to(
      () => RegisterPage(),
      binding: RegisterBinding(),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 500),
    );
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> login() async {
    final username = usernameController.value.text;
    final password = passwordController.value.text;
    final isLoginSuccess = await _userRepo.login(username, password);
    if (isLoginSuccess) {
      Get.back();
    } else {
      Get.snackbar(
        'Login failed',
        'Username or password is incorrect',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
