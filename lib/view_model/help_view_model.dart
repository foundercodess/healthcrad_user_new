import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:health_crad_user/repo/auth_repo.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/utils/utils.dart';
import 'package:health_crad_user/view_model/user_view_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../repo/help_repo.dart';

class HelpViewModel with ChangeNotifier {
  final _helpRepo = HelpRepo();

// Help Api


  bool _loadingHelp = false;

  bool get loadingHelp => _loadingHelp;

  setLoadingHelp(bool value) {
    _loadingHelp = value;
    notifyListeners();
  }

  Future<void> helpApi( dynamic nameCon, dynamic mobileCon,
      dynamic messageCon, context) async {
    setLoadingHelp(true);
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    Map data = {
      "user_id": userId,
      "name": nameCon,
      "phone": mobileCon,
      "message": messageCon,
    };
    _helpRepo.helpApi(data).then((value) {
      if (value['status'] == 200) {
        setLoadingHelp(false);
        Utils.show(value["message"], context);
      }
    }).onError((error, stackTrace) {
      setLoadingHelp(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }


}