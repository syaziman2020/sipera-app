class RefereeAdmin {
  String? status;
  Results? results;

  RefereeAdmin({this.status, this.results});

  RefereeAdmin.fromJson(Map<String, dynamic> json) {
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
  int? totalWasit;
  List<TotalWasitPerCabor>? totalWasitPerCabor;

  Results({this.totalWasit, this.totalWasitPerCabor});

  Results.fromJson(Map<String, dynamic> json) {
    totalWasit = json['total_wasit'];
    if (json['total_wasit_per_cabor'] != null) {
      totalWasitPerCabor = <TotalWasitPerCabor>[];
      json['total_wasit_per_cabor'].forEach((v) {
        totalWasitPerCabor!.add(TotalWasitPerCabor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_wasit'] = totalWasit;
    if (totalWasitPerCabor != null) {
      data['total_wasit_per_cabor'] =
          totalWasitPerCabor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TotalWasitPerCabor {
  String? namaCabor;
  int? total;

  TotalWasitPerCabor({this.namaCabor, this.total});

  TotalWasitPerCabor.fromJson(Map<String, dynamic> json) {
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
