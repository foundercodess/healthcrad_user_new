import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:health_crad_user/repo/appointment_repo.dart';

import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/view_model/user_view_model.dart';

class AppointmentViewModel with ChangeNotifier {
  final _appointmentRepo = AppointmentRepo();

  //  Req Appo Api

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> doctorAppointmentApi(
      dynamic doctorCon,
      dynamic payModeCon,
      dynamic phoneCon,
      dynamic date,
      dynamic slotType,
      dynamic sTime,
      dynamic address,
      dynamic age,
      dynamic totalPayable,
      dynamic patientName,
      context) async {
    setLoading(true);
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    Map data = {
      "doctor_id": doctorCon,
      "user_id": userId,
      "paymode": payModeCon,
      "phone": phoneCon,
      "date": date,
      "slot_type": slotType,
      "s_time": sTime,
      "address": address,
      "age": age,
      "total_payable": totalPayable,
      "patient_name": patientName,
    };

    _appointmentRepo.doctorAppointmentApi(data).then((value) {
      if (value['status'] == 200) {
        setLoading(false);
        Navigator.pushNamed(context, RoutesName.commonOrderScreen,
            arguments: {
              "name": "Your appointment has been\nsuccessfully booked"
            });
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
