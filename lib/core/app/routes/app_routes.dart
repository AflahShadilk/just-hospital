import 'package:get/get.dart';
import 'package:justhospital/controllers/login_controller.dart';
import 'package:justhospital/controllers/register_controller.dart';
import 'package:justhospital/views/auth/login_view.dart';
import 'package:justhospital/views/auth/register_view.dart';
import 'package:justhospital/views/home/home_view.dart';
import 'package:justhospital/views/splash/splash_view.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';

  static List<GetPage> pages = [
    GetPage(
      name: splash,
      page: () => const SplashView(),
    ),
    GetPage(
      name: login,
      page: () => const LoginView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginController>(
          () => LoginController(),
        );
      }),
    ),
    GetPage(
      name: register,
      page: () => const RegisterView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RegisterController>(
          () => RegisterController(),
        );
      }),
    ),
    GetPage(
      name: home,
      page: () => const HomeView(),
    ),
  ];
}
