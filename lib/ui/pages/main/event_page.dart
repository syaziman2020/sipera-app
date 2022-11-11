import 'package:flutter/material.dart';
import 'package:sipera_app/controllers/public_controller.dart';
import 'package:sipera_app/shared/theme.dart';
import 'package:sipera_app/ui/pages/detail_event_page.dart';
import 'package:sipera_app/ui/widgets/event_tile.dart';

import 'package:get/get.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final TextEditingController searchController = TextEditingController();

  final publicC = Get.find<PublicController>();

  final _scrollController = ScrollController();

  bool onLoad = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(22, 15, 22, 10),
            child: TextFormField(
              controller: searchController,
              cursorColor: greenCA,
              onChanged: (value) {
                if (value.length % 4 == 0) {
                  publicC.getEventData(value, '');
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
                    publicC.getEventData('', '1');
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
            child: Obx(() {
              if (publicC.eventStatus.isTrue) {
                if (publicC.listEvent!.isNotEmpty) {
                  return NotificationListener(
                    onNotification: (ScrollNotification notification) {
                      return _handleScrollNotification(
                          scrollNotification: notification,
                          page: publicC
                              .eventResult!.value.results!.event!.currentPage!,
                          lastPage: publicC
                              .eventResult!.value.results!.event!.lastPage!);
                    },
                    child: RefreshIndicator(
                      displacement: 5,
                      color: greenCB,
                      onRefresh: () async {
                        searchController.clear();
                        onLoad = false;
                        await publicC.getEventData('', '1');
                      },
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        controller: _scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...publicC.listEvent!
                                .map(
                                  (e) => EventTile(
                                    onTap: () {
                                      Get.to(
                                        () => DetailEvent(
                                          title: '${e.judul}',
                                          location: '${e.lokasi}',
                                          date:
                                              '${e.tanggal!.split('-').reversed.join('/') ?? ''}',
                                          timeBegin:
                                              '${e.waktuMulai!.substring(0, e.waktuMulai!.length - 3) ?? ''}',
                                          timeEnd:
                                              '${e.waktuSelesai!.substring(0, e.waktuSelesai!.length - 3) ?? ''}',
                                          imageUrl: '${e.imgEvent}',
                                          dueDate:
                                              '${e.tanggalSelesai!.split('-').reversed.join('/') ?? ''}',
                                        ),
                                      );
                                    },
                                    title: '${e.judul}',
                                    location: '${e.lokasi}',
                                    date:
                                        '${e.tanggal!.split('-').reversed.join('/')}',
                                    time:
                                        '${e.waktuMulai!.substring(0, e.waktuMulai!.length - 3)} WIB',
                                    imageurl: '${e.imgEvent}',
                                  ),
                                )
                                .toList(),
                            (publicC.eventResult!.value.results!.event!
                                        .currentPage! <
                                    publicC.eventResult!.value.results!.event!
                                        .lastPage!)
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
                            ),
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
            }),
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
        publicC.refetchEvent('', (page + 1).toString()).then(
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
