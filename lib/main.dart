import 'package:flutter/material.dart';
import 'package:sipera_app/controllers/auth_controller.dart';
import 'package:sipera_app/controllers/main_controller.dart';
import 'package:sipera_app/controllers/public_controller.dart';

import 'package:sipera_app/routes/app_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final authC = Get.put(AuthController());
  final publicC = Get.put(PublicController());
  final mainC = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPage.listPage,
    );
  }
}
