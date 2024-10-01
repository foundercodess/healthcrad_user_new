import 'package:flutter/foundation.dart';
import 'package:health_crad_user/helper/network/base_api_services.dart';
import 'package:health_crad_user/helper/network/network_api_services.dart';
import 'package:health_crad_user/res/api_url.dart';


class RatingRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

// Rating Repo Api
  Future<dynamic> ratingApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.ratingUrl, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during ratingApi: $e');
      }
      rethrow;
    }
  }



}
