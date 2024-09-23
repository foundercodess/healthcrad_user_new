class SliderModel {
  String? message;
  int? status;
  List<CommonModel>? promotional;
  List<CommonModel>? offerSlider;
  List<CommonModel>? bestOffer;

  SliderModel(
      {this.message, this.promotional, this.offerSlider, this.bestOffer});

  SliderModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json["status"];
    if (json['pramotional'] != null) {
      promotional = <CommonModel>[];
      json['pramotional'].forEach((v) {
        promotional!.add(CommonModel.fromJson(v));
      });
    }
    if (json['offer_slider'] != null) {
      offerSlider = <CommonModel>[];
      json['offer_slider'].forEach((v) {
        offerSlider!.add(CommonModel.fromJson(v));
      });
    }
    if (json['best_offer'] != null) {
      bestOffer = <CommonModel>[];
      json['best_offer'].forEach((v) {
        bestOffer!.add(CommonModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (promotional != null) {
      data['pramotional'] = promotional!.map((v) => v.toJson()).toList();
    }
    if (offerSlider != null) {
      data['offer_slider'] = offerSlider!.map((v) => v.toJson()).toList();
    }
    if (bestOffer != null) {
      data['best_offer'] = bestOffer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CommonModel {
  dynamic image;
  dynamic url;
  dynamic type;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic status;

  CommonModel(
      {this.image,
        this.url,
        this.type,
        this.createdAt,
        this.updatedAt,
        this.status});

  CommonModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    url = json['url'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['url'] = url;
    data['type'] = type;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['status'] = status;
    return data;
  }
}
