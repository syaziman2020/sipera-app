import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CardStatistic extends StatelessWidget {
  final int total;
  final String category;
  final Color color;
  const CardStatistic(
      {Key? key,
      required this.category,
      this.total = 0,
      this.color = const Color(0xff2AC76C)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 24,
                  height: 24,
                  padding: const EdgeInsets.all(3.5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: whiteC,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/chart.png',
                      width: 16,
                    ),
                  ),
                ),
                Text(
                  '$total',
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                )
              ],
            ),
            Text(
              category,
              textAlign: TextAlign.center,
              style: whiteTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
