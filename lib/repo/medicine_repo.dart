import 'package:flutter/foundation.dart';
import 'package:health_crad_user/helper/network/base_api_services.dart';
import 'package:health_crad_user/helper/network/network_api_services.dart';
import 'package:health_crad_user/model/doctor_department.dart';
import 'package:health_crad_user/model/medicine_cat.dart';
import 'package:health_crad_user/model/slider_model.dart';
import 'package:health_crad_user/res/api_url.dart';


class MedicineCatRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<MedicineCatModel> medicineCatApi() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(ApiUrl.medicineCatUrl);
      return MedicineCatModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during medicineCatApi: $e');
      }
      rethrow;
    }
  }
}
