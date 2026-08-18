import 'package:get/get.dart';
import 'package:justhospital/views/home/home_view.dart';

class AppRoutes {
  AppRoutes._();

  static const String home = '/home';

  static List<GetPage> pages = [
    GetPage(
      name: home,
      page: () => const HomeView(),
    ),
  ];
}