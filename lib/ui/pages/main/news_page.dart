import 'package:flutter/material.dart';
import 'package:sipera_app/routes/route_names.dart';
import 'package:sipera_app/ui/widgets/form_search.dart';
import 'package:sipera_app/ui/widgets/news_tile.dart';
import 'package:get/get.dart';

class NewsPage extends StatelessWidget {
  NewsPage({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SearchForm(controller: searchController),
          const SizedBox(
            height: 10,
          ),
          NewsTile(
            onTap: () {
              Get.toNamed(RouteName.detailNews);
            },
            imageurl:
                'https://media.suara.com/pictures/653x366/2022/03/20/96268-ganda-putra-indonesia-muhammad-shohibul-fikribagas-maulana-belakang.webp',
            time: '21:00,',
            date: '07-September-2022',
            title: '10 pemain untan masuk club bola munchen',
            category: 'Sports',
          ),
          NewsTile(
            onTap: () {},
            imageurl:
                'https://media.suara.com/pictures/653x366/2022/03/20/96268-ganda-putra-indonesia-muhammad-shohibul-fikribagas-maulana-belakang.webp',
            time: '21:00,',
            date: '07-September-2022',
            title: '10 pemain untan masuk club bola munchen',
            category: 'Sports',
          ),
          NewsTile(
            onTap: () {},
            imageurl:
                'https://media.suara.com/pictures/653x366/2022/03/20/96268-ganda-putra-indonesia-muhammad-shohibul-fikribagas-maulana-belakang.webp',
            time: '21:00,',
            date: '07-September-2022',
            title: '10 pemain untan masuk club',
            category: 'Sports',
          ),
          NewsTile(
            onTap: () {},
            imageurl:
                'https://media.suara.com/pictures/653x366/2022/03/20/96268-ganda-putra-indonesia-muhammad-shohibul-fikribagas-maulana-belakang.webp',
            time: '21:00,',
            date: '07-September-2022',
            title: '10 pemain untan masuk club bola munchen',
            category: 'Sports',
          ),
        ],
      ),
    );
  }
}
