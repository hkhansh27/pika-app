import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pika/src/res/images.dart';
import 'package:pika/src/res/textstyle.dart';

import '../home/widgets/transaction_list.dart';
import 'notifications_controller.dart';
import 'notifications_list.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({Key? key}) : super(key: key);

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
                      // Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Theme.of(context).textTheme.headline6!.color,
                    ),
                  ),
                  Text(
                    "Notifications",
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
            Obx(
              () => Expanded(
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 50),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppTheme.isLightTheme == false ? const Color(0xff211F32) : const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff000000).withOpacity(0.10),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 14, right: 14, top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "See all",
                                    style: Theme.of(context).textTheme.headline6!.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: HexColor(AppTheme.primaryColorString!)),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Column(
                              children: [
                                for (var i = 0; i < controller.notifications.length; i++)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Column(
                                      children: [
                                        notificationsList(
                                          DefaultImages.bell,
                                          HexColor(AppTheme.primaryColorString!).withOpacity(0.10),
                                          controller.notifications[i].title,
                                          controller.notifications[i].message,
                                          DateFormat.yMMMMEEEEd()
                                              .format(DateTime.parse(controller.notifications[i].createdAt!))
                                              .toString(),
                                        ),
                                        if (i != controller.notifications.length - 1)
                                          const Divider(
                                            height: 0,
                                            thickness: 1,
                                          ),
                                      ],
                                    ),
                                  )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
