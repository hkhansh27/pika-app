import 'package:get/get.dart';
import 'package:pika/src/ui/proof/controllers/proof_controller.dart';

class ProofBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProofController>(ProofController());
  }
}
