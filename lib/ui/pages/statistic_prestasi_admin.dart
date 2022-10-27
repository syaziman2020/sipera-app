import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipera_app/controllers/auth_controller.dart';

import '../../shared/theme.dart';
import '../widgets/card_statistic.dart';

class StatisticAdminPrestasi extends StatelessWidget {
  StatisticAdminPrestasi({Key? key}) : super(key: key);
  final achievementC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteC,
      appBar: AppBar(
        iconTheme: IconThemeData(color: blackC),
        backgroundColor: whiteC,
        title: Text(
          'Statistik Prestasi',
          style: blackTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(() {
        if (achievementC.achievementAdmin != null) {
          return GridView.count(
            padding: const EdgeInsets.only(
              top: 15,
              left: 22,
              right: 22,
            ),
            crossAxisSpacing: 15,
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            childAspectRatio: 1.6,
            children: [
              CardStatistic(
                category: 'Total',
                total: achievementC
                        .achievementAdmin?.value.results?.totalPrestasi ??
                    0,
                color: Colors.blue,
              ),
              CardStatistic(
                category: 'Tahun Ini',
                total: achievementC.achievementAdmin?.value.results
                        ?.totalPrestasiTahunIni ??
                    0,
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
