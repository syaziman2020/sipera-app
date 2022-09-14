import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class NewsTile extends StatelessWidget {
  final String date;
  final String time;
  final String category;
  final String imageurl;
  final String title;
  final Function() onTap;
  NewsTile({
    Key? key,
    required this.date,
    required this.time,
    required this.category,
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
          margin: EdgeInsets.only(top: 12, bottom: 12),
          width: double.infinity,
          color: Color(0xffE0E0E0),
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
                    height: 80,
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
                                  TextSpan(text: ' | '),
                                  TextSpan(text: time),
                                ],
                              ),
                            ),
                            Text(
                              title,
                              style: blackTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          category,
                          style: greyTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.network(
                    imageurl,
                    width: 100,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
