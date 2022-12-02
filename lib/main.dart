import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/controllers/app_controller.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.put<AppController>(AppController()).init();
  runApp(MyApp());
}
