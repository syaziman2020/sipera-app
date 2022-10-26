import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/theme.dart';

class DetailNews extends StatelessWidget {
  DetailNews(
      {Key? key,
      required this.date,
      required this.id,
      required this.description,
      required this.imageUrl,
      required this.title})
      : super(key: key);
  final String imageUrl;
  final String description;
  final String title;
  final String date;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: Get.width,
              child: Stack(children: [
                FadeInImage(
                    fadeInCurve: Curves.easeInExpo,
                    fadeOutCurve: Curves.easeOutExpo,
                    placeholder: AssetImage("assets/no_image.png"),
                    image: NetworkImage('${imageUrl}'),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        "assets/no_image.png",
                        fit: BoxFit.cover,
                      );
                    },
                    fit: BoxFit.cover),
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
              ]),
            ),
            Column(
              children: [
                SizedBox(height: Get.height * 0.37),
                Padding(
                  padding: EdgeInsets.fromLTRB(22, 13, 22, 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xff8DEEB5),
                            borderRadius: BorderRadius.circular(7)),
                        child: Container(
                          child: Center(
                            child: Text(
                              '${date}',
                              style: greenTextStyle.copyWith(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '${title}',
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: medium,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '${description}',
                        style: greyTextStyle.copyWith(
                          fontSize: 14,
                          color: Color(0xff333333),
                        ),
                      )
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
