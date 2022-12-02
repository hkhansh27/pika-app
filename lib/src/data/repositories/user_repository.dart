import 'package:get/get.dart';

import '../api/services/user_service.dart';
import '../storage/app_storage.dart';

class UserRepository {
  final _userService = Get.find<UserService>();
  final storage = Get.find<AppStorage>();

  Future<bool> login(String username, String password) async {
    var token = await _userService.login(username, password);
    if (token != null) {
      await storage.saveUserToken(token);
    }
    return token != null;
  }
}
