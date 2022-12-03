import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../res/textstyle.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textformfield.dart';
import '../../../gen/assets.gen.dart';
import 'controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
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
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
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
                  // const Icon(Icons.arrow_back),
                  const SizedBox(
                    height: 38,
                  ),
                  Text(
                    "Hi Welcome Back!",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Sign in to your account",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: const Color(0xffA2A0A8),
                        ),
                  ),

                  Expanded(
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 30),
                            Obx(() {
                              return CustomTextFormField(
                                prefix: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(
                                    Assets.images.user.path,
                                    // color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                hintText: "Phone Number",
                                inputType: TextInputType.phone,
                                textEditingController: controller.usernameController.value,
                                capitalization: TextCapitalization.none,
                              );
                            }),
                            const SizedBox(height: 24),
                            Obx(() {
                              return CustomTextFormField(
                                sufix: InkWell(
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    controller.isPasswordVisible.value = !controller.isPasswordVisible.value;
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: SvgPicture.asset(
                                      Assets.images.eyeSlash.path,
                                      // color:  HexColor(AppTheme.secondaryColorString!)
                                    ),
                                  ),
                                ),
                                prefix: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(
                                    Assets.images.lock.path,
                                    // color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                hintText: "Password",
                                obscure: controller.isPasswordVisible.value == true ? false : true,
                                textEditingController: controller.passwordController.value,
                                capitalization: TextCapitalization.none,
                                limit: [
                                  FilteringTextInputFormatter.singleLineFormatter,
                                ],
                                inputType: TextInputType.visiblePassword,
                              );
                            }),
                            const SizedBox(height: 16),
                            InkWell(
                              focusColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Forgot your password?",
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: HexColor(AppTheme.primaryColorString!),
                                        ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 32),
                            InkWell(
                              focusColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                controller.login();
                              },
                              child: customButton(HexColor(AppTheme.primaryColorString!), "Login",
                                  HexColor(AppTheme.secondaryColorString!), context),
                            ),
                            InkWell(
                              focusColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                controller.goToVerifyPhoneScreen();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don’t have account?",
                                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                            fontWeight: FontWeight.w600, fontSize: 16, color: const Color(0xff9CA3AF))),
                                    Text(" Sign Up",
                                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: HexColor(AppTheme.primaryColorString!),
                                            ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                color: const Color(0xffE8E8E8),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 16.0, right: 16),
                              child: Text("Or login with"),
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: const Color(0xffE8E8E8),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          height: 56,
                          width: Get.width,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffE8E8E8)),
                            borderRadius: BorderRadius.circular(16),
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 17.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: SvgPicture.asset(
                                    Assets.images.googleIcon.path,
                                    //color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {},
                                  child: Text(
                                    "Login with Google",
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: const Color(0xff15141F),
                                        ),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
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
