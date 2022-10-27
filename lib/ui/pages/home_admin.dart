import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipera_app/controllers/auth_controller.dart';
import 'package:sipera_app/routes/route_names.dart';
import 'package:sipera_app/shared/theme.dart';
import 'package:sipera_app/ui/widgets/card_home_admin.dart.dart';

class HomeAdmin extends StatelessWidget {
  HomeAdmin({Key? key}) : super(key: key);

  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    Widget title(String text) {
      return Text(
        text,
        style: blackTextStyle.copyWith(
          fontSize: 18,
          fontWeight: semiBold,
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteC,
      appBar: AppBar(
        backgroundColor: whiteC,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              splashRadius: 25,
              onPressed: () {
                Get.defaultDialog(
                  radius: 10,
                  titlePadding: const EdgeInsets.all(0),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 22),
                  title: '',
                  content: Column(
                    children: [
                      const Icon(
                        Icons.logout,
                        size: 40,
                        color: Color(0xffEB5757),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Logout dari Admin?',
                        style: blackTextStyle.copyWith(
                          fontWeight: bold,
                          color: const Color(0xffEB5757),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Anda harus login kembali untuk akses admin',
                        textAlign: TextAlign.center,
                        style: greyTextStyle.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                  confirm: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    width: Get.width / 2 - 70,
                    child: ElevatedButton(
                      onPressed: () async {
                        Get.dialog(
                          Center(
                            child: CircularProgressIndicator(
                              color: greenCB,
                            ),
                          ),
                          barrierDismissible: false,
                        );
                        final result = await authC.logoutController();
                        Get.back();

                        if (result == true) {
                          Get.offAllNamed(RouteName.onBoarding);
                        }
                      },
                      style: buttonStyle().copyWith(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 12),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xffEB5757),
                        ),
                        elevation: MaterialStateProperty.all(0),
                      ),
                      child: Text(
                        'Ya',
                        style: whiteTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                  ),
                  cancel: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    width: Get.width / 2 - 70,
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Tidak',
                        style: greyTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.logout,
                color: blackC,
              ),
            ),
          )
        ],
        title: Obx(() {
          if (authC.userLogin?.value != null) {
            return Text(
              'Halo ${authC.userLogin?.value.results?.name}',
              style: blackTextStyle.copyWith(fontWeight: semiBold),
            );
          }
          return const SizedBox();
        }),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 26, 22, 10),
                child: title('Statistik'),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 22),
                crossAxisCount: 3,
                crossAxisSpacing: 21,
                mainAxisSpacing: 2,
                childAspectRatio: 0.65,
                children: [
                  CardHomeAdmin(
                    imageUrl: 'assets/athlete.png',
                    title: 'Atlet',
                    onTap: () {
                      Get.toNamed(RouteName.statisticAtletAdmin);
                    },
                  ),
                  CardHomeAdmin(
                    onTap: () {
                      Get.toNamed(RouteName.statisticPelatihAdmin);
                    },
                    imageUrl: 'assets/pelatih.png',
                    title: 'Pelatih',
                  ),
                  CardHomeAdmin(
                    onTap: () {
                      Get.toNamed(RouteName.statisticWasitAdmin);
                    },
                    imageUrl: 'assets/wasit.png',
                    title: 'Wasit',
                  ),
                  CardHomeAdmin(
                    onTap: () {
                      Get.toNamed(RouteName.statisticGuruAdmin);
                    },
                    imageUrl: 'assets/guru.png',
                    title: 'Guru Olahraga',
                  ),
                  CardHomeAdmin(
                    onTap: () {
                      Get.toNamed(RouteName.statisticFasilitasAdmin);
                    },
                    imageUrl: 'assets/facilities.png',
                    title: 'Fasilitas Olahraga',
                  ),
                  CardHomeAdmin(
                    onTap: () {
                      Get.toNamed(RouteName.statisticPrestasiAdmin);
                    },
                    imageUrl: 'assets/trophyadmin.png',
                    title: 'Prestasi',
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 26, 22, 10),
                child: title('Grafik'),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 22),
                crossAxisCount: 3,
                crossAxisSpacing: 21,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
                children: [
                  CardHomeAdmin(
                    onTap: () async {
                      Get.toNamed(RouteName.graphicAtlet);
                    },
                    imageUrl: 'assets/athlete.png',
                    title: 'Atlet',
                  ),
                  CardHomeAdmin(
                    onTap: () async {
                      Get.toNamed(RouteName.graphicAchievement);
                    },
                    imageUrl: 'assets/trophyadmin.png',
                    title: 'Prestasi',
                  ),
                  CardHomeAdmin(
                    onTap: () {
                      Get.toNamed(RouteName.graphicTotal);
                    },
                    imageUrl: 'assets/total.png',
                    title: 'Total',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
