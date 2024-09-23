import 'package:flutter/foundation.dart';
import 'package:health_crad_user/helper/network/base_api_services.dart';
import 'package:health_crad_user/helper/network/network_api_services.dart';
import 'package:health_crad_user/model/slider_model.dart';
import 'package:health_crad_user/res/api_url.dart';


class SliderRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<SliderModel> sliderApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.sliderUrl, data);
      return SliderModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during sliderApi: $e');
      }
      rethrow;
    }
  }
}
