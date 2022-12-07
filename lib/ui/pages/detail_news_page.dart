import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/theme.dart';

class DetailNews extends StatelessWidget {
  const DetailNews(
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
      backgroundColor: const Color(0xffFAFAFA),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: Get.width,
              child: Stack(children: [
                FadeInImage(
                    width: Get.width,
                    fadeInCurve: Curves.easeInExpo,
                    fadeOutCurve: Curves.easeOutExpo,
                    placeholder:
                        const AssetImage("assets/no_image_available.png"),
                    image: NetworkImage('$imageUrl'),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        "assets/no_image_available.png",
                        fit: BoxFit.cover,
                      );
                    },
                    fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.only(top: 35, left: 20),
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
                                offset: const Offset(1, 1),
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
                  padding: const EdgeInsets.fromLTRB(22, 13, 22, 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: const Color(0xff8DEEB5),
                            borderRadius: BorderRadius.circular(7)),
                        child: Center(
                          child: Text(
                            '$date',
                            style: greenTextStyle.copyWith(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        '$title',
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        '$description',
                        style: greyTextStyle.copyWith(
                          fontSize: 14,
                          color: const Color(0xff333333),
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
