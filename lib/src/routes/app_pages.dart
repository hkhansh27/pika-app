import 'package:get/get.dart';
import 'package:pika/src/ui/proof/proof_binding.dart';
import 'package:pika/src/ui/proof/residency_proof_screen.dart';
import 'package:pika/src/ui/splash/splash.dart';

import '../ui/home/home.dart';
import '../ui/login/login.dart';
import '../ui/register/register.dart';
import '../ui/otp/otp.dart';
import '../ui/ekyc/ekyc.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashScreen(),
      binding: ProofBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.OTP,
      page: () => OtpPage(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: AppRoutes.EKYC,
      page: () => VerifyIdentityScreen(),
      binding: ProofBinding(),
    ),
  ];
}
