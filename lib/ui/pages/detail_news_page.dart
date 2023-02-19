import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/public/article_model.dart';
import '../../shared/theme.dart';

class DetailNews extends StatelessWidget {
  const DetailNews(
      {Key? key,
      required this.category,
      required this.date,
      required this.id,
      required this.description,
      required this.imageUrl,
      required this.title})
      : super(key: key);
  final List<KategoriArtikel>? category;
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
                Container(
                  margin: EdgeInsets.only(
                    top: Get.height * 0.34,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  height: Get.height * 0.04,
                  decoration: BoxDecoration(
                    color: whiteC,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  child: Center(
                      child: Image.asset(
                    'assets/crop_logo.png',
                    height: 40,
                    fit: BoxFit.cover,
                  )),
                )
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          (category!.isNotEmpty || category != null)
                              ? Flexible(
                                  flex: 2,
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    children: [
                                      ...category!.map(
                                        (e) => Container(
                                          margin: const EdgeInsets.only(
                                              right: 5, bottom: 5),
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: const Color(0xff8DEEB5),
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Center(
                                              child: Text(
                                                '${e.masterArtikel?.kategoriArtikel ?? 'Olahraga'}',
                                                style: greenTextStyle.copyWith(
                                                    fontSize: 12,
                                                    fontWeight: medium),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: Text(
                                '$date',
                                style: greyTextStyle.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          )
                        ],
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
