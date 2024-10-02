import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:health_crad_user/model/address_get_model.dart';
import 'package:health_crad_user/repo/Order_repo.dart';
import 'package:health_crad_user/repo/address_repo.dart';
import 'package:health_crad_user/utils/utils.dart';
import 'package:health_crad_user/view_model/address_view_model.dart';
import 'package:health_crad_user/view_model/coupon_view_model.dart';
import 'package:health_crad_user/view_model/path_view_model.dart';
import 'package:health_crad_user/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class OrderViewModel with ChangeNotifier {


  final _orderRepo = OrderRepo();


  // Create Order Api

  bool _loadingCreateOrder= false;

  bool get loadingCreateOrder => _loadingCreateOrder;

  setLoadingCreateOrder(bool value) {
    _loadingCreateOrder = value;
    notifyListeners();
  }

  Future<void> createOrderApi(context) async {
    setLoadingCreateOrder(true);
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    final pathViewModel = Provider.of<PathViewModel>(context);
    final addressViewModel = Provider.of<AddressViewModel>(context);
    final couponViewModel = Provider.of<CouponViewModel>(context);
    Map data = {
      "userid": userId,
      "addressid":addressViewModel.selectedAddress ,
      // "couponid": ,
      // "coupon_amount": ,
      // "paymode": state,
      "des_required": pathViewModel.base64Image,
    };
    _orderRepo.createOrderApi(data).then((value) {
      if (value['status'] == 200) {
        setLoadingCreateOrder(false);

        Utils.show(value["message"], context);

      }
    }).onError((error, stackTrace) {
      setLoadingCreateOrder(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }


}