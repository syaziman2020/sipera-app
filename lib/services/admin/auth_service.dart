import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sipera_app/models/admin/login_model.dart' as login;
import 'package:sipera_app/models/admin/profile_model.dart' as profile;
import 'package:sipera_app/services/main_url.dart';

class AuthService {
  final MainUrl _mainUrl = MainUrl();
  Dio dio = Dio();

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
        log(result.results!.token.toString());
        _mainUrl.setToken(result.results!.token.toString());

        return result;
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
      final response = await dio.post("${_mainUrl.mainUrl}/logout");

      if (response.statusCode == 200) {
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
      final response = await dio.get(
        "${_mainUrl.mainUrl}/detail-profil",
        options: Options(
          headers: {'Authorization': "Bearer ${_mainUrl.getToken()}"},
        ),
      );
      if (response.statusCode == 200) {
        profile.ProfileModel profileModel =
            await profile.ProfileModel.fromJson(response.data);

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
