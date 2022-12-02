import 'package:pika/src/data/api/models/response/login_response.dart';
import 'package:pika/src/data/api/models/user_model.dart';

import '../api_client.dart';
import '../api_constants.dart';

class UserService {
  Future<String?> login(String username, String password) async {
    final response = await ApiClient.getDio().post(
      ApiConstants.LOGIN,
      data: {
        'username': username,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      final loginResponse = LoginResponse.fromJson(response.data);
      return loginResponse.accessToken;
    }
    return null;
  }
}
