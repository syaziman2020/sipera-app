import 'package:flutter/material.dart';
import 'package:sipera_app/shared/theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  const CustomButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: buttonStyle(),
        child: Text(
          title,
          style: whiteTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
