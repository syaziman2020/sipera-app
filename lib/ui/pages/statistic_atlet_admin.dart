import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import '../widgets/card_statistic.dart';

class StatisticAtletAdmin extends StatelessWidget {
  const StatisticAtletAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteC,
      appBar: AppBar(
        iconTheme: IconThemeData(color: blackC),
        backgroundColor: whiteC,
        title: Text(
          'Statistik Atlet',
          style: blackTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: GridView.count(
        padding: const EdgeInsets.only(
          top: 15,
          left: 22,
          right: 22,
        ),
        crossAxisSpacing: 15,
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        childAspectRatio: 1.6,
        children: [
          CardStatistic(
            category: 'Total',
            total: 42,
            color: Colors.blue,
          ),
          CardStatistic(
            category: 'Atlet Disabilitas',
            total: 42,
            color: Colors.purple,
          ),
          CardStatistic(
            category: 'Bulu Tangkis',
            total: 42,
          ),
          CardStatistic(
            category: 'Bulu Tangkis',
            total: 42,
          ),
          CardStatistic(
            category: 'Bulu Tangkis',
            total: 42,
          ),
        ],
      ),
    );
  }
}
