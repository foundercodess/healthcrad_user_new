class AmbulanceTypeModel {
  List<Data>? data;
  int? status;
  String? message;

  AmbulanceTypeModel({this.data, this.status, this.message});

  AmbulanceTypeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? type;
  String? basePrice;
  String? price;
  String? description;
  String? features;
  dynamic status;

  Data(
      {this.id,
        this.type,
        this.basePrice,
        this.price,
        this.description,
        this.features,
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    basePrice = json['base_price'];
    price = json['price'];
    description = json['description'];
    features = json['features'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['base_price'] = basePrice;
    data['price'] = price;
    data['description'] = description;
    data['features'] = features;
    data['status'] = status;
    return data;
  }
}
