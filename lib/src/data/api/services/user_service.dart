import 'package:pika/src/data/api/models/response/auth/register_response.dart';
import 'package:pika/src/data/api/models/response/auth/login_response.dart';
import 'package:pika/src/data/api/models/response/notification_response.dart';
import 'package:pika/src/data/api/models/user_model.dart';

import '../api_client.dart';
import '../api_constants.dart';
import '../models/response/check_contact_response.dart';

class UserService {
  Future<LoginRespone?> login(String username, String password, String? deviceId) async {
    try {
      final response = await ApiClient.getDio().post(
        ApiConstants.LOGIN,
        data: {
          'username': username,
          'password': password,
          'deviceId': deviceId,
        },
      );
      if (response.statusCode == 200) {
        return LoginRespone.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<RegisterRespone> register(UserModel user) async {
    try {
      final response = await ApiClient.getDio().post(ApiConstants.REGISTER, data: {
        "username": user.username,
        "fullName": user.fullName,
        "email": user.email,
        "identityNumber": user.idCard,
        "phone": user.phone,
        "password": user.password,
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

  Future<String> getBalance() async {
    try {
      final response = await ApiClient.getDio().get(ApiConstants.GET_BALANCE);
      if (response.statusCode == 200) {
        return response.data.toString();
      } else {
        throw Exception('Get balance failed');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> getNameByAccountNo(String accountNo) async {
    try {
      final response = await ApiClient.getDio().get('${ApiConstants.GET_NAME_BY_ACCOUNT_NO}/$accountNo');
      if (response.statusCode == 200) {
        return response.data.toString();
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<NotificationRespone>> getNotifications() async {
    try {
      final response = await ApiClient.getDio().get(ApiConstants.GET_NOTIFCATIONS);
      if (response.statusCode == 200) {
        return (response.data as List).map((e) => NotificationRespone.fromJson(e)).toList();
      } else {
        throw Exception('Get notifications failed');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getPassbookBalance() async {
    try {
      final response = await ApiClient.getDio().get(ApiConstants.GET_PASSBOOK_BALANCE);
      if (response.statusCode == 200) {
        return response.data.toString();
      } else {
        throw Exception('Get passbook balance failed');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deposit(String amount) async {
    try {
      final response = await ApiClient.getDio().post('${ApiConstants.DEPOSIT}/$amount');
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Deposit failed');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> withdraw(String amount) async {
    try {
      final response = await ApiClient.getDio().post('${ApiConstants.WITHDRAW}/$amount');
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Withdraw failed');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CheckContactResponse>> checkContact(List<String?> phones) async {
    try {
      final response = await ApiClient.getDio().post(ApiConstants.CHECK_CONTACT, data: {
        "phones": phones,
      });
      if (response.statusCode == 200) {
        return (response.data as List).map((e) => CheckContactResponse.fromJson(e)).toList();
      } else {
        throw Exception('Check contact failed');
      }
    } catch (e) {
      rethrow;
    }
  }
}
