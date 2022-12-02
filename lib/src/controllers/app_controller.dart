import 'package:get/get.dart';
import 'package:pika/src/data/api/api_client.dart';
import 'package:pika/src/data/api/api_constants.dart';
import 'package:pika/src/data/api/ekyc_api_client.dart';
import 'package:pika/src/data/api/services/ekyc_service.dart';
import 'package:pika/src/data/repositories/ekyc_repository.dart';

import '../data/api/models/user_model.dart';
import '../data/api/services/user_service.dart';
import '../data/repositories/user_repository.dart';
import '../data/storage/app_storage.dart';

class AppController extends GetxController {
  Rx<bool> isAuthenticated = false.obs;
  UserModel? user;

  init() async {
    await initStorage();
    final storage = Get.find<AppStorage>();
    setupLocator();
    await initAuth(storage);
  }

  Future<void> initAuth(AppStorage storage) async {
    isAuthenticated.value = await storage.isAuthenticated();
    user = await storage.getUserInfo();
    String? token = await storage.getUserToken();
    await initApi(token);
  }

  initApi(String? accessToken) async {
    ApiClient.instance.init(ApiConstants.BASE_URL, accessToken);
    EkycApiClient.instance.init(
      ApiConstants.EKYC_URL,
      ApiConstants.EKYC_ACCESSTOKEN,
      ApiConstants.EKYC_TOKENID,
      ApiConstants.EKYC_TOKENKEY,
    );
  }

  initStorage() async {
    await Get.put(AppStorage()).init();
  }

  setupLocator() {
    // services
    Get.put(UserService());
    Get.put(EkycService());

    // repositories
    Get.put(UserRepository());
    Get.put(EkycRepository());
  }
}
