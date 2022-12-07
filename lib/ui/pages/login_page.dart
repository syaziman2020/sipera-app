import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipera_app/controllers/auth_controller.dart';

import 'package:sipera_app/routes/route_names.dart';
import '../../shared/theme.dart';
import '../widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passController = TextEditingController(text: '');
  final loginC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget contentHeader() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height / 15,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 50),
            child: Image.asset(
              'assets/crop_logo.png',
              width: Get.width * 0.4,
            ),
          ),
          Text(
            "Masuk Sebagai Admin",
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Masukkan email dan password anda yang sudah terdaftar sebagai admin",
            style: greyTextStyle.copyWith(
              fontSize: 14,
              height: 1.8,
            ),
          ),
        ],
      );
    }

    Widget formWithButton() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height / 24,
          ),
          Text(
            'Email',
            style: greyTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 20),
            child: TextFormField(
              controller: _emailController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              cursorColor: greenCA,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                hintText: 'Masukkan email anda',
                hintStyle: greyTextStyle.copyWith(
                  fontSize: 13,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    4,
                  ),
                  borderSide: BorderSide(color: greenCA),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    4,
                  ),
                  borderSide: BorderSide(color: greenCA),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: greenCA),
                  borderRadius: BorderRadius.circular(4),
                ),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: greenCA,
                    ),
                    borderRadius: BorderRadius.circular(4)),
              ),
            ),
          ),
          Text(
            'Password',
            style: greyTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Obx(
            () => SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: _passController,
                obscureText: loginC.isObscure.value,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: greenCA,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye_rounded,
                      size: 23,
                      color: greyC,
                    ),
                    onPressed: () {
                      loginC.obscureStatus();
                    },
                  ),
                  contentPadding: const EdgeInsets.all(15),
                  hintText: 'Masukkan Password anda',
                  hintStyle: greyTextStyle.copyWith(
                    fontSize: 13,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      4,
                    ),
                    borderSide: BorderSide(color: greenCA),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      4,
                    ),
                    borderSide: BorderSide(color: greenCA),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: greenCA),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: greenCA,
                      ),
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height / 15,
          ),
          CustomButton(
            title: "Masuk",
            onTap: () async {
              Get.dialog(
                Center(
                  child: CircularProgressIndicator(
                    color: greenCB,
                  ),
                ),
                barrierDismissible: false,
              );
              await loginC.loginController(
                  _emailController.text, _passController.text);
              Get.back();
              if (loginC.isLogin.isTrue) {
                Get.offAllNamed(RouteName.homeAdmin);
              } else {
                Get.defaultDialog(
                  barrierDismissible: false,
                  title: 'Gagal!!',
                  titleStyle: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 18),
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
                        '${loginC.errorMessage}',
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
            },
          ),
          const SizedBox(
            height: 20,
          )
        ],
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(22, 20, 22, 0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            contentHeader(),
            formWithButton(),
          ],
        ),
      ),
    );
  }
}
