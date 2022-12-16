import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pika/src/data/repositories/user_repository.dart';

import '../../../data/repositories/transaction_repository.dart';
import '../../../routes/app_pages.dart';

class TopUpSuccessController extends GetxController with StateMixin {
  var data = Get.arguments;
  var userRepo = Get.find<UserRepository>();

  @override
  void onInit() {
    super.onInit();
    transfer();
  }

  Future<void> transfer() async {
    change(null, status: RxStatus.loading());
    try {
      var amount = data['amount'];

      bool response = false;

      if (data['action'] == 'withdraw') {
        response = await userRepo.withdraw(amount);
      } else if (data['action'] == 'deposit') {
        response = await userRepo.deposit(amount);
      }

      if (response) {
        change(response, status: RxStatus.success());
      }

      change(null, status: RxStatus.error(data));
    } catch (e) {
      change(null, status: RxStatus.error(data));
    }
  }
}
