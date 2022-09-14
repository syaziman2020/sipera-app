import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CardAchievement extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String name;
  final Function() onTap;
  const CardAchievement({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(22, 0, 22, 10),
        padding: EdgeInsets.all(9),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xffE0E0E0), width: 1),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: Image.network(
                imageUrl,
                height: 56,
                width: 52,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  name,
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: medium,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
