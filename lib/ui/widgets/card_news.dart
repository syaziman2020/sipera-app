import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CardNews extends StatelessWidget {
  String imageUrl;
  final Function() onTap;
  String title;
  String date;

  CardNews({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250,
        height: 295,
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.all(10),
        decoration: cardShadow().copyWith(
          boxShadow: [
            BoxShadow(
              color: blackC.withOpacity(0.25),
              offset: const Offset(1, 1),
              blurRadius: 4,
              spreadRadius: 1,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: FadeInImage(
                  height: 163,
                  width: double.infinity,
                  fadeInCurve: Curves.easeInExpo,
                  fadeOutCurve: Curves.easeOutExpo,
                  placeholder:
                      const AssetImage("assets/no_image_available.png"),
                  image: NetworkImage('$imageUrl'),
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/no_image_available.png",
                      fit: BoxFit.cover,
                    );
                  },
                  fit: BoxFit.cover),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Olahraga',
              style: greyTextStyle.copyWith(),
            ),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.calendar_month_rounded,
                  size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  date,
                  style: blackTextStyle.copyWith(
                    fontSize: 11,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
