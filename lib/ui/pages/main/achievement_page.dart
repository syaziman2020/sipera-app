import 'package:flutter/material.dart';
import 'package:sipera_app/controllers/public_controller.dart';

import 'package:get/get.dart';
import 'package:sipera_app/ui/pages/detail_achievement_page.dart';

import '../../../shared/theme.dart';
import '../../widgets/card_achievement.dart';

class AchievementPage extends StatefulWidget {
  AchievementPage({Key? key}) : super(key: key);

  @override
  State<AchievementPage> createState() => _AchievementPageState();
}

class _AchievementPageState extends State<AchievementPage> {
  final TextEditingController searchController = TextEditingController();

  final publicC = Get.find<PublicController>();

  final _scrollController = ScrollController();

  final _scrollAntrianController = ScrollController();

  bool onLoad = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(22, 15, 22, 10),
            child: TextFormField(
              controller: searchController,
              cursorColor: greenCA,
              onChanged: (value) {
                if (value.length % 4 == 0) {
                  publicC.getAchievementData(value, '');
                }
              },
              style: blackTextStyle.copyWith(fontSize: 13),
              decoration: InputDecoration(
                hintText: 'Cari...',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/search.png',
                        fit: BoxFit.cover,
                        height: 24,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 5),
                        height: 24,
                        width: 1,
                        color: greenCA,
                      )
                    ],
                  ),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    searchController.clear();
                    publicC.getAchievementData('', '1');
                  },
                  child: Icon(
                    Icons.cancel,
                    color: greenCA,
                  ),
                ),
                contentPadding: const EdgeInsets.all(12),
                hintStyle: blackTextStyle.copyWith(
                  fontSize: 13,
                  color: blackC.withOpacity(0.87),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  borderSide: BorderSide(color: greenCA),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  borderSide: BorderSide(color: greenCA),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            color: Color(0xffE0E0E0),
            thickness: 1,
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Obx(
              () {
                if (publicC.achievementStatus.isTrue) {
                  if (publicC.listAchievement!.isNotEmpty) {
                    return NotificationListener(
                      onNotification: (ScrollNotification notification) {
                        return _handleScrollNotification(
                            scrollNotification: notification,
                            page: publicC.achievementResult!.value.results!
                                .prestasi!.currentPage!,
                            lastPage: publicC.achievementResult!.value.results!
                                .prestasi!.lastPage!);
                      },
                      child: RefreshIndicator(
                        displacement: 5,
                        color: greenCB,
                        onRefresh: () async {
                          searchController.clear();
                          onLoad = false;
                          await publicC.getAchievementData('', '1');
                          print('gggg');
                          print(
                              '${publicC.achievementResult!.value.results!.prestasi!.data![0].atlet!.foto!.substring(57, publicC.achievementResult!.value.results!.prestasi!.data![0].atlet!.foto!.length)}');
                        },
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          physics: AlwaysScrollableScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...publicC.listAchievement!
                                  .map(
                                    (e) => CardAchievement(
                                      imageUrl: '${e.foto}',
                                      title: '${e.namaPrestasi}',
                                      name: '${e.cabor!.namaCabor}',
                                      onTap: () {
                                        Get.to(
                                          () => DetailAchievement(
                                            achieveName: '${e.namaPrestasi}',
                                            bornPlace:
                                                '${e.atlet!.tempatLahir}',
                                            name: '${e.atlet!.nama}',
                                            imageUrlAchieve: '${e.foto}',
                                            imageUrlAtlet:
                                                '${e.atlet!.foto!.substring(57, e.atlet!.foto!.length)}',
                                            date:
                                                '${e.atlet!.tanggalLahir!.split('-').reversed.join('/')}',
                                            category: '${e.cabor!.namaCabor}',
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                  .toList(),
                              (publicC.achievementResult!.value.results!
                                          .prestasi!.currentPage! <
                                      publicC.achievementResult!.value.results!
                                          .prestasi!.lastPage!)
                                  ? SizedBox(
                                      height: 80,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: greenCB,
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                              SizedBox(
                                height: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        'Data tidak ditemukan',
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                        ),
                      ),
                    );
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: greenCA,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  bool _handleScrollNotification({
    required ScrollNotification scrollNotification,
    required int page,
    required int lastPage,
  }) {
    // Check Scroll Position
    if (scrollNotification is ScrollEndNotification &&
        _scrollController.position.extentAfter == _scrollController.offset) {
      // Set More Loading = true
      if (onLoad == true) {
        return false;
      }
      onLoad = true;
      // More Posts
      if (page != lastPage) {
        publicC.refetchAchievement('', (page + 1).toString()).then(
          (value) {
            // Set More Loading = false

            setState(() {
              searchController.clear();
              onLoad = false;
            });
          },
        );
      }
    }

    return false;
  }
}
