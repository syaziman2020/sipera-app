import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/theme.dart';

class DetailEvent extends StatelessWidget {
  const DetailEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteC,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: EdgeInsets.only(top: 35, left: 20),
                width: Get.width,
                height: Get.height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://akcdn.detik.net.id/community/media/visual/2021/07/31/sprinter-lalu-muhammad-zohri.jpeg?w=700&q=90'),
                  ),
                ),
                child: Align(
                  alignment: Alignment.topLeft,
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
            Column(
              children: [
                SizedBox(height: Get.height * 0.38),
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
                        'Siskom Cup 2022',
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Futsal',
                        style: greenTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
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
                                '21:00',
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
                                '18/09/2022',
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
                                Icons.place_outlined,
                                size: 20,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'Gor Pangsuma',
                                style: greyTextStyle.copyWith(
                                  fontSize: 13,
                                  color: Color(0xff4F4F4F),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 13),
                        height: 1,
                        decoration: BoxDecoration(
                          color: greyC.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eu facilisi dolor ut felis, tincidunt ac. Elementum convallis arcu ullamcorper luctus nisi. Neque malesuada neque pretium dui amet, velit malesuada non. Lacus sed vitae amet arcu ornare eget sem scelerisque. Odio id non sed faucibus congue ante. Vestibulum, quis sed sed in laoreet maecenas ultricies viverra. Cras orci sed dignissim sit eget feugiat sit etiam. Arcu rhoncus non magna felis enim eget ridiculus fames suscipit. Egestas euismod odio egestas elit vulputate lorem in gravida. Mi sagittis, libero, pulvinar sed ut habitasse suspendisse. Nunc consectetur proin sed adipiscing amet molestie. Enim neque, diam ullamcorper massa at.us sem faucibus massa vitae. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eu facilisi dolor ut felis, tincidunt ac. Elementum convallis arcu ullamcorper luctus nisi. Neque malesuada neque pretium dui amet, velit malesuada non. Lacus sed vitae amet arcu ornare eget sem scelerisque. Odio id non sed faucibus congue ante. Vestibulum, quis sed sed in laoreet maecenas ultricies viverra. Cras orci sed dignissim sit eget feugiat sit etiam. Arcu rhoncus non magna felis enim eget ridiculus fames suscipit. Egestas euismod odio egestas elit vulputate lorem in gravida. Mi sagittis, libero, pulvinar sed ut habitasse suspendisse. Nunc consectetur proin sed adipiscing amet molestie. Enim neque, diam ullamcorper massa at.us sem faucibus massa vitae.',
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
