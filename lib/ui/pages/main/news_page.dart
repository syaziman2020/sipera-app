import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sipera_app/controllers/public_controller.dart';
import 'package:sipera_app/shared/theme.dart';
import 'package:sipera_app/ui/pages/detail_news_page.dart';

import 'package:sipera_app/ui/widgets/news_tile.dart';
import 'package:get/get.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  TextEditingController searchController = TextEditingController();

  final publicC = Get.find<PublicController>();

  final _scrollController = ScrollController();

  bool onLoad = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(22, 15, 22, 10),
            child: TextFormField(
              controller: searchController,
              cursorColor: greenCA,
              onChanged: (value) {
                if (value.length % 4 == 0) {
                  publicC.getArticleData(value, '');
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
                    publicC.getArticleData('', '1');
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
            height: 10,
          ),
          Expanded(
            child: Obx(
              () {
                if (publicC.articleStatus.isTrue) {
                  if (publicC.listArticle!.isNotEmpty) {
                    return NotificationListener(
                      onNotification: (ScrollNotification notification) {
                        return _handleScrollNotification(
                            scrollNotification: notification,
                            page: publicC.articleResult!.value.results!
                                .allArtikel!.currentPage!,
                            lastPage: publicC.articleResult!.value.results!
                                .allArtikel!.lastPage!);
                      },
                      child: RefreshIndicator(
                        displacement: 5,
                        color: greenCB,
                        onRefresh: () async {
                          searchController.clear();
                          onLoad = false;
                          await publicC.getArticleData('', '1');
                        },
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: _scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...publicC.listArticle!
                                  .map(
                                    (e) => NewsTile(
                                      onTap: () {
                                        Get.to(
                                          () => DetailNews(
                                              date:
                                                  '${DateFormat("d MMMM yyyy").format(DateTime.parse(e.tanggal!))}',
                                              id: e.id!,
                                              description: '${e.isiArtikel}',
                                              imageUrl: '${e.imgArtikel}',
                                              title: '${e.judul}'),
                                        );
                                      },
                                      imageurl: '${e.imgArtikel}',
                                      id: e.id!,
                                      date:
                                          '${DateFormat("d MMMM yyyy").format(DateTime.parse(e.tanggal!))}',
                                      title: '${e.judul}',
                                    ),
                                  )
                                  .toList(),
                              (publicC.articleResult!.value.results!.allArtikel!
                                          .currentPage! <
                                      publicC.articleResult!.value.results!
                                          .allArtikel!.lastPage!)
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
                    return Text(
                      'Tidak Ada yang bisa ditampilkan',
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                      ),
                    );
                  }
                }
                return SizedBox(
                  height: Get.height * 0.7,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: greenCB,
                    ),
                  ),
                );
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
        _scrollController.position.maxScrollExtent ==
            _scrollController.offset) {
      // Set More Loading = true
      if (onLoad == true) {
        return false;
      }
      onLoad = true;
      // More Posts
      if (page != lastPage) {
        publicC.refetchArticle('', (page + 1).toString()).then(
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
