import 'package:flutter/material.dart';
import 'package:sipera_app/controllers/auth_controller.dart';

import '../../shared/theme.dart';
import '../widgets/card_statistic.dart';
import 'package:get/get.dart';

class StatisticFasilitasAdmin extends StatelessWidget {
  StatisticFasilitasAdmin({Key? key}) : super(key: key);

  final facilityC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteC,
      appBar: AppBar(
        iconTheme: IconThemeData(color: blackC),
        backgroundColor: whiteC,
        title: Text(
          'Statistik Fasilitas Olahraga',
          style: blackTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(
        () {
          if (facilityC.facilityAdmin?.value != null) {
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
                ...facilityC.listFacility!
                    .asMap()
                    .map(
                      (index, e) => MapEntry(
                        index,
                        CardStatistic(
                          category: '${e.jenisLapangan}',
                          total: int.tryParse(e.total!) ?? 0,
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
        },
      ),
    );
  }
}
