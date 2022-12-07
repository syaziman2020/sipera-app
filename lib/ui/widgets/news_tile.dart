import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class NewsTile extends StatelessWidget {
  final String date;
  final int id;

  final String imageurl;
  final String title;
  final Function() onTap;
  const NewsTile({
    Key? key,
    required this.date,
    required this.id,
    required this.imageurl,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 12, bottom: 12),
          width: double.infinity,
          color: const Color(0xffE0E0E0),
          height: 1,
        ),
        InkWell(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                style: greyTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: light,
                                ),
                                children: [
                                  TextSpan(
                                    text: date,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: blackTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: FadeInImage(
                      height: 80,
                      width: 100,
                      fadeInCurve: Curves.easeInExpo,
                      fadeOutCurve: Curves.easeOutExpo,
                      placeholder:
                          const AssetImage("assets/no_image_available.png"),
                      image: NetworkImage(imageurl),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/no_image_available.png",
                          fit: BoxFit.cover,
                        );
                      },
                      fit: BoxFit.cover),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
