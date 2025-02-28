import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipera_app/controllers/auth_controller.dart';
import 'package:sipera_app/controllers/on_boarding_controller.dart';
import 'package:sipera_app/controllers/public_controller.dart';
import 'package:sipera_app/routes/route_names.dart';
import 'package:sipera_app/shared/theme.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../widgets/custom_button.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({Key? key}) : super(key: key);

  final List<String> imageUrl = [
    'assets/onboard1.png',
    'assets/onboard2.png',
    'assets/onboard3.png',
  ];

  final List<dynamic> text = [
    [
      'Gak perlu ribet mengakses statistik atlet dan prestasi!',
      'Dengan SIPERA, info deretan prestasi dan jumlah atlet bisa dilihat'
    ],
    [
      'Gak perlu ribet mencari info olah raga!',
      'Dengan SIPERA, kamu bisa mengakses info dengan Ponsel Pintar kamu'
    ],
    [
      'Berita terkini dan agenda olah raga ada digenggaman kamu',
      'Yuk, gabung sekarang dan pakai aplikasi nya!'
    ]
  ];

  final storage = new FlutterSecureStorage();

  int index = -1;
  CarouselController carouselController = CarouselController();

  final onBoardC = Get.find<OnBoardingController>();
  final publicC = Get.find<PublicController>();
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    Widget indicator(int index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.5),
        width: (index == onBoardC.curentIndex.value) ? 12 : 10,
        height: (index == onBoardC.curentIndex.value) ? 12 : 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: (index == onBoardC.curentIndex.value) ? greenCA : greenCC,
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteC,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    onBoardC.curentIndex.value = index;
                  },
                ),
                items: imageUrl.map((e) {
                  return Image.asset(
                    e,
                    width: Get.width * 0.6,
                  );
                }).toList(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.15),
                child: Obx(
                  () => Column(
                    children: [
                      Text(
                        (index == onBoardC.curentIndex.value)
                            ? text[0][0]
                            : (index == onBoardC.curentIndex.value + 1)
                                ? text[1][0]
                                : text[2][0],
                        textAlign: TextAlign.center,
                        style: greenTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        (index == onBoardC.curentIndex.value)
                            ? text[0][1]
                            : (index == onBoardC.curentIndex.value + 1)
                                ? text[1][1]
                                : text[2][1],
                        textAlign: TextAlign.center,
                        style: greyTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
              child: Obx(
                () {
                  if (imageUrl.length - 1 == onBoardC.curentIndex.value) {
                    return Column(
                      children: [
                        CustomButton(
                          title: "Mulai Sekarang",
                          onTap: () async {
                            Get.toNamed(RouteName.mainPage);
                            publicC.fetchAllData().then((value) {
                              if (publicC.isDone.isFalse) {
                                Get.defaultDialog(
                                  barrierDismissible: false,
                                  title: 'Gagal!!',
                                  titleStyle: blackTextStyle.copyWith(
                                      fontWeight: semiBold, fontSize: 18),
                                  titlePadding: const EdgeInsets.only(
                                      top: 15, bottom: 20),
                                  radius: 10,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 22),
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
                                        'Pastikan koneksi internet anda stabil',
                                        textAlign: TextAlign.center,
                                        style: greyTextStyle.copyWith(
                                            fontSize: 13),
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
                                          const EdgeInsets.symmetric(
                                              vertical: 13),
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
                            });
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          onTap: () async {
                            String? value = await storage.read(key: 'save');
                            if (value != null) {
                              Get.offAllNamed(RouteName.homeAdmin);
                            } else {
                              Get.toNamed(RouteName.loginPage);
                            }
                          },
                          child: Text(
                            'Masuk Sebagai Admin',
                            style: greenTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: medium,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          onTap: () {
                            carouselController.jumpToPage(imageUrl.length - 1);
                          },
                          child: Text(
                            'Lewati',
                            style: greenTextStyle.copyWith(
                              fontSize: 13,
                              fontWeight: medium,
                            ),
                          ),
                        ),
                        Obx(
                          () => Row(
                            children: imageUrl.map((e) {
                              if (index < 2) {
                                index++;
                              } else {
                                index = 0;
                              }
                              return indicator(index);
                            }).toList(),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            carouselController.nextPage();
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                            color: greenCA,
                          ),
                        )
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
