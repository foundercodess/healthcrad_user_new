class CartModel {
  List<ViewCartData>? viewCartData;
  dynamic itemCost;
  dynamic totalDiscount;
  dynamic packagingCharge;
  dynamic deliveryCharge;
  dynamic descountCupon;
  dynamic totalAmount;
  dynamic status;
  dynamic message;

  CartModel(
      {this.viewCartData,
        this.itemCost,
        this.totalDiscount,
        this.packagingCharge,
        this.deliveryCharge,
        this.descountCupon,
        this.totalAmount,
        this.status,
        this.message});

  CartModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      viewCartData = <ViewCartData>[];
      json['data'].forEach((v) {
        viewCartData!.add(ViewCartData.fromJson(v));
      });
    }
    itemCost = json['item_cost'];
    totalDiscount = json['total_discount'];
    packagingCharge = json['packaging_charge'];
    deliveryCharge = json['delivery_charge'];
    descountCupon = json['descount_cupon'];
    totalAmount = json['total_amount'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (viewCartData != null) {
      data['data'] = viewCartData!.map((v) => v.toJson()).toList();
    }
    data['item_cost'] = itemCost;
    data['total_discount'] = totalDiscount;
    data['packaging_charge'] = packagingCharge;
    data['delivery_charge'] = deliveryCharge;
    data['descount_cupon'] = descountCupon;
    data['total_amount'] = totalAmount;
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class ViewCartData {
  dynamic id;
  dynamic name;
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
  dynamic marketer;
  dynamic selfComposition;
  dynamic storage;
  dynamic detail;
  dynamic disclaimer;
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
        this.marketer,
        this.selfComposition,
        this.storage,
        this.detail,
        this.disclaimer,
        this.productQuantity});

  ViewCartData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    subcategory = json['subcategory'];
    price = json['price']??0;
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
    data['marketer'] = marketer;
    data['self_composition'] = selfComposition;
    data['storage'] = storage;
    data['detail'] = detail;
    data['disclaimer'] = disclaimer;
    data['product_quantity'] = productQuantity;
    return data;
  }
}
