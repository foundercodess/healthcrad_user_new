import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:health_crad_user/model/address_get_model.dart';
import 'package:health_crad_user/model/order_history_model.dart';
import 'package:health_crad_user/repo/Order_repo.dart';
import 'package:health_crad_user/repo/address_repo.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/utils/utils.dart';
import 'package:health_crad_user/view_model/address_view_model.dart';
import 'package:health_crad_user/view_model/cart_view_model.dart';
import 'package:health_crad_user/view_model/coupon_view_model.dart';
import 'package:health_crad_user/view_model/path_view_model.dart';
import 'package:health_crad_user/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class OrderViewModel with ChangeNotifier {
  final _orderRepo = OrderRepo();

  // Create Order Api

  bool _loadingCreateOrder = false;

  bool get loadingCreateOrder => _loadingCreateOrder;

  setLoadingCreateOrder(bool value) {
    _loadingCreateOrder = value;
    notifyListeners();
  }

  Future<void> createOrderApi(dynamic payMode, context) async {
    setLoadingCreateOrder(true);
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    final pathViewModel = Provider.of<PathViewModel>(context, listen: false);
    final addressViewModel =
        Provider.of<AddressViewModel>(context, listen: false);
    final couponViewModel =
        Provider.of<CouponViewModel>(context, listen: false);
    final cartViewModel = Provider.of<CartViewModel>(context, listen: false);
    Map data = {
      "userid": userId,
      "addressid": addressViewModel
          .modelAddressData!.getAddressData![addressViewModel.selectedIndex].id
          .toString(),
      "couponid": couponViewModel.appliedCoupon != null
          ? couponViewModel.appliedCoupon!.id.toString()
          : "",
      "coupon_amount": couponViewModel.appliedCoupon != null
          ? couponViewModel.appliedCoupon!.discountPrice.toString()
          : "",
      "paymode": payMode,
      "des_required": pathViewModel.base64Image,
      "delivery_charge": cartViewModel.vModelData!.deliveryCharge,
      "packging_charge": cartViewModel.vModelData!.packagingCharge,
    };
    _orderRepo.createOrderApi(data).then((value) {
      if (value['status'] == 200) {
        setLoadingCreateOrder(false);
        Utils.show(value["message"], context);
        Navigator.pushNamed(context, RoutesName.commonOrderScreen,
            arguments: {"name": "Your order has been successfully\nplaced"});
      }
    }).onError((error, stackTrace) {
      setLoadingCreateOrder(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }

  // order by prescription

  bool _loadingCreatePOrder = false;

  bool get loadingCreatePOrder => _loadingCreatePOrder;

  setLoadingCreatePOrder(bool value) {
    _loadingCreatePOrder = value;
    notifyListeners();
  }

  Future<void> orderByPrescriptionApi(context) async {
    setLoadingCreateOrder(true);
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    final pathViewModel = Provider.of<PathViewModel>(context, listen: false);
    final addressViewModel =
        Provider.of<AddressViewModel>(context, listen: false);

    Map data = {
      "userid": userId,
      "address_id": addressViewModel
          .modelAddressData!.getAddressData![addressViewModel.selectedIndex].id
          .toString(),
      "images": pathViewModel.base64Image,
    };
    _orderRepo.orderByPrescriptionApi(data).then((value) {
      if (value['status'] == 200) {
        setLoadingCreateOrder(false);
        Utils.show(value["message"], context);
        Navigator.pushNamed(context, RoutesName.commonOrderScreen, arguments: {
          "name": "Your order by prescription has been\nsuccessfully placed"
        });
      }
    }).onError((error, stackTrace) {
      setLoadingCreateOrder(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }

  // Order History Api

  OrderHistoryModel? _orderHistoryModel;
  OrderHistoryModel? get orderHistoryModel => _orderHistoryModel;

  void setOrderHistoryModel(OrderHistoryModel name) {
    _orderHistoryModel = name;
    notifyListeners();
  }


  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void selectOrderHistory(int addIndex){
    _selectedIndex =addIndex;
    notifyListeners();
  }


  Future<void> orderHistoryApi(context) async {
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    _orderRepo.orderHistoryApi(userId).then((value) {
      if (value.status == 200) {
        setOrderHistoryModel(value);
      } else {
        if (kDebugMode) {
          print('value: ${value.message}');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
