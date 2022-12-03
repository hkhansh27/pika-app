import 'package:get/get.dart';
import 'package:pika/src/data/api/models/user_model.dart';

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

  Future<UserModel?> getUserInfo() async {
    return await storage.getUserInfo();
  }

  Future<void> saveUserInfo(UserModel userModel) async {
    await storage.saveUserInfo(userModel);
  }

  Future<void> updateUserInfo(UserModel userModel) async {
    var userInfo = await storage.getUserInfo();
    userInfo!.idCard = userModel.idCard;
    userInfo.fullName = userModel.fullName;
    userInfo.address = userModel.address;
    userInfo.birthDay = userModel.birthDay;
    userInfo.city = userModel.city;
    userInfo.issueDate = userModel.issueDate;
    await storage.saveUserInfo(userInfo);
  }
}
