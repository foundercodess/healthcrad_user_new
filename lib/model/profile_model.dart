class ProfileModel {
  Data? data;
  int? status;
  String? message;

  ProfileModel({this.data, this.status, this.message});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  int? mobileno;
  String? gender;
  String? dob;
  String? createdAt;
  dynamic updatedAt;
  int? otp;
  int? status;

  Data(
      {this.id,
        this.name,
        this.email,
        this.mobileno,
        this.gender,
        this.dob,
        this.createdAt,
        this.updatedAt,
        this.otp,
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobileno = json['mobileno'];
    gender = json['gender'];
    dob = json['dob'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    otp = json['otp'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobileno'] = mobileno;
    data['gender'] = gender;
    data['dob'] = dob;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['otp'] = otp;
    data['status'] = status;
    return data;
  }
}
