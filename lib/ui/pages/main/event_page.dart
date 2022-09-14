import 'package:flutter/material.dart';
import 'package:sipera_app/routes/route_names.dart';
import 'package:sipera_app/shared/theme.dart';
import 'package:sipera_app/ui/widgets/event_tile.dart';
import 'package:sipera_app/ui/widgets/form_search.dart';
import 'package:get/get.dart';
import '../../widgets/button_filter.dart';

class EventPage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchForm(controller: searchController),
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 22, bottom: 10),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ButtonFilter(
                    title: 'Semua',
                    status: true,
                  ),
                  ButtonFilter(
                    title: 'Bulu Tangkis',
                  ),
                  ButtonFilter(
                    title: 'Sepak Bola',
                  ),
                  ButtonFilter(
                    title: 'Voli',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            EventTile(
              onTap: () {
                Get.toNamed(RouteName.detailEvent);
              },
              title: 'Workshop Esport Screen XII',
              location: 'Gedung Kulber',
              date: '20/08/2022',
              time: '21:00',
              imageurl:
                  'https://badminton-coach.co.uk/wp-content/uploads/2013/04/badminton-jump-smash-300x453.jpg',
            ),
            EventTile(
              onTap: () {},
              title: 'Workshop Esport Screen XII',
              location: 'Gedung Kulber',
              date: '20/08/2022',
              time: '21:00',
              imageurl:
                  'https://badminton-coach.co.uk/wp-content/uploads/2013/04/badminton-jump-smash-300x453.jpg',
            ),
            EventTile(
              onTap: () {},
              title: 'Workshop Esport Screen XII',
              location: 'Gedung Kulber',
              date: '20/08/2022',
              time: '21:00',
              imageurl:
                  'https://badminton-coach.co.uk/wp-content/uploads/2013/04/badminton-jump-smash-300x453.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
