import 'package:dio/dio.dart';
import 'package:sipera_app/models/public/achievement_model.dart' as am;
import 'package:sipera_app/models/public/article_model.dart' as arm;
import 'package:sipera_app/models/public/event_model.dart' as em;
import 'package:sipera_app/models/public/statistic_model.dart' as sm;

import '../main_url.dart';

class PublicService {
  final MainUrl _mainUrl = MainUrl();
  Dio dio = Dio();
  Future<sm.StatisticModel?> getStatisticData() async {
    try {
      final response = await dio.get(
        "${_mainUrl.mainUrl}/statistik",
      );
      if (response.statusCode == 200) {
        sm.StatisticModel statisticModel =
            sm.StatisticModel.fromJson(response.data);
        return statisticModel;
      } else {
        throw Exception(
            'Get tidak berhasil dengan code ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<am.AchievementModel?> getAchievementData(String? search) async {
    try {
      final response = await dio.get(
        "${_mainUrl.mainUrl}/prestasi?cp=${search}",
      );
      if (response.statusCode == 200) {
        am.AchievementModel achievementModel =
            am.AchievementModel.fromJson(response.data);
        return achievementModel;
      } else {
        throw Exception(
            'Get tidak berhasil dengan code ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<arm.ArticleModel?> getArticleData(String? search) async {
    try {
      final response = await dio.get(
        "${_mainUrl.mainUrl}/artikel?judul=${search}",
      );
      if (response.statusCode == 200) {
        arm.ArticleModel articleModel =
            arm.ArticleModel.fromJson(response.data);
        return articleModel;
      } else {
        throw Exception(
            'Get tidak berhasil dengan code ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<em.EventModel> getEventData(String? search) async {
    try {
      final response = await dio.get(
        "${_mainUrl.mainUrl}/event",
      );
      if (response.statusCode == 200) {
        em.EventModel eventModel = em.EventModel.fromJson(response.data);
        return eventModel;
      } else {
        throw Exception(
            'Get tidak berhasil dengan code ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
