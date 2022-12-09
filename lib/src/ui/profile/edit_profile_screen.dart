import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pika/src/res/images.dart';
import 'package:pika/src/res/textstyle.dart';
import 'package:pika/src/widgets/custom_textfield.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_textformfield.dart';
import 'controllers/profile_controller.dart';

class EditProfileScreen extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.isLightTheme == false
            ? HexColor('#15141f')
            : HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
        elevation: 0,
        leading: InkWell(
          onTap: controller.backScreen,
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).textTheme.headline6!.color,
          ),
        ),
        title: Text(
          "My Account",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            color: AppTheme.isLightTheme == false
                ? HexColor('#15141f')
                : HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
            child: ListView(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 32),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: AppTheme.isLightTheme == false
                                ? const Color(0xffF5F7FE)
                                : HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
                            foregroundImage: const AssetImage(
                              DefaultImages.profile,
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
                      const SizedBox(height: 32),
                      CustomTextField(
                        hintText: "Enter userName",
                        widget: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            DefaultImages.profileUser,
                          ),
                        ),
                        color: AppTheme.isLightTheme == false ? const Color(0xff211F32) : const Color(0xffF9F9FA),
                        radius: 16,
                        textEditingController: TextEditingController(
                          text: controller.userModel.value!.fullName,
                        ),
                        inputType: TextInputType.name,
                        readOnly: true,
                      ),
                      const SizedBox(height: 24),
                      CustomTextField(
                        hintText: "Enter mobile number",
                        widget: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            DefaultImages.call,
                          ),
                        ),
                        color: AppTheme.isLightTheme == false ? const Color(0xff211F32) : const Color(0xffF9F9FA),
                        radius: 16,
                        readOnly: true,
                        textEditingController: TextEditingController(
                          text: controller.userModel.value!.phone,
                        ),
                        inputType: TextInputType.number,
                      ),
                      const SizedBox(height: 24),
                      Obx(
                        () => CustomTextFormField(
                          focusNode: controller.passwordFocus,
                          prefix: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: SvgPicture.asset(
                              DefaultImages.pswd,
                              width: 50,
                              height: 20,
                              color: controller.passwordFocus.hasFocus
                                  ? HexColor(AppTheme.primaryColorString!)
                                  : const Color(0xffA2A0A8),
                              // color:  HexColor(AppTheme.secondaryColorString!)
                            ),
                          ),
                          sufix: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: InkWell(
                              onTap: controller.passwordVisible,
                              child: SvgPicture.asset(
                                controller.isPasswordVisible.value == true
                                    ? DefaultImages.eyeOpen
                                    : DefaultImages.eyeClose,
                                width: 50,
                                height: 20,
                                color: controller.passwordFocus.hasFocus
                                    ? HexColor(AppTheme.primaryColorString!)
                                    : const Color(0xffA2A0A8),
                              ),
                            ),
                          ),
                          onChangedFunc: (value) {
                            controller.password.value = value;
                          },
                          initialValue: controller.userModel.value!.password,
                          inputType: TextInputType.visiblePassword,
                          errorText: controller.passwordError.value,
                          obscure: controller.isPasswordVisible.value,
                          capitalization: TextCapitalization.none,
                          limit: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      CustomTextField(
                        hintText: "Enter bank",
                        widget: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            DefaultImages.flag,
                          ),
                        ),
                        color: AppTheme.isLightTheme == false ? const Color(0xff211F32) : const Color(0xffF9F9FA),
                        radius: 16,
                        textEditingController: TextEditingController(text: "Vietnamese"),
                        sufix: Padding(
                          padding: const EdgeInsets.only(top: 16, right: 15),
                          child: Text(
                            "Change",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: HexColor(AppTheme.primaryColorString!),
                                ),
                          ),
                        ),
                        inputType: TextInputType.name,
                      ),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: controller.validPassword ? () => controller.changePassword() : null,
                child: customButton(
                    controller.validPassword
                        ? HexColor(AppTheme.primaryColorString!)
                        : HexColor(AppTheme.primaryColorString!).withOpacity(0.5),
                    "Save changes",
                    HexColor(AppTheme.secondaryColorString!),
                    context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
