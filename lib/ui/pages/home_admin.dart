import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipera_app/routes/route_names.dart';
import 'package:sipera_app/shared/theme.dart';
import 'package:sipera_app/ui/widgets/card_home_admin.dart.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({Key? key}) : super(key: key);

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
                  title: 'Log Out',
                  titleStyle: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  content: Text(
                    'Anda yakin ingin keluar?',
                    style: blackTextStyle,
                  ),
                  confirm: ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(RouteName.onBoarding);
                    },
                    style: buttonStyle().copyWith(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                    child: Text(
                      'Ya',
                      style: whiteTextStyle,
                    ),
                  ),
                  cancel: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: TextButton.styleFrom(
                      side: BorderSide(color: greenCA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Tidak',
                      style: greenTextStyle,
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
        title: Text(
          'Halo Admin',
          style: blackTextStyle.copyWith(fontWeight: semiBold),
        ),
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
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 22),
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
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 22),
                crossAxisCount: 3,
                crossAxisSpacing: 21,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
                children: [
                  CardHomeAdmin(
                    onTap: () {
                      Get.toNamed(RouteName.graphicAtlet);
                    },
                    imageUrl: 'assets/athlete.png',
                    title: 'Atlet',
                  ),
                  CardHomeAdmin(
                    onTap: () {
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
