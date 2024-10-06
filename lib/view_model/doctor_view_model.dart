import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:health_crad_user/model/doctor_department.dart';
import 'package:health_crad_user/model/doctor_view_review_model.dart';
import 'package:health_crad_user/model/get_doctor_model.dart';
import 'package:health_crad_user/model/slider_model.dart';
import 'package:health_crad_user/repo/doctor_repo.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/utils/utils.dart';
import '../repo/silder_repo.dart';

class DoctorViewModel with ChangeNotifier {
  final _doctorDepartmentRepo = DoctorDepartmentRepo();

  // Doctor Department
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

//    Doctor Get Api

  GetDoctorModel? _getDoctorModelData;
  GetDoctorModel? get getDoctorModelData => _getDoctorModelData;

  void setGetDoctorModelData(GetDoctorModel name) {
    _getDoctorModelData = name;
    notifyListeners();
  }

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void selectDoctorProfile(int addIndex) {
    _selectedIndex = addIndex;
    notifyListeners();
  }

  Future<void> getDoctorApi(context, String catId) async {
    Map data = {
      "id": catId,
    };
    _doctorDepartmentRepo.getDoctorApi(data).then((value) {
      if (value.status == 200) {
        setGetDoctorModelData(value);

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

  // DoctorVR Api

  DoctorViewReviewModel? _doctorVRModel;
  DoctorViewReviewModel? get doctorVRModel => _doctorVRModel;

  void setDoctorViewReviewModel(DoctorViewReviewModel name) {
    _doctorVRModel = name;
    notifyListeners();
  }

  Future<void> doctorVRApi(context, String doctorId) async {
    _doctorDepartmentRepo.doctorVRApi(doctorId).then((value) {
      if (value.status == 200) {
        setDoctorViewReviewModel(value);
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
