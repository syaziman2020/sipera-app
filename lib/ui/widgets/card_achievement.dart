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
        margin: const EdgeInsets.fromLTRB(22, 0, 22, 10),
        padding: const EdgeInsets.all(9),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xffE0E0E0), width: 1),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: FadeInImage(
                  width: 52,
                  height: 56,
                  fadeInCurve: Curves.easeInExpo,
                  fadeOutCurve: Curves.easeOutExpo,
                  placeholder:
                      const AssetImage("assets/no_image_available.webp"),
                  image: NetworkImage('$imageUrl'),
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/no_image_available.webp",
                      fit: BoxFit.cover,
                    );
                  },
                  fit: BoxFit.cover),
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
