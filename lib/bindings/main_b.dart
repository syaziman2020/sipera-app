import 'package:get/get.dart';
import 'package:sipera_app/controllers/main_controller.dart';

class MainB implements Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
