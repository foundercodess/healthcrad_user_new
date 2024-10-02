class AllMedicineModel {
  List<AllMedicineData>? allMedicineData;
  int? totalmedicine;
  int? status;
  String? message;

  AllMedicineModel({this.allMedicineData, this.totalmedicine, this.status, this.message});

  AllMedicineModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      allMedicineData = <AllMedicineData>[];
      json['data'].forEach((v) {
        allMedicineData!.add(AllMedicineData.fromJson(v));
      });
    }
    totalmedicine = json['totalmedicine'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.allMedicineData != null) {
      data['data'] = this.allMedicineData!.map((v) => v.toJson()).toList();
    }
    data['totalmedicine'] = totalmedicine;
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class AllMedicineData {
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
  String? image;
  String? discription;
  dynamic shopid;
  dynamic decriptionRequired;
  String? coupon;
  dynamic discountedAmount;
  dynamic status;
  dynamic prescription;
  dynamic is_added_to_cart;

  AllMedicineData(
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
        this.is_added_to_cart
      });

  AllMedicineData.fromJson(Map<String, dynamic> json) {
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
    is_added_to_cart = json['is_added_to_cart'];
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
    data['is_added_to_cart'] = is_added_to_cart;
    return data;
  }
}
