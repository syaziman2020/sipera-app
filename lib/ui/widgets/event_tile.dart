import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class EventTile extends StatelessWidget {
  final String imageurl;
  final String date;
  final String time;
  final String location;
  final String title;
  final Function() onTap;
  const EventTile({
    Key? key,
    required this.imageurl,
    required this.date,
    required this.time,
    required this.location,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FadeInImage(
                      width: 100,
                      height: 120,
                      fadeInCurve: Curves.easeInExpo,
                      fadeOutCurve: Curves.easeOutExpo,
                      placeholder:
                          const AssetImage("assets/noimage_portrait.png"),
                      image: NetworkImage(imageurl),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/noimage_portrait.png",
                          fit: BoxFit.cover,
                        );
                      },
                      fit: BoxFit.cover),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: 22),
                    height: 112,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: blackTextStyle.copyWith(
                                  fontWeight: medium, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
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
                                  const TextSpan(text: ' - '),
                                  TextSpan(text: time),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: blackTextStyle.copyWith(
                              fontWeight: light, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 12),
            width: double.infinity,
            color: const Color(0xffE0E0E0),
            height: 1,
          ),
        ],
      ),
    );
  }
}
