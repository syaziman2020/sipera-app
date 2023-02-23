class AtletAdmin {
  String? status;
  Results? results;

  AtletAdmin({this.status, this.results});

  AtletAdmin.fromJson(Map<String, dynamic> json) {
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
  int? totalAtlet;
  int? totalAtletDisabilitas;
  List<TotalAtletPerCabor>? totalAtletPerCabor;

  Results(
      {this.totalAtlet, this.totalAtletDisabilitas, this.totalAtletPerCabor});

  Results.fromJson(Map<String, dynamic> json) {
    totalAtlet = json['total_atlet'];
    totalAtletDisabilitas = json['total_atlet_disabilitas'];
    if (json['total_atlet_per_cabor'] != null) {
      totalAtletPerCabor = <TotalAtletPerCabor>[];
      json['total_atlet_per_cabor'].forEach((v) {
        totalAtletPerCabor!.add(TotalAtletPerCabor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_atlet'] = totalAtlet;
    data['total_atlet_disabilitas'] = totalAtletDisabilitas;
    if (totalAtletPerCabor != null) {
      data['total_atlet_per_cabor'] =
          totalAtletPerCabor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TotalAtletPerCabor {
  String? namaCabor;
  int? total;

  TotalAtletPerCabor({this.namaCabor, this.total});

  TotalAtletPerCabor.fromJson(Map<String, dynamic> json) {
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
