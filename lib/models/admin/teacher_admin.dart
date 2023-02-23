class TeacherAdmin {
  String? status;
  Results? results;

  TeacherAdmin({this.status, this.results});

  TeacherAdmin.fromJson(Map<String, dynamic> json) {
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
  int? totalGuruOlahraga;
  List<TotalGuruOlahragaPerCabor>? totalGuruOlahragaPerCabor;

  Results({this.totalGuruOlahraga, this.totalGuruOlahragaPerCabor});

  Results.fromJson(Map<String, dynamic> json) {
    totalGuruOlahraga = json['total_guru_olahraga'];
    if (json['total_guru_olahraga_per_cabor'] != null) {
      totalGuruOlahragaPerCabor = <TotalGuruOlahragaPerCabor>[];
      json['total_guru_olahraga_per_cabor'].forEach((v) {
        totalGuruOlahragaPerCabor!.add(TotalGuruOlahragaPerCabor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_guru_olahraga'] = totalGuruOlahraga;
    if (totalGuruOlahragaPerCabor != null) {
      data['total_guru_olahraga_per_cabor'] =
          totalGuruOlahragaPerCabor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TotalGuruOlahragaPerCabor {
  String? namaCabor;
  String? total;

  TotalGuruOlahragaPerCabor({this.namaCabor, this.total});

  TotalGuruOlahragaPerCabor.fromJson(Map<String, dynamic> json) {
    namaCabor = json['nama_cabor'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama_cabor'] = namaCabor;
    data['total'] = total;
    return data;
  }
}
