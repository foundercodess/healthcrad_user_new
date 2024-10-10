import 'package:flutter/foundation.dart';
import 'package:health_crad_user/helper/network/base_api_services.dart';
import 'package:health_crad_user/helper/network/network_api_services.dart';
import 'package:health_crad_user/res/api_url.dart';


class HelpRepo {
  final BaseApiServices _apiServices = NetworkApiServices();



// Help Api


  Future<dynamic> helpApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.helpUrl, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during helpApi: $e');
      }
      rethrow;
    }
  }




}
