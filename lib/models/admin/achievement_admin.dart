class AchievementAdmin {
  String? status;
  Results? results;

  AchievementAdmin({this.status, this.results});

  AchievementAdmin.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (results != null) {
      data['results'] = results!.toJson();
    }
    return data;
  }
}

class Results {
  int? totalPrestasi;
  int? totalPrestasiTahunIni;

  Results({this.totalPrestasi, this.totalPrestasiTahunIni});

  Results.fromJson(Map<String, dynamic> json) {
    totalPrestasi = json['total_prestasi'];
    totalPrestasiTahunIni = json['total_prestasi_tahun_ini'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_prestasi'] = totalPrestasi;
    data['total_prestasi_tahun_ini'] = totalPrestasiTahunIni;
    return data;
  }
}
