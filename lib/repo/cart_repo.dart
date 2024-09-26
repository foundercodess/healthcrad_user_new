import 'package:flutter/foundation.dart';
import 'package:health_crad_user/helper/network/base_api_services.dart';
import 'package:health_crad_user/helper/network/network_api_services.dart';
import 'package:health_crad_user/model/cart_model.dart';
import 'package:health_crad_user/res/api_url.dart';

import '../view_model/cart_view_model.dart';

class AddToCartRepo {
  final BaseApiServices _apiServices = NetworkApiServices();
// AddToCart
  Future<dynamic> addToCartApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.addToCartUrl, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during addToCartApi: $e');
      }
      rethrow;
    }
  }
  // delete to cart

  Future<dynamic> deleteToCartApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.deleteCartUrl, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during deleteToCartApi: $e');
      }
      rethrow;
    }
  }


  // view cart


  Future<CartModel> cartViewApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(ApiUrl.cartViewUrl + data);
      return CartModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during cartViewApi: $e');
      }
      rethrow;
    }
  }

}
