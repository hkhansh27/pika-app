import 'package:get/get.dart';
import 'package:pika/src/ui/home/controllers/topup_success_controller.dart';

import 'controllers/contact_controller.dart';
import 'controllers/home_controller.dart';
import 'controllers/passbook_controller.dart';
import 'controllers/transaction_controller.dart';
import 'controllers/transfer_detail_controller.dart';
import 'controllers/transfer_success_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => TransactionController());
    Get.lazyPut(() => TransferDetailController());
    Get.lazyPut(() => TransferSuccessController());
    Get.lazyPut(() => PassbookController());
    Get.lazyPut(() => TopUpSuccessController());
    Get.lazyPut(() => ContactController());
  }
}
