
import 'package:flutter/foundation.dart';
import 'package:health_crad_user/model/profile_model.dart';
import 'package:health_crad_user/repo/profile_repo.dart';
import 'package:health_crad_user/view_model/user_view_model.dart';


class ProfileViewModel with ChangeNotifier {
  final _profileRepo  = ProfileRepository();


  ProfileModel? _modelData ;
  ProfileModel? get modelData => _modelData;

  void setModelData(ProfileModel name) {
    _modelData = name;
    notifyListeners();
  }

  Future<void> profileApi(context) async {
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    _profileRepo.profileApi(userId).then((value) {
      if (value.status == 200) {
        setModelData(value);
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

