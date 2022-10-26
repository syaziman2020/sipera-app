import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipera_app/controllers/auth_controller.dart';
import '../../shared/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:collection/collection.dart';

class GraphicAtlet extends StatelessWidget {
  GraphicAtlet({Key? key}) : super(key: key);

  final authC = Get.find<AuthController>();

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
          'Grafik Atlet',
          style: blackTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.015,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 30,
                ),
                child: title('Grafik Perbulan'),
              ),
              AspectRatio(
                aspectRatio: 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(right: 22),
                  child: Obx(
                    () => BarChart(
                      BarChartData(
                        gridData: FlGridData(
                          checkToShowHorizontalLine: (value) => true,
                          checkToShowVerticalLine: (value) => false,
                        ),
                        barTouchData: BarTouchData(
                          allowTouchBarBackDraw: true,
                          handleBuiltInTouches: true,
                          touchTooltipData: BarTouchTooltipData(
                            tooltipMargin: 1,
                            tooltipBgColor: Colors.transparent,
                          ),
                        ),
                        alignment: BarChartAlignment.spaceAround,
                        minY: 1,
                        titlesData: FlTitlesData(
                          topTitles: AxisTitles(
                            drawBehindEverything: false,
                          ),
                          rightTitles: AxisTitles(drawBehindEverything: false),
                          bottomTitles: AxisTitles(
                            axisNameWidget: Text(
                              'Bulan',
                              style: blackTextStyle.copyWith(
                                fontWeight: semiBold,
                              ),
                            ),
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                switch (value.toInt()) {
                                  case 0:
                                    return Text(
                                      '1',
                                      style: blackTextStyle,
                                    );
                                  case 1:
                                    return Text(
                                      '2',
                                      style: blackTextStyle,
                                    );
                                  case 2:
                                    return Text(
                                      '3',
                                      style: blackTextStyle,
                                    );
                                  case 3:
                                    return Text(
                                      '4',
                                      style: blackTextStyle,
                                    );
                                  case 4:
                                    return Text(
                                      '5',
                                      style: blackTextStyle,
                                    );
                                  case 5:
                                    return Text(
                                      '6',
                                      style: blackTextStyle,
                                    );
                                  case 6:
                                    return Text(
                                      '7',
                                      style: blackTextStyle,
                                    );
                                  case 7:
                                    return Text(
                                      '8',
                                      style: blackTextStyle,
                                    );
                                  case 8:
                                    return Text(
                                      '9',
                                      style: blackTextStyle,
                                    );
                                  case 9:
                                    return Text(
                                      '10',
                                      style: blackTextStyle,
                                    );
                                  case 10:
                                    return Text(
                                      '11',
                                      style: blackTextStyle,
                                    );
                                  case 11:
                                    return Text(
                                      '12',
                                      style: blackTextStyle,
                                    );

                                  default:
                                }
                                return SizedBox();
                              },
                            ),
                          ),
                        ),
                        barGroups: [
                          BarChartGroupData(
                            x: 0,
                            barRods: [
                              BarChartRodData(
                                toY: authC.jumlahJanAtlet.value.toDouble(),
                                color: greenCB,
                              )
                            ],
                          ),
                          BarChartGroupData(
                            x: 1,
                            barRods: [
                              BarChartRodData(
                                toY: authC.jumlahFebAtlet.value.toDouble(),
                                color: greenCB,
                              )
                            ],
                          ),
                          BarChartGroupData(
                            x: 2,
                            barRods: [
                              BarChartRodData(
                                toY: authC.jumlahMarAtlet.value.toDouble(),
                                color: greenCB,
                              )
                            ],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(
                                toY: authC.jumlahAprAtlet.value.toDouble(),
                                color: greenCB,
                              )
                            ],
                          ),
                          BarChartGroupData(
                            x: 4,
                            barRods: [
                              BarChartRodData(
                                toY: authC.jumlahMayAtlet.value.toDouble(),
                                color: greenCB,
                              )
                            ],
                          ),
                          BarChartGroupData(
                            x: 5,
                            barRods: [
                              BarChartRodData(
                                toY: authC.jumlahJunAtlet.value.toDouble(),
                                color: greenCB,
                              )
                            ],
                          ),
                          BarChartGroupData(
                            x: 6,
                            barRods: [
                              BarChartRodData(
                                toY: authC.jumlahJulAtlet.value.toDouble(),
                                color: greenCB,
                              )
                            ],
                          ),
                          BarChartGroupData(
                            x: 7,
                            barRods: [
                              BarChartRodData(
                                toY: authC.jumlahAugAtlet.value.toDouble(),
                                color: greenCB,
                              )
                            ],
                          ),
                          BarChartGroupData(
                            x: 8,
                            barRods: [
                              BarChartRodData(
                                toY: authC.jumlahSepAtlet.value.toDouble(),
                                color: greenCB,
                              )
                            ],
                          ),
                          BarChartGroupData(
                            x: 9,
                            barRods: [
                              BarChartRodData(
                                toY: authC.jumlahOctAtlet.value.toDouble(),
                                color: greenCB,
                              )
                            ],
                          ),
                          BarChartGroupData(
                            x: 10,
                            barRods: [
                              BarChartRodData(
                                toY: authC.jumlahNovAtlet.value.toDouble(),
                                color: greenCB,
                              )
                            ],
                          ),
                          BarChartGroupData(
                            x: 11,
                            barRods: [
                              BarChartRodData(
                                toY: authC.jumlahDesAtlet.value.toDouble(),
                                color: greenCB,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
                child: title('Grafik Pertahun'),
              ),
              AspectRatio(
                aspectRatio: 0.8,
                child: Padding(
                  padding: EdgeInsets.only(right: 22),
                  child: BarChart(
                    BarChartData(
                      gridData: FlGridData(
                        checkToShowVerticalLine: (value) => false,
                      ),
                      barTouchData: BarTouchData(
                        allowTouchBarBackDraw: true,
                        touchTooltipData: BarTouchTooltipData(
                          tooltipMargin: 1,
                          tooltipBgColor: Colors.transparent,
                        ),
                      ),
                      alignment: BarChartAlignment.spaceAround,
                      minY: 1,
                      titlesData: FlTitlesData(
                        rightTitles: AxisTitles(drawBehindEverything: true),
                        topTitles: AxisTitles(drawBehindEverything: true),
                        bottomTitles: AxisTitles(
                          axisNameWidget: Text(
                            'Tahun',
                            style: blackTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                          sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                return Text(
                                    '${authC.listGraphAtlet![value.toInt()].tahun}');
                              }),
                        ),
                      ),
                      barGroups: [
                        ...authC.listGraphAtlet!.mapIndexed(
                          (index, element) {
                            return BarChartGroupData(
                              x: index,
                              barRods: [
                                BarChartRodData(
                                  toY: double.parse(element.total!),
                                  color: greenCB,
                                )
                              ],
                            );
                          },
                        ).toList(),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                child: title('Grafik Berdasarkan Umur'),
              ),
              AspectRatio(
                aspectRatio: 1.5,
                child: Obx(
                  () {
                    if (authC.isLogin.isTrue) {
                      return PieChart(
                        PieChartData(
                          sections: [
                            PieChartSectionData(
                              value: authC.graphicAtlet!.value.results!.anak! /
                                  authC.jumlahUmur.value *
                                  100,
                              color: Colors.blue,
                              radius: 30 +
                                  (authC.graphicAtlet!.value.results!.anak! /
                                      authC.jumlahUmur.value *
                                      100),
                              title:
                                  '${(authC.graphicAtlet!.value.results!.anak! / authC.jumlahUmur.value * 100).toStringAsFixed(2)}%',
                              titleStyle:
                                  whiteTextStyle.copyWith(fontWeight: semiBold),
                            ),
                            PieChartSectionData(
                              value:
                                  authC.graphicAtlet!.value.results!.remaja! /
                                      authC.jumlahUmur.value *
                                      100,
                              color: Colors.orange,
                              radius: 30 +
                                  (authC.graphicAtlet!.value.results!.remaja! /
                                      authC.jumlahUmur.value *
                                      100),
                              title:
                                  '${(authC.graphicAtlet!.value.results!.remaja! / authC.jumlahUmur.value * 100).toStringAsFixed(2)}%',
                              titleStyle:
                                  whiteTextStyle.copyWith(fontWeight: semiBold),
                            ),
                            PieChartSectionData(
                              value:
                                  authC.graphicAtlet!.value.results!.dewasa! /
                                      authC.jumlahUmur.value *
                                      100,
                              color: Colors.red,
                              radius: 30 +
                                  (authC.graphicAtlet!.value.results!.dewasa! /
                                      authC.jumlahUmur.value *
                                      100),
                              title:
                                  '${(authC.graphicAtlet!.value.results!.dewasa! / authC.jumlahUmur.value * 100).toStringAsFixed(2)}%',
                              titleStyle:
                                  whiteTextStyle.copyWith(fontWeight: semiBold),
                            ),
                          ],
                          centerSpaceRadius: 30,
                          pieTouchData: PieTouchData(enabled: true),
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
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
                            'Anak = ${authC.graphicAtlet!.value.results!.anak}',
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
                            'Remaja = ${authC.graphicAtlet!.value.results!.remaja}',
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
                            'Dewasa = ${authC.graphicAtlet!.value.results!.dewasa}',
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
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
