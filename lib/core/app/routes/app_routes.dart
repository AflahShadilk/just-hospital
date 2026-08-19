import 'package:get/get.dart';
import 'package:justhospital/views/home/home_view.dart';
import 'package:justhospital/views/splash/splash_view.dart';

class AppRoutes {
  AppRoutes._();
  
  static const String splash = '/splash';
  static const String home = '/home';

  static List<GetPage> pages = [
    GetPage(
      name: splash,
      page: () => const SplashView(),
    ),
    GetPage(
      name: home,
      page: () => const HomeView(),
    ),
  ];
}