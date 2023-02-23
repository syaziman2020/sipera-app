class GraphicAchievement {
  String? status;
  Results? results;

  GraphicAchievement({this.status, this.results});

  GraphicAchievement.fromJson(Map<String, dynamic> json) {
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
  List<Jan>? jan;
  List<Feb>? feb;
  List<Mar>? mar;
  List<Apr>? apr;
  List<Mei>? mei;
  List<Jun>? jun;
  List<Jul>? jul;
  List<Ags>? ags;
  List<Sep>? sep;
  List<Okt>? okt;
  List<Nov>? nov;
  List<Des>? des;
  List<PerTahun>? perTahun;
  String? anak;
  String? remaja;
  String? dewasa;

  Results(
      {this.jan,
      this.feb,
      this.mar,
      this.apr,
      this.mei,
      this.jun,
      this.jul,
      this.ags,
      this.sep,
      this.okt,
      this.nov,
      this.des,
      this.perTahun,
      this.anak,
      this.remaja,
      this.dewasa});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['Jan'] != null) {
      jan = <Jan>[];
      json['Jan'].forEach((v) {
        jan!.add(Jan.fromJson(v));
      });
    }
    if (json['Feb'] != null) {
      feb = <Feb>[];
      json['Feb'].forEach((v) {
        feb!.add(Feb.fromJson(v));
      });
    }
    if (json['Mar'] != null) {
      mar = <Mar>[];
      json['Mar'].forEach((v) {
        mar!.add(Mar.fromJson(v));
      });
    }
    if (json['Apr'] != null) {
      apr = <Apr>[];
      json['Apr'].forEach((v) {
        apr!.add(Apr.fromJson(v));
      });
    }
    if (json['Mei'] != null) {
      mei = <Mei>[];
      json['Mei'].forEach((v) {
        mei!.add(Mei.fromJson(v));
      });
    }
    if (json['Jun'] != null) {
      jun = <Jun>[];
      json['Jun'].forEach((v) {
        jun!.add(Jun.fromJson(v));
      });
    }
    if (json['Jul'] != null) {
      jul = <Jul>[];
      json['Jul'].forEach((v) {
        jul!.add(Jul.fromJson(v));
      });
    }
    if (json['Ags'] != null) {
      ags = <Ags>[];
      json['Ags'].forEach((v) {
        ags!.add(Ags.fromJson(v));
      });
    }
    if (json['Sep'] != null) {
      sep = <Sep>[];
      json['Sep'].forEach((v) {
        sep!.add(Sep.fromJson(v));
      });
    }
    if (json['Okt'] != null) {
      okt = <Okt>[];
      json['Okt'].forEach((v) {
        okt!.add(Okt.fromJson(v));
      });
    }
    if (json['Nov'] != null) {
      nov = <Nov>[];
      json['Nov'].forEach((v) {
        nov!.add(Nov.fromJson(v));
      });
    }
    if (json['Des'] != null) {
      des = <Des>[];
      json['Des'].forEach((v) {
        des!.add(Des.fromJson(v));
      });
    }
    if (json['per_tahun'] != null) {
      perTahun = <PerTahun>[];
      json['per_tahun'].forEach((v) {
        perTahun!.add(PerTahun.fromJson(v));
      });
    }
    anak = json['anak'];
    remaja = json['remaja'];
    dewasa = json['dewasa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (jan != null) {
      data['Jan'] = jan!.map((v) => v.toJson()).toList();
    }
    if (feb != null) {
      data['Feb'] = feb!.map((v) => v.toJson()).toList();
    }
    if (mar != null) {
      data['Mar'] = mar!.map((v) => v.toJson()).toList();
    }
    if (apr != null) {
      data['Apr'] = apr!.map((v) => v.toJson()).toList();
    }
    if (mei != null) {
      data['Mei'] = mei!.map((v) => v.toJson()).toList();
    }
    if (jun != null) {
      data['Jun'] = jun!.map((v) => v.toJson()).toList();
    }
    if (jul != null) {
      data['Jul'] = jul!.map((v) => v.toJson()).toList();
    }
    if (ags != null) {
      data['Ags'] = ags!.map((v) => v.toJson()).toList();
    }
    if (sep != null) {
      data['Sep'] = sep!.map((v) => v.toJson()).toList();
    }
    if (okt != null) {
      data['Okt'] = okt!.map((v) => v.toJson()).toList();
    }
    if (nov != null) {
      data['Nov'] = nov!.map((v) => v.toJson()).toList();
    }
    if (des != null) {
      data['Des'] = des!.map((v) => v.toJson()).toList();
    }
    if (perTahun != null) {
      data['per_tahun'] = perTahun!.map((v) => v.toJson()).toList();
    }
    data['anak'] = anak;
    data['remaja'] = remaja;
    data['dewasa'] = dewasa;
    return data;
  }
}

