import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pika/src/res/images.dart';
import 'package:pika/src/res/textstyle.dart';
import 'package:pika/src/ui/home/controllers/home_controller.dart';
import 'package:pika/src/ui/home/home.dart';
import 'package:pika/src/ui/home/widgets/transaction_list.dart';
import 'package:pika/src/ui/statistics/widget/card_view.dart';
import 'widget/circle_card.dart' as statisticsCircleCard;

class StatisticsView extends GetView<TransactionController> {
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
                    "Statistic",
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
            const SizedBox(height: 10),
            controller.isWeek.value == true
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Spending",
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.60),
                              ),
                        ),
                        const SizedBox(height: 8),
                        Row(children: [
                          Text(
                            "1.691.54 VND",
                            style: Theme.of(context).textTheme.headline6!.copyWith(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "-3.1% from last month",
                            style: Theme.of(context).textTheme.headline6!.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.60),
                                ),
                          ),
                        ])
                      ],
                    ),
                  ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    cardView(
                      context,
                      controller.isWeek.value == true
                          ? HexColor(AppTheme.primaryColorString!)
                          : AppTheme.isLightTheme == false
                              ? const Color(0xff211F32)
                              : const Color(0xffF9F9FA),
                      controller.isWeek.value == true ? Colors.white : const Color(0xffA2A0A8),
                      () {
                        controller.isWeek.value = true;
                        controller.isMonth.value = false;
                        controller.isYear.value = false;
                      },
                      "Week",
                    ),
                    cardView(
                      context,
                      controller.isMonth.value == true
                          ? HexColor('#6C56F9')
                          : AppTheme.isLightTheme == false
                              ? const Color(0xff211F32)
                              : const Color(0xffF9F9FA),
                      controller.isMonth.value == true ? Colors.white : const Color(0xffA2A0A8),
                      () {
                        controller.isWeek.value = false;
                        controller.isMonth.value = true;
                        controller.isYear.value = false;
                      },
                      "Month",
                    ),
                    cardView(
                      context,
                      controller.isYear.value == true
                          ? HexColor(AppTheme.primaryColorString!)
                          : AppTheme.isLightTheme == false
                              ? const Color(0xff211F32)
                              : const Color(0xffF9F9FA),
                      controller.isYear.value == true ? Colors.white : const Color(0xffA2A0A8),
                      () {
                        controller.isWeek.value = false;
                        controller.isMonth.value = false;
                        controller.isYear.value = true;
                      },
                      "Year",
                    )
                  ],
                ),
              ),
            ),
            Obx(
              () => Expanded(
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [
                    const SizedBox(height: 20),
                    controller.isWeek.value == true
                        ? Column(
                            children: [
                              SizedBox(
                                height: 200,
                                width: 200,
                                child: SvgPicture.asset(
                                  AppTheme.isLightTheme == false ? DefaultImages.darkChart2 : DefaultImages.chart2,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 60,
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  child: ListView(
                                    physics: const ClampingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 16),
                                            child: statisticsCircleCard.circleCard(
                                              context,
                                              "Food",
                                              HexColor(AppTheme.primaryColorString!),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 16),
                                            child: statisticsCircleCard.circleCard(
                                              context,
                                              "Bills",
                                              HexColor('#907FFA'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 16),
                                            child: statisticsCircleCard.circleCard(
                                              context,
                                              "Gadget",
                                              HexColor('#CCCACF'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 16),
                                            child: statisticsCircleCard.circleCard(
                                              context,
                                              "Food",
                                              HexColor(AppTheme.primaryColorString!),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: SizedBox(
                              height: 250,
                              child: SvgPicture.asset(
                                AppTheme.isLightTheme == false ? DefaultImages.darkChart1 : DefaultImages.chart1,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                    const SizedBox(height: 20),
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
                                    controller.isWeek.value == true
                                        ? "This Week"
                                        : controller.isMonth.value == true
                                            ? "This Month"
                                            : "This Year",
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
