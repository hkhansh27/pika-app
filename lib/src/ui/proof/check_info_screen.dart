import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pika/src/res/images.dart';
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
                                    DefaultImages.phone,
                                    color: _focusNodes[1].hasFocus
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : const Color(0xffA2A0A8),
                                    // color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                hintText: "Phone Number",
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
                                    DefaultImages.phone,
                                    color: _focusNodes[1].hasFocus
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : const Color(0xffA2A0A8),
                                    // color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                hintText: controller.userModel.value.idCard!,
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
                                    DefaultImages.phone,
                                    color: _focusNodes[1].hasFocus
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : const Color(0xffA2A0A8),
                                    // color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                hintText: controller.userModel.value.fullName!,
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
                                    DefaultImages.phone,
                                    color: _focusNodes[1].hasFocus
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : const Color(0xffA2A0A8),
                                    // color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                hintText: controller.userModel.value.address!,
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
                                    DefaultImages.phone,
                                    color: _focusNodes[1].hasFocus
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : const Color(0xffA2A0A8),
                                    // color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                hintText: controller.userModel.value.birthDay!,
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
                                    DefaultImages.phone,
                                    color: _focusNodes[1].hasFocus
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : const Color(0xffA2A0A8),
                                    // color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                hintText: controller.userModel.value.city!,
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
                                    DefaultImages.phone,
                                    color: _focusNodes[1].hasFocus
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : const Color(0xffA2A0A8),
                                    // color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                hintText: controller.userModel.value.issueDate!,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    focusColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () {},
                                    child: Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: const Color(0xffDCDBE0)),
                                          color: HexColor(AppTheme.primaryColorString!),
                                          borderRadius: BorderRadius.circular(8)),
                                      child: Icon(
                                        Icons.check,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                    ),
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
                              InkWell(
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {},
                                child: customButton(HexColor(AppTheme.primaryColorString!), "Sign Up",
                                    HexColor(AppTheme.secondaryColorString!), context),
                              ),
                              InkWell(
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 24),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Already have an account? ",
                                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: const Color(0xff9CA3AF))),
                                      Text(" Login",
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
