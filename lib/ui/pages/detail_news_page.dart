import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/theme.dart';

class DetailNews extends StatelessWidget {
  const DetailNews({Key? key}) : super(key: key);

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
                  height: 41,
                  decoration: BoxDecoration(
                    color: whiteC,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  child: Center(
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(22, 13, 22, 22),
                  margin: EdgeInsets.only(bottom: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffFAFAFA),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Color(0xff8DEEB5),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Container(
                                child: Center(
                                  child: Text(
                                    'Sports',
                                    style: greenTextStyle.copyWith(
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            flex: 2,
                            child: Text(
                              '07-September-2022 | 21:00',
                              style: greyTextStyle.copyWith(
                                fontSize: 13,
                                color: Color(0xff4F4F4F),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Siskom Cup 2022',
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: medium,
                        ),
                      ),
                      SizedBox(
                        height: 15,
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
