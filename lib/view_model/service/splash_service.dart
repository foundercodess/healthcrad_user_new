// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:health_crad_user/view_model/user_view_model.dart';

class SplashServices {
  Future<String?> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      if (kDebugMode) {
        print(value.toString());
        print('valueId');
      }
      if (value.toString() == 'null' || value.toString() == '') {
        // await Future.delayed(const Duration(seconds: 3));
        // Navigator.pushNamed(context, RoutesName.mainScreen);
      } else {
        // await Future.delayed(const Duration(seconds: 3));
        // Navigator.pushNamed(context, RoutesName.bottomNavBar);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
      });
    }
}
