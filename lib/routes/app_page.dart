import 'package:get/get.dart';
import 'package:sipera_app/bindings/on_board_b.dart';
import 'package:sipera_app/routes/route_names.dart';
import 'package:sipera_app/ui/pages/graphic_achievement.dart';
import 'package:sipera_app/ui/pages/graphic_atlet.dart';
import 'package:sipera_app/ui/pages/graphic_total.dart';
import 'package:sipera_app/ui/pages/home_admin.dart';
import 'package:sipera_app/ui/pages/main_page.dart';
import 'package:sipera_app/ui/pages/on_boarding_page.dart';
import 'package:sipera_app/ui/pages/splash_page.dart';
import 'package:sipera_app/ui/pages/statistic_atlet_admin.dart';
import 'package:sipera_app/ui/pages/statistic_fasilitas_admin.dart';
import 'package:sipera_app/ui/pages/statistic_pelatih_admin.dart';
import 'package:sipera_app/ui/pages/statistic_prestasi_admin.dart';
import '../ui/pages/login_page.dart';
import '../ui/pages/statistic_guru_admin.dart';

import '../ui/pages/statistic_wasit_admin.dart';

class AppPage {
  static final listPage = [
    GetPage(
      name: RouteName.splashPage,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: RouteName.onBoarding,
      page: () => OnBoardingPage(),
      binding: OnBoardingB(),
    ),
    GetPage(
      name: RouteName.loginPage,
      page: () => LoginPage(),
      bindings: [
        OnBoardingB(),
      ],
    ),
    GetPage(
      name: RouteName.mainPage,
      page: () => MainPage(),
    ),
    GetPage(
      name: RouteName.homeAdmin,
      page: () => HomeAdmin(),
    ),
    GetPage(
      name: RouteName.statisticAtletAdmin,
      page: () => StatisticAtletAdmin(),
    ),
    GetPage(
      name: RouteName.statisticPelatihAdmin,
      page: () => StatisticPelatihAdmin(),
    ),
    GetPage(
      name: RouteName.statisticWasitAdmin,
      page: () => StatisticWasitAdmin(),
    ),
    GetPage(
      name: RouteName.statisticGuruAdmin,
      page: () => StatisticGuruAdmin(),
    ),
    GetPage(
      name: RouteName.statisticFasilitasAdmin,
      page: () => StatisticFasilitasAdmin(),
    ),
    GetPage(
      name: RouteName.statisticPrestasiAdmin,
      page: () => StatisticAdminPrestasi(),
    ),
    GetPage(
      name: RouteName.graphicAtlet,
      page: () => GraphicAtlet(),
    ),
    GetPage(
      name: RouteName.graphicAchievement,
      page: () => GraphicAchievement(),
    ),
    GetPage(
      name: RouteName.graphicTotal,
      page: () => GraphicTotal(),
    ),
  ];
}
