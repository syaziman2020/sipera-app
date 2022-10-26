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

Map<String, dynamic> ppp = {
  "id": 9,
  "nama_prestasi": "Juara 2 Tenis Meja Putra",
  "id_atlet": "1",
  "id_cabor": "9",
  "foto":
      "https://sipera.jasadesainsosmed.com/img_folder/img_prestasi_atlet/1663069052_hero-fullscreen-bg.png",
  "tahun": "2018",
  "created_at": "2022-09-13T11:34:14.000000Z",
  "updated_at": "2022-09-13T11:37:33.000000Z",
  "cabor": {
    "id": 9,
    "nama_cabor": "Tenis Meja",
    "created_at": "2022-09-02T12:46:01.000000Z",
    "updated_at": null
  },
  "atlet": {
    "id": 1,
    "nik": "6104170107860344",
    "nama": "Weldi",
    "jenis_kelamin": "1",
    "tempat_lahir": "Pontianak",
    "tanggal_lahir": "1996-08-02",
    "id_agama": "1",
    "disabilitas": "0",
    "id_provinsi": "11",
    "id_kabupaten": "1102",
    "id_kecamatan": "1102011",
    "id_desa": "1102011001",
    "alamat": "sdsadsad",
    "no_hp": "085650081221",
    "email": "admin@email.com",
    "id_cabor": "1",
    "tanggal_bergabung": "2022-09-02",
    "penyakit": "asdsadsad",
    "id_pendidikan": "8",
    "id_status": "2",
    "foto": "1662138671_logo_kab_ketapang.png",
    "lat": "-0.084606229313",
    "lon": "109.38902378082",
    "created_at": "2022-09-02T17:11:11.000000Z",
    "updated_at": "2022-09-02T17:26:11.000000Z"
  }
};
