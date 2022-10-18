class ProfileModel {
  String? status;
  Results? results;

  ProfileModel({this.status, this.results});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  Users? users;
  RoleUser? dataUsers;

  Results({this.users, this.dataUsers});

  Results.fromJson(Map<String, dynamic> json) {
    users = json['users'] != null ? Users.fromJson(json['users']) : null;
    dataUsers = json['data-users'] != null
        ? RoleUser.fromJson(json['data-users'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (users != null) {
      data['users'] = users!.toJson();
    }
    if (dataUsers != null) {
      data['data-users'] = dataUsers!.toJson();
    }
    return data;
  }
}

class Users {
  int? id;
  String? name;
  String? email;
  String? idRole;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  RoleUser? roleUser;

  Users(
      {this.id,
      this.name,
      this.email,
      this.idRole,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.roleUser});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    idRole = json['id_role'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    roleUser =
        json['role_user'] != null ? RoleUser.fromJson(json['role_user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['id_role'] = idRole;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (roleUser != null) {
      data['role_user'] = roleUser!.toJson();
    }
    return data;
  }
}

class RoleUser {
  int? id;
  String? namaRole;
  String? createdAt;
  String? updatedAt;

  RoleUser({this.id, this.namaRole, this.createdAt, this.updatedAt});

  RoleUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaRole = json['nama_role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama_role'] = namaRole;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
