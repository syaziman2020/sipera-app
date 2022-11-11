import 'dart:convert';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:sipera_app/models/admin/login_model.dart' as login;
import 'package:sipera_app/models/admin/profile_model.dart' as profile;
import 'package:sipera_app/services/main_url.dart';

class AuthService {
  final MainUrl _mainUrl = MainUrl();
  Dio dio = Dio();
  final storage = FlutterSecureStorage();

  Future<login.LoginModel?> loginProfile(
      {required String email, required String password}) async {
    try {
      final response = await dio.post("${_mainUrl.mainUrl}/login",
          data: jsonEncode({
            'email': email,
            'password': password,
          }));

      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        login.LoginModel result = login.LoginModel.fromJson(response.data);
        if (result.status == 'ok') {
          _mainUrl.setToken(result.results!.token.toString());
          await storage.write(key: 'save', value: _mainUrl.getToken());

          return result;
        }
        log(result.results!.token.toString());
      }
      if (_mainUrl.getToken().isEmpty) {
        throw Exception('token kosong');
      } else {
        throw Exception(
            'Post tidak berhasil dengan code ${response.statusCode}');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<bool>? logout() async {
    try {
      String? value = await storage.read(key: 'save');
      final response = await dio.post(
        "${_mainUrl.mainUrl}/logout",
        options: Options(
          headers: {'Authorization': "Bearer ${value}"},
        ),
      );

      if (response.statusCode == 200) {
        await storage.delete(key: 'save');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<profile.ProfileModel?> getProfile() async {
    try {
      if (_mainUrl.getToken().isEmpty) {
        throw Exception('Token kosong');
      }
      String? value = await storage.read(key: 'save');
      final response = await dio.get(
        "${_mainUrl.mainUrl}/detail-profil",
        options: Options(
          headers: {'Authorization': "Bearer ${value}"},
        ),
      );
      if (response.statusCode == 200) {
        profile.ProfileModel profileModel =
            profile.ProfileModel.fromJson(response.data);

        return profileModel;
      } else {
        throw Exception(
            'Get tidak berhasil dengan code ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
