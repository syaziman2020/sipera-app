class AchievementModel {
  String? status;
  Results? results;

  AchievementModel({this.status, this.results});

  AchievementModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results =
        json['results'] != null ? new Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    if (this.results != null) {
      data['results'] = this.results!.toJson();
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
    prestasi = json['prestasi'] != null
        ? new Prestasi.fromJson(json['prestasi'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link'] = this.link;
    if (this.prestasi != null) {
      data['prestasi'] = this.prestasi!.toJson();
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
  String? prevPageUrl;
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
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
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
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int? id;
  String? namaLomba;
  String? namaPerwakilan;
  String? jenisPerlombaan;
  String? medaliEmas;
  String? medaliPerak;
  String? medaliPerunggu;
  String? idCabor;
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
        prestasiAtlet!.add(new PrestasiAtlet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['nama_lomba'] = this.namaLomba;
    data['nama_perwakilan'] = this.namaPerwakilan;
    data['jenis_perlombaan'] = this.jenisPerlombaan;
    data['medali_emas'] = this.medaliEmas;
    data['medali_perak'] = this.medaliPerak;
    data['medali_perunggu'] = this.medaliPerunggu;
    data['id_cabor'] = this.idCabor;
    data['foto'] = this.foto;
    data['tahun'] = this.tahun;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.prestasiAtlet != null) {
      data['prestasi_atlet'] =
          this.prestasiAtlet!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrestasiAtlet {
  int? id;
  String? namaPrestasi;
  String? idPrestasiLomba;
  String? idAtlet;
  String? idCabor;
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
    atlet = json['atlet'] != null ? new Atlet.fromJson(json['atlet']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['nama_prestasi'] = this.namaPrestasi;
    data['id_prestasi_lomba'] = this.idPrestasiLomba;
    data['id_atlet'] = this.idAtlet;
    data['id_cabor'] = this.idCabor;
    data['foto'] = this.foto;
    data['tahun'] = this.tahun;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.atlet != null) {
      data['atlet'] = this.atlet!.toJson();
    }
    return data;
  }
}

class Atlet {
  int? id;
  String? nik;
  String? nama;
  String? jenisKelamin;
  String? tempatLahir;
  String? tanggalLahir;
  String? idAgama;
  String? disabilitas;
  String? idProvinsi;
  String? idKabupaten;
  String? idKecamatan;
  String? idDesa;
  String? alamat;
  String? noHp;
  String? email;
  String? idCabor;
  String? tanggalBergabung;
  Null? penyakit;
  String? idPendidikan;
  String? idStatus;
  String? foto;
  String? lat;
  String? lon;
  String? verifikasi;
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
    data['id'] = this.id;
    data['nik'] = this.nik;
    data['nama'] = this.nama;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['tempat_lahir'] = this.tempatLahir;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['id_agama'] = this.idAgama;
    data['disabilitas'] = this.disabilitas;
    data['id_provinsi'] = this.idProvinsi;
    data['id_kabupaten'] = this.idKabupaten;
    data['id_kecamatan'] = this.idKecamatan;
    data['id_desa'] = this.idDesa;
    data['alamat'] = this.alamat;
    data['no_hp'] = this.noHp;
    data['email'] = this.email;
    data['id_cabor'] = this.idCabor;
    data['tanggal_bergabung'] = this.tanggalBergabung;
    data['penyakit'] = this.penyakit;
    data['id_pendidikan'] = this.idPendidikan;
    data['id_status'] = this.idStatus;
    data['foto'] = this.foto;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['verifikasi'] = this.verifikasi;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
