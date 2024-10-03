import 'package:flutter/foundation.dart';
import 'package:health_crad_user/helper/network/base_api_services.dart';
import 'package:health_crad_user/helper/network/network_api_services.dart';
import 'package:health_crad_user/res/api_url.dart';


class UpdateQuantityRepo {
  final BaseApiServices _apiServices = NetworkApiServices();


// Update Quantity Repo

  Future<dynamic> updateQuantityApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.updateQuantityUrl, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during updateQuantityApi: $e');
      }
      rethrow;
    }
  }



}
