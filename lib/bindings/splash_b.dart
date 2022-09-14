import 'package:get/get.dart';
import 'package:sipera_app/controllers/splash_controller.dart';

class SplashB implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
