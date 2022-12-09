import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pika/src/res/images.dart';

import '../../res/textstyle.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textformfield.dart';
import 'register_controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Container(
            color: AppTheme.isLightTheme == false ? const Color(0xff15141F) : const Color(0xffFFFFFF),
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: AppBar().preferredSize.height,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Create your account",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Create an account to continue!",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: const Color(0xffA2A0A8),
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Column(
                          children: [
                            Obx(
                              () => CustomTextFormField(
                                focusNode: controller.usernameFocus,
                                prefix: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(
                                    DefaultImages.user,
                                    width: 50,
                                    height: 20,
                                    color: controller.usernameFocus.hasFocus
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : const Color(0xffA2A0A8),
                                    // color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                onChangedFunc: (value) {
                                  controller.username.value = value;
                                },
                                hintText: "Username",
                                inputType: TextInputType.name,
                                textEditingController: controller.nameController.value,
                                errorText: controller.usernameError.value,
                                capitalization: TextCapitalization.none,
                                limit: [
                                  LengthLimitingTextInputFormatter(10),
                                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
                                ],
                              ),
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
                                          ? DefaultImages.eyeClose
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
                                hintText: "Password",
                                inputType: TextInputType.visiblePassword,
                                textEditingController: controller.pswdController.value,
                                errorText: controller.passwordError.value,
                                capitalization: TextCapitalization.none,
                                obscure: controller.isPasswordVisible.value,
                                limit: [
                                  LengthLimitingTextInputFormatter(10),
                                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            Obx(
                              () => CustomTextFormField(
                                focusNode: controller.emailFocus,
                                onChangedFunc: (value) {
                                  controller.email.value = value;
                                },
                                prefix: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(
                                    DefaultImages.email,
                                    width: 50,
                                    height: 20,
                                    color: controller.emailFocus.hasFocus
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : const Color(0xffA2A0A8),
                                    // color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                hintText: "Email",
                                inputType: TextInputType.emailAddress,
                                textEditingController: controller.emailController.value,
                                errorText: controller.emailError.value,
                                capitalization: TextCapitalization.none,
                                limit: [
                                  LengthLimitingTextInputFormatter(20),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    controller.onAgree();
                                  },
                                  child: Obx(() => Container(
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: const Color(0xffDCDBE0)),
                                            color: controller.isAgree.value
                                                ? HexColor(AppTheme.primaryColorString!)
                                                : Colors.transparent,
                                            borderRadius: BorderRadius.circular(8)),
                                        child: Icon(
                                          Icons.check,
                                          size: 15,
                                          color: controller.isAgree.value ? Colors.white : Colors.transparent,
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                    child: RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text: "By creating an account, you aggree to our ",
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: AppTheme.isLightTheme == false
                                                ? const Color(0xffA2A0A8)
                                                : const Color(0xff211F32),
                                          ),
                                    ),
                                    TextSpan(
                                        text: "Terms",
                                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: HexColor(AppTheme.primaryColorString!))),
                                    TextSpan(
                                      text: " and ",
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: AppTheme.isLightTheme == false
                                                ? const Color(0xffA2A0A8)
                                                : const Color(0xff211F32),
                                          ),
                                    ),
                                    TextSpan(
                                        text: "Conditions",
                                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: HexColor(AppTheme.primaryColorString!))),
                                  ]),
                                )
                                    // Text(
                                    //   "By creating an account, you aggree to our Terms and Conditions",
                                    //   maxLines: 3,
                                    //   style: Theme.of(context)
                                    //       .textTheme
                                    //       .bodyText2!
                                    //       .copyWith(
                                    //         fontWeight: FontWeight.w500,
                                    //         fontSize: 14,
                                    //         color: Color(0xff211F32),
                                    //       ),
                                    // ),
                                    )
                              ],
                            ),
                            const SizedBox(height: 32),
                            Obx(
                              () => InkWell(
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: controller.enableButton ? () => controller.doRegister() : null,
                                child: customButton(
                                    controller.enableButton
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : HexColor(AppTheme.primaryColorString!).withOpacity(0.5),
                                    "Continue",
                                    HexColor(AppTheme.secondaryColorString!),
                                    context),
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
        ),
      ),
    );
  }
}
