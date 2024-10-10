import 'package:flutter/foundation.dart';
import 'package:health_crad_user/helper/network/base_api_services.dart';
import 'package:health_crad_user/helper/network/network_api_services.dart';

import 'package:health_crad_user/model/get_coupons_model.dart';

import 'package:health_crad_user/res/api_url.dart';


class CouponRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<CouponsModel> couponGetApi() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(ApiUrl.getCouponsUrl);
      return CouponsModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during couponGetApi: $e');
      }
      rethrow;
    }
  }
}
