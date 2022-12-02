import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';
import 'controllers/app_controller.dart';

class MyApp extends GetWidget<AppController> {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Obx(
        () => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          initialRoute: _getRoute(),
          getPages: AppPages.pages,
          defaultTransition: Transition.fadeIn,
        ),
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
