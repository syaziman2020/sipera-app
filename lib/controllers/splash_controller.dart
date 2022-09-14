import 'package:get/get.dart';
import 'package:sipera_app/routes/route_names.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(RouteName.onBoarding);
    });
    super.onInit();
  }
}
