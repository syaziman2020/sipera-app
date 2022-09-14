import 'package:get/get.dart';
import 'package:sipera_app/bindings/main_b.dart';
import 'package:sipera_app/bindings/on_board_b.dart';
import 'package:sipera_app/bindings/splash_b.dart';
import 'package:sipera_app/routes/route_names.dart';
import 'package:sipera_app/ui/pages/detail_achievement_page.dart';
import 'package:sipera_app/ui/pages/detail_event_page.dart';
import 'package:sipera_app/ui/pages/detail_news_page.dart';
import 'package:sipera_app/ui/pages/main_page.dart';
import 'package:sipera_app/ui/pages/on_boarding_page.dart';
import 'package:sipera_app/ui/pages/splash_page.dart';

import '../ui/pages/login_page.dart';
import '../ui/pages/statistic_page.dart';

class AppPage {
  static final listPage = [
    GetPage(
      name: RouteName.splashPage,
      page: () => SplashPage(),
      binding: SplashB(),
    ),
    GetPage(
      name: RouteName.onBoarding,
      page: () => OnBoardingPage(),
      binding: OnBoardingB(),
    ),
    GetPage(
      name: RouteName.loginPage,
      page: () => LoginPage(),
      binding: OnBoardingB(),
    ),
    GetPage(
      name: RouteName.mainPage,
      page: () => MainPage(),
      binding: MainB(),
    ),
    GetPage(
      name: RouteName.statisticPage,
      page: () => StatisticPage(),
    ),
    GetPage(
      name: RouteName.detailAchievement,
      page: () => DetailAchievement(),
    ),
    GetPage(
      name: RouteName.detailNews,
      page: () => DetailNews(),
    ),
    GetPage(
      name: RouteName.detailEvent,
      page: () => DetailEvent(),
    ),
  ];
}
