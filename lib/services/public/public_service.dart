import 'package:dio/dio.dart';
import 'package:sipera_app/models/public/achievement_model.dart' as am;
import 'package:sipera_app/models/public/article_model.dart' as arm;
import 'package:sipera_app/models/public/event_model.dart' as em;
import 'package:sipera_app/models/public/slider_model.dart' as slm;
import 'package:sipera_app/models/public/statistic_model.dart' as sm;

import '../main_url.dart';

class PublicService {
  final MainUrl _mainUrl = MainUrl();
  Dio dio = Dio();

  Future<sm.StatisticModel?> getStatisticData() async {
    dio.options.receiveTimeout = 20000;
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

  Future<am.AchievementModel?> getAchievementData(
      String? search, String? page) async {
    dio.options.receiveTimeout = 20000;
    try {
      final response = await dio.get(
        "${_mainUrl.mainUrl}/prestasi?page=$page&cp=${search ?? ''}",
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

  Future<slm.SliderModel?> getSliderData() async {
    dio.options.receiveTimeout = 20000;
    try {
      final response = await dio.get(
        "${_mainUrl.mainUrl}/slider",
      );
      if (response.statusCode == 200) {
        slm.SliderModel sliderModel = slm.SliderModel.fromJson(response.data);
        return sliderModel;
      } else {
        throw Exception(
            'Get tidak berhasil dengan code ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<arm.ArticleModel?> getArticleData(String? search, String? page) async {
    dio.options.receiveTimeout = 20000;
    try {
      final response = await dio.get(
        "${_mainUrl.mainUrl}/artikel?page=${page ?? ''}&judul=${search ?? ''}",
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

  Future<em.EventModel> getEventData(String? search, String? page) async {
    dio.options.receiveTimeout = 20000;
    try {
      final response = await dio.get(
        "${_mainUrl.mainUrl}/event?page=${page ?? ''}&judul=${search ?? ''}",
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
