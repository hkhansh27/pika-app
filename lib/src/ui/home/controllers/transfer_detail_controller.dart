import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../data/api/models/user_model.dart';
import '../../../data/repositories/transaction_repository.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../routes/app_pages.dart';
import '../../otp/otp.dart';
import '../transfer_sucess_screen.dart';

class TransferDetailController extends GetxController {
  final amountController = TextEditingController().obs;
  final descriptionController = TextEditingController().obs;
  var _transactionRepo = Get.find<TransactionRepository>();
  var _userRepo = Get.find<UserRepository>();
  var balance = ''.obs;
  final Rx<UserModel?> userModel = UserModel().obs;

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    userModel.value = await _userRepo.getUserInfo();
    balance.value = await _userRepo.getBalance();
  }

  goToOtpScreen(String accountNo, String accountName) {
    // check amount not empty
    if (amountController.value.text.isEmpty) {
      EasyLoading.showError('Amount is required');
      return;
    }

    // if amout > balance
    if (int.parse(amountController.value.text) > int.parse(balance.value.replaceAll(',', ''))) {
      EasyLoading.showError('Balance is not enough');
      return;
    }

    // check description not empty
    if (descriptionController.value.text.isEmpty) {
      EasyLoading.showError('Description is required');
      return;
    }
    Get.to(
      () => OtpScreen(),
      binding: OtpBinding(),
      arguments: {
        "phone": userModel.value!.phone,
        "nextRoute": AppRoutes.TRANSFER_SUCCESS,
        "data": {
          "amount": amountController.value.text,
          "description": descriptionController.value.text,
          "accountNo": accountNo,
          "accountName": accountName,
        },
      },
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 500),
    );
  }
}
