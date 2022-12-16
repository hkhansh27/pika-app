import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pika/src/res/images.dart';
import 'package:pika/src/res/textstyle.dart';
import 'package:pika/src/widgets/custom_container.dart';

import '../../widgets/custom_textformfield.dart';
import 'controllers/transaction_controller.dart';
import 'widgets/contact_widget.dart';

class TransferScreen extends GetView<TransactionController> {
  TransferScreen({Key? key, this.code}) : super(key: key);
  String? code;

  @override
  Widget build(BuildContext context) {
    code != null ? controller.getNameByAccountNo(code) : null;

    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
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
                          "Transfer",
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
                                    Text(
                                      "Where do you want to\ntransfer?",
                                      style: Theme.of(context).textTheme.headline6!.copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 30),
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
                                        child: code == null
                                            ? CustomTextFormField(
                                                sufix: InkWell(
                                                  focusColor: Colors.transparent,
                                                  highlightColor: Colors.transparent,
                                                  hoverColor: Colors.transparent,
                                                  splashColor:
                                                      Theme.of(context).textTheme.headline6!.color!.withOpacity(0.5),
                                                  onTap: () {},
                                                  child: const Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                prefix: Padding(
                                                  padding: const EdgeInsets.all(14.0),
                                                  child: SvgPicture.asset(DefaultImages.creditcard,
                                                      color: HexColor(AppTheme.primaryColorString!)),
                                                ),
                                                hintText: "Account number",
                                                textEditingController: controller.numberAccount.value,
                                                capitalization: TextCapitalization.none,
                                                limit: [
                                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                                ],
                                                inputType: TextInputType.visiblePassword,
                                              )
                                            : CustomTextFormField(
                                                sufix: InkWell(
                                                  focusColor: Colors.transparent,
                                                  highlightColor: Colors.transparent,
                                                  hoverColor: Colors.transparent,
                                                  splashColor:
                                                      Theme.of(context).textTheme.headline6!.color!.withOpacity(0.5),
                                                  onTap: () {},
                                                  child: const Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                prefix: Padding(
                                                  padding: const EdgeInsets.all(14.0),
                                                  child: SvgPicture.asset(DefaultImages.creditcard,
                                                      color: HexColor(AppTheme.primaryColorString!)),
                                                ),
                                                hintText: "Account number",
                                                initialValue: code,
                                                capitalization: TextCapitalization.none,
                                                limit: [
                                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                                ],
                                                inputType: TextInputType.visiblePassword,
                                              ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
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
                                        child: Obx(
                                          () => CustomTextFormField(
                                            sufix: InkWell(
                                              focusColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              splashColor:
                                                  Theme.of(context).textTheme.headline6!.color!.withOpacity(0.5),
                                              onTap: () {},
                                              child: const Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.white,
                                              ),
                                            ),
                                            prefix: Padding(
                                              padding: const EdgeInsets.all(14.0),
                                              child: SvgPicture.asset(DefaultImages.user,
                                                  color: HexColor(AppTheme.primaryColorString!)),
                                            ),
                                            hintText: "Account Name",
                                            capitalization: TextCapitalization.none,
                                            textEditingController: controller.nameAccount.value,
                                            readOnly: true,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Obx(
                                      () => controller.accountNameError.value
                                          ? Text(
                                              "Couldn't find account",
                                              textAlign: TextAlign.start,
                                              style: Theme.of(context).textTheme.headline6!.copyWith(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.red,
                                                  ),
                                            )
                                          : const SizedBox(),
                                    ),
                                    const SizedBox(height: 25),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Transfer to",
                                          style: Theme.of(context).textTheme.headline6!.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
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
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      height: 90,
                                      width: Get.width,
                                      child: ListView(
                                        physics: const ClampingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 30,
                                                    backgroundColor: AppTheme.isLightTheme == false
                                                        ? const Color(0xffF5F7FE)
                                                        : HexColor(AppTheme.primaryColorString!).withOpacity(0.15),
                                                    child: SvgPicture.asset(
                                                      DefaultImages.userAdd,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    "Add",
                                                    style: Theme.of(context).textTheme.headline6!.copyWith(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(width: 14),
                                              Obx(
                                                () => controller.contactList.isEmpty
                                                    ? const SizedBox()
                                                    : ListView.builder(
                                                        shrinkWrap: true,
                                                        physics: const ClampingScrollPhysics(),
                                                        scrollDirection: Axis.horizontal,
                                                        itemCount: controller.contactList.length,
                                                        itemBuilder: (context, index) {
                                                          return Padding(
                                                            padding: const EdgeInsets.only(left: 14, right: 14),
                                                            child: Column(
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    controller.nameAccount.value.text =
                                                                        controller.contactList[index].fullName!;
                                                                    controller.numberAccount.value.text =
                                                                        controller.contactList[index].accountNo!;
                                                                    controller.goToTransferDetailScreen();
                                                                  },
                                                                  child: contact(
                                                                    image: "",
                                                                    fullName: controller.contactList[index].fullName!,
                                                                    accountNo: controller.contactList[index].accountNo!,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
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
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).padding.bottom + 14,
              ),
              child: CustomButton(
                title: "Continue",
                onTap: () {
                  controller.goToTransferDetailScreen();
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
