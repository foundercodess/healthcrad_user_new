class AddressGetModel {
  List<GetAddressData>? getAddressData;
  int? status;
  String? message;

  AddressGetModel({this.getAddressData, this.status, this.message});

  AddressGetModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      getAddressData = <GetAddressData>[];
      json['data'].forEach((v) {
        getAddressData!.add(new GetAddressData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getAddressData != null) {
      data['data'] = this.getAddressData!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class GetAddressData {
  int? id;
  int? userId;
  String? pincode;
  String? city;
  String? userName;
  String? patientName;
  String? address;
  String? landmark;
  int? phone;
  String? state;
  int? isDeleted;

  GetAddressData(
      {this.id,
        this.userId,
        this.pincode,
        this.city,
        this.userName,
        this.patientName,
        this.address,
        this.landmark,
        this.phone,
        this.state,
        this.isDeleted});

  GetAddressData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    pincode = json['pincode'];
    city = json['city'];
    userName = json['user_name'];
    patientName = json['patient_name'];
    address = json['address'];
    landmark = json['landmark'];
    phone = json['phone'];
    state = json['state'];
    isDeleted = json['is_deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['pincode'] = this.pincode;
    data['city'] = this.city;
    data['user_name'] = this.userName;
    data['patient_name'] = this.patientName;
    data['address'] = this.address;
    data['landmark'] = this.landmark;
    data['phone'] = this.phone;
    data['state'] = this.state;
    data['is_deleted'] = this.isDeleted;
    return data;
  }
}
