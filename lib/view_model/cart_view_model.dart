import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:health_crad_user/model/cart_model.dart';

import 'package:health_crad_user/repo/cart_repo.dart';
import 'package:health_crad_user/utils/utils.dart';
import 'package:health_crad_user/view_model/medicine_view_model.dart';
import 'package:health_crad_user/view_model/update_quantity_view_model.dart';

import 'package:health_crad_user/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class CartViewModel with ChangeNotifier {
  final _addToCartRepo = AddToCartRepo();

  // Add To Cart

  bool _loadingAdd = false;

  bool get loadingAdd => _loadingAdd;

  setLoadingAdd(bool value) {
    _loadingAdd = value;
    notifyListeners();
  }

  Future<void> addToCartApi(
      dynamic uid, dynamic productId, dynamic quantity, context) async {
    setLoadingAdd(true);

    Map data = {
      "uid": uid,
      "productid": productId,
      "quantity": quantity,
    };
    print(data);
    _addToCartRepo.addToCartApi(data).then((value) {
      if (value['status'] == 200) {
        Provider.of<MedicineViewModel>(context, listen: false)
            .allMedicineApi(context, '', '10', '0');
        cartViewApi(context);
        Utils.show('Item Added in cart Successfully', context);
        setLoadingAdd(false);
      } else {}
    }).onError((error, stackTrace) {
      setLoadingAdd(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }

// delete to cart api

  bool _loadingDc = false;

  bool get loadingDc => _loadingDc;

  setLoadingDc(bool value) {
    _loadingDc = value;
    notifyListeners();
  }

  Future<void> deleteToCartApi(dynamic productId,BuildContext context, int index) async {
    setLoadingDc(true);

    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    Map data = {
      "uid": userId,
      "productid": productId,
    };

    _addToCartRepo.deleteToCartApi(data).then((value) {
      if (value['status'] == 200) {
        Navigator.pop(context);
          Provider.of<CartViewModel>(context, listen: false).cartViewApi(context);
          Utils.show(value["message"], context);
          Provider.of<MedicineViewModel>(context, listen: false)
              .allMedicineApi(context, '', '10', '0');
          setLoadingDc(false);
      } else {}
    }).onError((error, stackTrace) {
      setLoadingAdd(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }

  // cart View Model

  CartModel? _vModelData;
  CartModel? get vModelData => _vModelData;

  void setVModelData(CartModel name) {
    _vModelData = name;
    notifyListeners();
  }

  Future<void> cartViewApi(context) async {
    print("cart view api executed");
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    _addToCartRepo.cartViewApi(userId).then((value) {
      if (value.status == 200) {
        setVModelData(value);
      } else {
        setVModelData(value);
        if (kDebugMode) {
          print('value: ${value.message}');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('error: $error');
      }
    });
    notifyListeners();
  }
}
