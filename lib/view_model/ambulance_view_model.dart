import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:health_crad_user/model/ambulance_history_model.dart';
import 'package:health_crad_user/model/ambulance_type_model.dart';
import 'package:health_crad_user/repo/ambulance_repo.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/utils/utils.dart';
import 'package:health_crad_user/view_model/user_view_model.dart';

class AmbulanceViewModel with ChangeNotifier {


  final _ambulanceRepo = AmbulanceRepo();


  // Ambulance Type


  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  AmbulanceTypeModel? _ambulanceTypeData;

  AmbulanceTypeModel? get ambulanceTypeData => _ambulanceTypeData;

  setAmbulanceTypeData(AmbulanceTypeModel value) {
    _ambulanceTypeData = value;
    notifyListeners();
  }

  Future<void> ambulanceTypeApi(context) async {
    setLoading(true);
    _ambulanceRepo.ambulanceTypeApi().then((value) {
      if (value.status == 200) {
        setLoading(false);
        setAmbulanceTypeData(value);
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



//   Ambulance Request Api



  dynamic _reqData;
  dynamic get reqData =>_reqData;

  setReqData(context,dynamic data){
    _reqData=data;
    print(_reqData);
    Navigator.pushNamed(context, RoutesName.ambulanceReview);
    notifyListeners();
  }

  bool _loadingAmbulanceRequest = false;

  bool get loadingAmbulanceRequest => _loadingAmbulanceRequest;

  setLoadingAmbulanceRequest(bool value) {
    _loadingAmbulanceRequest = value;
    notifyListeners();
  }

  Future<void> ambulanceRequestApi(context) async {
    setLoadingAmbulanceRequest(true);

    _ambulanceRepo.ambulanceRequestApi(reqData).then((value) {
      if (value['status'] == 200) {
        setLoadingAmbulanceRequest(false);
        Utils.show( value["message"], context);
      }
      else{
        Utils.show(value["message"], context);
      }
    }).onError((error, stackTrace) {
      setLoadingAmbulanceRequest(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }


  // Ambulance History
  AmbulanceHistoryModel? _ambulanceHistoryModel;
  AmbulanceHistoryModel? get ambulanceHistoryModel => _ambulanceHistoryModel;

  void setAmbulanceHistoryModel(AmbulanceHistoryModel name) {
    _ambulanceHistoryModel = name;
    notifyListeners();
  }
  Future<void> ambulanceHistoryApi(context) async {
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    _ambulanceRepo.ambulanceHistoryApi(userId).then((value) {
      if (value.status == 200) {
        setAmbulanceHistoryModel(value);


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
