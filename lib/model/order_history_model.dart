// class OrderHistoryModel {
//   List<OrderHistoryData>? orderHistoryData;
//   int? status;
//   String? message;
//
//   OrderHistoryModel({this.orderHistoryData, this.status, this.message});
//
//   OrderHistoryModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       orderHistoryData = <OrderHistoryData>[];
//       json['data'].forEach((v) {
//         orderHistoryData!.add(OrderHistoryData.fromJson(v));
//       });
//     }
//     status = json['status'];
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (orderHistoryData != null) {
//       data['data'] = orderHistoryData!.map((v) => v.toJson()).toList();
//     }
//     data['status'] = status;
//     data['message'] = message;
//     return data;
//   }
// }
//
// class OrderHistoryData {
//   dynamic id;
//   dynamic userId;
//   dynamic address;
//   dynamic couponId;
//   dynamic couponAmount;
//   dynamic totalAmount;
//   dynamic discount;
//   dynamic paymode;
//   dynamic status;
//   dynamic desRequired;
//   dynamic deliveryCharge;
//   dynamic packagingCharge;
//   dynamic createdAt;
//   dynamic updatedAt;
//   dynamic userName;
//   dynamic city;
//   dynamic landmark;
//   dynamic phone;
//   dynamic state;
//   List<Medicinedata>? medicinedata;
//
//   OrderHistoryData(
//       {this.id,
//         this.userId,
//         this.address,
//         this.couponId,
//         this.couponAmount,
//         this.totalAmount,
//         this.discount,
//         this.paymode,
//         this.status,
//         this.desRequired,
//         this.deliveryCharge,
//         this.packagingCharge,
//         this.createdAt,
//         this.updatedAt,
//         this.userName,
//         this.city,
//         this.landmark,
//         this.phone,
//         this.state,
//         this.medicinedata});
//
//   OrderHistoryData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['userId'];
//     address = json['address'];
//     couponId = json['coupon_id'];
//     couponAmount = json['coupon_amount'];
//     totalAmount = json['total_amount'];
//     discount = json['discount'];
//     paymode = json['paymode'];
//     status = json['status'];
//     desRequired = json['des_required'];
//     deliveryCharge = json['delivery_charge'];
//     packagingCharge = json['packaging_charge'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     userName = json['user_name'];
//     city = json['city'];
//     landmark = json['landmark'];
//     phone = json['phone'];
//     state = json['state'];
//     if (json['medicinedata'] != null) {
//       medicinedata = <Medicinedata>[];
//       json['medicinedata'].forEach((v) {
//         medicinedata!.add(Medicinedata.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['userId'] = userId;
//     data['address'] = address;
//     data['coupon_id'] = couponId;
//     data['coupon_amount'] = couponAmount;
//     data['total_amount'] = totalAmount;
//     data['discount'] = discount;
//     data['paymode'] = paymode;
//     data['status'] = status;
//     data['des_required'] = desRequired;
//     data['delivery_charge'] = deliveryCharge;
//     data['packaging_charge'] = packagingCharge;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['user_name'] = userName;
//     data['city'] = city;
//     data['landmark'] = landmark;
//     data['phone'] = phone;
//     data['state'] = state;
//     if (medicinedata != null) {
//       data['medicinedata'] = medicinedata!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Medicinedata {
//   dynamic id;
//   dynamic invoice;
//   dynamic uid;
//   dynamic productid;
//   dynamic sopid;
//   dynamic amount;
//   dynamic quantity;
//   dynamic totalamount;
//   dynamic datetime;
//   dynamic status;
//   dynamic paymod;
//   dynamic address;
//   dynamic orderid;
//   dynamic track;
//   dynamic actionTime;
//   dynamic prescription;
//   dynamic prescriptionImage;
//   dynamic name;
//   dynamic image;
//
//   Medicinedata(
//       {this.id,
//         this.invoice,
//         this.uid,
//         this.productid,
//         this.sopid,
//         this.amount,
//         this.quantity,
//         this.totalamount,
//         this.datetime,
//         this.status,
//         this.paymod,
//         this.address,
//         this.orderid,
//         this.track,
//         this.actionTime,
//         this.prescription,
//         this.prescriptionImage,
//         this.name,
//         this.image});
//
//   Medicinedata.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     invoice = json['invoice'];
//     uid = json['uid'];
//     productid = json['productid'];
//     sopid = json['sopid'];
//     amount = json['amount'];
//     quantity = json['quantity'];
//     totalamount = json['totalamount'];
//     datetime = json['datetime'];
//     status = json['status'];
//     paymod = json['paymod'];
//     address = json['address'];
//     orderid = json['orderid'];
//     track = json['track'];
//     actionTime = json['action_time'];
//     prescription = json['prescription'];
//     prescriptionImage = json['prescription_image'];
//     name = json['name'];
//     image = json['image'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['invoice'] = invoice;
//     data['uid'] = uid;
//     data['productid'] = productid;
//     data['sopid'] = sopid;
//     data['amount'] = amount;
//     data['quantity'] = quantity;
//     data['totalamount'] = totalamount;
//     data['datetime'] = datetime;
//     data['status'] = status;
//     data['paymod'] = paymod;
//     data['address'] = address;
//     data['orderid'] = orderid;
//     data['track'] = track;
//     data['action_time'] = actionTime;
//     data['prescription'] = prescription;
//     data['prescription_image'] = prescriptionImage;
//     data['name'] = name;
//     data['image'] = image;
//     return data;
//   }
// }


class OrderHistoryModel {
  List<OrderHistoryData>? orderHistoryData;
  int? status;
  String? message;

  OrderHistoryModel({this.orderHistoryData, this.status, this.message});

  OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      orderHistoryData = <OrderHistoryData>[];
      json['data'].forEach((v) {
        orderHistoryData!.add(new OrderHistoryData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderHistoryData != null) {
      data['data'] = this.orderHistoryData!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class OrderHistoryData {
  dynamic id;
  dynamic userId;
  dynamic address;
  dynamic couponId;
  dynamic couponAmount;
  dynamic totalAmount;
  dynamic discount;
  dynamic paymode;
  dynamic status;
  dynamic desRequired;
  dynamic deliveryCharge;
  dynamic packagingCharge;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic userName;
  dynamic city;
  dynamic landmark;
  dynamic phone;
  dynamic state;
  List<Medicinedata>? medicinedata;

  OrderHistoryData(
      {this.id,
        this.userId,
        this.address,
        this.couponId,
        this.couponAmount,
        this.totalAmount,
        this.discount,
        this.paymode,
        this.status,
        this.desRequired,
        this.deliveryCharge,
        this.packagingCharge,
        this.createdAt,
        this.updatedAt,
        this.userName,
        this.city,
        this.landmark,
        this.phone,
        this.state,
        this.medicinedata});

  OrderHistoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    address = json['address'];
    couponId = json['coupon_id'];
    couponAmount = json['coupon_amount'];
    totalAmount = json['total_amount'];
    discount = json['discount'];
    paymode = json['paymode'];
    status = json['status'];
    desRequired = json['des_required'];
    deliveryCharge = json['delivery_charge'];
    packagingCharge = json['packaging_charge'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userName = json['user_name'];
    city = json['city'];
    landmark = json['landmark'];
    phone = json['phone'];
    state = json['state'];
    if (json['medicinedata'] != null) {
      medicinedata = <Medicinedata>[];
      json['medicinedata'].forEach((v) {
        medicinedata!.add(new Medicinedata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['address'] = this.address;
    data['coupon_id'] = this.couponId;
    data['coupon_amount'] = this.couponAmount;
    data['total_amount'] = this.totalAmount;
    data['discount'] = this.discount;
    data['paymode'] = this.paymode;
    data['status'] = this.status;
    data['des_required'] = this.desRequired;
    data['delivery_charge'] = this.deliveryCharge;
    data['packaging_charge'] = this.packagingCharge;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_name'] = this.userName;
    data['city'] = this.city;
    data['landmark'] = this.landmark;
    data['phone'] = this.phone;
    data['state'] = this.state;
    if (this.medicinedata != null) {
      data['medicinedata'] = this.medicinedata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Medicinedata {
  int? id;
  String? name;
  String? category;
  int? subcategory;
  String? price;
  String? discount;
  String? box;
  String? sPrice;
  int? quantity;
  dynamic generic;
  dynamic company;
  dynamic effects;
  dynamic eDate;
  dynamic addDate;
  dynamic hospitalId;
  dynamic image;
  dynamic discription;
  dynamic shopid;
  dynamic decriptionRequired;
  dynamic coupon;
  dynamic discountedAmount;
  dynamic status;
  dynamic prescription;
  dynamic marketer;
  dynamic selfComposition;
  dynamic storage;
  dynamic detail;
  dynamic disclaimer;
  dynamic stock;
  dynamic productQuantity;
  dynamic itemCost;

  Medicinedata(
      {this.id,
        this.name,
        this.category,
        this.subcategory,
        this.price,
        this.discount,
        this.box,
        this.sPrice,
        this.quantity,
        this.generic,
        this.company,
        this.effects,
        this.eDate,
        this.addDate,
        this.hospitalId,
        this.image,
        this.discription,
        this.shopid,
        this.decriptionRequired,
        this.coupon,
        this.discountedAmount,
        this.status,
        this.prescription,
        this.marketer,
        this.selfComposition,
        this.storage,
        this.detail,
        this.disclaimer,
        this.stock,
        this.productQuantity,
        this.itemCost});

  Medicinedata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    subcategory = json['subcategory'];
    price = json['price'];
    discount = json['discount'];
    box = json['box'];
    sPrice = json['s_price'];
    quantity = json['quantity'];
    generic = json['generic'];
    company = json['company'];
    effects = json['effects'];
    eDate = json['e_date'];
    addDate = json['add_date'];
    hospitalId = json['hospital_id'];
    image = json['image'];
    discription = json['discription'];
    shopid = json['shopid'];
    decriptionRequired = json['decription_required'];
    coupon = json['coupon'];
    discountedAmount = json['discounted_amount'];
    status = json['status'];
    prescription = json['prescription'];
    marketer = json['marketer'];
    selfComposition = json['self_composition'];
    storage = json['storage'];
    detail = json['detail'];
    disclaimer = json['disclaimer'];
    stock = json['stock'];
    productQuantity = json['product_quantity'];
    itemCost = json['item_cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['subcategory'] = this.subcategory;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['box'] = this.box;
    data['s_price'] = this.sPrice;
    data['quantity'] = this.quantity;
    data['generic'] = this.generic;
    data['company'] = this.company;
    data['effects'] = this.effects;
    data['e_date'] = this.eDate;
    data['add_date'] = this.addDate;
    data['hospital_id'] = this.hospitalId;
    data['image'] = this.image;
    data['discription'] = this.discription;
    data['shopid'] = this.shopid;
    data['decription_required'] = this.decriptionRequired;
    data['coupon'] = this.coupon;
    data['discounted_amount'] = this.discountedAmount;
    data['status'] = this.status;
    data['prescription'] = this.prescription;
    data['marketer'] = this.marketer;
    data['self_composition'] = this.selfComposition;
    data['storage'] = this.storage;
    data['detail'] = this.detail;
    data['disclaimer'] = this.disclaimer;
    data['stock'] = this.stock;
    data['product_quantity'] = this.productQuantity;
    data['item_cost'] = this.itemCost;
    return data;
  }
}
