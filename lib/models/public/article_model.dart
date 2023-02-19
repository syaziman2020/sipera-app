class ArticleModel {
  String? status;
  Results? results;

  ArticleModel({this.status, this.results});

  ArticleModel.fromJson(Map<String, dynamic> json) {
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
  AllArtikel? allArtikel;

  Results({this.allArtikel});

  Results.fromJson(Map<String, dynamic> json) {
    allArtikel = json['all_artikel'] != null
        ? AllArtikel.fromJson(json['all_artikel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (allArtikel != null) {
      data['all_artikel'] = allArtikel!.toJson();
    }
    return data;
  }
}

class AllArtikel {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  AllArtikel(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  AllArtikel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Data {
  int? id;
  String? judul;
  String? tanggal;
  int? idUser;
  int? statusArtikel;
  String? isiArtikel;
  String? imgArtikel;
  String? slug;
  int? counter;
  String? createdAt;
  String? updatedAt;
  List<KategoriArtikel>? kategoriArtikel;

  Data(
      {this.id,
      this.judul,
      this.tanggal,
      this.idUser,
      this.statusArtikel,
      this.isiArtikel,
      this.imgArtikel,
      this.slug,
      this.counter,
      this.createdAt,
      this.updatedAt,
      this.kategoriArtikel});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    tanggal = json['tanggal'];
    idUser = json['id_user'];
    statusArtikel = json['status_artikel'];
    isiArtikel = json['isi_artikel'];
    imgArtikel = json['img_artikel'];
    slug = json['slug'];
    counter = json['counter'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['kategori_artikel'] != null) {
      kategoriArtikel = <KategoriArtikel>[];
      json['kategori_artikel'].forEach((v) {
        kategoriArtikel!.add(KategoriArtikel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['judul'] = judul;
    data['tanggal'] = tanggal;
    data['id_user'] = idUser;
    data['status_artikel'] = statusArtikel;
    data['isi_artikel'] = isiArtikel;
    data['img_artikel'] = imgArtikel;
    data['slug'] = slug;
    data['counter'] = counter;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (kategoriArtikel != null) {
      data['kategori_artikel'] =
          kategoriArtikel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class KategoriArtikel {
  int? id;
  int? idArtikel;
  int? idKategoriArtikel;
  String? createdAt;
  String? updatedAt;
  MasterArtikel? masterArtikel;

  KategoriArtikel(
      {this.id,
      this.idArtikel,
      this.idKategoriArtikel,
      this.createdAt,
      this.updatedAt,
      this.masterArtikel});

  KategoriArtikel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idArtikel = json['id_artikel'];
    idKategoriArtikel = json['id_kategori_artikel'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    masterArtikel = json['master_artikel'] != null
        ? MasterArtikel.fromJson(json['master_artikel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_artikel'] = idArtikel;
    data['id_kategori_artikel'] = idKategoriArtikel;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (masterArtikel != null) {
      data['master_artikel'] = masterArtikel!.toJson();
    }
    return data;
  }
}

class MasterArtikel {
  int? id;
  String? kategoriArtikel;
  String? createdAt;
  String? updatedAt;

  MasterArtikel(
      {this.id, this.kategoriArtikel, this.createdAt, this.updatedAt});

  MasterArtikel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kategoriArtikel = json['kategori_artikel'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['kategori_artikel'] = kategoriArtikel;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
