import 'package:get/get.dart';
import 'package:sipera_app/controllers/auth_controller.dart';

class LoginB implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
