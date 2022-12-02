// ignore_for_file: sized_box_for_whitespace, file_names, prefer_const_constructors
import 'package:pika/src/res/images.dart';
import 'package:pika/src/res/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pika/src/ui/proof/upload_front_photo_screen.dart';
import 'package:pika/src/ui/proof/widget/customMethodContainer.dart';
import 'package:pika/src/widgets/custom_button.dart';

class RedsidencyProofScreen extends StatefulWidget {
  const RedsidencyProofScreen({Key? key}) : super(key: key);

  @override
  State<RedsidencyProofScreen> createState() => _RedsidencyProofScreenState();
}

class _RedsidencyProofScreenState extends State<RedsidencyProofScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: InkWell(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            color: AppTheme.isLightTheme == false ? const Color(0xff15141F) : Colors.white,
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
                    height: 28,
                  ),
                  Text(
                    "Proof of residency",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Prove you live in Vietnam",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: const Color(0xffA2A0A8),
                        ),
                  ),
                  Expanded(
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Nationality",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: const Color(0xffA2A0A8),
                              ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 72,
                            decoration: BoxDecoration(
                                color:
                                    AppTheme.isLightTheme == false ? const Color(0xff211F32) : const Color(0xffF9F9FA),
                                borderRadius: BorderRadius.circular(16)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        child: SvgPicture.asset(
                                          DefaultImages.flag,
                                          fit: BoxFit.cover,
                                          // color:  HexColor(AppTheme.secondaryColorString!)
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Vietnamese",
                                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: AppTheme.isLightTheme == false
                                                      ? Colors.white
                                                      : const Color(0xff15141F),
                                                ),
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 16.0),
                                    child: Text("Change",
                                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: HexColor(AppTheme.primaryColorString!))),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Method of verification",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: const Color(0xffA2A0A8),
                              ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        customMethodContainer(context, "Passport", "Issued in Vietnam", DefaultImages.passport, () {}),
                        const SizedBox(
                          height: 16,
                        ),
                        customMethodContainer(
                          context,
                          "Identity Card",
                          "Issued in Vietnam",
                          DefaultImages.identityCard,
                          () {
                            Get.to(() => UploadFrontPhotoScreen());
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        customMethodContainer(
                            context, "My info digital document", "Issued in Vietnam", DefaultImages.digitalDoc, () {}),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(
                        UploadFrontPhotoScreen(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 500),
                      );
                    },
                    child: customButton(HexColor(AppTheme.primaryColorString!), "Continue",
                        HexColor(AppTheme.secondaryColorString!), context),
                  ),
                  SizedBox(height: MediaQuery.of(context).padding.bottom + 14),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
