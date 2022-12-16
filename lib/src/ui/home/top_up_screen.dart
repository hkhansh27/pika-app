import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pika/src/ui/home/home.dart';
import 'package:swipe/swipe.dart';

import '../../res/images.dart';
import '../../res/textstyle.dart';
import '../../widgets/custom_textformfield.dart';
import 'controllers/passbook_controller.dart';
import 'widgets/topup_dialog.dart';

class TopUpSCreen extends GetView<PassbookController> {
  TopUpSCreen({Key? key, required this.action}) : super(key: key);
  String action;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.isLightTheme == false ? HexColor('#15141f') : HexColor(AppTheme.secondaryColorString!),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                  child: Row(
                    children: [
                      InkWell(
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        "Top Up",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      const Expanded(child: SizedBox()),
                      const Icon(
                        Icons.arrow_back,
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    height: Get.height - 107,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: AppTheme.isLightTheme == false
                          ? const Color(0xff211F32)
                          : Theme.of(context).appBarTheme.backgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child: Column(
                            children: [
                              const SizedBox(height: 30),
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: const Color(0xffF5F7FE),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: SvgPicture.asset(
                                    DefaultImages.unicorn,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Obx(
                                () => Text(
                                  controller.userModel.value?.fullName ?? "Error",
                                  style: Theme.of(context).textTheme.headline6!.copyWith(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                controller.userModel.value?.accountNo ?? "Error",
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xffA2A0A8),
                                    ),
                              ),
                              const SizedBox(height: 40),
                              Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.3),
                                    ),
                                  ),
                                  child: CustomTextFormField(
                                    sufix: InkWell(
                                      focusColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    prefix: Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: SvgPicture.asset(DefaultImages.creditcard,
                                          color: HexColor(AppTheme.primaryColorString!)),
                                    ),
                                    hintText: "Amount",
                                    backgroundColor: Colors.transparent,
                                    textEditingController: controller.amountController.value,
                                    capitalization: TextCapitalization.none,
                                    limit: [
                                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                    ],
                                    inputType: TextInputType.visiblePassword,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom,
            ),
            child: Swipe(
              onSwipeRight: () {
                Get.bottomSheet(
                  topupDialog(
                    context,
                    controller.userModel.value!.fullName!,
                    controller.userModel.value!.accountNo!,
                    controller.amountController.value.text,
                    action,
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                child: Container(
                  height: 56,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppTheme.isLightTheme == false
                        ? HexColor(AppTheme.primaryColorString!)
                        : HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color:
                                AppTheme.isLightTheme == false ? Colors.white : HexColor(AppTheme.primaryColorString!),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              DefaultImages.swipe,
                              color: AppTheme.isLightTheme == false
                                  ? HexColor(AppTheme.primaryColorString!)
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        action == 'deposit' ? "Swipe to top-up" : "Swipe to withdraw",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
