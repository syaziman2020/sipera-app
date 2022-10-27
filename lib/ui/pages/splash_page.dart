import 'package:flutter/material.dart';
import 'package:sipera_app/shared/theme.dart';
import 'package:get/get.dart';

import '../../controllers/public_controller.dart';
import '../../routes/route_names.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final publicC = Get.find<PublicController>();

  @override
  void initState() {
    publicC.fetchAllData().then((value) {
      Get.offNamed(RouteName.onBoarding);
      if (publicC.isDone.isFalse) {
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
                'Pastikan koneksi internet anda stabil',
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
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteC,
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          width: Get.width * 0.4,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
