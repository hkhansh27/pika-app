import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';
import 'controllers/app_controller.dart';

class MyApp extends GetWidget<AppController> {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        initialRoute: AppRoutes.SPLASH,
        getPages: AppPages.pages,
        defaultTransition: Transition.fadeIn,
        builder: EasyLoading.init(),
      ),
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }

  String _getRoute() {
    if (controller.isAuthenticated.value) {
      return AppRoutes.HOME;
    } else {
      return AppRoutes.SPLASH;
    }
  }
}
