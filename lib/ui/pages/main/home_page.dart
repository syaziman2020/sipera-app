import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sipera_app/controllers/public_controller.dart';
import 'package:sipera_app/shared/theme.dart';
import 'package:sipera_app/ui/widgets/card_achievement.dart';
import 'package:sipera_app/ui/widgets/card_news.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../detail_achievement_page.dart';
import '../detail_news_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  CarouselController carouselController = CarouselController();
  final publicC = Get.find<PublicController>();
  int indexSlider = -1;
  @override
  Widget build(BuildContext context) {
    Widget iconHeader({required String total, required String title}) {
      return SizedBox(
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
                border: Border.all(color: const Color(0xffC4C4C4), width: 1),
              ),
              child: Center(
                child: Text(
                  '$total',
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
            margin: const EdgeInsets.fromLTRB(22, 0, 22, 0),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
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
                    return const SizedBox();
                  }
                } else {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              highlightColor: whiteC,
                              baseColor: const Color(0xffE1E1E1),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: whiteC,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: const Color(0xffC4C4C4), width: 1),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Shimmer.fromColors(
                              baseColor: const Color(0xffE1E1E1),
                              highlightColor: whiteC,
                              child: Container(
                                width: 30,
                                height: 10,
                                color: const Color(0xffE1E1E1),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              highlightColor: whiteC,
                              baseColor: const Color(0xffE1E1E1),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: whiteC,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: const Color(0xffC4C4C4), width: 1),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Shimmer.fromColors(
                              baseColor: const Color(0xffE1E1E1),
                              highlightColor: whiteC,
                              child: Container(
                                width: 30,
                                height: 10,
                                color: const Color(0xffE1E1E1),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              highlightColor: whiteC,
                              baseColor: const Color(0xffE1E1E1),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: whiteC,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: const Color(0xffC4C4C4), width: 1),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Shimmer.fromColors(
                              baseColor: const Color(0xffE1E1E1),
                              highlightColor: whiteC,
                              child: Container(
                                width: 30,
                                height: 10,
                                color: const Color(0xffE1E1E1),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              highlightColor: whiteC,
                              baseColor: const Color(0xffE1E1E1),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: whiteC,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: const Color(0xffC4C4C4), width: 1),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Shimmer.fromColors(
                              baseColor: const Color(0xffE1E1E1),
                              highlightColor: whiteC,
                              child: Container(
                                width: 30,
                                height: 10,
                                color: const Color(0xffE1E1E1),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
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
                      physics: const ClampingScrollPhysics(),
                      padding:
                          const EdgeInsets.only(left: 22, top: 4, bottom: 5),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return CardNews(
                          onTap: () {
                            Get.to(
                              () => DetailNews(
                                  date:
                                      '${DateFormat("d MMMM yyyy").format(DateTime.parse(publicC.listArticle![index].tanggal!))}',
                                  id: publicC.listArticle![index].id!,
                                  description:
                                      '${publicC.listArticle![index].isiArtikel}',
                                  imageUrl:
                                      '${publicC.listArticle![index].imgArtikel}',
                                  title:
                                      '${publicC.listArticle![index].judul}'),
                            );
                          },
                          imageUrl:
                              '${(publicC.listArticle![index].imgArtikel)}',
                          date:
                              '${publicC.listArticle![index].tanggal!.split('-').reversed.join('/')}',
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
                return ConstrainedBox(
                  constraints:
                      BoxConstraints(maxHeight: 300, maxWidth: Get.width),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 22, top: 4, bottom: 5),
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 250,
                          height: 295,
                          margin: const EdgeInsets.only(right: 20),
                          padding: const EdgeInsets.all(10),
                          decoration: cardShadow().copyWith(
                            boxShadow: [
                              BoxShadow(
                                color: blackC.withOpacity(0.25),
                                offset: const Offset(1, 1),
                                blurRadius: 4,
                                spreadRadius: 1,
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Shimmer.fromColors(
                                baseColor: const Color(0xffe1e1e1),
                                highlightColor: whiteC,
                                child: Container(
                                  height: 163,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffe1e1e1),
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Shimmer.fromColors(
                                baseColor: const Color(0xffE1E1E1),
                                highlightColor: whiteC,
                                child: Container(
                                  width: 60,
                                  height: 14,
                                  color: const Color(0xffE1E1E1),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Shimmer.fromColors(
                                baseColor: const Color(0xffE1E1E1),
                                highlightColor: whiteC,
                                child: Container(
                                  width: 100,
                                  height: 14,
                                  color: const Color(0xffE1E1E1),
                                ),
                              ),
                              const Spacer(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Shimmer.fromColors(
                                    baseColor: const Color(0xffE1E1E1),
                                    highlightColor: whiteC,
                                    child: Container(
                                      width: 14,
                                      height: 14,
                                      color: const Color(0xffE1E1E1),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Shimmer.fromColors(
                                    baseColor: const Color(0xffE1E1E1),
                                    highlightColor: whiteC,
                                    child: Container(
                                      width: 60,
                                      height: 12,
                                      color: const Color(0xffE1E1E1),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 295,
                          margin: const EdgeInsets.only(right: 20),
                          padding: const EdgeInsets.all(10),
                          decoration: cardShadow().copyWith(
                            boxShadow: [
                              BoxShadow(
                                color: blackC.withOpacity(0.25),
                                offset: const Offset(1, 1),
                                blurRadius: 4,
                                spreadRadius: 1,
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Shimmer.fromColors(
                                baseColor: const Color(0xffe1e1e1),
                                highlightColor: whiteC,
                                child: Container(
                                  height: 163,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffe1e1e1),
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Shimmer.fromColors(
                                baseColor: const Color(0xffE1E1E1),
                                highlightColor: whiteC,
                                child: Container(
                                  width: 60,
                                  height: 14,
                                  color: const Color(0xffE1E1E1),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Shimmer.fromColors(
                                baseColor: const Color(0xffE1E1E1),
                                highlightColor: whiteC,
                                child: Container(
                                  width: 80,
                                  height: 14,
                                  color: const Color(0xffE1E1E1),
                                ),
                              ),
                              const Spacer(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Shimmer.fromColors(
                                    baseColor: const Color(0xffE1E1E1),
                                    highlightColor: whiteC,
                                    child: Container(
                                      width: 14,
                                      height: 14,
                                      color: const Color(0xffE1E1E1),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Shimmer.fromColors(
                                    baseColor: const Color(0xffE1E1E1),
                                    highlightColor: whiteC,
                                    child: Container(
                                      width: 60,
                                      height: 12,
                                      color: const Color(0xffE1E1E1),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
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
          Obx(() {
            if (publicC.achievementStatus.isTrue) {
              if (publicC.achievementResult!.value.results!.prestasi!.data!
                  .isNotEmpty) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return CardAchievement(
                      imageUrl: '${publicC.listAchievement![index].foto}',
                      title: '${publicC.listAchievement![index].namaPrestasi}',
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
                    'Tidak Ada Prestasi',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                  ),
                );
              }
            } else {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.fromLTRB(22, 0, 22, 10),
                      padding: const EdgeInsets.all(9),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color(0xffE0E0E0), width: 1),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 52,
                            height: 56,
                            decoration: BoxDecoration(
                              color: const Color(0xffe1e1e1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Shimmer.fromColors(
                                baseColor: const Color(0xffE1E1E1),
                                highlightColor: whiteC,
                                child: Container(
                                  width: 120,
                                  height: 12,
                                  color: const Color(0xffE1E1E1),
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Shimmer.fromColors(
                                baseColor: const Color(0xffE1E1E1),
                                highlightColor: whiteC,
                                child: Container(
                                  width: 60,
                                  height: 10,
                                  color: const Color(0xffE1E1E1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            }
          }),
        ],
      );
    }

    Widget indicator(int index) {
      print('ini indicator ${publicC.indexSlider}');
      return Container(
        margin: EdgeInsets.only(right: 6),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: (index == publicC.indexSlider)
                ? greenCA
                : greenCC.withOpacity(0.5),
            shape: BoxShape.circle),
      );
    }

    Widget sliderCard() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Obx(() {
            if (publicC.sliderStatus.isTrue) {
              if (publicC.listSlider!.isNotEmpty) {
                return CarouselSlider(
                  items: [
                    ...publicC.listSlider!.map((e) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 22),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(2, 5),
                                blurRadius: 5,
                                spreadRadius: 0,
                                color: blackC.withOpacity(0.1),
                              )
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage(
                              width: double.infinity,
                              height: double.infinity,
                              fadeInCurve: Curves.easeInExpo,
                              fadeOutCurve: Curves.easeOutExpo,
                              placeholder: const AssetImage(
                                  "assets/no_image_available.webp"),
                              image: NetworkImage('${e.imgSlider}'),
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  "assets/no_image_available.webp",
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                );
                              },
                              fit: BoxFit.cover),
                        ),
                      );
                    }).toList(),
                  ],
                  carouselController: carouselController,
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      print('ini index $index');
                      publicC.indexSlider.value = index;
                      indexSlider = index;
                    },
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    aspectRatio: 2,
                    initialPage: 2,
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    'Data tidak ditemukan',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                );
              }
            } else {
              return CarouselSlider(
                items: [
                  Shimmer.fromColors(
                    baseColor: const Color(0xffE1E1E1),
                    highlightColor: whiteC,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 22),
                      decoration: BoxDecoration(
                        color: const Color(0xffE1E1E1),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 5,
                            spreadRadius: 0,
                            color: blackC.withOpacity(0.1),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
                carouselController: carouselController,
                options: CarouselOptions(
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  aspectRatio: 2,
                  initialPage: 0,
                ),
              );
            }
          }),
          SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Obx(() {
              if (publicC.sliderStatus.isTrue) {
                if (publicC.listSlider!.isNotEmpty) {
                  return Row(
                    children: [
                      ...publicC.listSlider!.map((e) {
                        if (indexSlider < publicC.listSlider!.length) {
                          indexSlider++;
                          print(indexSlider);
                        } else {
                          indexSlider = 0;
                        }
                        return indicator(0);
                      }).toList(),
                    ],
                  );
                } else {
                  return SizedBox();
                }
              } else {
                return Container(
                  margin: EdgeInsets.only(right: 6),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      color: greenCC.withOpacity(0.5), shape: BoxShape.circle),
                );
              }
            }),
          ),
        ],
      );
    }

    return SafeArea(
      child: RefreshIndicator(
        color: greenCB,
        onRefresh: () async {
          await publicC.fetchAllData();

          if (publicC.isDone.isTrue) {
          } else {
            Get.defaultDialog(
              barrierDismissible: false,
              title: 'Gagal!!',
              titleStyle:
                  blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
              titlePadding: const EdgeInsets.only(top: 15, bottom: 20),
              radius: 10,
              contentPadding: const EdgeInsets.symmetric(horizontal: 22),
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
                    'Periksa Koneksi Internet Anda',
                    textAlign: TextAlign.center,
                    style: greyTextStyle.copyWith(fontSize: 13),
                  ),
                ],
              ),
              confirm: Container(
                margin: const EdgeInsets.only(bottom: 15),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: buttonStyle().copyWith(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 13),
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
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              sliderCard(),
              latestNews(),
              newAchievement(),
            ],
          ),
        ),
      ),
    );
  }
}
