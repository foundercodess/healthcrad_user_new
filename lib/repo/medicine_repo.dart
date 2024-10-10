import 'package:flutter/foundation.dart';
import 'package:health_crad_user/helper/network/base_api_services.dart';
import 'package:health_crad_user/helper/network/network_api_services.dart';
import 'package:health_crad_user/model/all_medicine_model.dart';

import 'package:health_crad_user/model/medicine_cat.dart';
import 'package:health_crad_user/model/medicine_details_model.dart';

import 'package:health_crad_user/res/api_url.dart';

class MedicineCatRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

// MedicineCat
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

  // All Medicine
  Future<AllMedicineModel> allMedicineApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(ApiUrl.allMedicineUrl, data);
      return AllMedicineModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during allMedicineApi: $e');
      }
      rethrow;
    }
  }
// Medicine Details

  Future<MedicineDetailsModel> medicineDetailsApi(dynamic medicineId) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(ApiUrl.medicineDetailsUrl + medicineId);
      return MedicineDetailsModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during medicineDetailsApi: $e');
      }
      rethrow;
    }
  }
}




