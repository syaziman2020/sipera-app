import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class ButtonFilter extends StatelessWidget {
  final String title;
  bool status;
  ButtonFilter({
    Key? key,
    required this.title,
    this.status = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: (status) ? greenCA : whiteC,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
          side: BorderSide(
            width: 1,
            color: greenCA,
          ),
        ),
        child: Text(
          title,
          style: whiteTextStyle.copyWith(
              color: (status) ? whiteC : greenCA,
              fontSize: 12,
              fontWeight: medium),
        ),
      ),
    );
  }
}
