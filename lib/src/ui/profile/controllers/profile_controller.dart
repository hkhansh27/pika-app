import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../data/api/models/user_model.dart';
import '../../../data/repositories/user_repository.dart';
import '../edit_profile_screen.dart';

class ProfileController extends GetxController {
  RxBool darkMode = false.obs;
  RxBool alert = true.obs;
  RxBool expense = true.obs;
  RxBool utilize = false.obs;
  RxBool balance = true.obs;
  RxBool paid = false.obs;
  RxBool spending = true.obs;
  RxBool isPasswordVisible = true.obs;

  final Rx<UserModel?> userModel = UserModel().obs;

  final _userRepo = Get.find<UserRepository>();

  get validPassword => passwordError.value == null && password.value.isNotEmpty;

  @override
  void refresh() {
    super.refresh();
    refreshData();
  }

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
    ever<String>(password, validatePassword);
  }

  Future<void> getUserInfo() async {
    userModel.value = await _userRepo.getUserInfo();
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

  Future<void> changePassword() async {
    try {
      if (validPassword) {
        EasyLoading.show(status: 'Changing...');
        bool isSuccess = await _userRepo.changePassword(password.value);
        EasyLoading.dismiss();
        if (isSuccess) {
          Get.back();
          Get.snackbar(
            "Success!",
            "Password changed successfully",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          update();
        }
      }
    } catch (e) {
      Get.snackbar(
        "Error!",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void refreshData() {
    getUserInfo();
    isPasswordVisible.value = true;
  }

  void goToEditProfile() {
    Get.to(
      EditProfileScreen(),
      transition: Transition.downToUp,
      duration: const Duration(milliseconds: 500),
    );
  }

  void backScreen() {
    Get.back();
    update();
  }
}
