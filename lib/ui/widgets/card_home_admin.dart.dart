import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CardHomeAdmin extends StatelessWidget {
  const CardHomeAdmin({
    Key? key,
    required this.onTap,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);
  final Function() onTap;
  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(17),
            margin: const EdgeInsets.only(bottom: 7),
            decoration: BoxDecoration(
              color: whiteC,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xffC5C5C5), width: 1),
            ),
            child: Center(
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
