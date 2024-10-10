class AmbulanceHistoryModel {
  List<AmbulanceHistoryData>? ambulanceHistoryData;
  int? status;
  String? message;

  AmbulanceHistoryModel({this.ambulanceHistoryData, this.status, this.message});

  AmbulanceHistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      ambulanceHistoryData = <AmbulanceHistoryData>[];
      json['data'].forEach((v) {
        ambulanceHistoryData!.add(AmbulanceHistoryData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.ambulanceHistoryData != null) {
      data['data'] = this.ambulanceHistoryData!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class AmbulanceHistoryData {
  int? id;
  Null driverName;
  int? phone;
  Null type;
  Null decideVehicle;
  Null aadharFront;
  Null aadharBack;
  Null drivingLicence;
  Null vDocument;
  Null agencyId;
  Null images;
  String? userId;
  String? address;
  Null status;
  String? username;
  String? originlatitude;
  String? originlongitude;
  String? destinationlatitude;
  String? destinationlogitude;
  Null amount;
  String? pickupAddress;
  String? dropAddress;
  String? ambulanceType;
  String? distance;
  Null paymode;
  Null datetime;
  Null verifyNumber;
  Null bookdate;
  Null adminShow;
  Null agencyShow;
  Null onlinePaymentStatus;
  Null driverPhone;

  AmbulanceHistoryData(
      {this.id,
        this.driverName,
        this.phone,
        this.type,
        this.decideVehicle,
        this.aadharFront,
        this.aadharBack,
        this.drivingLicence,
        this.vDocument,
        this.agencyId,
        this.images,
        this.userId,
        this.address,
        this.status,
        this.username,
        this.originlatitude,
        this.originlongitude,
        this.destinationlatitude,
        this.destinationlogitude,
        this.amount,
        this.pickupAddress,
        this.dropAddress,
        this.ambulanceType,
        this.distance,
        this.paymode,
        this.datetime,
        this.verifyNumber,
        this.bookdate,
        this.adminShow,
        this.agencyShow,
        this.onlinePaymentStatus,
        this.driverPhone});

  AmbulanceHistoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driverName = json['driver_name'];
    phone = json['phone'];
    type = json['type'];
    decideVehicle = json['decide_vehicle'];
    aadharFront = json['aadhar_front'];
    aadharBack = json['aadhar_back'];
    drivingLicence = json['driving_licence'];
    vDocument = json['v_document'];
    agencyId = json['agency_id'];
    images = json['images'];
    userId = json['user_id'];
    address = json['address'];
    status = json['status'];
    username = json['username'];
    originlatitude = json['originlatitude'];
    originlongitude = json['originlongitude'];
    destinationlatitude = json['destinationlatitude'];
    destinationlogitude = json['destinationlogitude'];
    amount = json['amount'];
    pickupAddress = json['pickup_address'];
    dropAddress = json['drop_address'];
    ambulanceType = json['ambulance_type'];
    distance = json['distance'];
    paymode = json['paymode'];
    datetime = json['datetime'];
    verifyNumber = json['verify_number'];
    bookdate = json['bookdate'];
    adminShow = json['admin_show'];
    agencyShow = json['agency_show'];
    onlinePaymentStatus = json['online_payment_status'];
    driverPhone = json['driver_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['driver_name'] = driverName;
    data['phone'] = phone;
    data['type'] = type;
    data['decide_vehicle'] = decideVehicle;
    data['aadhar_front'] = aadharFront;
    data['aadhar_back'] = aadharBack;
    data['driving_licence'] = drivingLicence;
    data['v_document'] = vDocument;
    data['agency_id'] = agencyId;
    data['images'] = images;
    data['user_id'] = userId;
    data['address'] = address;
    data['status'] = status;
    data['username'] = username;
    data['originlatitude'] = originlatitude;
    data['originlongitude'] = originlongitude;
    data['destinationlatitude'] = destinationlatitude;
    data['destinationlogitude'] = destinationlogitude;
    data['amount'] = amount;
    data['pickup_address'] = pickupAddress;
    data['drop_address'] = dropAddress;
    data['ambulance_type'] = ambulanceType;
    data['distance'] = distance;
    data['paymode'] = paymode;
    data['datetime'] = datetime;
    data['verify_number'] = verifyNumber;
    data['bookdate'] = bookdate;
    data['admin_show'] = adminShow;
    data['agency_show'] = agencyShow;
    data['online_payment_status'] = onlinePaymentStatus;
    data['driver_phone'] = driverPhone;
    return data;
  }
}
