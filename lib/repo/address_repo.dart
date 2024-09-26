import 'package:flutter/foundation.dart';
import 'package:health_crad_user/helper/network/base_api_services.dart';
import 'package:health_crad_user/helper/network/network_api_services.dart';
import 'package:health_crad_user/model/address_get_model.dart';
import 'package:health_crad_user/res/api_url.dart';


class AddressRepo {
  final BaseApiServices _apiServices = NetworkApiServices();


// Address Api
  Future<dynamic> addAddressApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.addAddressUrl, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during addAddressApi: $e');
      }
      rethrow;
    }
  }
// Get Address Api

  Future<AddressGetModel> getAddressApi(dynamic userId) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(ApiUrl.getAddressUrl + userId);
      return AddressGetModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during getAddressApi: $e');
      }
      rethrow;
    }
  }


// delete Address


  Future<dynamic> deleteAddressApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.deleteAddressUrl, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during deleteAddressApi: $e');
      }
      rethrow;
    }
  }
}
