import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:pika/src/ui/profile/profile_binding.dart';
import 'package:pika/src/ui/profile/setting_screen.dart';
import 'package:pika/src/ui/proof/proof_binding.dart';
import 'package:pika/src/ui/proof/verify_phone_screen.dart';

import '../../../data/repositories/user_repository.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  var nextRoute = Get.arguments;
  Rx<TextEditingController> mobileController = TextEditingController().obs;
  Rx<TextEditingController> pswdController = TextEditingController().obs;
  RxBool isVisible = false.obs;

  final usernameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final isPasswordVisible = false.obs;
  final _userRepo = Get.find<UserRepository>();

  Future<bool> authenticateBiometric() async {
    bool isAuthenticated = false;

    try {
      await handleTransitionLoginScreen();

      final LocalAuthentication _localAuthentication = LocalAuthentication();
      bool isBiometricSupported = await _localAuthentication.isDeviceSupported();

      if (isBiometricSupported) {
        isAuthenticated = await _localAuthentication.authenticate(
          localizedReason: 'Authenticate to access the app con cho',
          authMessages: const <AuthMessages>[
            AndroidAuthMessages(
              biometricNotRecognized: 'Biometric not recognized',
              cancelButton: 'No thanks',
            ),
            IOSAuthMessages(
              cancelButton: 'No thanks',
            ),
          ],
          options: const AuthenticationOptions(
            biometricOnly: true,
            stickyAuth: true,
          ),
        );
      }
    } on Exception catch (e) {
      Get.snackbar(
        backgroundColor: Colors.red,
        colorText: Colors.white,
        'Login failed',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return isAuthenticated;
  }

  void handleNextRoute() async {
    final isAuthenticated = await authenticateBiometric();

    if (isAuthenticated) {
      switch (Get.previousRoute) {
        case AppRoutes.SETTING:
          await _userRepo.toggleFingerAuthen();
          Get.back(result: {'isFingerAuthenticated': true});
          break;
        // case AppRoutes.OTP:
        // await _userRepo.toggleFingerAuthen();
        //   Get.snackbar(
        //     backgroundColor: Colors.green,
        //     colorText: Colors.white,
        //     "Fingerprint successfully",
        //     "Fingerprint has been successfully authenticated",
        //   );
        //   Get.off(
        //     () => SettingScreen(),
        //     binding: ProfileBinding(),
        //     transition: Transition.rightToLeft,
        //     duration: const Duration(milliseconds: 500),
        //     arguments: {'isFingerAuthenticated': true},
        //   );
        //   break;
        default:
          Get.offAllNamed(AppRoutes.HOME);
      }
    }
  }

  void goToVerifyPhoneScreen() {
    Get.to(
      () => VerifyPhoneScreen(),
      binding: ProofBinding(),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 500),
    );
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> handleTransitionLoginScreen() async {
    if (Get.currentRoute == AppRoutes.LOGIN) {
      final isFingerAuthenticated = await _userRepo.isFingerAuthenticated();
      if (!isFingerAuthenticated) {
        throw Exception('Fingerprint is not set');
      }
    }
  }

  Future<void> login() async {
    final username = usernameController.value.text;
    final password = passwordController.value.text;
    final isLoginSuccess = await _userRepo.login(username, password);
    if (isLoginSuccess) {
      Get.offAllNamed(AppRoutes.HOME);
    } else {
      Get.snackbar(
        'Login failed',
        'Username or password is incorrect',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
