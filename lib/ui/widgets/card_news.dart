import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CardNews extends StatelessWidget {
  String imageUrl;
  String category;
  String title;
  String writer;
  String time;

  CardNews({
    Key? key,
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.writer,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 295,
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.all(10),
      decoration: cardShadow().copyWith(
        boxShadow: [
          BoxShadow(
            color: blackC.withOpacity(0.25),
            offset: Offset(1, 1),
            blurRadius: 4,
            spreadRadius: 1,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
              height: 163,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            category,
            style: greyTextStyle.copyWith(),
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 5),
                width: 22,
                height: 22,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(
                    0xffE5E5E5,
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/people.png',
                    fit: BoxFit.cover,
                    width: 14,
                  ),
                ),
              ),
              Text(
                writer,
                style: blackTextStyle.copyWith(
                  fontSize: 11,
                ),
              ),
              Container(
                width: 3,
                height: 3,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: greyC,
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                time,
                style: greyTextStyle.copyWith(
                  fontSize: 11,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
