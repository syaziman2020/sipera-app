class SliderModel {
  String? status;
  Results? results;

  SliderModel({this.status, this.results});

  SliderModel.fromJson(Map<String, dynamic> json) {
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
  List<Slider>? slider;

  Results({this.slider});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['slider'] != null) {
      slider = <Slider>[];
      json['slider'].forEach((v) {
        slider!.add(Slider.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (slider != null) {
      data['slider'] = slider!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Slider {
  int? id;
  String? judul;
  String? imgSlider;
  String? createdAt;
  String? updatedAt;

  Slider({this.id, this.judul, this.imgSlider, this.createdAt, this.updatedAt});

  Slider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    imgSlider = json['img_slider'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['judul'] = judul;
    data['img_slider'] = imgSlider;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
