import 'package:flutter/foundation.dart';
import 'package:health_crad_user/helper/network/base_api_services.dart';
import 'package:health_crad_user/helper/network/network_api_services.dart';
import 'package:health_crad_user/model/order_history_model.dart';
import 'package:health_crad_user/res/api_url.dart';

class OrderRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  // Create Order Api
  Future<dynamic> createOrderApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(ApiUrl.orderCreateUrl, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during createOrderApi: $e');
      }
      rethrow;
    }
  }

  // Create Order by prescription Api
  Future<dynamic> orderByPrescriptionApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          ApiUrl.createOrderPrescriptionUrl, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during orderByPrescriptionApi: $e');
      }
      rethrow;
    }
  }



//   Order History Api

  Future<OrderHistoryModel> orderHistoryApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(ApiUrl.orderHistoryUrl + data);
      return OrderHistoryModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during orderHistoryApi: $e');
      }
      rethrow;
    }
  }
}
