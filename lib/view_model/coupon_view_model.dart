import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:health_crad_user/model/get_coupons_model.dart';
import 'package:health_crad_user/repo/coupon_repo.dart';
import 'package:health_crad_user/utils/utils.dart';
import 'package:health_crad_user/view_model/cart_view_model.dart';
import 'package:provider/provider.dart';

class CouponViewModel with ChangeNotifier {
  final _couponRepo = CouponRepo();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }



  CouponsModel? _couponsModelData;

  CouponsModel? get couponsModelData => _couponsModelData;

  CouponsModelData? _appliedCoupon;

  CouponsModelData? get appliedCoupon => _appliedCoupon;

  String _getTotalAmountWithApplyCoupon = "";
  String get getTotalAmountWithApplyCoupon => _getTotalAmountWithApplyCoupon;

  setCouponsModelData(CouponsModel value) {
    _couponsModelData = value;
    notifyListeners();
  }

  void validateAndApplyCoupon(context, String val) {
    CouponsModelData? matchedCoupon =
        _couponsModelData!.couponsModelData!.firstWhere(
      (e) => e.couponCode == val.toUpperCase(),
    );

    if (matchedCoupon != null) {
      _appliedCoupon = matchedCoupon;
      final cartViewModel = Provider.of<CartViewModel>(context, listen: false);
      final totalAmount = cartViewModel.vModelData!.totalAmount;

      if (totalAmount != null) {
        final couponAmount =
            double.parse(_appliedCoupon!.discountPrice.toString());
        cartViewModel.vModelData!.totalAmount =
            (totalAmount - couponAmount).toInt();
        Navigator.pop(context);

        cartViewModel
            .notifyListeners(); // Notify listeners after the state change
      }
    } else {
      print("Coupon not found");
    }
  }

  void removeAppliedCoupon(context) {
    final cartViewModel = Provider.of<CartViewModel>(context, listen: false);
    final totalAmount = cartViewModel.vModelData!.totalAmount;
    if (totalAmount != null) {
      final couponAmount =
          double.parse(_appliedCoupon!.discountPrice.toString());
      cartViewModel.vModelData!.totalAmount =
          (totalAmount + couponAmount).toInt();

      _appliedCoupon = null;
      cartViewModel
          .notifyListeners(); // Notify listeners after the state change
    }

    notifyListeners();
  }

  Future<void> couponGetApi(context) async {
    setLoading(true);
    _couponRepo.couponGetApi().then((value) {
      if (value.status == 200) {
        setLoading(false);
        setCouponsModelData(value);
      } else {
        setLoading(false);
        Utils.show(value.message.toString(), context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.show(error.toString(), context);
        print('error: $error');
      }
    });
  }
}
