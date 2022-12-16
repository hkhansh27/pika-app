import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pika/src/routes/app_pages.dart';

import '../../../data/api/models/user_model.dart';
import '../../../data/repositories/user_repository.dart';
import '../../otp/otp_binding.dart';
import '../../otp/otp_screen.dart';

class PassbookController extends GetxController with StateMixin {
  final Rx<UserModel?> userModel = UserModel().obs;
  final _userRepo = Get.find<UserRepository>();
  final passbookBalance = "".obs;
  final balance = "".obs;
  Rx<TextEditingController> amountController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    change(null, status: RxStatus.loading());
    userModel.value = await _userRepo.getUserInfo();
    passbookBalance.value = await _userRepo.getPassbookBalance();
    balance.value = await _userRepo.getBalance();
    change(null, status: RxStatus.success());
  }

  void goToOtpScreen(String action) {
    // check amount not empty
    if (amountController.value.text.isEmpty) {
      Get.snackbar("Error", "Amount is required");
      return;
    }

    // if amout > balance
    if (int.parse(amountController.value.text) > int.parse(balance.value.replaceAll(',', ''))) {
      Get.snackbar("Error", "Balance is not enough");
      return;
    }

    Get.to(
      () => OtpScreen(),
      binding: OtpBinding(),
      arguments: {
        "phone": userModel.value!.phone,
        "nextRoute": AppRoutes.TOPUP_SUCCESS,
        "data": {
          "amount": amountController.value.text,
          "action": action,
        },
      },
    );
  }
}
