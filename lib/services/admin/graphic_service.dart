import 'package:dio/dio.dart';
import 'package:sipera_app/models/admin/graphic_achievement.dart'
    as gachievement;
import 'package:sipera_app/models/admin/graphic_atlet.dart' as gatlet;
import 'package:sipera_app/models/admin/graphic_sportsman.dart' as gsport;

import '../main_url.dart';

class GraphicService {
  final MainUrl _mainUrl = MainUrl();
  Dio dio = Dio();

  Future<gatlet.GraphicAtlet?> getGraphicAtlet() async {
    try {
      if (_mainUrl.getToken().isEmpty) {
        throw Exception('Token kosong');
      }
      final response = await dio.get(
        "${_mainUrl.mainUrl}/grafik-atlet",
        options: Options(
          headers: {'Authorization': "Bearer ${_mainUrl.getToken()}"},
        ),
      );
      if (response.statusCode == 200) {
        gatlet.GraphicAtlet graphicAtlet =
             gatlet.GraphicAtlet.fromJson(response.data);

        return graphicAtlet;
      } else {
        throw Exception(
            'Get tidak berhasil dengan code ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<gachievement.GraphicAchievement?> getGraphicAchievement() async {
    try {
      if (_mainUrl.getToken().isEmpty) {
        throw Exception('Token kosong');
      }
      final response = await dio.get(
        "${_mainUrl.mainUrl}/grafik-prestasi-atlet",
        options: Options(
          headers: {'Authorization': "Bearer ${_mainUrl.getToken()}"},
        ),
      );
      if (response.statusCode == 200) {
        gachievement.GraphicAchievement graphicAchievement =
            gachievement.GraphicAchievement.fromJson(response.data);

        return graphicAchievement;
      } else {
        throw Exception(
            'Get tidak berhasil dengan code ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<gsport.GraphicSportsman?> getGraphicSportsman() async {
    try {
      if (_mainUrl.getToken().isEmpty) {
        throw Exception('Token kosong');
      }
      final response = await dio.get(
        "${_mainUrl.mainUrl}/grafik-olahragawan",
        options: Options(
          headers: {'Authorization': "Bearer ${_mainUrl.getToken()}"},
        ),
      );
      if (response.statusCode == 200) {
        gsport.GraphicSportsman graphicSportsman =
            gsport.GraphicSportsman.fromJson(response.data);
        return graphicSportsman;
      } else {
        throw Exception(
            'Get tidak berhasil dengan code ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
