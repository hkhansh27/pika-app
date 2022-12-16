import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pika/src/res/images.dart';
import 'package:pika/src/res/textstyle.dart';
import 'package:pika/src/routes/app_pages.dart';
import 'package:pika/src/ui/home/controllers/topup_success_controller.dart';
import 'package:pika/src/widgets/custom_container.dart';

class TopUpSucessScreen extends GetView<TopUpSuccessController> {
  const TopUpSucessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => Scaffold(
              body: Container(
                color: AppTheme.isLightTheme == false
                    ? HexColor('#15141f')
                    : HexColor(AppTheme.secondaryColorString!).withOpacity(0.05),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 150,
                            width: 249,
                            child: SvgPicture.asset(
                              DefaultImages.sucess,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            controller.data['action'] == 'deposit' ? "Top Up Success" : "Withdraw Success",
                            style: Theme.of(context).textTheme.headline6!.copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            height: 60,
                            width: 165,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
                            ),
                            child: Center(
                              child: Text(
                                '${controller.data['amount']} VND',
                                style: Theme.of(context).textTheme.headline6!.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            "Has been added to your Pika saving",
                            style: Theme.of(context).textTheme.caption!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffA2A0A8),
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: MediaQuery.of(context).padding.bottom + 14,
                      ),
                      child: CustomButton(
                        title: "Done",
                        onTap: () {
                          Get.offAllNamed(AppRoutes.HOME);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (error) => Center(child: Text(error.toString())));
  }
}
