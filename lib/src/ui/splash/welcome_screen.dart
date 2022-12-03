import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pika/src/controllers/tab_controller.dart';
import 'package:pika/src/res/images.dart';
import 'package:pika/src/res/textstyle.dart';
import 'package:pika/src/routes/app_pages.dart';
import 'package:pika/src/ui/login/login.dart';
import 'package:pika/src/ui/proof/proof_binding.dart';
import 'package:pika/src/ui/proof/verify_phone_screen.dart';
import 'package:pika/src/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeFirstScreen extends GetView {
  final slideController = Get.put(TabScreenController());

  final controller = PageController(viewportFraction: 0.8, keepPage: true, initialPage: 0);

  final pages = List<int>.generate(2, (i) => 1, growable: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppTheme.isLightTheme == false ? const Color(0xff15141F) : const Color(0xffFFFFFF),
        child: Padding(
          padding: EdgeInsets.only(
            left: 32,
            right: 32.0,
            top: AppBar().preferredSize.height,
          ),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    slideController.i.value == 0 ? "Welcome to Pika" : "Budgeting",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Theme.of(context).textTheme.caption!.color,
                        ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAll(LoginScreen());
                    },
                    child: Container(
                      height: 34,
                      width: 62,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppTheme.isLightTheme == false ? const Color(0xff52525C) : const Color(0xffF9F9FA),
                      ),
                      child: Center(
                        child: Text(
                          "Skip",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: AppTheme.isLightTheme == false ? Colors.white : const Color(0xff15141F),
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [
                    slideController.i.value == 0
                        ? SizedBox(
                            height: 130,
                            child: Text(
                              "Managing your money is about to get a lot better.",
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 32,
                                  ),
                            ),
                          )
                        : SizedBox(
                            height: 130,
                            child: Text(
                              "Spend smarter every day, all from one app. ",
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 32,
                                  ),
                            ),
                          ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 200,
                      child: PageView.builder(
                        controller: controller,
                        itemCount: pages.length,
                        onPageChanged: (slideIndex) {
                          slideController.i.value = slideIndex;
                        },
                        itemBuilder: (_, index) {
                          return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.transparent,
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              child: index == 0
                                  ? SizedBox(
                                      height: 232,
                                      // width: 232,
                                      child: Image.asset(
                                        AppTheme.isLightTheme == false ? DefaultImages.darkwc1 : DefaultImages.wc1,
                                        fit: BoxFit.fill,
                                      ))
                                  : SizedBox(
                                      height: 232,
                                      //  width: 280,
                                      child: Image.asset(
                                        AppTheme.isLightTheme == false ? DefaultImages.darkwc2 : DefaultImages.wc2,
                                        fit: BoxFit.fill,
                                      )));
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: pages.length,
                        effect: const ExpandingDotsEffect(
                          dotHeight: 8,

                          dotWidth: 10,
                          // strokeWidth: 5,
                        ),
                      ),
                    ),
                    //   const SizedBox(height: 30.0),
                  ],
                ),
              ),
              InkWell(
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Get.offAllNamed(AppRoutes.LOGIN);
                },
                child: customButton(
                    HexColor(AppTheme.primaryColorString!), "Login", HexColor(AppTheme.secondaryColorString!), context),
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Get.to(
                    () => VerifyPhoneScreen(),
                    binding: ProofBinding(),
                    transition: Transition.rightToLeft,
                    duration: const Duration(milliseconds: 500),
                  );
                },
                child: customButton(
                    AppTheme.isLightTheme == false ? const Color(0xff52525C) : const Color(0xffF5F7FE),
                    "Create an account",
                    AppTheme.isLightTheme == false ? Colors.white : HexColor(AppTheme.primaryColorString!),
                    context),
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom + 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
