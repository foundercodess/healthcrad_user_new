import 'package:flutter/foundation.dart';
import 'package:health_crad_user/helper/network/base_api_services.dart';
import 'package:health_crad_user/helper/network/network_api_services.dart';
import 'package:health_crad_user/res/api_url.dart';


class AppointmentRepo {
  final BaseApiServices _apiServices = NetworkApiServices();


 // Doctor Appointment Api

  Future<dynamic> doctorAppointmentApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.doctorAppointmentUrl, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during doctorAppointmentApi: $e');
      }
      rethrow;
    }
  }



}
