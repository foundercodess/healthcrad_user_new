import 'package:flutter/foundation.dart';
import 'package:health_crad_user/helper/network/base_api_services.dart';
import 'package:health_crad_user/helper/network/network_api_services.dart';
import 'package:health_crad_user/res/api_url.dart';


class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.loginUrl, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during loginApi: $e');
      }
      rethrow;
    }
  }



  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.registerUrl, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during registerApi: $e');
      }
      rethrow;
    }
  }
}
