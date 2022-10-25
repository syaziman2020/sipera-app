import 'package:flutter/material.dart';
import 'package:sipera_app/controllers/splash_controller.dart';
import 'package:sipera_app/shared/theme.dart';
import 'package:get/get.dart';

import '../../controllers/public_controller.dart';
import '../../routes/route_names.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final publicC = Get.find<PublicController>();

  @override
  void initState() {
    publicC.fetchAllData().then((value) {
      Future.delayed(Duration(seconds: 1));
      Get.offNamed(RouteName.onBoarding);
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
