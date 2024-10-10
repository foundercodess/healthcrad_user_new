class POrderHistoryModel {
  List<POrderHistoryData>? pOrderHistoryData;
  int? status;
  String? message;

  POrderHistoryModel({this.pOrderHistoryData, this.status, this.message});

  POrderHistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      pOrderHistoryData = <POrderHistoryData>[];
      json['data'].forEach((v) {
        pOrderHistoryData!.add(POrderHistoryData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.pOrderHistoryData != null) {
      data['data'] = this.pOrderHistoryData!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class POrderHistoryData {
  dynamic id;
  dynamic images;
  dynamic pincode;
  dynamic city;
  dynamic name;
  dynamic phone;
  dynamic additionalComment;
  dynamic landmark;
  dynamic status;
  dynamic userid;
  dynamic addressId;
  dynamic datetime;
  dynamic agencyId;
  dynamic url;
  dynamic actionTime;
  dynamic address;
  dynamic state;
  dynamic userName;

  POrderHistoryData(
      {this.id,
        this.images,
        this.pincode,
        this.city,
        this.name,
        this.phone,
        this.additionalComment,
        this.landmark,
        this.status,
        this.userid,
        this.addressId,
        this.datetime,
        this.agencyId,
        this.url,
        this.actionTime,
        this.address,
        this.state,
        this.userName});

  POrderHistoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    images = json['images'];
    pincode = json['pincode'];
    city = json['city'];
    name = json['name'];
    phone = json['phone'];
    additionalComment = json['additional_comment'];
    landmark = json['landmark'];
    status = json['status'];
    userid = json['userid'];
    addressId = json['address_id'];
    datetime = json['datetime'];
    agencyId = json['agency_id'];
    url = json['url'];
    actionTime = json['action_time'];
    address = json['address'];
    state = json['state'];
    userName = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['images'] = images;
    data['pincode'] = pincode;
    data['city'] = city;
    data['name'] = name;
    data['phone'] = phone;
    data['additional_comment'] = additionalComment;
    data['landmark'] = landmark;
    data['status'] = status;
    data['userid'] = userid;
    data['address_id'] = addressId;
    data['datetime'] = datetime;
    data['agency_id'] = agencyId;
    data['url'] = url;
    data['action_time'] = actionTime;
    data['address'] = address;
    data['state'] = state;
    data['user_name'] = userName;
    return data;
  }
}
