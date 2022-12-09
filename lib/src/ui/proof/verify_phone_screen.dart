import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pika/src/res/images.dart';
import 'package:pika/src/ui/proof/controllers/proof_controller.dart';

import '../../res/textstyle.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textformfield.dart';

class VerifyPhoneScreen extends GetView<ProofController> {
  final FocusNode _focusNodes = FocusNode();

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
                    "Getting Started",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Verify your phone number",
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
                                focusNode: _focusNodes,
                                prefix: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(
                                    DefaultImages.phone,
                                    color: _focusNodes.hasFocus
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : const Color(0xffA2A0A8),
                                    // color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                onChangedFunc: (value) {
                                  controller.phone.value = value;
                                },
                                hintText: "Phone Number",
                                inputType: TextInputType.phone,
                                errorText: controller.phoneError.value,
                                textEditingController: controller.mobileController.value,
                                capitalization: TextCapitalization.none,
                                limit: [LengthLimitingTextInputFormatter(10), FilteringTextInputFormatter.digitsOnly],
                              ),
                            ),
                            const SizedBox(height: 32),
                            Obx(
                              () => InkWell(
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: controller.enableButton ? () => controller.goToOtpScreen() : null,
                                child: customButton(
                                    controller.enableButton
                                        ? HexColor(AppTheme.primaryColorString!)
                                        : HexColor(AppTheme.primaryColorString!).withOpacity(0.5),
                                    "Next",
                                    HexColor(AppTheme.secondaryColorString!),
                                    context),
                              ),
                            ),
                            InkWell(
                              focusColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                controller.goToLoginPage();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Already have an account? ",
                                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                            fontWeight: FontWeight.w600, fontSize: 16, color: const Color(0xff9CA3AF))),
                                    Text(
                                      " Login",
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: HexColor(AppTheme.primaryColorString!),
                                          ),
                                    ),
                                  ],
                                ),
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
