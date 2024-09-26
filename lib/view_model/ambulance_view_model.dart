import 'package:flutter/foundation.dart';
import 'package:health_crad_user/model/ambulance_type_model.dart';
import 'package:health_crad_user/model/doctor_department.dart';
import 'package:health_crad_user/model/slider_model.dart';
import 'package:health_crad_user/repo/ambulance_repo.dart';
import 'package:health_crad_user/repo/doctor_repo.dart';
import 'package:health_crad_user/utils/utils.dart';
import '../repo/silder_repo.dart';


class AmbulanceViewModel with ChangeNotifier {


  final _ambulanceRepo = AmbulanceRepo();



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
}
