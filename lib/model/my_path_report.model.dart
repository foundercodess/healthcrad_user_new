class MyPathModel {
  int? status;
  String? message;
  List<MyPathViewData>? myPathViewData;

  MyPathModel({this.status, this.message, this.myPathViewData});

  MyPathModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      myPathViewData = <MyPathViewData>[];
      json['data'].forEach((v) {
        myPathViewData!.add(MyPathViewData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.myPathViewData != null) {
      data['data'] = this.myPathViewData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyPathViewData {
  int? id;
  dynamic category;
  dynamic patient;
  dynamic doctor;
  dynamic date;
  dynamic categoryName;
  dynamic report;
  dynamic status;
  String? userId;
  String? patientName;
  String? patientPhone;
  dynamic patientAddress;
  dynamic doctorName;
  dynamic dateString;
  dynamic hospitalId;
  dynamic invoiceId;
  dynamic categoryId;
  dynamic testStatus;
  dynamic testStatusDate;
  dynamic deliveryStatus;
  dynamic deliveryStatusDate;
  dynamic receiverName;
  dynamic updatedOn;
  dynamic reportedBy;
  dynamic doneBy;
  dynamic signedBy;
  String? labName;
  dynamic price;
  dynamic testType;
  String? testDate;
  String? paymode;
  String? images;
  String? labAddress;
  String? referredBy;
  String? age;
  dynamic adminShow;
  dynamic paymentStatus;

  MyPathViewData(
      {this.id,
        this.category,
        this.patient,
        this.doctor,
        this.date,
        this.categoryName,
        this.report,
        this.status,
        this.userId,
        this.patientName,
        this.patientPhone,
        this.patientAddress,
        this.doctorName,
        this.dateString,
        this.hospitalId,
        this.invoiceId,
        this.categoryId,
        this.testStatus,
        this.testStatusDate,
        this.deliveryStatus,
        this.deliveryStatusDate,
        this.receiverName,
        this.updatedOn,
        this.reportedBy,
        this.doneBy,
        this.signedBy,
        this.labName,
        this.price,
        this.testType,
        this.testDate,
        this.paymode,
        this.images,
        this.labAddress,
        this.referredBy,
        this.age,
        this.adminShow,
        this.paymentStatus});

  MyPathViewData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    patient = json['patient'];
    doctor = json['doctor'];
    date = json['date'];
    categoryName = json['category_name'];
    report = json['report'];
    status = json['status'];
    userId = json['user_id'];
    patientName = json['patient_name'];
    patientPhone = json['patient_phone'];
    patientAddress = json['patient_address'];
    doctorName = json['doctor_name'];
    dateString = json['date_string'];
    hospitalId = json['hospital_id'];
    invoiceId = json['invoice_id'];
    categoryId = json['category_id'];
    testStatus = json['test_status'];
    testStatusDate = json['test_status_date'];
    deliveryStatus = json['delivery_status'];
    deliveryStatusDate = json['delivery_status_date'];
    receiverName = json['receiver_name'];
    updatedOn = json['updated_on'];
    reportedBy = json['reported_by'];
    doneBy = json['done_by'];
    signedBy = json['signed_by'];
    labName = json['lab_name'];
    price = json['price'];
    testType = json['test_type'];
    testDate = json['test_date'];
    paymode = json['paymode'];
    images = json['images'];
    labAddress = json['lab_address'];
    referredBy = json['referred_by'];
    age = json['age'];
    adminShow = json['admin_show'];
    paymentStatus = json['payment_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['patient'] = patient;
    data['doctor'] = doctor;
    data['date'] = date;
    data['category_name'] = categoryName;
    data['report'] = report;
    data['status'] = status;
    data['user_id'] = userId;
    data['patient_name'] = patientName;
    data['patient_phone'] = patientPhone;
    data['patient_address'] = patientAddress;
    data['doctor_name'] = doctorName;
    data['date_string'] = dateString;
    data['hospital_id'] = hospitalId;
    data['invoice_id'] = invoiceId;
    data['category_id'] = categoryId;
    data['test_status'] = testStatus;
    data['test_status_date'] = testStatusDate;
    data['delivery_status'] = deliveryStatus;
    data['delivery_status_date'] = deliveryStatusDate;
    data['receiver_name'] = receiverName;
    data['updated_on'] = updatedOn;
    data['reported_by'] = reportedBy;
    data['done_by'] = doneBy;
    data['signed_by'] = signedBy;
    data['lab_name'] = labName;
    data['price'] = price;
    data['test_type'] = testType;
    data['test_date'] = testDate;
    data['paymode'] = paymode;
    data['images'] = images;
    data['lab_address'] = labAddress;
    data['referred_by'] = referredBy;
    data['age'] = age;
    data['admin_show'] = adminShow;
    data['payment_status'] = paymentStatus;
    return data;
  }
}
