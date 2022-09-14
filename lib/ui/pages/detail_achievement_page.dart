import 'package:flutter/material.dart';
import 'package:sipera_app/shared/theme.dart';
import 'package:get/get.dart';
import 'package:sipera_app/ui/widgets/achievement_tile.dart';

class DetailAchievement extends StatelessWidget {
  const DetailAchievement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteC,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://akcdn.detik.net.id/community/media/visual/2021/07/31/sprinter-lalu-muhammad-zohri.jpeg?w=700&q=90'),
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.only(top: Get.height * 0.04, left: 22),
                  width: double.infinity,
                  margin: EdgeInsets.only(top: Get.height * 0.26),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.0),
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.95),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ferdy Sambo',
                        style: whiteTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        'Bulu Tangkis',
                        style: whiteTextStyle,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 22, top: 32),
              child: Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: whiteC.withOpacity(0.7),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: blackC.withOpacity(0.25),
                            offset: Offset(1, 1),
                            spreadRadius: 1,
                            blurRadius: 1),
                      ],
                    ),
                    child: const Center(
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: Get.height * 0.38),
                Container(
                  padding: EdgeInsets.all(22),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: whiteC,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Prestasi',
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      AchievementTile(
                        title: 'Juara 1 lomba badminton',
                        level: 'Tingkat Desa',
                      ),
                      AchievementTile(
                        title: 'Juara 1 lomba badminton',
                        level: 'Tingkat Desa',
                      ),
                      AchievementTile(
                        title: 'Juara 1 lomba badminton',
                        level: 'Tingkat Desa',
                      ),
                      AchievementTile(
                        title: 'Juara 1 lomba badminton',
                        level: 'Tingkat Desa',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
