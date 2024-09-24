class MedicineCatModel {
  List<MedicineCatData>? medicineCatData;
  int? status;
  String? message;

  MedicineCatModel({this.medicineCatData, this.status, this.message});

  MedicineCatModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      medicineCatData = <MedicineCatData>[];
      json['data'].forEach((v) {
        medicineCatData!.add(MedicineCatData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (medicineCatData != null) {
      data['data'] = medicineCatData!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class MedicineCatData {
  int? id;
  String? category;
  String? description;
dynamic hospitalId;
  String? image;
  dynamic status;

  MedicineCatData(
      {this.id,
        this.category,
        this.description,
        this.hospitalId,
        this.image,
        this.status});

  MedicineCatData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    description = json['description'];
    hospitalId = json['hospital_id'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['description'] = description;
    data['hospital_id'] = hospitalId;
    data['image'] = image;
    data['status'] = status;
    return data;
  }
}
