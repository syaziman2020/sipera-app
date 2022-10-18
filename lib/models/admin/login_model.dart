class LoginModel {
  String? status;
  Results? results;

  LoginModel({this.status, this.results});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
  String? token;
  String? name;

  Results({this.token, this.name});

  Results.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['name'] = name;
    return data;
  }
}
