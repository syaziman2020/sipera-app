import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sipera_app/models/admin/achievement_admin.dart' as acmin;
import 'package:sipera_app/models/admin/atlet_admin.dart' as atmin;
import 'package:sipera_app/models/admin/coach_admin.dart' as comin;
import 'package:sipera_app/models/admin/facility_admin.dart' as famin;
import 'package:sipera_app/models/admin/referee_admin.dart' as remin;
import 'package:sipera_app/models/admin/teacher_admin.dart' as temin;

import '../main_url.dart';

class CategoryService {
  final MainUrl _mainUrl = MainUrl();
  Dio dio = Dio();
  final storage = const FlutterSecureStorage();

  Future<atmin.AtletAdmin?> getAtletAdmin() async {
    try {
      if (_mainUrl.getToken().isEmpty) {
        throw Exception('Token kosong');
      }
      String? value = await storage.read(key: 'save');
      final response = await dio.get(
        "${_mainUrl.mainUrl}/atlet",
        options: Options(
          headers: {'Authorization': "Bearer ${value}"},
        ),
      );
      if (response.statusCode == 200) {
        atmin.AtletAdmin atletAdmin = atmin.AtletAdmin.fromJson(response.data);

        return atletAdmin;
      } else {
        throw Exception(
            'Get tidak berhasil dengan code ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<comin.CoachAdmin?> getCoachAdmin() async {
    try {
      if (_mainUrl.getToken().isEmpty) {
        throw Exception('Token kosong');
      }
      String? value = await storage.read(key: 'save');
      final response = await dio.get(
        "${_mainUrl.mainUrl}/pelatih",
        options: Options(
          headers: {'Authorization': "Bearer ${value}"},
        ),
      );
      if (response.statusCode == 200) {
        comin.CoachAdmin coachAdmin = comin.CoachAdmin.fromJson(response.data);

        return coachAdmin;
      } else {
        throw Exception(
            'Get tidak berhasil dengan code ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<remin.RefereeAdmin?> getRefereeAdmin() async {
    try {
      if (_mainUrl.getToken().isEmpty) {
        throw Exception('Token kosong');
      }

      String? value = await storage.read(key: 'save');
      final response = await dio.get(
        "${_mainUrl.mainUrl}/wasit",
        options: Options(
          headers: {'Authorization': "Bearer ${value}"},
        ),
      );
      if (response.statusCode == 200) {
        remin.RefereeAdmin refereeAdmin =
            remin.RefereeAdmin.fromJson(response.data);

        return refereeAdmin;
      } else {
        throw Exception(
            'Get tidak berhasil dengan code ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<temin.TeacherAdmin?> getTeacherAdmin() async {
    try {
      if (_mainUrl.getToken().isEmpty) {
        throw Exception('Token kosong');
      }
      String? value = await storage.read(key: 'save');
      final response = await dio.get(
        "${_mainUrl.mainUrl}/guru-olahraga",
        options: Options(
          headers: {'Authorization': "Bearer ${value}"},
        ),
      );
      if (response.statusCode == 200) {
        temin.TeacherAdmin teacherAdmin =
            temin.TeacherAdmin.fromJson(response.data);

        return teacherAdmin;
      } else {
        throw Exception(
            'Get tidak berhasil dengan code ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<famin.FacilityAdmin?> getFacilityAdmin() async {
    try {
      if (_mainUrl.getToken().isEmpty) {
        throw Exception('Token kosong');
      }
      String? value = await storage.read(key: 'save');
      final response = await dio.get(
        "${_mainUrl.mainUrl}/sarana-prasarana",
        options: Options(
          headers: {'Authorization': "Bearer ${value}"},
        ),
      );
      if (response.statusCode == 200) {
        famin.FacilityAdmin facilityAdmin =
            famin.FacilityAdmin.fromJson(response.data);
        return facilityAdmin;
      } else {
        throw Exception(
            'Get tidak berhasil dengan code ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<acmin.AchievementAdmin?> getAchievementAdmin() async {
    try {
      if (_mainUrl.getToken().isEmpty) {
        throw Exception('Token kosong');
      }
      String? value = await storage.read(key: 'save');
      final response = await dio.get(
        "${_mainUrl.mainUrl}/jumlah-prestasi",
        options: Options(
          headers: {'Authorization': "Bearer ${value}"},
        ),
      );
      if (response.statusCode == 200) {
        acmin.AchievementAdmin achievementAdmin =
            acmin.AchievementAdmin.fromJson(response.data);
        return achievementAdmin;
      } else {
        throw Exception(
            'Get tidak berhasil dengan code ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
