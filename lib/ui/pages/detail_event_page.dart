import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/theme.dart';

class DetailEvent extends StatelessWidget {
  final String title;
  final String date;
  final String timeBegin;
  final String timeEnd;
  final String location;
  final String imageUrl;

  DetailEvent({
    Key? key,
    required this.title,
    required this.date,
    required this.imageUrl,
    required this.location,
    required this.timeBegin,
    required this.timeEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteC,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height * 0.85,
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  SizedBox(
                    height: Get.height * 0.85,
                    child: FadeInImage(
                        fadeInCurve: Curves.easeInExpo,
                        fadeOutCurve: Curves.easeOutExpo,
                        placeholder: AssetImage("assets/noimage_portrait.png"),
                        image: NetworkImage('${imageUrl}'),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            "assets/noimage_portrait.png",
                            fit: BoxFit.cover,
                          );
                        },
                        fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 35, left: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: whiteC.withOpacity(0.7),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: blackC.withOpacity(0.25),
                                  offset: Offset(1, 1),
                                  spreadRadius: 1,
                                  blurRadius: 1),
                            ],
                          ),
                          child: const Center(
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(height: Get.height * 0.82),
                Container(
                  padding: EdgeInsets.all(22),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: whiteC,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${title}',
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: greenCB,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${location}',
                            style: greenTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.schedule,
                                size: 20,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '${timeBegin} WIB - ${timeEnd} WIB',
                                style: greyTextStyle.copyWith(
                                  fontSize: 13,
                                  color: Color(0xff4F4F4F),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                size: 20,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '${date}',
                                style: greyTextStyle.copyWith(
                                  fontSize: 13,
                                  color: Color(0xff4F4F4F),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
