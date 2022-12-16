import 'package:get/get.dart';
import 'package:pika/src/data/api/models/response/notification_response.dart';
import 'package:pika/src/data/repositories/user_repository.dart';

class NotificationsController extends GetxController {
  final notifications = <NotificationRespone>[].obs;
  final _userRepo = Get.find<UserRepository>();

  @override
  void onInit() {
    super.onInit();
    getNotifications();
  }

  getNotifications() async {
    try {
      var notifications = await _userRepo.getNotifications();
      this.notifications.value = notifications;
    } catch (e) {
      rethrow;
    }
  }
}
