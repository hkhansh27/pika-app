import 'package:pika/src/app.dart';
import 'package:pika/src/res/images.dart';
import 'package:pika/src/res/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pika/src/ui/login/fingerprint_screen.dart';
import 'package:pika/src/ui/otp/otp_screen.dart';
import 'package:pika/src/ui/profile/notification_screen.dart';
import 'package:pika/src/ui/profile/controllers/profile_controller.dart';
import 'package:pika/src/ui/profile/widget/custom_row.dart';
import 'package:pika/src/ui/profile/widget/notification_view.dart';
import 'package:pika/src/ui/profile/widget/social_view.dart';
import 'package:pika/src/ui/splash/splash.dart';

import '../../routes/app_pages.dart';

class SettingScreen extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: AppTheme.isLightTheme == false
          ? HexColor('#15141f')
          : HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Theme.of(context).textTheme.headline6!.color,
                    ),
                  ),
                  Text(
                    "Settings",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  const Icon(
                    Icons.arrow_back,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32),
                      Text(
                        "General",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xffA2A0A8),
                            ),
                      ),
                      const SizedBox(height: 16),
                      notificationView(
                        context,
                        "Dark Mode",
                        CupertinoSwitch(
                          value: controller.darkMode.value,
                          activeColor: HexColor(AppTheme.primaryColorString!),
                          onChanged: (v) {
                            // setState(() {
                            //   profileController.darkMode.value = v;
                            //   if (v == true) {
                            //     changeColor(dark);
                            //   } else {
                            //     changeColor(light);
                            //   }
                            // });
                          },
                        ),
                      ),
                      const SizedBox(height: 22),
                      customRow(
                        context,
                        "Reset Password",
                      ),
                      const SizedBox(height: 32),
                      //finger print switch button
                      notificationView(
                        context,
                        "Allow Touch ID",
                        Obx(
                          () => CupertinoSwitch(
                            value: controller.allowFingerprint.value,
                            activeColor: HexColor(AppTheme.primaryColorString!),
                            onChanged: (v) {
                              controller.handleAllowFingerprint(v);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      InkWell(
                        onTap: () {
                          Get.to(
                            const NotificationScreen(),
                            transition: Transition.downToUp,
                            duration: const Duration(milliseconds: 500),
                          );
                        },
                        child: customRow(
                          context,
                          "Notifications",
                        ),
                      ),
                      const SizedBox(height: 32),
                      customRow(
                        context,
                        "Privacy Settings",
                      ),
                      const SizedBox(height: 32),
                      customRow(
                        context,
                        "Help Center",
                      ),
                      const SizedBox(height: 32),
                      customRow(
                        context,
                        "Contact Us",
                      ),
                      const SizedBox(height: 32),
                      InkWell(
                        onTap: controller.logout,
                        child: customRow(
                          context,
                          "Log out",
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        "Follow Us",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xffA2A0A8),
                            ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          socialView(
                            AppTheme.isLightTheme == false ? DefaultImages.twitterdark : DefaultImages.twitter,
                          ),
                          socialView(
                            AppTheme.isLightTheme == false ? DefaultImages.facebookDark : DefaultImages.facebook,
                          ),
                          socialView(
                            AppTheme.isLightTheme == false ? DefaultImages.tiktokDark : DefaultImages.tikTok,
                          ),
                          socialView(
                            AppTheme.isLightTheme == false ? DefaultImages.instagramDark : DefaultImages.instagram,
                          )
                        ],
                      ),
                      Center(
                        child: Text(
                          "Pika © 2021 v1.0",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff9EA3AE),
                              ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
