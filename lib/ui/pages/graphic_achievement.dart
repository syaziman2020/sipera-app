import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipera_app/controllers/auth_controller.dart';
import 'package:collection/collection.dart';
import '../../shared/theme.dart';

class GraphicAchievement extends StatelessWidget {
  GraphicAchievement({Key? key}) : super(key: key);

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
                  vertical: 20,
                ),
                child: title('Grafik Perbulan'),
              ),
              AspectRatio(
                aspectRatio: 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(right: 22),
                  child: Obx(() {
                    if (authC.isLogin.isTrue) {
                      return BarChart(
                        BarChartData(
                          gridData: FlGridData(
                            checkToShowHorizontalLine: (value) => true,
                            checkToShowVerticalLine: (value) => false,
                          ),
                          barTouchData: BarTouchData(
                            allowTouchBarBackDraw: true,
                            touchTooltipData: BarTouchTooltipData(
                              tooltipBgColor: Colors.transparent,
                            ),
                          ),
                          alignment: BarChartAlignment.spaceAround,
                          minY: 0,
                          titlesData: FlTitlesData(
                            topTitles: AxisTitles(drawBehindEverything: false),
                            rightTitles:
                                AxisTitles(drawBehindEverything: false),
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
                                  return const SizedBox();
                                },
                              ),
                            ),
                          ),
                          barGroups: [
                            BarChartGroupData(
                              x: 0,
                              barRods: [
                                BarChartRodData(
                                  toY: authC.jumlahJanPrestasi.value.toDouble(),
                                  color: greenCB,
                                )
                              ],
                            ),
                            BarChartGroupData(
                              x: 1,
                              barRods: [
                                BarChartRodData(
                                  toY: authC.jumlahFebPrestasi.value.toDouble(),
                                  color: greenCB,
                                )
                              ],
                            ),
                            BarChartGroupData(
                              x: 2,
                              barRods: [
                                BarChartRodData(
                                  toY: authC.jumlahMarPrestasi.value.toDouble(),
                                  color: greenCB,
                                )
                              ],
                            ),
                            BarChartGroupData(
                              x: 3,
                              barRods: [
                                BarChartRodData(
                                  toY: authC.jumlahAprPrestasi.value.toDouble(),
                                  color: greenCB,
                                )
                              ],
                            ),
                            BarChartGroupData(
                              x: 4,
                              barRods: [
                                BarChartRodData(
                                  toY: authC.jumlahMayPrestasi.value.toDouble(),
                                  color: greenCB,
                                )
                              ],
                            ),
                            BarChartGroupData(
                              x: 5,
                              barRods: [
                                BarChartRodData(
                                  toY: authC.jumlahJunPrestasi.value.toDouble(),
                                  color: greenCB,
                                )
                              ],
                            ),
                            BarChartGroupData(
                              x: 6,
                              barRods: [
                                BarChartRodData(
                                  toY: authC.jumlahJulPrestasi.value.toDouble(),
                                  color: greenCB,
                                )
                              ],
                            ),
                            BarChartGroupData(
                              x: 7,
                              barRods: [
                                BarChartRodData(
                                  toY: authC.jumlahAugPrestasi.value.toDouble(),
                                  color: greenCB,
                                )
                              ],
                            ),
                            BarChartGroupData(
                              x: 8,
                              barRods: [
                                BarChartRodData(
                                  toY: authC.jumlahSepPrestasi.value.toDouble(),
                                  color: greenCB,
                                )
                              ],
                            ),
                            BarChartGroupData(
                              x: 9,
                              barRods: [
                                BarChartRodData(
                                  toY: authC.jumlahOctPrestasi.value.toDouble(),
                                  color: greenCB,
                                )
                              ],
                            ),
                            BarChartGroupData(
                              x: 10,
                              barRods: [
                                BarChartRodData(
                                  toY: authC.jumlahNovPrestasi.value.toDouble(),
                                  color: greenCB,
                                )
                              ],
                            ),
                            BarChartGroupData(
                              x: 11,
                              barRods: [
                                BarChartRodData(
                                  toY: authC.jumlahDesPrestasi.value.toDouble(),
                                  color: greenCB,
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  }),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                child: title('Grafik Pertahun'),
              ),
              AspectRatio(
                aspectRatio: 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(right: 22),
                  child: BarChart(
                    BarChartData(
                      gridData: FlGridData(
                        checkToShowHorizontalLine: (value) => true,
                        checkToShowVerticalLine: (value) => false,
                      ),
                      barTouchData: BarTouchData(
                        allowTouchBarBackDraw: true,
                        touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: Colors.transparent,
                        ),
                      ),
                      alignment: BarChartAlignment.spaceAround,
                      minY: 0,
                      titlesData: FlTitlesData(
                        rightTitles: AxisTitles(drawBehindEverything: false),
                        topTitles: AxisTitles(drawBehindEverything: false),
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
                                  '${authC.listGraphAchievement![value.toInt()].year}');
                            },
                          ),
                        ),
                      ),
                      barGroups: [
                        ...authC.listGraphAchievement!.mapIndexed(
                          (index, element) {
                            return BarChartGroupData(
                              x: index,
                              barRods: [
                                BarChartRodData(
                                  toY: (element.total!).toDouble(),
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
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
