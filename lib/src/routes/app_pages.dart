import 'package:get/get.dart';
import 'package:pika/src/ui/proof/proof_binding.dart';
import 'package:pika/src/ui/splash/splash.dart';
import 'package:pika/src/ui/tab_screen.dart';

import '../ui/home/home.dart';
import '../ui/login/login.dart';
import '../ui/notifications/notification_binding.dart';
import '../ui/otp/otp.dart';
import '../ui/profile/profile_binding.dart';
import '../ui/register/register.dart';
import '../ui/chat/chat.dart';

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
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => TabScreen(),
      bindings: [
        HomeBinding(),
        ProfileBinding(),
        NotificationsBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () => RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.OTP,
      page: () => OtpScreen(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: AppRoutes.FINGERPRINT,
      page: () => FingerPrintScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.EKYC,
      page: () => VerifyIdentityScreen(),
      binding: ProofBinding(),
    ),
    GetPage(
      name: AppRoutes.TRANSFER_SUCCESS,
      page: () => TransferSucessScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.TOPUP_SUCCESS,
      page: () => TopUpSucessScreen(),
      binding: HomeBinding(),
    ),
  ];
}
