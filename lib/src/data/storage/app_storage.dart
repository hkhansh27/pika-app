import 'package:get_storage/get_storage.dart';
import 'package:pika/src/data/api/models/user_model.dart';

class AppStorage {
  late GetStorage box;
  static const USER_TOKEN = "user_token";
  static const APP_USER_INFO = "app_user_info";

  init() async {
    await GetStorage.init();
    box = GetStorage();
  }

  Future<bool> isAuthenticated() async {
    return box.hasData(USER_TOKEN);
  }

  Future<void> saveUserToken(String token) async {
    await box.write(USER_TOKEN, token);
  }

  Future<void> saveUserInfo(UserModel userInfo) async {
    await box.erase();
    await box.write(APP_USER_INFO, userInfo.toJson());
  }

  Future<void> eraseData() async {
    return await box.erase();
  }

  Future<String?> getUserToken() async {
    return box.read(USER_TOKEN);
  }

  Future<UserModel?> getUserInfo() async {
    final userInfo = box.read(APP_USER_INFO);
    return userInfo != null ? UserModel.fromJson(userInfo) : null;
  }
}
