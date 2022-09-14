import 'package:flutter/material.dart';
import 'package:sipera_app/routes/route_names.dart';
import 'package:sipera_app/ui/widgets/button_filter.dart';
import 'package:sipera_app/ui/widgets/form_search.dart';
import 'package:get/get.dart';

import '../../widgets/card_achievement.dart';

class AchievementPage extends StatelessWidget {
  AchievementPage({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchForm(controller: searchController),
          SingleChildScrollView(
            padding: EdgeInsets.only(left: 22, bottom: 10),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ButtonFilter(
                  title: 'Semua',
                  status: true,
                ),
                ButtonFilter(
                  title: 'Bulu Tangkis',
                ),
                ButtonFilter(
                  title: 'Sepak Bola',
                ),
                ButtonFilter(
                  title: 'Voli',
                ),
              ],
            ),
          ),
          CardAchievement(
            imageUrl:
                'https://img.okezone.com/content/2022/05/01/40/2588056/hasil-final-badminton-asia-championship-2022-wang-zhiyi-juara-usai-kalahkan-akane-yamaguchi-e2JTQH95sl.jpg',
            title: 'Juara 1 Lomba Badminton',
            name: 'Ferdy Sambo',
            onTap: () {
              Get.toNamed(RouteName.detailAchievement);
            },
          ),
          CardAchievement(
            imageUrl:
                'https://img.okezone.com/content/2022/05/01/40/2588056/hasil-final-badminton-asia-championship-2022-wang-zhiyi-juara-usai-kalahkan-akane-yamaguchi-e2JTQH95sl.jpg',
            title: 'Juara 1 Lomba Badminton',
            name: 'Ferdy Sambo',
            onTap: () {},
          ),
          CardAchievement(
            imageUrl:
                'https://img.okezone.com/content/2022/05/01/40/2588056/hasil-final-badminton-asia-championship-2022-wang-zhiyi-juara-usai-kalahkan-akane-yamaguchi-e2JTQH95sl.jpg',
            title: 'Juara 1 Lomba Badminton',
            name: 'Ferdy Sambo',
            onTap: () {},
          ),
          CardAchievement(
            imageUrl:
                'https://img.okezone.com/content/2022/05/01/40/2588056/hasil-final-badminton-asia-championship-2022-wang-zhiyi-juara-usai-kalahkan-akane-yamaguchi-e2JTQH95sl.jpg',
            title: 'Juara 1 Lomba Badminton',
            name: 'Ferdy Sambo',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
