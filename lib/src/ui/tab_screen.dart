import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pika/src/controllers/tab_controller.dart';
import 'package:pika/src/res/images.dart';
import 'package:pika/src/res/textstyle.dart';
import 'package:pika/src/ui/notifications/notifications_screen.dart';
import 'package:pika/src/ui/home/home.dart';
import 'package:pika/src/ui/home/home_screen.dart';
import 'package:pika/src/ui/statistics/statistics_view.dart';

import 'profile/profile_view.dart';
import 'profile/setting_screen.dart';
import 'qr/qr_scan_screen.dart';

class TabScreen extends GetView<TabScreenController> {
  final controller = Get.put(TabScreenController());
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor(AppTheme.primaryColorString!),
        onPressed: () {},
        child: InkWell(
          child: SvgPicture.asset(
            DefaultImages.scan,
          ),
          onTap: () {
            Get.to(() => QrScanScreen());
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          elevation: 20,
          currentIndex: controller.pageIndex.value,
          onTap: (index) {
            controller.pageIndex.value = index;
          },
          backgroundColor:
              AppTheme.isLightTheme == false ? HexColor('#15141f') : Theme.of(context).appBarTheme.backgroundColor,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: AppTheme.isLightTheme == false
              ? const Color(0xffA2A0A8)
              : HexColor(AppTheme.primaryColorString!).withOpacity(0.4),
          selectedItemColor: HexColor(AppTheme.primaryColorString!),
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset(
                  DefaultImages.homr,
                  color: controller.pageIndex.value == 0
                      ? HexColor(AppTheme.primaryColorString!)
                      : AppTheme.isLightTheme == false
                          ? const Color(0xffA2A0A8)
                          : HexColor(AppTheme.primaryColorString!).withOpacity(0.4),
                ),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset(
                  DefaultImages.chart,
                  color: controller.pageIndex.value == 1
                      ? HexColor(AppTheme.primaryColorString!)
                      : AppTheme.isLightTheme == false
                          ? const Color(0xffA2A0A8)
                          : HexColor(AppTheme.primaryColorString!).withOpacity(0.4),
                ),
              ),
              label: "Statistics",
            ),
            BottomNavigationBarItem(
                icon: SizedBox(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset(
                    DefaultImages.card,
                    color: controller.pageIndex.value == 2
                        ? HexColor(AppTheme.primaryColorString!)
                        : AppTheme.isLightTheme == false
                            ? const Color(0xffA2A0A8)
                            : HexColor(AppTheme.primaryColorString!).withOpacity(0.4),
                  ),
                ),
                label: "Notifications"),
            BottomNavigationBarItem(
                icon: SizedBox(
                  height: 20,
                  width: 20,
                  child: SvgPicture.asset(
                    DefaultImages.user,
                    color: controller.pageIndex.value == 3
                        ? HexColor(AppTheme.primaryColorString!)
                        : AppTheme.isLightTheme == false
                            ? const Color(0xffA2A0A8)
                            : HexColor(AppTheme.primaryColorString!).withOpacity(0.4),
                  ),
                ),
                label: "Profile"),
          ],

          // height: 60,
          // selectedIndex: _currentIndex,
          // onDestinationSelected: (_currentIndex) => setState(() {
          //   this._currentIndex = _currentIndex;
          //   setState(() {
          //     controller.pageIndex.value = _currentIndex;
          //   });
          // }),
          // backgroundColor: AppTheme.isLightTheme == false
          //     ? HexColor('#15141f')
          //     : Theme.of(context).appBarTheme.backgroundColor,

          // // ignore: prefer_const_literals_to_create_immutables
          // destinations: [
          //   NavigationDestination(
          //     icon: SizedBox(
          //       height: 20,
          //       width: 20,
          //       child: SvgPicture.asset(
          //         DefaultImages.homr,
          //         color: controller.pageIndex.value == 0
          //             ? HexColor(AppTheme.primaryColorString!)
          //             : AppTheme.isLightTheme == false
          //                 ? const Color(0xffA2A0A8)
          //                 : HexColor(AppTheme.primaryColorString!)
          //                     .withOpacity(0.4),
          //       ),
          //     ),
          //     label: "Home",
          //   ),
          //   NavigationDestination(
          //       icon: SizedBox(
          //         height: 20,
          //         width: 20,
          //         child: SvgPicture.asset(
          //           DefaultImages.chart,
          //           color: controller.pageIndex.value == 1
          //               ? HexColor(AppTheme.primaryColorString!)
          //               : AppTheme.isLightTheme == false
          //                   ? const Color(0xffA2A0A8)
          //                   : HexColor(AppTheme.primaryColorString!)
          //                       .withOpacity(0.4),
          //         ),
          //       ),
          //       label: "Statistics"),
          //   NavigationDestination(
          //       icon: SizedBox(
          //         height: 20,
          //         width: 20,
          //         child: SvgPicture.asset(
          //           DefaultImages.card,
          //           color: controller.pageIndex.value == 2
          //               ? HexColor(AppTheme.primaryColorString!)
          //               : AppTheme.isLightTheme == false
          //                   ? const Color(0xffA2A0A8)
          //                   : HexColor(AppTheme.primaryColorString!)
          //                       .withOpacity(0.4),
          //         ),
          //       ),
          //       label: "Card"),
          //   NavigationDestination(
          //       icon: SizedBox(
          //         height: 20,
          //         width: 20,
          //         child: SvgPicture.asset(
          //           DefaultImages.user,
          //           color: controller.pageIndex.value == 3
          //               ? HexColor(AppTheme.primaryColorString!)
          //               : AppTheme.isLightTheme == false
          //                   ? const Color(0xffA2A0A8)
          //                   : HexColor(AppTheme.primaryColorString!)
          //                       .withOpacity(0.4),
          //         ),
          //       ),
          //       label: "Profile"),
          // ],
        ),
      ),
      // body: _widgetOptions.elementAt(_currentIndex),,
      // BottomAppBar(
      //   clipBehavior: Clip.antiAlias,
      //   shape: const CircularNotchedRectangle(),
      //   elevation: 10,
      //   child: SizedBox(
      //     height: 55,
      //     child: BottomNavigationBar(
      //       currentIndex: controller.pageIndex.value,
      //       onTap: (index) {
      //         setState(() {
      //           controller.pageIndex.value = index;
      //         });
      //       },
      //       backgroundColor: AppTheme.isLightTheme == false
      //           ? HexColor('#15141f')
      //           : Theme.of(context).appBarTheme.backgroundColor,
      //       type: BottomNavigationBarType.fixed,
      //       unselectedItemColor: AppTheme.isLightTheme == false
      //           ? const Color(0xffA2A0A8)
      //           : HexColor(AppTheme.primaryColorString!).withOpacity(0.4),
      //       selectedItemColor: HexColor(AppTheme.primaryColorString!),
      //       items: [
      //         BottomNavigationBarItem(
      //           icon: SizedBox(
      //             height: 20,
      //             width: 20,
      //             child: SvgPicture.asset(
      //               DefaultImages.homr,
      //               color: controller.pageIndex.value == 0
      //                   ? HexColor(AppTheme.primaryColorString!)
      //                   : AppTheme.isLightTheme == false
      //                       ? const Color(0xffA2A0A8)
      //                       : HexColor(AppTheme.primaryColorString!)
      //                           .withOpacity(0.4),
      //             ),
      //           ),
      //           label: "home",
      //         ),
      //         BottomNavigationBarItem(
      //           icon: SizedBox(
      //             height: 20,
      //             width: 20,
      //             child: SvgPicture.asset(
      //               DefaultImages.chart,
      //               color: controller.pageIndex.value == 1
      //                   ? HexColor(AppTheme.primaryColorString!)
      //                   : AppTheme.isLightTheme == false
      //                       ? const Color(0xffA2A0A8)
      //                       : HexColor(AppTheme.primaryColorString!)
      //                           .withOpacity(0.4),
      //             ),
      //           ),
      //           label: "Statistics",
      //         ),
      //         BottomNavigationBarItem(
      //             icon: SizedBox(
      //               height: 20,
      //               width: 20,
      //               child: SvgPicture.asset(
      //                 DefaultImages.card,
      //                 color: controller.pageIndex.value == 2
      //                     ? HexColor(AppTheme.primaryColorString!)
      //                     : AppTheme.isLightTheme == false
      //                         ? const Color(0xffA2A0A8)
      //                         : HexColor(AppTheme.primaryColorString!)
      //                             .withOpacity(0.4),
      //               ),
      //             ),
      //             label: "Card"),
      //         BottomNavigationBarItem(
      //             icon: SizedBox(
      //               height: 20,
      //               width: 20,
      //               child: SvgPicture.asset(
      //                 DefaultImages.user,
      //                 color: controller.pageIndex.value == 3
      //                     ? HexColor(AppTheme.primaryColorString!)
      //                     : AppTheme.isLightTheme == false
      //                         ? const Color(0xffA2A0A8)
      //                         : HexColor(AppTheme.primaryColorString!)
      //                             .withOpacity(0.4),
      //               ),
      //             ),
      //             label: "profile"),
      //       ],
      //     ),
      //   ),
      // ),
      body: GetX<TabScreenController>(
        init: controller,
        builder: (controller) => controller.pageIndex.value == 0
            ? HomeScreen()
            : controller.pageIndex.value == 1
                ? StatisticsView()
                : controller.pageIndex.value == 2
                    ? const NotificationsView()
                    : SettingScreen(),
      ),
    );
  }
}
