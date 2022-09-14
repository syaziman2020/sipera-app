import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/theme.dart';
import '../widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passController = TextEditingController(text: '');

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
          Image.asset(
            'assets/logo.png',
            width: Get.width * 0.4,
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
                hintStyle: blackTextStyle.copyWith(
                  fontSize: 13,
                  color: blackC.withOpacity(0.87),
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
          SizedBox(
            width: double.infinity,
            child: TextFormField(
              controller: _passController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              cursorColor: greenCA,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                hintText: 'Masukkan Password anda',
                hintStyle: blackTextStyle.copyWith(
                  fontSize: 13,
                  color: blackC.withOpacity(0.87),
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
          SizedBox(
            height: size.height / 15,
          ),
          CustomButton(
            title: "Masuk",
            onTap: () {},
          ),
          const SizedBox(
            height: 20,
          )
        ],
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
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
