import 'package:flutter/foundation.dart';
import 'package:health_crad_user/helper/network/base_api_services.dart';
import 'package:health_crad_user/helper/network/network_api_services.dart';
import 'package:health_crad_user/model/doctor_department.dart';
import 'package:health_crad_user/model/doctor_view_review_model.dart';
import 'package:health_crad_user/model/get_doctor_model.dart';
import 'package:health_crad_user/model/slider_model.dart';
import 'package:health_crad_user/res/api_url.dart';


class DoctorDepartmentRepo {
  final BaseApiServices _apiServices = NetworkApiServices();
  // Doctor Department
  Future<DoctorDepartment> doctorCatApi() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(ApiUrl.doctorCatUrl);
      return DoctorDepartment.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during doctorCatApi: $e');
      }
      rethrow;
    }
  }


//   Doctor Get List Api


  Future<GetDoctorModel> getDoctorApi(String catId) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(ApiUrl.doctorGetListUrl + catId);
      return GetDoctorModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during getDoctorApi: $e');
      }
      rethrow;
    }
  }


//   Doctor View Review Api


  Future<DoctorViewReviewModel> doctorVRApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(ApiUrl.doctorViewReviewUrl + data);
      return DoctorViewReviewModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during doctorVRApi: $e');
      }
      rethrow;
    }
  }



}
