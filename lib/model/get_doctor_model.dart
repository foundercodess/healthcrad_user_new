class GetDoctorModel {
  List<GetDoctorModelData>? getDoctorModelData;
  int? status;
  String? message;

  GetDoctorModel({this.getDoctorModelData, this.status, this.message});

  GetDoctorModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      getDoctorModelData = <GetDoctorModelData>[];
      json['data'].forEach((v) {
        getDoctorModelData!.add(GetDoctorModelData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getDoctorModelData != null) {
      data['data'] = getDoctorModelData!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class GetDoctorModelData {
  dynamic id;
  dynamic docterId;
  dynamic imgUrl;
  dynamic name;
  dynamic email;
  dynamic address;
  dynamic phone;
  dynamic qualification;
  dynamic department;
  dynamic profile;
  dynamic exp;
  dynamic fees;
  dynamic ionUserId;
  dynamic hospitalId;
  dynamic departmentName;
  dynamic appointmentConfirmation;
  dynamic signature;
  dynamic aadharFront;
  dynamic aadharBack;
  dynamic license;
  dynamic status;
  dynamic password;
  dynamic docstatus;
  dynamic city;
  dynamic landmark;
  dynamic otp;
  dynamic about;
  dynamic adminShow;

  GetDoctorModelData(
      {this.id,
        this.docterId,
        this.imgUrl,
        this.name,
        this.email,
        this.address,
        this.phone,
        this.qualification,
        this.department,
        this.profile,
        this.exp,
        this.fees,
        this.ionUserId,
        this.hospitalId,
        this.departmentName,
        this.appointmentConfirmation,
        this.signature,
        this.aadharFront,
        this.aadharBack,
        this.license,
        this.status,
        this.password,
        this.docstatus,
        this.city,
        this.landmark,
        this.otp,
        this.about,
        this.adminShow});

  GetDoctorModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    docterId = json['docter_id'];
    imgUrl = json['img_url'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    phone = json['phone'];
    qualification = json['Qualification'];
    department = json['department'];
    profile = json['profile'];
    exp = json['Exp'];
    fees = json['fees'];
    ionUserId = json['ion_user_id'];
    hospitalId = json['hospital_id'];
    departmentName = json['department_name'];
    appointmentConfirmation = json['appointment_confirmation'];
    signature = json['signature'];
    aadharFront = json['aadhar_front'];
    aadharBack = json['aadhar_back'];
    license = json['license'];
    status = json['status'];
    password = json['password'];
    docstatus = json['docstatus'];
    city = json['city'];
    landmark = json['landmark'];
    otp = json['otp'];
    about = json['about'];
    adminShow = json['admin_show'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['docter_id'] = docterId;
    data['img_url'] = imgUrl;
    data['name'] = name;
    data['email'] = email;
    data['address'] = address;
    data['phone'] = phone;
    data['Qualification'] = qualification;
    data['department'] = department;
    data['profile'] = profile;
    data['Exp'] = exp;
    data['fees'] = fees;
    data['ion_user_id'] = ionUserId;
    data['hospital_id'] = hospitalId;
    data['department_name'] = departmentName;
    data['appointment_confirmation'] = appointmentConfirmation;
    data['signature'] = signature;
    data['aadhar_front'] = aadharFront;
    data['aadhar_back'] = aadharBack;
    data['license'] = license;
    data['status'] = status;
    data['password'] = password;
    data['docstatus'] = docstatus;
    data['city'] = city;
    data['landmark'] = landmark;
    data['otp'] = otp;
    data['about'] = about;
    data['admin_show'] = adminShow;
    return data;
  }
}
