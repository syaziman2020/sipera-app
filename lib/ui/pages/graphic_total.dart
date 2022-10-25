import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipera_app/controllers/auth_controller.dart';
// import 'package:sipera_app/controllers/graphic_controller.dart';

import '../../shared/theme.dart';

class GraphicTotal extends StatelessWidget {
  GraphicTotal({Key? key}) : super(key: key);

  final totalC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    Widget title(String text) {
      return Text(
        text,
        style: blackTextStyle.copyWith(
          fontSize: 18,
          fontWeight: semiBold,
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteC,
      appBar: AppBar(
        iconTheme: IconThemeData(color: blackC),
        backgroundColor: whiteC,
        title: Text(
          'Grafik Atlet Berprestasi',
          style: blackTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.015,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 20,
              ),
              child: title('Grafik Total'),
            ),
            AspectRatio(
              aspectRatio: 1.5,
              child: Obx(() {
                if (totalC.isLogin.isTrue) {
                  return PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                          value: (totalC.graphicTotal!.value.results!.atlet! /
                                  totalC.jumlah.value) *
                              100,
                          color: Colors.blue,
                          radius: 50 +
                              (totalC.graphicTotal!.value.results!.atlet! /
                                      totalC.jumlah.value) *
                                  100,
                          title:
                              '${((totalC.graphicTotal!.value.results!.atlet! / totalC.jumlah.value) * 100).toStringAsFixed(2)}%',
                          titleStyle:
                              whiteTextStyle.copyWith(fontWeight: semiBold),
                        ),
                        PieChartSectionData(
                          value: (totalC.graphicTotal!.value.results!.pelatih! /
                                  totalC.jumlah.value) *
                              100,
                          color: Colors.orange,
                          radius: 50 +
                              (totalC.graphicTotal!.value.results!.pelatih! /
                                      totalC.jumlah.value) *
                                  100,
                          title:
                              '${((totalC.graphicTotal!.value.results!.pelatih! / totalC.jumlah.value) * 100).toStringAsFixed(2)}%',
                          titleStyle:
                              whiteTextStyle.copyWith(fontWeight: semiBold),
                        ),
                        PieChartSectionData(
                          value: (totalC.graphicTotal!.value.results!.wasit! /
                                  totalC.jumlah.value) *
                              100,
                          color: Colors.red,
                          radius: 50 +
                              (totalC.graphicTotal!.value.results!.wasit! /
                                      totalC.jumlah.value) *
                                  100,
                          title:
                              '${((totalC.graphicTotal!.value.results!.wasit! / totalC.jumlah.value) * 100).toStringAsFixed(2)}%',
                          titleStyle:
                              whiteTextStyle.copyWith(fontWeight: semiBold),
                        ),
                        PieChartSectionData(
                          value: (totalC.graphicTotal!.value.results!.guru! /
                                  totalC.jumlah.value) *
                              100,
                          color: Colors.green,
                          radius: 50 +
                              (totalC.graphicTotal!.value.results!.guru! /
                                      totalC.jumlah.value) *
                                  100,
                          title:
                              '${((totalC.graphicTotal!.value.results!.guru! / totalC.jumlah.value) * 100).toStringAsFixed(2)}%',
                          titleStyle:
                              whiteTextStyle.copyWith(fontWeight: semiBold),
                        ),
                      ],
                      centerSpaceRadius: 20,
                      pieTouchData: PieTouchData(enabled: true),
                    ),
                  );
                } else {
                  return SizedBox();
                }
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
              child: Obx(() {
                if (totalC.graphicTotal != null) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                            ),
                            Text(
                              'Atlet = ${totalC.graphicTotal?.value.results?.atlet ?? 0}',
                              style: blackTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.orange,
                              ),
                            ),
                            Text(
                              'Pelatih =  ${totalC.graphicTotal?.value.results?.pelatih ?? 0}',
                              style: blackTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              'Wasit =  ${totalC.graphicTotal?.value.results?.wasit ?? 0}',
                              style: blackTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                            ),
                            Text(
                              'Guru Olahraga =  ${totalC.graphicTotal?.value.results?.guru ?? 0}',
                              style: blackTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return SizedBox();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
