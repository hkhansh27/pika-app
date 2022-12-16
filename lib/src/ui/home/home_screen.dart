import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pika/src/res/images.dart';
import 'package:pika/src/res/textstyle.dart';
import 'package:pika/src/ui/home/home.dart';
import 'package:pika/src/ui/home/pika_saving_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../country/tuition_screen.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        return Scaffold(
          body: Container(
            color: AppTheme.isLightTheme == false ? const Color(0xff15141F) : Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good morning",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).textTheme.caption!.color,
                                ),
                          ),
                          Text(
                            "${controller.userModel.value?.fullName ?? ""}",
                            style: Theme.of(context).textTheme.headline6!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 28,
                            width: 69,
                            decoration: BoxDecoration(
                              color: const Color(0xffF6A609).withOpacity(0.10),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  DefaultImages.ranking,
                                ),
                                Text(
                                  "Gold",
                                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                        color: const Color(0xffF6A609),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              DefaultImages.avatar,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppTheme.isLightTheme == false
                                    ? HexColor('#15141f')
                                    : Theme.of(context).appBarTheme.backgroundColor,
                                border: Border.all(
                                  color: HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    customContainer(
                                      title: "VND",
                                      background: AppTheme.primaryColorString,
                                      textColor: Colors.white,
                                    ),
                                    const SizedBox(width: 5),
                                    customContainer(
                                      title: "USD",
                                      background: AppTheme.isLightTheme == false ? '#211F32' : "#FFFFFF",
                                      textColor: Theme.of(context).textTheme.bodyText2!.color,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: HexColor(AppTheme.primaryColorString!),
                                  size: 20,
                                ),
                                Text(
                                  "Add Currency",
                                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                        color: HexColor(AppTheme.primaryColorString!),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: SizedBox(
                          height: 180,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(16, 10, 0, 20),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(15),
                                  right: Radius.circular(15),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.yellow,
                                    Colors.red,
                                  ],
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  DefaultImages.hdBank,
                                  width: 40,
                                  height: 40,
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  'CARD NUMBER',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  controller.userModel.value!.accountNo!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Obx(
                                  () => Text(
                                    //format balance to 6,000,000 VND
                                    NumberFormat.currency(
                                      locale: 'vi',
                                      symbol: 'VND',
                                      decimalDigits: 0,
                                    ).format(int.parse(controller.balance.value)),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 32,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              // Get.toNamed("/chat");
                              Get.to(() => ContactScreen(), binding: HomeBinding());
                            },
                            child: circleCard(
                              image: DefaultImages.contacts,
                              title: "Contacts",
                            ),
                          ),
                          InkWell(
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {},
                            child: circleCard(
                              image: DefaultImages.withdraw,
                              title: "Withdraw",
                            ),
                          ),
                          InkWell(
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              Get.to(
                                TransferScreen(),
                                transition: Transition.downToUp,
                                duration: const Duration(milliseconds: 500),
                                binding: HomeBinding(),
                              );
                            },
                            child: circleCard(
                              image: DefaultImages.transfer,
                              title: "Transfer",
                            ),
                          ),
                          InkWell(
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              Get.bottomSheet(
                                //container white background for bottom sheet with qr code
                                Container(
                                  height: 300,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 20),
                                      const Text(
                                        'My code',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Container(
                                        height: 200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: QrImage(
                                          data: controller.userModel.value!.accountNo!,
                                          version: QrVersions.auto,
                                          size: 200.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                              // Get.to(
                              //   TransferScreen(),
                              //   transition: Transition.downToUp,
                              //   duration: const Duration(milliseconds: 500),
                              // );
                            },
                            child: circleCard(
                              image: DefaultImages.scan,
                              title: "QR",
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
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
                                padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Transactions",
                                      style: Theme.of(context).textTheme.headline6!.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
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
                              const SizedBox(height: 10),
                              // service icon grid
                              GridView(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                                shrinkWrap: true,
                                children: [
                                  InkWell(
                                    focusColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      Get.to(
                                        () => TuitionScreen(),
                                        transition: Transition.downToUp,
                                        duration: const Duration(milliseconds: 500),
                                      );
                                    },
                                    child: circleCard(
                                      image: DefaultImages.school,
                                      title: "Tuitions",
                                    ),
                                  ),
                                  InkWell(
                                    focusColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      // Get.to(
                                      //   () => TuitionScreen(),
                                      //   transition: Transition.downToUp,
                                      //   duration: const Duration(milliseconds: 500),
                                      // );
                                    },
                                    child: circleCard(
                                      image: DefaultImages.electricity,
                                      title: "Electricity",
                                    ),
                                  ),
                                  InkWell(
                                    focusColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      // Get.to(
                                      //   () => TuitionScreen(),
                                      //   transition: Transition.downToUp,
                                      //   duration: const Duration(milliseconds: 500),
                                      // );
                                    },
                                    child: circleCard(
                                      image: DefaultImages.water,
                                      title: "Water",
                                    ),
                                  ),
                                  InkWell(
                                    focusColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      // Get.to(
                                      //   () => TuitionScreen(),
                                      //   transition: Transition.downToUp,
                                      //   duration: const Duration(milliseconds: 500),
                                      // );
                                    },
                                    child: circleCard(
                                      image: DefaultImages.internet,
                                      title: "Internet",
                                    ),
                                  ),
                                  InkWell(
                                    focusColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      Get.to(
                                        () => PikaSavingScreen(),
                                        binding: HomeBinding(),
                                        transition: Transition.downToUp,
                                        duration: const Duration(milliseconds: 500),
                                      );
                                    },
                                    child: circleCard(
                                      image: DefaultImages.walletSave,
                                      title: "Pika saving",
                                    ),
                                  ),
                                  InkWell(
                                    focusColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      // Get.to(
                                      //   () => TuitionScreen(),
                                      //   transition: Transition.downToUp,
                                      //   duration: const Duration(milliseconds: 500),
                                      // );
                                    },
                                    child: circleCard(
                                      image: DefaultImages.threeDots,
                                      title: "More",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      onLoading: const Center(child: CircularProgressIndicator()),
    );
  }
}
