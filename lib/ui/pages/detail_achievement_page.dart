import 'package:flutter/material.dart';
import 'package:sipera_app/controllers/public_controller.dart';
import 'package:sipera_app/models/public/achievement_model.dart';
import 'package:sipera_app/shared/theme.dart';
import 'package:get/get.dart';
import 'package:sipera_app/ui/widgets/achievement_tile.dart';

class DetailAchievement extends StatelessWidget {
  DetailAchievement({
    Key? key,
    required this.link,
    required this.achieveName,
    required this.category,
    required this.imageUrlAchieve,
    required this.listPrestasiAtlet,
    required this.first,
    required this.second,
    required this.third,
  }) : super(key: key);

  final String imageUrlAchieve;
  final String link;
  final String achieveName;
  final String first;
  final String second;
  final String third;
  final List<PrestasiAtlet> listPrestasiAtlet;

  final String category;

  final publicC = Get.find<PublicController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteC,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: Get.width,
              height: Get.height * 0.4,
              child: Stack(
                children: [
                  FadeInImage(
                      width: Get.width,
                      height: Get.height * 0.4,
                      fadeInCurve: Curves.easeInExpo,
                      fadeOutCurve: Curves.easeOutExpo,
                      placeholder:
                          const AssetImage("assets/noimage_portrait.png"),
                      image: NetworkImage('$imageUrlAchieve'),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          "assets/noimage_portrait.png",
                          fit: BoxFit.cover,
                        );
                      },
                      fit: BoxFit.cover),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.only(left: 22),
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
                      child: Center(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '$achieveName',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: semiBold,
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                '$category',
                                style: whiteTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, top: 32),
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
                            offset: const Offset(1, 1),
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * 0.38),
                Container(
                  padding: const EdgeInsets.all(22),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: whiteC,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/first.png',
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  first,
                                  style: greyTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: medium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/second.png',
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  second,
                                  style: greyTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: medium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/third.png',
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  third,
                                  style: greyTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: medium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      (listPrestasiAtlet.isEmpty || listPrestasiAtlet == null)
                          ? const SizedBox()
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...listPrestasiAtlet.map(
                                  (e) => AchievementTile(
                                    kelamin: '${e.atlet?.jenisKelamin ?? 0}',
                                    title: '${e.atlet?.nama ?? '-'}',
                                    born:
                                        '${e.atlet?.tempatLahir ?? '-'}, ${e.atlet?.tanggalLahir!.split('-').reversed.join('/') ?? '-'}',
                                    imagePeople:
                                        '$link${e.atlet?.foto ?? 'https://cdn-icons-png.flaticon.com/512/3112/3112993.png'}',
                                  ),
                                ),
                              ],
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
