import 'package:flutter/material.dart';
import 'package:sipera_app/controllers/splash_controller.dart';
import 'package:sipera_app/shared/theme.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  final splashC = Get.find<SplashController>();

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
