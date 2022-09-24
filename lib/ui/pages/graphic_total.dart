import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/theme.dart';

class GraphicTotal extends StatelessWidget {
  GraphicTotal({Key? key}) : super(key: key);

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

    List<PieChartSectionData> _chartSections() {
      final List<PieChartSectionData> list = [
        PieChartSectionData(
          value: 20,
          color: Colors.blue,
          radius: 80,
          title: '20%',
          titleStyle: whiteTextStyle.copyWith(fontWeight: semiBold),
        ),
        PieChartSectionData(
          value: 40,
          color: Colors.orange,
          radius: 100,
          title: '40%',
          titleStyle: whiteTextStyle.copyWith(fontWeight: semiBold),
        ),
        PieChartSectionData(
          value: 30,
          color: Colors.red,
          radius: 90,
          title: '30%',
          titleStyle: whiteTextStyle.copyWith(fontWeight: semiBold),
        ),
        PieChartSectionData(
          value: 10,
          color: Colors.green,
          radius: 70,
          title: '10%',
          titleStyle: whiteTextStyle.copyWith(fontWeight: semiBold),
        ),
      ];
      // for (var sector in sectors) {
      //   const double radius = 40.0;
      //   final data = PieChartSectionData(
      //     color: sector.color,
      //     value: sector.value,
      //     radius: radius,
      //     title: '',
      //   );
      //   list.add(data);
      // }
      return list;
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
              child: PieChart(
                PieChartData(
                  sections: _chartSections(),
                  centerSpaceRadius: 40,
                  pieTouchData: PieTouchData(enabled: true),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
              child: Column(
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
                          'Atlet',
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
                          'Pelatih',
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
                          'Wasit',
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
                          'Guru Olahraga',
                          style: blackTextStyle.copyWith(
                            fontWeight: medium,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
