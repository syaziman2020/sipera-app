import 'package:flutter/material.dart';
import 'package:sipera_app/shared/theme.dart';

class AchievementTile extends StatelessWidget {
  final String title;
  final String level;
  AchievementTile({Key? key, required this.title, required this.level})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xffEDEDED),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: blackC.withOpacity(0.25),
            offset: Offset(1, 1),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 14),
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: whiteC,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Image.asset(
                'assets/trophy.png',
                width: 50,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  level,
                  style: greyTextStyle.copyWith(
                    fontWeight: light,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
