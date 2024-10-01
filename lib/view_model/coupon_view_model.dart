import 'package:flutter/foundation.dart';

import 'package:health_crad_user/model/get_coupons_model.dart';
import 'package:health_crad_user/repo/coupon_repo.dart';
import 'package:health_crad_user/utils/utils.dart';



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

  setCouponsModelData(CouponsModel value) {
    _couponsModelData = value;
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
