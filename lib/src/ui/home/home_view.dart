import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pika/src/res/images.dart';
import 'package:pika/src/res/textstyle.dart';
import 'package:pika/src/ui/home/home.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    //remove
    Get.put(HomeController());

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
                        "Good morning",
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
                                  title: "USD",
                                  background: AppTheme.primaryColorString,
                                  textColor: Colors.white,
                                ),
                                const SizedBox(width: 5),
                                customContainer(
                                  title: "IDR",
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
                      width: Get.width,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return SvgPicture.asset(
                            DefaultImages.debitcard,
                            fit: BoxFit.fill,
                          );
                        },
                        itemCount: 3,
                        viewportFraction: 1,
                        scale: 0.9,
                        autoplay: true,
                        itemWidth: Get.width,
                        itemHeight: 180,
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
                          Get.to(const TopUpSCreen(),
                              transition: Transition.downToUp, duration: const Duration(milliseconds: 500));
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
                          Get.to(const TransferScreen(),
                              transition: Transition.downToUp, duration: const Duration(milliseconds: 500));
                        },
                        child: circleCard(
                          image: DefaultImages.transfer,
                          title: "Transfer",
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
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              for (var i = 0; i < controller.transactionList.length; i++)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: transactionList(
                                    controller.transactionList[i].image,
                                    controller.transactionList[i].background,
                                    controller.transactionList[i].title,
                                    controller.transactionList[i].subTitle,
                                    controller.transactionList[i].price,
                                    controller.transactionList[i].time,
                                  ),
                                )
                            ],
                          )
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
  }
}
