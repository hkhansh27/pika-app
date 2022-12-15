import 'dart:developer';

import 'package:get/get.dart';
import 'package:pika/src/data/api/models/user_model.dart';

import '../api/services/user_service.dart';
import '../storage/app_storage.dart';

class UserRepository {
  final _userService = Get.find<UserService>();
  final storage = Get.find<AppStorage>();

  Future<bool> login(String username, String password) async {
    var response = await _userService.login(username, password);
    if (response == null) return false;

    //map data to user model
    UserModel userModel = UserModel();
    userModel.id = response.account!.id;
    userModel.accountNo = response.account!.accountNo;
    userModel.username = response.account!.username;
    userModel.password = password;
    userModel.email = response.account!.email;
    userModel.fullName = response.account!.fullName;
    userModel.idCard = response.account!.identityNumber;
    userModel.phone = response.account!.phone;
    userModel.token = response.accessToken;

    //store user info to local storage
    await storage.saveUserInfo(userModel);
    return true;
  }

  Future<void> toggleFingerAuthen() async {
    var isFingerAuthen = await storage.isFingerAuthenticated();
    await storage.authenticateFinger(!isFingerAuthen);
  }

  Future<bool> isFingerAuthenticated() async {
    return await storage.isFingerAuthenticated();
  }

  Future<bool> isAuthenticated() async {
    return await storage.isAuthenticated();
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

  Future<void> register(String username, String password, String email) async {
    try {
      var userInfo = await storage.getUserInfo();
      userInfo!.username = username;
      userInfo.password = password;
      userInfo.email = email;

      //mock data
      // userInfo!.username = 'hkhansh27';
      // userInfo.password = 'Khanh@123';
      // userInfo.email = 'khanh201011@gmail.com';

      var user = await _userService.register(userInfo);

      if (user != null) {
        //map register response to user info
        userInfo.id = user.account!.id;
        userInfo.accountNo = user.account!.accountNo;
        userInfo.token = user.token;

        //store user info to local storage
        await storage.saveUserInfo(userInfo);
      } else {
        throw Exception('Register failed');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> changePassword(String newPassword) async {
    try {
      var userInfo = await storage.getUserInfo();
      var isSuccess = await _userService.changePassword(
        userInfo!.username!,
        userInfo.password!,
        newPassword,
      );
      if (isSuccess == false) {
        throw Exception('Change password failed');
      }
      userInfo.password = newPassword;
      await storage.saveUserInfo(userInfo);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    await storage.eraseData();
  }

  void setAllowFingerprint(bool value) {}
}
