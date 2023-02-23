import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipera_app/controllers/auth_controller.dart';

import '../../shared/theme.dart';
import '../widgets/card_statistic.dart';

class StatisticPelatihAdmin extends StatelessWidget {
  StatisticPelatihAdmin({Key? key}) : super(key: key);
  final coachC = Get.find<AuthController>();
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
      body: Obx(() {
        if (coachC.coachAdmin != null) {
          return GridView.count(
            padding: const EdgeInsets.only(
              top: 15,
              left: 22,
              right: 22,
              bottom: 15,
            ),
            crossAxisSpacing: 15,
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            childAspectRatio: 1.6,
            children: [
              CardStatistic(
                category: 'Total',
                total: coachC.coachAdmin?.value.results?.totalPelatih ?? 0,
                color: Colors.blue,
              ),
              ...coachC.listCoach!
                  .asMap()
                  .map(
                    (index, e) => MapEntry(
                      index,
                      CardStatistic(
                        category: '${e.namaCabor}',
                        total: int.parse(e.total!) ?? 0,
                      ),
                    ),
                  )
                  .values
                  .toList(),
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
