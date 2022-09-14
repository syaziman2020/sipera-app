import 'package:get/get.dart';
import 'package:sipera_app/controllers/on_boarding_controller.dart';

class OnBoardingB implements Bindings {
  @override
  void dependencies() {
    Get.put(OnBoardingController());
  }
}
