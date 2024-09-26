class CartModel {
  List<ViewCartData>? viewCartData;
  int? status;
  String? message;

  CartModel({this.viewCartData, this.status, this.message});

  CartModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      viewCartData = <ViewCartData>[];
      json['data'].forEach((v) {
        viewCartData!.add(ViewCartData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (viewCartData != null) {
      data['data'] = viewCartData!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class ViewCartData {
  int? id;
  String? name;
  dynamic category;
  dynamic subcategory;
  dynamic price;
  dynamic discount;
  dynamic box;
  dynamic sPrice;
  dynamic quantity;
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
  dynamic productQuantity;

  ViewCartData(
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
      this.productQuantity
      });

  ViewCartData.fromJson(Map<String, dynamic> json) {
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
    productQuantity = json['product_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category'] = category;
    data['subcategory'] = subcategory;
    data['price'] = price;
    data['discount'] = discount;
    data['box'] = box;
    data['s_price'] = sPrice;
    data['quantity'] = quantity;
    data['generic'] = generic;
    data['company'] = company;
    data['effects'] = effects;
    data['e_date'] = eDate;
    data['add_date'] = addDate;
    data['hospital_id'] = hospitalId;
    data['image'] = image;
    data['discription'] = discription;
    data['shopid'] = shopid;
    data['decription_required'] = decriptionRequired;
    data['coupon'] = coupon;
    data['discounted_amount'] = discountedAmount;
    data['status'] = status;
    data['prescription'] = prescription;
    data['product_quantity'] = productQuantity;
    return data;
  }
}
