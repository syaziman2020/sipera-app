import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipera_app/controllers/auth_controller.dart';

import '../../shared/theme.dart';
import '../widgets/card_statistic.dart';

class StatisticAtletAdmin extends StatelessWidget {
  StatisticAtletAdmin({Key? key}) : super(key: key);
  final atletC = Get.find<AuthController>();
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
      body: Obx(
        () {
          if (atletC.atletAdmin?.value != null) {
            return GridView.count(
              padding: EdgeInsets.only(
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
                  total: atletC.atletAdmin?.value.results?.totalAtlet ?? 0,
                  color: Colors.blue,
                ),
                CardStatistic(
                  category: 'Atlet Disabilitas',
                  total:
                      atletC.atletAdmin?.value.results?.totalAtletDisabilitas ??
                          0,
                  color: Colors.purple,
                ),
                ...atletC.listCabor!
                    .asMap()
                    .map(
                      (index, e) => MapEntry(
                        index,
                        CardStatistic(
                          category: '${e.namaCabor}',
                          total: int.tryParse(e.total!) ?? 0,
                        ),
                      ),
                    )
                    .values
                    .toList(),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
