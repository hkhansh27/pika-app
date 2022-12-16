import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pika/src/ui/otp/otp.dart';
import 'package:pinput/pinput.dart';

import '../../res/textstyle.dart';
import '../../widgets/custom_button.dart';

class OtpScreen extends GetView<OtpController> {
  final defaultPinTheme = PinTheme(
    width: 66,
    height: 66,
    textStyle: TextStyle(
        fontSize: 32,
        color: AppTheme.isLightTheme == false ? Colors.white : const Color(0xff15141F),
        fontWeight: FontWeight.w800),
    decoration: BoxDecoration(
      color: AppTheme.isLightTheme == false ? const Color(0xff211F32) : const Color(0xffF9F9FA),
      //border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(16),
    ),
  );

  OtpScreen({super.key});

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
                  InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back)),
                  const Spacer(),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "OTP Authentication",
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                                fontWeight: FontWeight.w800,
                                fontSize: 24,
                              ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "An authentication code has been sent to",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: const Color(0xffA2A0A8),
                              ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          controller.args['phone'],
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Pinput(
                          defaultPinTheme: defaultPinTheme,
                          onCompleted: (value) {
                            controller.verifyOtp(value);
                          },
                          androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Obx(
                          () => InkWell(
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: controller.isVerified.value ? () => controller.next() : null,
                            child: customButton(
                                controller.isVerified.value
                                    ? HexColor(AppTheme.primaryColorString!)
                                    : HexColor(AppTheme.primaryColorString!).withOpacity(0.5),
                                "Continue",
                                HexColor(AppTheme.secondaryColorString!),
                                context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
