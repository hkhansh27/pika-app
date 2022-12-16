import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../data/repositories/transaction_repository.dart';
import '../../../routes/app_pages.dart';

class TransferSuccessController extends GetxController with StateMixin {
  var data = Get.arguments;
  var transactionRepo = Get.find<TransactionRepository>();

  @override
  void onInit() {
    super.onInit();
    transfer();
  }

  Future<void> transfer() async {
    change(null, status: RxStatus.loading());
    try {
      var amount = data['amount'];
      var description = data['description'];
      var accountNo = data['accountNo'];
      var response = await transactionRepo.transfer(amount, description, accountNo);
      change(response, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(data));
    }
  }

  addContact(String accNo) async {
    EasyLoading.show(status: 'Adding...');
    await transactionRepo.addContact(accNo).then((value) {
      EasyLoading.dismiss();
      if (value) {
        EasyLoading.showSuccess('Added');
      } else {
        EasyLoading.showError('Failed');
      }
    });
    EasyLoading.dismiss();
    Get.offAllNamed(AppRoutes.HOME);
  }
}
