import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pika/src/routes/app_pages.dart';
import '../../data/repositories/user_repository.dart';
import '../otp/otp.dart';
import '../login/login.dart';

class RegisterController extends GetxController {
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> mobileController = TextEditingController().obs;
  Rx<TextEditingController> pswdController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  RxBool isPasswordVisible = true.obs;

  final _userRepo = Get.find<UserRepository>();

  RxBool isVisible = false.obs;
  final isAgree = false.obs;

  @override
  void onInit() {
    super.onInit();
    ever<String>(email, validateEmail);
    ever<String>(password, validatePassword);
    ever<String>(username, validateUsername);
  }

  final email = ''.obs;
  final emailError = RxnString();
  final emailFocus = FocusNode();
  void validateEmail(String email) {
    String pattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (email.isEmpty || !regex.hasMatch(email)) {
      emailError.value = 'Enter a valid email address';
    } else {
      emailError.value = null;
    }
  }

  final username = ''.obs;
  final usernameError = RxnString();
  final usernameFocus = FocusNode();
  void validateUsername(String username) {
    if (username.isEmpty) {
      usernameError.value = 'Enter a valid username';
    } else {
      usernameError.value = null;
    }
  }

  final password = ''.obs;
  final passwordError = RxnString();
  final passwordFocus = FocusNode();
  void validatePassword(String password) {
    if (password.isEmpty) {
      passwordError.value = 'Please enter a password!';
    } else if (password.length < 3) {
      passwordError.value = 'Password must be at least 3 characters';
    } else {
      passwordError.value = null;
    }
  }

  void passwordVisible() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  bool get enableButton =>
      username.isNotEmpty &&
      password.isNotEmpty &&
      email.isNotEmpty &&
      usernameError.value == null &&
      passwordError.value == null &&
      emailError.value == null &&
      isAgree.value;

  void onAgree() {
    isAgree.value = !isAgree.value;
  }

  Future<void> doRegister() async {
    try {
      EasyLoading.show(status: 'Registering...');
      await _userRepo.register(
        nameController.value.text,
        pswdController.value.text,
        emailController.value.text,
      );
      EasyLoading.dismiss();
      goToHomePage();
    } catch (e) {
      Get.snackbar(
        "Error!",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      EasyLoading.dismiss();
    }
  }

  void goToOtpPage() {
    Get.to(
      () => OtpScreen(),
      binding: OtpBinding(),
      arguments: {
        "phone": mobileController.value.text,
        "nextRoute": "FingerprintScreen",
      },
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 500),
    );
  }

  void goToLoginPage() {
    Get.to(
      () => LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 500),
    );
  }

  void goToHomePage() {
    Get.offAllNamed(AppRoutes.HOME);
  }
}
