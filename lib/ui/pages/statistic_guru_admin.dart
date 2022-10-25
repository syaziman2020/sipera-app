import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipera_app/controllers/auth_controller.dart';

import '../../shared/theme.dart';
import '../widgets/card_statistic.dart';

class StatisticGuruAdmin extends StatelessWidget {
  StatisticGuruAdmin({Key? key}) : super(key: key);

  final teacherC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteC,
      appBar: AppBar(
        iconTheme: IconThemeData(color: blackC),
        backgroundColor: whiteC,
        title: Text(
          'Statistik Guru Olahraga',
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
          if (teacherC.teacherAdmin?.value != null) {
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
                  total:
                      teacherC.teacherAdmin?.value.results?.totalGuruOlahraga ??
                          0,
                  color: Colors.blue,
                ),
                ...teacherC.listTeacher!
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
