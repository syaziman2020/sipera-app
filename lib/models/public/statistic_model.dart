class StatisticModel {
  String? status;
  Results? results;

  StatisticModel({this.status, this.results});

  StatisticModel.fromJson(Map<String, dynamic> json) {
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
  int? atlet;
  int? pelatih;
  int? guru;
  int? wasit;

  Results({this.atlet, this.pelatih, this.guru, this.wasit});

  Results.fromJson(Map<String, dynamic> json) {
    atlet = json['atlet'];
    pelatih = json['pelatih'];
    guru = json['guru'];
    wasit = json['wasit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['atlet'] = atlet;
    data['pelatih'] = pelatih;
    data['guru'] = guru;
    data['wasit'] = wasit;
    return data;
  }
}
