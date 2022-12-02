import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pika/src/res/images.dart';
import 'package:pika/src/res/textstyle.dart';
import 'package:pika/src/ui/splash/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() => WelcomeFirstScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            color: AppTheme.isLightTheme == false ? HexColor('#15141F') : HexColor(AppTheme.primaryColorString!)),
        child: Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: SvgPicture.asset(DefaultImages.logo, color: HexColor(AppTheme.secondaryColorString!)),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  height: 40,
                  width: 130,
                  child: SvgPicture.asset(DefaultImages.text, color: HexColor(AppTheme.secondaryColorString!)),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 48, right: 48, bottom: 20),
              child: Text(
                "FinPay is a financial platform to manage your business and money.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: const Color(0xffDCDBE0),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
