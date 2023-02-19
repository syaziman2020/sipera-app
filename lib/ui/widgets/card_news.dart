import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipera_app/models/public/article_model.dart';

import '../../shared/theme.dart';

class CardNews extends StatelessWidget {
  final String imageUrl;
  final Function() onTap;
  final String title;
  final String date;
  List<KategoriArtikel?>? listCategory = [];

  CardNews({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.onTap,
    required this.listCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width * 0.66,
        height: Get.height * 0.41,
        margin: const EdgeInsets.only(right: 20, top: 15, bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: cardShadow().copyWith(
          boxShadow: [
            BoxShadow(
              color: blackC.withOpacity(0.25),
              offset: const Offset(1, 1),
              blurRadius: 4,
              spreadRadius: 1,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: FadeInImage(
                      height: Get.height * 0.21,
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
                ),
                const SizedBox(
                  height: 5,
                ),
                (listCategory != null || listCategory!.isNotEmpty)
                    ? Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: Get.width * 0.63,
                        child: Wrap(
                          direction: Axis.horizontal,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [
                            ...listCategory!.map(
                              (e) => Container(
                                margin: const EdgeInsets.only(
                                  right: 5,
                                  bottom: 5,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xff8DEEB5).withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  '${e?.masterArtikel?.kategoriArtikel ?? ''}',
                                  style: greenTextStyle.copyWith(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.calendar_month_rounded,
                  size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  date,
                  style: blackTextStyle.copyWith(
                    fontSize: 11,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
