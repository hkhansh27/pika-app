import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pika/src/res/images.dart';
import 'package:pika/src/res/textstyle.dart';
import 'package:pika/src/ui/profile/chat_screen.dart';
import 'package:pika/src/ui/profile/controllers/profile_controller.dart';
import 'package:pika/src/ui/profile/edit_profile_screen.dart';
import 'package:pika/src/ui/profile/setting_screen.dart';
import 'package:pika/src/ui/profile/widget/income_container.dart';

import '../profile/widget/notification_view.dart';
import 'controllers/passbook_controller.dart';
import 'home.dart';
import 'widgets/circle_card.dart';

class PikaSavingScreen extends GetView<PassbookController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
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
                        "Pika saving",
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
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    SizedBox(
                                      height: 70,
                                      width: 70,
                                      child: Image.asset(
                                        DefaultImages.avatar,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 28,
                                      width: 28,
                                      child: SvgPicture.asset(
                                        DefaultImages.camera,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 23),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.userModel.value?.fullName ?? 'Error',
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      height: 28,
                                      width: 116,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF6A609).withOpacity(0.10),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Member Gold ",
                                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                                  color: const Color(0xffF6A609),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          SvgPicture.asset(
                                            DefaultImages.ranking,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                            Text(
                              "Overview",
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Obx(
                              () => incomeContainer(
                                context,
                                "Principal",
                                '${controller.passbookBalance.value} VND',
                                DefaultImages.income,
                              ),
                            ),
                            const SizedBox(height: 15),
                            incomeContainer(
                              context,
                              "Interest",
                              "0 VND",
                              DefaultImages.outcome,
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    Get.to(
                                      TopUpSCreen(action: 'deposit'),
                                      transition: Transition.downToUp,
                                      duration: const Duration(milliseconds: 500),
                                    );
                                  },
                                  child: circleCard(
                                    image: DefaultImages.topup,
                                    title: "Top-up",
                                  ),
                                ),
                                InkWell(
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    Get.to(
                                      TopUpSCreen(action: 'withdraw'),
                                      transition: Transition.downToUp,
                                      duration: const Duration(milliseconds: 500),
                                    );
                                  },
                                  child: circleCard(
                                    image: DefaultImages.withdraw,
                                    title: "Withdraw",
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            InkWell(
                              onTap: () {
                                Get.to(
                                  const ChatScreen(),
                                  transition: Transition.downToUp,
                                  duration: const Duration(milliseconds: 500),
                                );
                              },
                              child: SizedBox(
                                height: 80,
                                width: Get.width,
                                child: SvgPicture.asset(
                                  AppTheme.isLightTheme == false ? DefaultImages.chatcsDark : DefaultImages.chatDialog,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(left: 16, right: 16),
                              child: Text(
                                "You joined Finpay on September 2021. It’s been 1 month since then and our mission is still the same, help you better manage your finance.",
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      height: 1.8,
                                      color: const Color(0xffA2A0A8),
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      onLoading: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
