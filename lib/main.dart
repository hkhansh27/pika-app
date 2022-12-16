import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/controllers/app_controller.dart';
import 'src/app.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await Get.put<AppController>(AppController()).init();
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}
