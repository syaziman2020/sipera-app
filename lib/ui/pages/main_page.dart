import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sipera_app/controllers/main_controller.dart';
import 'package:sipera_app/shared/theme.dart';
import 'package:get/get.dart';
import 'package:sipera_app/ui/pages/main/event_page.dart';
import 'package:sipera_app/ui/pages/main/home_page.dart';
import 'package:sipera_app/ui/pages/main/news_page.dart';
import 'package:sipera_app/ui/pages/main/achievement_page.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final mainC = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    Widget content(int index) {
      switch (index) {
        case 0:
          return HomePage();
        case 1:
          return const AchievementPage();
        case 2:
          return const NewsPage();
        case 3:
          return const EventPage();
        default:
          return HomePage();
      }
    }

    Widget bottomNavbar() {
      return Obx(
        () {
          return Container(
            decoration: BoxDecoration(
              color: whiteC,
              boxShadow: [
                BoxShadow(
                    color: blackC.withOpacity(0.15),
                    offset: const Offset(0, -2),
                    blurRadius: 10),
              ],
            ),
            padding: const EdgeInsets.only(top: 14),
            child: SalomonBottomBar(
              margin: const EdgeInsets.fromLTRB(22, 0, 22, 15),
              currentIndex: mainC.currenIndex.value,
              onTap: (i) {
                mainC.currenIndex.value = i;
              },
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(
                    Icons.home_outlined,
                  ),
                  title: Text(
                    "Beranda",
                    style: noStyle.copyWith(fontSize: 13, color: greenCA),
                  ),
                  selectedColor: greenCB,
                  activeIcon: Icon(
                    Icons.home_outlined,
                    color: greenCA,
                  ),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.emoji_events_outlined),
                  title: Text(
                    "Prestasi",
                    style: noStyle.copyWith(fontSize: 13, color: greenCA),
                  ),
                  selectedColor: greenCB,
                  activeIcon: Icon(
                    Icons.emoji_events_outlined,
                    color: greenCA,
                  ),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.feed_outlined),
                  title: Text(
                    "Berita",
                    style: noStyle.copyWith(fontSize: 13, color: greenCA),
                  ),
                  selectedColor: greenCB,
                  activeIcon: Icon(
                    Icons.feed_outlined,
                    color: greenCA,
                  ),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.event_available),
                  title: Text(
                    "Agenda",
                    style: noStyle.copyWith(fontSize: 13, color: greenCA),
                  ),
                  selectedColor: greenCB,
                  activeIcon: Icon(
                    Icons.event_available,
                    color: greenCA,
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: whiteC,
      body: Obx(
        () {
          return content(mainC.currenIndex.value);
        },
      ),
      bottomNavigationBar: bottomNavbar(),
    );
  }
}
