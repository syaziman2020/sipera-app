import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import '../widgets/card_statistic.dart';

class StatisticPelatihAdmin extends StatelessWidget {
  const StatisticPelatihAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteC,
      appBar: AppBar(
        iconTheme: IconThemeData(color: blackC),
        backgroundColor: whiteC,
        title: Text(
          'Statistik Pelatih',
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