class Jan {
  String? cabangOlahraga;
  String? total;

  Jan({this.cabangOlahraga, this.total});

  Jan.fromJson(Map<String, dynamic> json) {
    cabangOlahraga = json['cabang_olahraga'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cabang_olahraga'] = cabangOlahraga;
    data['total'] = total;
    return data;
  }
}

class Feb {
  String? cabangOlahraga;
  String? total;

  Feb({this.cabangOlahraga, this.total});

  Feb.fromJson(Map<String, dynamic> json) {
    cabangOlahraga = json['cabang_olahraga'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cabang_olahraga'] = cabangOlahraga;
    data['total'] = total;
    return data;
  }
}

class Mar {
  String? cabangOlahraga;
  String? total;

  Mar({this.cabangOlahraga, this.total});

  Mar.fromJson(Map<String, dynamic> json) {
    cabangOlahraga = json['cabang_olahraga'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cabang_olahraga'] = cabangOlahraga;
    data['total'] = total;
    return data;
  }
}

class Apr {
  String? cabangOlahraga;
  String? total;

  Apr({this.cabangOlahraga, this.total});

  Apr.fromJson(Map<String, dynamic> json) {
    cabangOlahraga = json['cabang_olahraga'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cabang_olahraga'] = cabangOlahraga;
    data['total'] = total;
    return data;
  }
}

class Mei {
  String? cabangOlahraga;
  String? total;

  Mei({this.cabangOlahraga, this.total});

  Mei.fromJson(Map<String, dynamic> json) {
    cabangOlahraga = json['cabang_olahraga'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cabang_olahraga'] = cabangOlahraga;
    data['total'] = total;
    return data;
  }
}

class Jun {
  String? cabangOlahraga;
  String? total;

  Jun({this.cabangOlahraga, this.total});

  Jun.fromJson(Map<String, dynamic> json) {
    cabangOlahraga = json['cabang_olahraga'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cabang_olahraga'] = cabangOlahraga;
    data['total'] = total;
    return data;
  }
}

class Jul {
  String? cabangOlahraga;
  String? total;

  Jul({this.cabangOlahraga, this.total});

  Jul.fromJson(Map<String, dynamic> json) {
    cabangOlahraga = json['cabang_olahraga'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cabang_olahraga'] = cabangOlahraga;
    data['total'] = total;
    return data;
  }
}

class Ags {
  String? cabangOlahraga;
  String? total;

  Ags({this.cabangOlahraga, this.total});

  Ags.fromJson(Map<String, dynamic> json) {
    cabangOlahraga = json['cabang_olahraga'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cabang_olahraga'] = cabangOlahraga;
    data['total'] = total;
    return data;
  }
}

class Sep {
  String? cabangOlahraga;
  String? total;

  Sep({this.cabangOlahraga, this.total});

  Sep.fromJson(Map<String, dynamic> json) {
    cabangOlahraga = json['cabang_olahraga'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cabang_olahraga'] = cabangOlahraga;
    data['total'] = total;
    return data;
  }
}

class Okt {
  String? cabangOlahraga;
  String? total;

  Okt({this.cabangOlahraga, this.total});

  Okt.fromJson(Map<String, dynamic> json) {
    cabangOlahraga = json['cabang_olahraga'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cabang_olahraga'] = cabangOlahraga;
    data['total'] = total;
    return data;
  }
}

class Nov {
  String? cabangOlahraga;
  String? total;

  Nov({this.cabangOlahraga, this.total});

  Nov.fromJson(Map<String, dynamic> json) {
    cabangOlahraga = json['cabang_olahraga'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cabang_olahraga'] = cabangOlahraga;
    data['total'] = total;
    return data;
  }
}

class Des {
  String? cabangOlahraga;
  String? total;

  Des({this.cabangOlahraga, this.total});

  Des.fromJson(Map<String, dynamic> json) {
    cabangOlahraga = json['cabang_olahraga'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cabang_olahraga'] = cabangOlahraga;
    data['total'] = total;
    return data;
  }
}

class PerTahun {
  String? year;
  String? total;

  PerTahun({this.year, this.total});

  PerTahun.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['year'] = year;
    data['total'] = total;
    return data;
  }
}
