import 'package:flutter/material.dart';
import 'package:sipera_app/shared/theme.dart';

class AchievementTile extends StatelessWidget {
  final String title;
  final String born;
  final String imagePeople;
  AchievementTile({
    Key? key,
    required this.title,
    required this.born,
    required this.imagePeople,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: whiteC,
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
          ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: FadeInImage(
                width: 90,
                height: 111,
                fadeInCurve: Curves.easeInExpo,
                fadeOutCurve: Curves.easeOutExpo,
                placeholder: AssetImage("assets/noimage_portrait.png"),
                image: NetworkImage('${imagePeople}'),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/noimage_portrait.png",
                    fit: BoxFit.cover,
                  );
                },
                fit: BoxFit.cover),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  born,
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
