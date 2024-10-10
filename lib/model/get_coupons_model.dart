class CouponsModel {
  List<CouponsModelData>? couponsModelData;
  int? status;
  String? message;

  CouponsModel({this.couponsModelData, this.status, this.message});

  CouponsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      couponsModelData = <CouponsModelData>[];
      json['data'].forEach((v) {
        couponsModelData!.add( CouponsModelData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (couponsModelData != null) {
      data['data'] = couponsModelData!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class CouponsModelData {
  int? id;
  String? couponCode;
  String? couponName;
  String? discountPrice;
  String? minOrderPrice;
  String? createdAt;
  String? description;

  CouponsModelData(
      {this.id,
        this.couponCode,
        this.couponName,
        this.discountPrice,
        this.minOrderPrice,
        this.createdAt,
        this.description});

  CouponsModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    couponCode = json['coupon_code'];
    couponName = json['coupon_name'];
    discountPrice = json['discount_price'];
    minOrderPrice = json['min_order_price'];
    createdAt = json['created_at'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['coupon_code'] = couponCode;
    data['coupon_name'] = couponName;
    data['discount_price'] = discountPrice;
    data['min_order_price'] = minOrderPrice;
    data['created_at'] = createdAt;
    data['description'] = description;
    return data;
  }
}
