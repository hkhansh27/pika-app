import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pika/src/res/images.dart';
import 'package:pika/src/res/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pika/src/ui/login/create_pin_screen.dart';
import 'package:pika/src/ui/reason/widget/custom_container.dart';

import '../../widgets/custom_container.dart';
import '../../widgets/custom_textformfield.dart';

class SelectReasonScreen extends StatefulWidget {
  const SelectReasonScreen({Key? key}) : super(key: key);

  @override
  State<SelectReasonScreen> createState() => _SelectReasonScreenState();
}

class _SelectReasonScreenState extends State<SelectReasonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: Container(
          color: AppTheme.isLightTheme == false ? const Color(0xff15141F) : Colors.white,
          child: InkWell(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
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
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  Text(
                    "School Tuition Fee",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "HUTECH - Đại học Công Nghệ TP.HCM",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: const Color(0xffA2A0A8),
                        ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
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
                          child: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                        ),
                        prefix: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child:
                              SvgPicture.asset(DefaultImages.creditcard, color: HexColor(AppTheme.primaryColorString!)),
                        ),
                        hintText: "Student ID",
                        capitalization: TextCapitalization.none,
                        limit: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        inputType: TextInputType.visiblePassword,
                      ),
                    ),
                  ),
                  SizedBox(height: 450),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom + 14,
                    ),
                    child: CustomButton(
                      title: "Continue",
                      onTap: () {
                        // fake loading
                        EasyLoading.show(status: 'loading...');
                        Future.delayed(const Duration(seconds: 1), () {
                          EasyLoading.dismiss();
                          EasyLoading.showSuccess('There is no tuition fee for this semester');
                        });
                      },
                    ),
                  )
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
