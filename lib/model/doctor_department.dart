class DoctorDepartment {
  List<DoctorCat>? doctorCat;
  int? status;
  String? message;

  DoctorDepartment({this.doctorCat, this.status, this.message});

  DoctorDepartment.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      doctorCat = <DoctorCat>[];
      json['data'].forEach((v) {
        doctorCat!.add(DoctorCat.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (doctorCat != null) {
      data['data'] = doctorCat!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class DoctorCat {
  int? id;
  String? name;
  String? description;
   dynamic x;
  dynamic y;
  String? hospitalId;
  String? image;
  String? status;

  DoctorCat(
      {this.id,
        this.name,
        this.description,
        this.x,
        this.y,
        this.hospitalId,
        this.image,
        this.status});

  DoctorCat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    x = json['x'];
    y = json['y'];
    hospitalId = json['hospital_id'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['x'] = x;
    data['y'] = y;
    data['hospital_id'] = hospitalId;
    data['image'] = image;
    data['status'] = status;
    return data;
  }
}
