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
    await box.write(APP_USER_INFO, userInfo);
  }

  Future<String?> getUserToken() async {
    return box.read(USER_TOKEN);
  }

  Future<UserModel?> getUserInfo() async {
    final userInfoJson = await box.read(APP_USER_INFO);
    return userInfoJson != null ? UserModel.fromJson(userInfoJson) : null;
  }
}
