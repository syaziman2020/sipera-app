class FacilityAdmin {
  String? status;
  Results? results;

  FacilityAdmin({this.status, this.results});

  FacilityAdmin.fromJson(Map<String, dynamic> json) {
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
  List<SaranaPrasarana>? saranaPrasarana;

  Results({this.saranaPrasarana});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['sarana_prasarana'] != null) {
      saranaPrasarana = <SaranaPrasarana>[];
      json['sarana_prasarana'].forEach((v) {
        saranaPrasarana!.add(SaranaPrasarana.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (saranaPrasarana != null) {
      data['sarana_prasarana'] =
          saranaPrasarana!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SaranaPrasarana {
  String? jenisLapangan;
  String? total;

  SaranaPrasarana({this.jenisLapangan, this.total});

  SaranaPrasarana.fromJson(Map<String, dynamic> json) {
    jenisLapangan = json['jenis_lapangan'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jenis_lapangan'] = jenisLapangan;
    data['total'] = total;
    return data;
  }
}
