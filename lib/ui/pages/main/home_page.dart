import 'package:flutter/material.dart';
import 'package:sipera_app/routes/route_names.dart';
import 'package:sipera_app/shared/theme.dart';
import 'package:sipera_app/ui/widgets/card_achievement.dart';
import 'package:sipera_app/ui/widgets/card_news.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget iconHeader(
        {required Function() onTap,
        required String imageUrl,
        required String title}) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: whiteC,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xffC4C4C4), width: 1),
                ),
                child: Center(
                  child: Image.asset(
                    imageUrl,
                    width: 24,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: blackTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: medium,
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget title(String text) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
        child: Text(
          text,
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 13,
          ),
          title('Statistik'),
          Container(
            margin: EdgeInsets.fromLTRB(22, 0, 22, 0),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            width: double.infinity,
            decoration: cardShadow().copyWith(color: whiteC),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconHeader(
                  onTap: () {
                    Get.toNamed(RouteName.statisticPage);
                  },
                  imageUrl: 'assets/athlete.png',
                  title: 'Atlet',
                ),
                iconHeader(
                  onTap: () {},
                  imageUrl: 'assets/pelatih.png',
                  title: 'Pelatih',
                ),
                iconHeader(
                  onTap: () {},
                  imageUrl: 'assets/guru.png',
                  title: 'Guru Olahraga',
                ),
                iconHeader(
                  onTap: () {},
                  imageUrl: 'assets/wasit.png',
                  title: 'Wasit',
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget latestNews() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          title('Berita Terkini'),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 22, top: 4, bottom: 5),
            child: Row(
              children: [
                CardNews(
                  imageUrl:
                      'https://media.suara.com/pictures/653x366/2022/03/20/96268-ganda-putra-indonesia-muhammad-shohibul-fikribagas-maulana-belakang.webp',
                  category: 'Sports',
                  writer: 'Uray W',
                  time: '3 jam yang lalu',
                  title: 'Atlet Untan berhasil meraih',
                ),
                CardNews(
                  imageUrl:
                      'https://media.suara.com/pictures/653x366/2022/03/20/96268-ganda-putra-indonesia-muhammad-shohibul-fikribagas-maulana-belakang.webp',
                  category: 'Sports',
                  writer: 'Uray W',
                  time: '3 jam yang lalu',
                  title:
                      'Atlet Untan berhasil meraih kemenangan tingkat fakultas',
                ),
                CardNews(
                  imageUrl:
                      'https://media.suara.com/pictures/653x366/2022/03/20/96268-ganda-putra-indonesia-muhammad-shohibul-fikribagas-maulana-belakang.webp',
                  category: 'Sports',
                  writer: 'Uray W',
                  time: '3 jam yang lalu',
                  title:
                      'Atlet Untan berhasil meraih kemenangan tingkat fakultas',
                ),
                CardNews(
                  imageUrl:
                      'https://media.suara.com/pictures/653x366/2022/03/20/96268-ganda-putra-indonesia-muhammad-shohibul-fikribagas-maulana-belakang.webp',
                  category: 'Sports',
                  writer: 'Uray W',
                  time: '3 jam yang lalu',
                  title:
                      'Atlet Untan berhasil meraih kemenangan tingkat fakultas',
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget newAchievement() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          title(
            'Prestasi Terbaru',
          ),
          CardAchievement(
            imageUrl:
                'https://img.okezone.com/content/2022/05/01/40/2588056/hasil-final-badminton-asia-championship-2022-wang-zhiyi-juara-usai-kalahkan-akane-yamaguchi-e2JTQH95sl.jpg',
            title: 'Juara 1 Lomba Badminton',
            name: 'Ferdy Sambo',
            onTap: () {},
          ),
          CardAchievement(
            imageUrl:
                'https://img.okezone.com/content/2022/05/01/40/2588056/hasil-final-badminton-asia-championship-2022-wang-zhiyi-juara-usai-kalahkan-akane-yamaguchi-e2JTQH95sl.jpg',
            title: 'Juara 1 Lomba Badminton',
            name: 'Ferdy Sambo',
            onTap: () {},
          ),
          CardAchievement(
            imageUrl:
                'https://img.okezone.com/content/2022/05/01/40/2588056/hasil-final-badminton-asia-championship-2022-wang-zhiyi-juara-usai-kalahkan-akane-yamaguchi-e2JTQH95sl.jpg',
            title: 'Juara 1 Lomba Badminton',
            name: 'Ferdy Sambo',
            onTap: () {},
          ),
        ],
      );
    }

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            latestNews(),
            newAchievement(),
          ],
        ),
      ),
    );
  }
}
