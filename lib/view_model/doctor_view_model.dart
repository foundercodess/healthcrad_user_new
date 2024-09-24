import 'package:flutter/foundation.dart';
import 'package:health_crad_user/model/doctor_department.dart';
import 'package:health_crad_user/model/slider_model.dart';
import 'package:health_crad_user/repo/doctor_repo.dart';
import 'package:health_crad_user/utils/utils.dart';
import '../repo/silder_repo.dart';


class DoctorViewModel with ChangeNotifier {


  final _doctorDepartmentRepo = DoctorDepartmentRepo();



  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  DoctorDepartment? _doctorModelData;

  DoctorDepartment? get doctorDepartmentModelData => _doctorModelData;

  setListData(DoctorDepartment value) {
    _doctorModelData = value;
    notifyListeners();
  }

  Future<void> doctorCatApi(context) async {
    setLoading(true);
    _doctorDepartmentRepo.doctorCatApi().then((value) {
      if (value.status == 200) {
        setLoading(false);
        setListData(value);
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
