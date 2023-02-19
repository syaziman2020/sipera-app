class AchievementModel {
  String? status;
  Results? results;

  AchievementModel({this.status, this.results});

  AchievementModel.fromJson(Map<String, dynamic> json) {
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
  String? link;
  Prestasi? prestasi;

  Results({this.link, this.prestasi});

  Results.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    prestasi =
        json['prestasi'] != null ? Prestasi.fromJson(json['prestasi']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link'] = link;
    if (prestasi != null) {
      data['prestasi'] = prestasi!.toJson();
    }
    return data;
  }
}

class Prestasi {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Prestasi(
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

  Prestasi.fromJson(Map<String, dynamic> json) {
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
  String? namaLomba;
  String? namaPerwakilan;
  int? jenisPerlombaan;
  int? medaliEmas;
  int? medaliPerak;
  int? medaliPerunggu;
  int? idCabor;
  String? foto;
  String? tahun;
  String? createdAt;
  String? updatedAt;
  List<PrestasiAtlet>? prestasiAtlet;

  Data(
      {this.id,
      this.namaLomba,
      this.namaPerwakilan,
      this.jenisPerlombaan,
      this.medaliEmas,
      this.medaliPerak,
      this.medaliPerunggu,
      this.idCabor,
      this.foto,
      this.tahun,
      this.createdAt,
      this.updatedAt,
      this.prestasiAtlet});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaLomba = json['nama_lomba'];
    namaPerwakilan = json['nama_perwakilan'];
    jenisPerlombaan = json['jenis_perlombaan'];
    medaliEmas = json['medali_emas'];
    medaliPerak = json['medali_perak'];
    medaliPerunggu = json['medali_perunggu'];
    idCabor = json['id_cabor'];
    foto = json['foto'];
    tahun = json['tahun'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['prestasi_atlet'] != null) {
      prestasiAtlet = <PrestasiAtlet>[];
      json['prestasi_atlet'].forEach((v) {
        prestasiAtlet!.add(PrestasiAtlet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama_lomba'] = namaLomba;
    data['nama_perwakilan'] = namaPerwakilan;
    data['jenis_perlombaan'] = jenisPerlombaan;
    data['medali_emas'] = medaliEmas;
    data['medali_perak'] = medaliPerak;
    data['medali_perunggu'] = medaliPerunggu;
    data['id_cabor'] = idCabor;
    data['foto'] = foto;
    data['tahun'] = tahun;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (prestasiAtlet != null) {
      data['prestasi_atlet'] = prestasiAtlet!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrestasiAtlet {
  int? id;
  String? namaPrestasi;
  int? idPrestasiLomba;
  int? idAtlet;
  int? idCabor;
  String? foto;
  String? tahun;
  String? createdAt;
  String? updatedAt;
  Atlet? atlet;

  PrestasiAtlet(
      {this.id,
      this.namaPrestasi,
      this.idPrestasiLomba,
      this.idAtlet,
      this.idCabor,
      this.foto,
      this.tahun,
      this.createdAt,
      this.updatedAt,
      this.atlet});

  PrestasiAtlet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaPrestasi = json['nama_prestasi'];
    idPrestasiLomba = json['id_prestasi_lomba'];
    idAtlet = json['id_atlet'];
    idCabor = json['id_cabor'];
    foto = json['foto'];
    tahun = json['tahun'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    atlet = json['atlet'] != null ? Atlet.fromJson(json['atlet']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama_prestasi'] = namaPrestasi;
    data['id_prestasi_lomba'] = idPrestasiLomba;
    data['id_atlet'] = idAtlet;
    data['id_cabor'] = idCabor;
    data['foto'] = foto;
    data['tahun'] = tahun;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (atlet != null) {
      data['atlet'] = atlet!.toJson();
    }
    return data;
  }
}

class Atlet {
  int? id;
  String? nik;
  String? nama;
  int? jenisKelamin;
  String? tempatLahir;
  String? tanggalLahir;
  int? idAgama;
  int? disabilitas;
  int? idProvinsi;
  int? idKabupaten;
  int? idKecamatan;
  int? idDesa;
  String? alamat;
  String? noHp;
  String? email;
  int? idCabor;
  String? tanggalBergabung;
  dynamic penyakit;
  int? idPendidikan;
  int? idStatus;
  String? foto;
  String? lat;
  String? lon;
  int? verifikasi;
  String? createdAt;
  String? updatedAt;

  Atlet(
      {this.id,
      this.nik,
      this.nama,
      this.jenisKelamin,
      this.tempatLahir,
      this.tanggalLahir,
      this.idAgama,
      this.disabilitas,
      this.idProvinsi,
      this.idKabupaten,
      this.idKecamatan,
      this.idDesa,
      this.alamat,
      this.noHp,
      this.email,
      this.idCabor,
      this.tanggalBergabung,
      this.penyakit,
      this.idPendidikan,
      this.idStatus,
      this.foto,
      this.lat,
      this.lon,
      this.verifikasi,
      this.createdAt,
      this.updatedAt});

  Atlet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    nama = json['nama'];
    jenisKelamin = json['jenis_kelamin'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    idAgama = json['id_agama'];
    disabilitas = json['disabilitas'];
    idProvinsi = json['id_provinsi'];
    idKabupaten = json['id_kabupaten'];
    idKecamatan = json['id_kecamatan'];
    idDesa = json['id_desa'];
    alamat = json['alamat'];
    noHp = json['no_hp'];
    email = json['email'];
    idCabor = json['id_cabor'];
    tanggalBergabung = json['tanggal_bergabung'];
    penyakit = json['penyakit'];
    idPendidikan = json['id_pendidikan'];
    idStatus = json['id_status'];
    foto = json['foto'];
    lat = json['lat'];
    lon = json['lon'];
    verifikasi = json['verifikasi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nik'] = nik;
    data['nama'] = nama;
    data['jenis_kelamin'] = jenisKelamin;
    data['tempat_lahir'] = tempatLahir;
    data['tanggal_lahir'] = tanggalLahir;
    data['id_agama'] = idAgama;
    data['disabilitas'] = disabilitas;
    data['id_provinsi'] = idProvinsi;
    data['id_kabupaten'] = idKabupaten;
    data['id_kecamatan'] = idKecamatan;
    data['id_desa'] = idDesa;
    data['alamat'] = alamat;
    data['no_hp'] = noHp;
    data['email'] = email;
    data['id_cabor'] = idCabor;
    data['tanggal_bergabung'] = tanggalBergabung;
    data['penyakit'] = penyakit;
    data['id_pendidikan'] = idPendidikan;
    data['id_status'] = idStatus;
    data['foto'] = foto;
    data['lat'] = lat;
    data['lon'] = lon;
    data['verifikasi'] = verifikasi;
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
