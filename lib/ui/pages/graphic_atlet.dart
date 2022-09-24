import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/theme.dart';
import 'package:fl_chart/fl_chart.dart';

class GraphicAtlet extends StatelessWidget {
  const GraphicAtlet({super.key});

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
                  vertical: 20,
                ),
                child: title('Grafik Perbulan'),
              ),
              AspectRatio(
                aspectRatio: 0.7,
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
                      minY: 5,
                      titlesData: FlTitlesData(
                        topTitles: AxisTitles(drawBehindEverything: false),
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
                              toY: 100,
                              color: greenCB,
                            )
                          ],
                        ),
                        BarChartGroupData(
                          x: 1,
                          barRods: [
                            BarChartRodData(
                              toY: 100,
                              color: greenCB,
                            )
                          ],
                        ),
                        BarChartGroupData(
                          x: 2,
                          barRods: [
                            BarChartRodData(
                              toY: 40,
                              color: greenCB,
                            )
                          ],
                        ),
                        BarChartGroupData(
                          x: 3,
                          barRods: [
                            BarChartRodData(
                              toY: 60,
                              color: greenCB,
                            )
                          ],
                        ),
                        BarChartGroupData(
                          x: 4,
                          barRods: [
                            BarChartRodData(
                              toY: 20,
                              color: greenCB,
                            )
                          ],
                        ),
                        BarChartGroupData(
                          x: 5,
                          barRods: [
                            BarChartRodData(
                              toY: 70,
                              color: greenCB,
                            )
                          ],
                        ),
                        BarChartGroupData(
                          x: 6,
                          barRods: [
                            BarChartRodData(
                              toY: 80,
                              color: greenCB,
                            )
                          ],
                        ),
                        BarChartGroupData(
                          x: 7,
                          barRods: [
                            BarChartRodData(
                              toY: 90,
                              color: greenCB,
                            )
                          ],
                        ),
                        BarChartGroupData(
                          x: 8,
                          barRods: [
                            BarChartRodData(
                              toY: 110,
                              color: greenCB,
                            )
                          ],
                        ),
                        BarChartGroupData(
                          x: 9,
                          barRods: [
                            BarChartRodData(
                              toY: 220,
                              color: greenCB,
                            )
                          ],
                        ),
                        BarChartGroupData(
                          x: 10,
                          barRods: [
                            BarChartRodData(
                              toY: 30,
                              color: greenCB,
                            )
                          ],
                        ),
                        BarChartGroupData(
                          x: 11,
                          barRods: [
                            BarChartRodData(
                              toY: 50,
                              color: greenCB,
                            )
                          ],
                        ),
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
                child: title('Grafik Pertahun'),
              ),
              AspectRatio(
                aspectRatio: 0.7,
                child: Padding(
                  padding: EdgeInsets.only(right: 22),
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
                      minY: 5,
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
                              switch (value.toInt()) {
                                case 0:
                                  return Text(
                                    '2019',
                                    style: blackTextStyle,
                                  );
                                case 1:
                                  return Text(
                                    '2020',
                                    style: blackTextStyle,
                                  );
                                case 2:
                                  return Text(
                                    '2021',
                                    style: blackTextStyle,
                                  );
                                case 3:
                                  return Text(
                                    '2022',
                                    style: blackTextStyle,
                                  );
                                case 4:
                                  return Text(
                                    '2023',
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
                              toY: 100,
                              color: greenCB,
                            )
                          ],
                        ),
                        BarChartGroupData(
                          x: 1,
                          barRods: [
                            BarChartRodData(
                              toY: 100,
                              color: greenCB,
                            )
                          ],
                        ),
                        BarChartGroupData(
                          x: 2,
                          barRods: [
                            BarChartRodData(
                              toY: 40,
                              color: greenCB,
                            )
                          ],
                        ),
                        BarChartGroupData(
                          x: 3,
                          barRods: [
                            BarChartRodData(
                              toY: 60,
                              color: greenCB,
                            )
                          ],
                        ),
                        BarChartGroupData(
                          x: 4,
                          barRods: [
                            BarChartRodData(
                              toY: 20,
                              color: greenCB,
                            )
                          ],
                        ),
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
                aspectRatio: 0.7,
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
                      minY: 5,
                      titlesData: FlTitlesData(
                        topTitles: AxisTitles(drawBehindEverything: false),
                        rightTitles: AxisTitles(drawBehindEverything: false),
                        bottomTitles: AxisTitles(
                          axisNameWidget: Text('Umur',
                              style: blackTextStyle.copyWith(
                                  fontWeight: semiBold)),
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              switch (value.toInt()) {
                                case 0:
                                  return Text(
                                    '18',
                                    style: blackTextStyle,
                                  );
                                case 1:
                                  return Text(
                                    '19',
                                    style: blackTextStyle,
                                  );
                                case 2:
                                  return Text(
                                    '20',
                                    style: blackTextStyle,
                                  );
                                case 3:
                                  return Text(
                                    '21',
                                    style: blackTextStyle,
                                  );
                                case 4:
                                  return Text(
                                    '22',
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
                              toY: 100,
                              color: greenCB,
                            )
                          ],
                        ),
                        BarChartGroupData(
                          x: 1,
                          barRods: [
                            BarChartRodData(
                              toY: 100,
                              color: greenCB,
                            )
                          ],
                        ),
                        BarChartGroupData(
                          x: 2,
                          barRods: [
                            BarChartRodData(
                              toY: 40,
                              color: greenCB,
                            )
                          ],
                        ),
                        BarChartGroupData(
                          x: 3,
                          barRods: [
                            BarChartRodData(
                              toY: 60,
                              color: greenCB,
                            )
                          ],
                        ),
                        BarChartGroupData(
                          x: 4,
                          barRods: [
                            BarChartRodData(
                              toY: 20,
                              color: greenCB,
                            )
                          ],
                        ),
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
