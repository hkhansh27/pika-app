import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:swipe/swipe.dart';

import '../../res/images.dart';
import '../../res/textstyle.dart';
import '../../routes/app_pages.dart';
import '../../widgets/card_textfield.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_textformfield.dart';
import '../otp/otp.dart';
import 'controllers/transaction_controller.dart';
import 'controllers/transfer_detail_controller.dart';
import 'widgets/amount_container.dart';
import 'widgets/transfer_dialog.dart';

class TransferDetailScreen extends GetView<TransferDetailController> {
  const TransferDetailScreen({super.key, required this.accountNo, required this.accountName});
  final String accountNo;
  final String accountName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.isLightTheme == false ? HexColor('#15141f') : HexColor(AppTheme.primaryColorString!),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
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
                          "Transfer Detail",
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
                      height: Get.height - 87,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: AppTheme.isLightTheme == false
                            ? const Color(0xff211F32)
                            : Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
                            child: Column(
                              children: [
                                const SizedBox(height: 30),
                                Column(
                                  children: [
                                    const CircleAvatar(
                                      radius: 40,
                                      backgroundImage: AssetImage(
                                        DefaultImages.user1,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      accountName,
                                      style: Theme.of(context).textTheme.headline6!.copyWith(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                    const SizedBox(height: 30),
                                    Container(
                                      height: 64,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: AppTheme.isLightTheme == false
                                            ? const Color(0xff323045)
                                            : HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
                                        border: Border.all(
                                          color: HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 20, right: 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                height: 44,
                                                width: 44,
                                                child: SvgPicture.asset(
                                                  DefaultImages.hdBank,
                                                )),
                                            const SizedBox(width: 14),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "HD Bank",
                                                  style: Theme.of(context).textTheme.headline6!.copyWith(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  accountNo,
                                                  style: Theme.of(context).textTheme.headline6!.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      color: Theme.of(context)
                                                          .textTheme
                                                          .headline6!
                                                          .color!
                                                          .withOpacity(0.60)),
                                                ),
                                              ],
                                            ),
                                            const Expanded(child: SizedBox()),
                                            Icon(
                                              Icons.keyboard_arrow_down_outlined,
                                              size: 30,
                                              color: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.5),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 25),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    color: AppTheme.isLightTheme == false
                                        ? const Color(0xff211F32)
                                        : Theme.of(context).scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.3),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: CustomTextFormField(
                                      sufix: InkWell(
                                        focusColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        splashColor: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.5),
                                        onTap: () {},
                                      ),
                                      prefix: Padding(
                                        padding: const EdgeInsets.all(14.0),
                                        child: SvgPicture.asset(DefaultImages.creditcard,
                                            color: HexColor(AppTheme.primaryColorString!)),
                                      ),
                                      hintText: "Amount",
                                      capitalization: TextCapitalization.none,
                                      limit: [
                                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                      ],
                                      inputType: TextInputType.visiblePassword,
                                      textEditingController: controller.amountController.value,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                CardTextField(
                                  hintText: "Add Note",
                                  color: AppTheme.isLightTheme == false
                                      ? const Color(0xff211F32)
                                      : const Color(0xffFAFAFA),
                                  radius: 12,
                                  textEditingController: controller.descriptionController.value,
                                ),
                                const SizedBox(height: 100),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Swipe(
              onSwipeRight: () {
                Get.bottomSheet(transferDialog(context));
              },
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: MediaQuery.of(context).padding.bottom + 14,
                ),
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
                        "Swipe to transfer",
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
          ],
        ));
  }

  Widget transferDialog(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 50),
      child: Container(
        height: 349,
        width: Get.width,
        decoration: BoxDecoration(
          color: AppTheme.isLightTheme == false ? const Color(0xff211F32) : Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: HexColor(AppTheme.primaryColorString!),
                      size: 20,
                    ),
                  ),
                  Text(
                    "Confirm",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.transparent,
                      size: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recipient",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: const Color(0xffA2A0A8)),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 18,
                        width: 24,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              DefaultImages.user1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        accountName,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Divider(
                color: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.08),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transfer to",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: const Color(0xffA2A0A8)),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        DefaultImages.creditcard1,
                        height: 24,
                        width: 24,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "HD Bank",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        accountNo,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffA2A0A8),
                            ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 5),
              Divider(
                color: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.08),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transfer Amount",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: const Color(0xffA2A0A8)),
                  ),
                  Text(
                    controller.amountController.value.text,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Divider(
                color: Theme.of(context).textTheme.headline6!.color!.withOpacity(0.08),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  Text(
                    controller.amountController.value.text,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomButton(
                title: "Continue",
                onTap: () {
                  controller.goToOtpScreen(accountNo, accountName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
