import 'package:flutter/material.dart';
import 'package:sipera_app/controllers/public_controller.dart';
import 'package:sipera_app/routes/route_names.dart';
import 'package:sipera_app/shared/theme.dart';
import 'package:sipera_app/ui/widgets/card_achievement.dart';
import 'package:sipera_app/ui/widgets/card_news.dart';
import 'package:get/get.dart';

import '../detail_achievement_page.dart';
import '../detail_news_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final publicC = Get.find<PublicController>();

  @override
  Widget build(BuildContext context) {
    Widget iconHeader({required String total, required String title}) {
      return Container(
        width: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: whiteC,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xffC4C4C4), width: 1),
              ),
              child: Center(
                child: Text(
                  '${total}',
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(
                fontSize: 10,
                fontWeight: medium,
              ),
            )
          ],
        ),
      );
    }

    Widget title(String text) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
        child: Text(
          text,
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 13,
          ),
          title('Statistik'),
          Container(
            margin: EdgeInsets.fromLTRB(22, 0, 22, 0),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            width: double.infinity,
            decoration: cardShadow().copyWith(color: whiteC),
            child: Obx(
              () {
                if (publicC.statisticStatus.isTrue) {
                  if (publicC.statisticResult != null) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        iconHeader(
                          total:
                              '${publicC.statisticResult!.value.results!.atlet}',
                          title: 'Atlet',
                        ),
                        iconHeader(
                          total:
                              '${publicC.statisticResult!.value.results!.pelatih}',
                          title: 'Pelatih',
                        ),
                        iconHeader(
                          total:
                              '${publicC.statisticResult!.value.results!.guru}',
                          title: 'Guru Olahraga',
                        ),
                        iconHeader(
                          total:
                              '${publicC.statisticResult!.value.results!.wasit}',
                          title: 'Wasit',
                        ),
                      ],
                    );
                  } else {
                    return SizedBox();
                  }
                } else {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: LinearProgressIndicator(
                        color: greenCA,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      );
    }

    Widget latestNews() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          title('Berita Terkini'),
          Obx(
            () {
              if (publicC.articleStatus.isTrue) {
                if (publicC.articleResult!.value.results!.allArtikel!.data!
                    .isNotEmpty) {
                  return ConstrainedBox(
                    constraints:
                        BoxConstraints(maxHeight: 300, maxWidth: Get.width),
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      padding: EdgeInsets.only(left: 22, top: 4, bottom: 5),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return CardNews(
                          onTap: () {
                            Get.to(
                              () => DetailNews(
                                  date:
                                      '${publicC.listArticle![index].tanggal!.split('-').reversed.join('/')}}',
                                  id: publicC.listArticle![index].id!,
                                  description:
                                      '${publicC.listArticle![index].isiArtikel}',
                                  imageUrl:
                                      '${publicC.listArticle![index].imgArtikel}',
                                  title:
                                      '${publicC.listArticle![index].judul}'),
                            );
                          },
                          imageUrl: '${publicC.listArticle![index].imgArtikel}',
                          date: '${publicC.listArticle![index].tanggal}',
                          title: '${publicC.listArticle![index].judul}',
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      'Tidak Ada Berita',
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: greenCB,
                  ),
                );
              }
            },
          ),
        ],
      );
    }

    Widget newAchievement() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          title(
            'Prestasi Terbaru',
          ),
          Obx(
            () {
              if (publicC.achievementStatus.isTrue) {
                if (publicC.achievementResult!.value.results!.prestasi!.data!
                    .isNotEmpty) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return CardAchievement(
                        imageUrl: '${publicC.listAchievement![index].foto}',
                        title:
                            '${publicC.listAchievement![index].namaPrestasi}',
                        name:
                            '${publicC.listAchievement![index].cabor!.namaCabor}',
                        onTap: () {
                          Get.to(
                            () => DetailAchievement(
                              achieveName:
                                  '${publicC.listAchievement![index].namaPrestasi}',
                              bornPlace:
                                  '${publicC.listAchievement![index].atlet!.tempatLahir}',
                              name:
                                  '${publicC.listAchievement![index].atlet!.nama}',
                              imageUrlAchieve:
                                  '${publicC.listAchievement![index].foto}',
                              imageUrlAtlet:
                                  '${publicC.listAchievement![index].atlet!.foto}',
                              date:
                                  '${publicC.listAchievement![index].atlet!.tanggalLahir!.split('-').reversed.join('/')}',
                              category:
                                  '${publicC.listAchievement![index].cabor!.namaCabor}',
                            ),
                          );
                        },
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text(
                      'Tidak Ada Berita',
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: greenCB,
                  ),
                );
              }
            },
          ),
        ],
      );
    }

    return SafeArea(
      child: RefreshIndicator(
        color: greenCB,
        onRefresh: () async {
          Get.dialog(
            Center(
              child: CircularProgressIndicator(
                color: greenCB,
              ),
            ),
            barrierDismissible: false,
          );
          await publicC.fetchAllData();

          if (publicC.isDone.isTrue) {
            Get.back();
          } else {
            Get.defaultDialog(
              barrierDismissible: false,
              title: 'Gagal!!',
              titleStyle:
                  blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
              titlePadding: EdgeInsets.only(top: 15, bottom: 20),
              radius: 10,
              contentPadding: EdgeInsets.symmetric(horizontal: 22),
              content: Column(
                children: [
                  Image.asset(
                    'assets/failed.png',
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Silakan cek kembali data yang anda masukkan',
                    textAlign: TextAlign.center,
                    style: greyTextStyle.copyWith(fontSize: 13),
                  ),
                ],
              ),
              confirm: Container(
                margin: EdgeInsets.only(bottom: 15),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: buttonStyle().copyWith(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 13),
                    ),
                  ),
                  child: Text(
                    'Oke!!',
                    style: whiteTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            );
          }
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              latestNews(),
              newAchievement(),
            ],
          ),
        ),
      ),
    );
  }
}
