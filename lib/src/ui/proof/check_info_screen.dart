import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pika/src/res/images.dart';
import 'package:pika/src/ui/login/verify_screen.dart';
import 'package:pika/src/ui/profile/controllers/profile_controller.dart';
import 'package:pika/src/ui/proof/controllers/proof_controller.dart';

import '../../res/textstyle.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textformfield.dart';
import '../register/register_controller.dart';

class CheckInfoPage extends GetView<ProofController> {
  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  Widget build(BuildContext context) {
    // ????
    controller.isVisible.value = false;
    _focusNodes.forEach((node) {
      node.addListener(() {});
    });

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
                    "Check your info",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Please check your info and make sure it's correct",
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
                        Obx(
                          () => Column(
                            children: [
                              //   const SizedBox(height: 20),
                              // CustomTextFormField(
                              //   focusNode: _focusNodes[0],
                              //   prefix: Padding(
                              //     padding: const EdgeInsets.all(14.0),
                              //     child: SvgPicture.asset(
                              //       DefaultImages.userName,
                              //       color: _focusNodes[0].hasFocus
                              //           ? HexColor(AppTheme.primaryColorString!)
                              //           : const Color(0xffA2A0A8),
                              //       // color:  HexColor(AppTheme.secondaryColorString!)
                              //     ),
                              //   ),
                              //   hintText: "Full Name",
                              //   inputType: TextInputType.text,
                              //   textEditingController: controller.nameController.value,
                              //   capitalization: TextCapitalization.words,
                              //   limit: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]'))],
                              // ),
                              // const SizedBox(height: 24),
                              CustomTextFormField(
                                focusNode: _focusNodes[1],
                                readOnly: true,
                                prefix: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(
                                    width: 50,
                                    height: 20,
                                    DefaultImages.phone,
                                    color: _focusNodes[1].hasFocus
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : const Color(0xffA2A0A8),
                                    // color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                hintText: controller.userModel.value?.phone ?? "Error",
                                inputType: TextInputType.phone,
                                textEditingController: controller.mobileController.value,
                                capitalization: TextCapitalization.none,
                                limit: [LengthLimitingTextInputFormatter(10), FilteringTextInputFormatter.digitsOnly],
                              ),

                              const SizedBox(height: 24),
                              CustomTextFormField(
                                focusNode: _focusNodes[1],
                                readOnly: true,
                                prefix: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(
                                    width: 50,
                                    height: 20,
                                    DefaultImages.idCardSvg,
                                    color: _focusNodes[1].hasFocus
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : const Color(0xffA2A0A8),
                                    // color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                hintText: controller.userModel.value?.idCard ?? "Error",
                                // inputType: TextInputType.phone,
                                textEditingController: controller.mobileController.value,
                                capitalization: TextCapitalization.none,
                                limit: [LengthLimitingTextInputFormatter(10), FilteringTextInputFormatter.digitsOnly],
                              ),
                              const SizedBox(height: 24),
                              CustomTextFormField(
                                focusNode: _focusNodes[1],
                                readOnly: true,
                                prefix: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(
                                    width: 35,
                                    height: 20,
                                    DefaultImages.name,
                                    color: _focusNodes[1].hasFocus
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : const Color(0xffA2A0A8),
                                    // color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                hintText: controller.userModel.value?.fullName ?? "Error",
                                // inputType: TextInputType.phone,
                                textEditingController: controller.mobileController.value,
                                capitalization: TextCapitalization.none,
                                limit: [LengthLimitingTextInputFormatter(10), FilteringTextInputFormatter.digitsOnly],
                              ),
                              const SizedBox(height: 24),
                              CustomTextFormField(
                                focusNode: _focusNodes[1],
                                readOnly: true,
                                prefix: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(
                                    width: 50,
                                    height: 20,
                                    DefaultImages.address,
                                    color: _focusNodes[1].hasFocus
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : const Color(0xffA2A0A8),
                                    // color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                hintText: controller.userModel.value?.address ?? "Error",
                                // inputType: TextInputType.phone,
                                textEditingController: controller.mobileController.value,
                                capitalization: TextCapitalization.none,
                                limit: [LengthLimitingTextInputFormatter(10), FilteringTextInputFormatter.digitsOnly],
                              ),
                              const SizedBox(height: 24),
                              CustomTextFormField(
                                focusNode: _focusNodes[1],
                                readOnly: true,
                                prefix: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(
                                    DefaultImages.birthDay,
                                    color: _focusNodes[1].hasFocus
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : const Color(0xffA2A0A8),
                                    width: 50,
                                    height: 20,
                                    // color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                hintText: controller.userModel.value?.birthDay ?? "Error",
                                // inputType: TextInputType.phone,
                                textEditingController: controller.mobileController.value,
                                capitalization: TextCapitalization.none,
                                limit: [LengthLimitingTextInputFormatter(10), FilteringTextInputFormatter.digitsOnly],
                              ),
                              const SizedBox(height: 24),
                              CustomTextFormField(
                                focusNode: _focusNodes[1],
                                readOnly: true,
                                prefix: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(
                                    width: 50,
                                    height: 20,
                                    DefaultImages.city,
                                    color: _focusNodes[1].hasFocus
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : const Color(0xffA2A0A8),
                                    // color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                hintText: controller.userModel.value?.city ?? "Error",
                                // inputType: TextInputType.phone,
                                textEditingController: controller.mobileController.value,
                                capitalization: TextCapitalization.none,
                                limit: [LengthLimitingTextInputFormatter(10), FilteringTextInputFormatter.digitsOnly],
                              ),
                              const SizedBox(height: 24),
                              CustomTextFormField(
                                focusNode: _focusNodes[1],
                                readOnly: true,
                                prefix: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(
                                    width: 50,
                                    height: 20,
                                    DefaultImages.issueDate,
                                    color: _focusNodes[1].hasFocus
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : const Color(0xffA2A0A8),
                                    // color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                hintText: controller.userModel.value?.issueDate ?? "Error",
                                // inputType: TextInputType.phone,
                                textEditingController: controller.mobileController.value,
                                capitalization: TextCapitalization.none,
                                limit: [LengthLimitingTextInputFormatter(10), FilteringTextInputFormatter.digitsOnly],
                              ),
                              // const SizedBox(height: 24),
                              // Obx(() {
                              //   return CustomTextFormField(
                              //     focusNode: _focusNodes[2],
                              //     sufix: InkWell(
                              //       focusColor: Colors.transparent,
                              //       highlightColor: Colors.transparent,
                              //       hoverColor: Colors.transparent,
                              //       splashColor: Colors.transparent,
                              //       onTap: () {
                              //         controller.isVisible.value = !controller.isVisible.value;
                              //       },
                              //       child: Padding(
                              //         padding: const EdgeInsets.all(14.0),
                              //         child: SvgPicture.asset(
                              //           DefaultImages.eye,
                              //           // color:  HexColor(AppTheme.secondaryColorString!)
                              //         ),
                              //       ),
                              //     ),
                              //     prefix: Padding(
                              //       padding: const EdgeInsets.all(14.0),
                              //       child: SvgPicture.asset(
                              //         DefaultImages.pswd,
                              //         color: _focusNodes[2].hasFocus
                              //             ? HexColor(AppTheme.primaryColorString!)
                              //             : const Color(0xffA2A0A8),
                              //         // color:  HexColor(AppTheme.secondaryColorString!)
                              //       ),
                              //     ),
                              //     hintText: "Password",
                              //     obscure: controller.isVisible.value == true ? false : true,
                              //     textEditingController: controller.pswdController.value,
                              //     capitalization: TextCapitalization.none,
                              //     limit: [
                              //       FilteringTextInputFormatter.singleLineFormatter,
                              //     ],
                              //     inputType: TextInputType.visiblePassword,
                              //   );
                              // }),
                              const SizedBox(height: 16),

                              const SizedBox(height: 32),
                              InkWell(
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: controller.goToSignupScreen,
                                child: customButton(HexColor(AppTheme.primaryColorString!), "Confirm",
                                    HexColor(AppTheme.secondaryColorString!), context),
                              ),
                              InkWell(
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: controller.reAuthentication,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 24),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Incorrect information? ",
                                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: const Color(0xff9CA3AF))),
                                      Text(
                                        " Try again",
                                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: HexColor(AppTheme.primaryColorString!),
                                            ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
