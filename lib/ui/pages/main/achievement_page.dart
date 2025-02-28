import 'package:flutter/material.dart';
import 'package:sipera_app/controllers/public_controller.dart';

import 'package:get/get.dart';
import 'package:sipera_app/ui/pages/detail_achievement_page.dart';

import '../../../shared/theme.dart';
import '../../widgets/card_achievement.dart';

class AchievementPage extends StatefulWidget {
  const AchievementPage({Key? key}) : super(key: key);

  @override
  State<AchievementPage> createState() => _AchievementPageState();
}

class _AchievementPageState extends State<AchievementPage> {
  final TextEditingController searchController = TextEditingController();

  final publicC = Get.find<PublicController>();

  final _scrollController = ScrollController();

  bool onLoad = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(22, 15, 22, 10),
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
                        margin: const EdgeInsets.only(left: 10, right: 5),
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
          const SizedBox(
            height: 15,
          ),
          const Divider(
            color: Color(0xffE0E0E0),
            thickness: 1,
          ),
          const SizedBox(
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
                        },
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...publicC.listAchievement!.map((e) {
                                return CardAchievement(
                                  first: '${e.medaliEmas ?? 0}',
                                  second: '${e.medaliPerak ?? 0}',
                                  third: '${e.medaliPerunggu ?? 0}',
                                  imageUrl: '${e.foto}',
                                  title: '${e.namaLomba}',
                                  name: '${e.namaPerwakilan}',
                                  onTap: () {
                                    Get.to(
                                      () => DetailAchievement(
                                        first: '${e.medaliEmas ?? 0}',
                                        second: '${e.medaliPerak ?? 0}',
                                        third: '${e.medaliPerunggu ?? 0}',
                                        link:
                                            '${publicC.achievementResult!.value.results!.link}',
                                        achieveName: '${e.namaLomba}',
                                        imageUrlAchieve: '${e.foto}',
                                        listPrestasiAtlet: e.prestasiAtlet!,
                                        category: '${e.namaPerwakilan}',
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
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
                              const SizedBox(
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
        _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
      // Set More Loading = true
      if (onLoad == true) {
        return false;
      }
      onLoad = true;

      // More Posts
      if (page != lastPage) {
        publicC.refetchAchievement('', (page + 1).toString()).then(
          (value) {
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
