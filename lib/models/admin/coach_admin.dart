class CoachAdmin {
  String? status;
  Results? results;

  CoachAdmin({this.status, this.results});

  CoachAdmin.fromJson(Map<String, dynamic> json) {
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
  int? totalPelatih;
  List<TotalPelatihPerCabor>? totalPelatihPerCabor;

  Results({this.totalPelatih, this.totalPelatihPerCabor});

  Results.fromJson(Map<String, dynamic> json) {
    totalPelatih = json['total_pelatih'];
    if (json['total_pelatih_per_cabor'] != null) {
      totalPelatihPerCabor = <TotalPelatihPerCabor>[];
      json['total_pelatih_per_cabor'].forEach((v) {
        totalPelatihPerCabor!.add(TotalPelatihPerCabor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_pelatih'] = totalPelatih;
    if (totalPelatihPerCabor != null) {
      data['total_pelatih_per_cabor'] =
          totalPelatihPerCabor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TotalPelatihPerCabor {
  String? namaCabor;
  String? total;

  TotalPelatihPerCabor({this.namaCabor, this.total});

  TotalPelatihPerCabor.fromJson(Map<String, dynamic> json) {
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
