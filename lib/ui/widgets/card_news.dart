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
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.all(10),
        decoration: cardShadow().copyWith(
          boxShadow: [
            BoxShadow(
              color: blackC.withOpacity(0.25),
              offset: Offset(1, 1),
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
              child: Image.network(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                height: 163,
              ),
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
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_month_rounded,
                  size: 20,
                ),
                SizedBox(
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
