import 'package:flutter/material.dart';
import 'package:sipera_app/shared/theme.dart';
import 'package:get/get.dart';
import 'package:sipera_app/ui/widgets/achievement_tile.dart';

class DetailAchievement extends StatelessWidget {
  DetailAchievement({
    Key? key,
    required this.achieveName,
    required this.bornPlace,
    required this.category,
    required this.date,
    required this.imageUrlAchieve,
    required this.imageUrlAtlet,
    required this.name,
  }) : super(key: key);

  final String imageUrlAchieve;
  final String imageUrlAtlet;
  final String achieveName;
  final String name;
  final String category;
  final String date;
  final String bornPlace;

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
              child: Stack(
                children: [
                  FadeInImage(
                      width: Get.width,
                      height: Get.height * 0.4,
                      fadeInCurve: Curves.easeInExpo,
                      fadeOutCurve: Curves.easeOutExpo,
                      placeholder: AssetImage("assets/noimage_portrait.png"),
                      image: NetworkImage('${imageUrlAchieve}'),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/noimage_portrait.png",
                          fit: BoxFit.cover,
                        );
                      },
                      fit: BoxFit.cover),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding:
                          EdgeInsets.only(top: Get.height * 0.04, left: 22),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${achieveName}',
                            style: whiteTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: semiBold,
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            '${category}',
                            style: whiteTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
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
                        'Atlet Berprestasi',
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      AchievementTile(
                        title: '${name}',
                        born: '${bornPlace}, ${date}',
                        imagePeople: '${imageUrlAtlet}',
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
