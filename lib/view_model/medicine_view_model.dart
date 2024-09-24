import 'package:flutter/foundation.dart';
import 'package:health_crad_user/model/doctor_department.dart';
import 'package:health_crad_user/model/medicine_cat.dart';
import 'package:health_crad_user/model/slider_model.dart';
import 'package:health_crad_user/repo/doctor_repo.dart';
import 'package:health_crad_user/repo/medicine_repo.dart';
import 'package:health_crad_user/utils/utils.dart';
import '../repo/silder_repo.dart';


class MedicineViewModel with ChangeNotifier {


  final _medicineCatRepo= MedicineCatRepo();



  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  MedicineCatModel? _medicineModelData;

  MedicineCatModel? get medicineModelData => _medicineModelData;

  setListData(MedicineCatModel value) {
    _medicineModelData = value;
    notifyListeners();
  }

  Future<void> medicineCatApi(context) async {
    setLoading(true);
    _medicineCatRepo.medicineCatApi().then((value) {
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
