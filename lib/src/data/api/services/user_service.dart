import 'package:pika/src/data/api/models/response/auth/register_response.dart';
import 'package:pika/src/data/api/models/response/auth/login_response.dart';
import 'package:pika/src/data/api/models/user_model.dart';

import '../api_client.dart';
import '../api_constants.dart';

class UserService {
  Future<LoginRespone?> login(String username, String password) async {
    final response = await ApiClient.getDio().post(
      ApiConstants.LOGIN,
      data: {
        'username': username,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      return LoginRespone.fromJson(response.data);
    }
    return null;
  }

  Future<RegisterRespone> register(UserModel user) async {
    try {
      final response = await ApiClient.getDio().post(ApiConstants.REGISTER, data: {
        "username": user.username,
        "fullName": user.fullName,
        "email": user.email,
        "identityNumber": user.idCard,
        "phone": user.phone,
        "password": user.password
      });

      if (response.statusCode == 200) return RegisterRespone.fromJson(response.data);
      throw Exception('Register failed');
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> changePassword(String username, String oldPass, String newPass) async {
    try {
      final response = await ApiClient.getDio().post(ApiConstants.CHANGE_PASSWORD, data: {
        "username": username,
        "oldPassword": oldPass,
        "newPassword": newPass,
      });

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Change password failed');
      }
    } catch (e) {
      rethrow;
    }
  }
}
