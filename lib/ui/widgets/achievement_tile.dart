import 'package:flutter/material.dart';
import 'package:sipera_app/shared/theme.dart';

class AchievementTile extends StatelessWidget {
  final String title;
  final String born;
  final String imagePeople;
  final String kelamin;
  const AchievementTile({
    Key? key,
    required this.title,
    required this.born,
    required this.imagePeople,
    required this.kelamin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: whiteC,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: blackC.withOpacity(0.25),
            offset: const Offset(1, 1),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: FadeInImage(
                width: 90,
                height: 111,
                fadeInCurve: Curves.easeInExpo,
                fadeOutCurve: Curves.easeOutExpo,
                placeholder: const AssetImage("assets/noimage_portrait.png"),
                image: NetworkImage('$imagePeople'),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/noimage_portrait.png",
                    fit: BoxFit.cover,
                  );
                },
                fit: BoxFit.cover),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  born,
                  overflow: TextOverflow.ellipsis,
                  style: greyTextStyle.copyWith(
                    fontWeight: light,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  (kelamin == '1')
                      ? 'Laki-laki'
                      : (kelamin == '2')
                          ? 'Perempuan'
                          : '',
                  overflow: TextOverflow.ellipsis,
                  style: greyTextStyle.copyWith(
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
