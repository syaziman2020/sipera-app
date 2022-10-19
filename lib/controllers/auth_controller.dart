import 'package:get/get.dart';
import 'package:sipera_app/models/admin/login_model.dart' as login;
import 'package:sipera_app/models/admin/profile_model.dart' as profile;
import 'package:sipera_app/services/admin/auth_service.dart';

class AuthController extends GetxController {
  RxBool isLogin = false.obs;
  RxBool isObscure = true.obs;
  Rx<login.LoginModel>? userLogin = login.LoginModel().obs;

  bool obscureStatus() {
    return isObscure.value = !isObscure.value;
  }

  loginController(String email, String pass) async {
    try {
      if (email == "" || pass == "") {
        return;
      }
      login.LoginModel? loginModel =
          await AuthService().loginProfile(email: email, password: pass);

      if (loginModel == null) {
        isLogin.value = false;
      } else {
        userLogin?.value = loginModel;
        print('xx');
        print(userLogin!.value.results!.name);

        isLogin.value = true;
      }
    } catch (e) {
      isLogin.value = false;
    }
  }

  Future<bool>? logoutController() {
    return AuthService().logout();
  }
}
