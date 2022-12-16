import 'package:get_storage/get_storage.dart';
import 'package:pika/src/data/api/models/user_model.dart';

class AppStorage {
  late GetStorage box;
  static const USER_TOKEN = "user_token";
  static const APP_USER_INFO = "app_user_info";
  static const FINGER_AUTH = "finger";
  static const FCM_TOKEN = "fcm_token";

  init() async {
    await GetStorage.init();
    box = GetStorage();
  }

  Future<bool> isAuthenticated() async {
    if (await getUserInfo() != null) return true;
    return false;
  }

  Future<void> authenticateFinger(bool isAuthenticate) async {
    await box.write(FINGER_AUTH, isAuthenticate);
  }

  Future<bool> isFingerAuthenticated() async {
    return box.read(FINGER_AUTH) ?? false;
  }

  Future<void> saveFcmToken(String? token) async {
    await box.write(FCM_TOKEN, token);
  }

  Future<String?> getFcmToken() async {
    return box.read(FCM_TOKEN);
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
